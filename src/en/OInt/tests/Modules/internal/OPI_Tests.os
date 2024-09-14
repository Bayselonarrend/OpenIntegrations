﻿// OneScript: ./OInt/tests/Modules/internal/OPI_Tests.os

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

    Telegram_GetForumAvatarList(TestParameters);

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

    CreateProductCollection(TestParameters);
    EditProductCollection(TestParameters);
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

    PUrl = "public_url";
    Map  = "Map";

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

Procedure GV_GetAuthorizationLink() Export

    ClientID = OPI_TestDataRetrieval.GetParameter("Google_ClientID");
    Result   = OPI_GoogleWorkspace.FormCodeRetrievalLink(ClientID);

    OPI_TestDataRetrieval.ExpectsThat(Result)
        .ИмеетТип("String")
        .Заполнено();

    OPI_TestDataRetrieval.WriteParameter("Google_Link", Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GV_GetToken() Export

    ClientID     = OPI_TestDataRetrieval.GetParameter("Google_ClientID");
    ClientSecret = OPI_TestDataRetrieval.GetParameter("Google_ClientSecret");
    Code         = OPI_TestDataRetrieval.GetParameter("Google_Code");

    Result = OPI_GoogleWorkspace.GetTokenByCode(ClientID, ClientSecret, Code);

    If ValueIsFilled(Result["access_token"])
        And ValueIsFilled(Result["refresh_token"]) Then

        OPI_TestDataRetrieval.WriteParameter("Google_Token"  , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Google_Refresh", Result["refresh_token"]);

    EndIf;

    OPI_Tools.Pause(5);

EndProcedure

Procedure GV_UpdateToken() Export

    ClientID     = OPI_TestDataRetrieval.GetParameter("Google_ClientID");
    ClientSecret = OPI_TestDataRetrieval.GetParameter("Google_ClientSecret");
    RefreshToken = OPI_TestDataRetrieval.GetParameter("Google_Refresh");

    Result = OPI_GoogleWorkspace.RefreshToken(ClientID, ClientSecret, RefreshToken);

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["access_token"]).Заполнено();

    OPI_TestDataRetrieval.WriteParameter("Google_Token", Result["access_token"]);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleCalendar

Procedure GC_GetCalendarList() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Result = OPI_GoogleCalendar.GetCalendarList(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCalendarList");

    OPI_TestDataRetrieval.ExpectsThat(Result)
        .ИмеетТип("Array");

    OPI_Tools.Pause(5);

EndProcedure

Procedure GC_CreateDeleteCalendar() Export

    Token       = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Name        = "TestCalendar";
    Description = "TestDescription";
    EditedName  = Name + " (change.)";
    TypeMap     = Type("Map");
    TypeString  = Type("String");
    Summary     = "summary";
    Black       = "#000000";
    Yellow      = "#ffd800";

    Result = OPI_GoogleCalendar.CreateCalendar(Token, Name);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateCalendar");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Summary]).Равно(Name);
    OPI_TestDataRetrieval.ExpectsThat(Result["id"]).ИмеетТип(TypeString).Заполнено();

    Calendar = Result["id"];

    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token
        , Calendar
        , EditedName
        , Description);

    OPI_TestDataRetrieval.WriteLog(Result, "EditCalendarMetadata");

    Check_GKObject(Result, EditedName, Description);

    Result = OPI_GoogleCalendar.GetCalendarMetadata(Token, Calendar);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCalendarMetadata");

    Check_GKObject(Result, EditedName, Description);

    Result = OPI_GoogleCalendar.AddCalendarToList(Token, Calendar);

    OPI_TestDataRetrieval.WriteLog(Result, "AddCalendarToList");

    Check_GKObject(Result, EditedName, Description);

    Result = OPI_GoogleCalendar.EditListCalendar(Token, Calendar, Black, Yellow, False);

    OPI_TestDataRetrieval.WriteLog(Result, "EditListCalendar");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Summary]).Равно(EditedName);
    OPI_TestDataRetrieval.ExpectsThat(Result["foregroundColor"]).Равно(Black);
    OPI_TestDataRetrieval.ExpectsThat(Result["backgroundColor"]).Равно(Yellow);

    Result = OPI_GoogleCalendar.GetListCalendar(Token, Calendar);

    OPI_TestDataRetrieval.WriteLog(Result, "GetListCalendar");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Summary]).Равно(EditedName);
    OPI_TestDataRetrieval.ExpectsThat(Result["foregroundColor"]).Равно(Black);
    OPI_TestDataRetrieval.ExpectsThat(Result["backgroundColor"]).Равно(Yellow);

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "ClearMainCalendar");

    Check_Empty(Result);

    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteCalendarFromList");

    Check_Empty(Result);

    Result = OPI_GoogleCalendar.DeleteCalendar(Token, Calendar);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteCalendar");

    Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GC_CreateDeleteEvent() Export

    CurrentDate       = OPI_Tools.GetCurrentDate();
    Token             = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Calendar          = OPI_TestDataRetrieval.GetParameter("Google_CalendarID");
    Name = "New event";
    Description       = "TestEventDescription";
    EditedDescription = "Test event description (change.)";
    UID = "id";
    Hour = 3600;

    Attachments = New Map;

    Attachments.Insert("Image1"
        , "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png");
    Attachments.Insert("Image2"
        , "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1");

    EventMap = New Map;
    EventMap.Insert("Description"           , Description);
    EventMap.Insert("Title"                 , Name);
    EventMap.Insert("Venue"                 , "InOffice");
    EventMap.Insert("StartDate"             , CurrentDate);
    EventMap.Insert("EndDate"               , EventMap["StartDate"] + Hour);
    EventMap.Insert("ArrayOfAttachmentURLs" , Attachments);
    EventMap.Insert("SendNotifications"     , True);

    Result = OPI_GoogleCalendar.CreateEvent(Token, Calendar, EventMap);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateEvent");

    Event = Result[UID];

    Check_GKObject(Result, Name, Description);

    EventMap = New Map;
    EventMap.Insert("Description", EditedDescription);

    Result = OPI_GoogleCalendar.EditEvent(Token, Calendar, EventMap, Event);

    OPI_TestDataRetrieval.WriteLog(Result, "EditEvent");

    Check_GKObject(Result, Name, EditedDescription);

    Result = OPI_GoogleCalendar.GetEvent(Token, Calendar, Event);

    OPI_TestDataRetrieval.WriteLog(Result, "GetEvent");

    Check_GKObject(Result, Name, EditedDescription);

    Result = OPI_GoogleCalendar.MoveEvent(Token, Calendar, Calendar, Event);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveEvent");

    Check_GKObject(Result, Name, EditedDescription);

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteEvent");

    Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GC_GetEventList() Export

    Token    = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Calendar = OPI_TestDataRetrieval.GetParameter("Google_CalendarID");

    Result = OPI_GoogleCalendar.GetEventList(Token, Calendar);

    OPI_TestDataRetrieval.WriteLog(Result, "GetEventList");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleDrive

Procedure GD_GetCatalogList() Export

    MimeType_ = "mimeType";
    Name_     = "name";
    Name      = "TestFolder";
    Token     = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Result    = OPI_GoogleDrive.GetDirectoriesList(Token, Name, True);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDirectoriesList");

    Result = Result[0];

    OPI_TestDataRetrieval.ExpectsThat(Result["files"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result[MimeType_]).Равно("application/vnd.google-apps.folder");
    OPI_TestDataRetrieval.ExpectsThat(Result[Name_]).Заполнено();

    OPI_Tools.Pause(5);
    Identifier = Result["id"];

    OPI_TestDataRetrieval.WriteParameter("GD_Catalog", Identifier);

    Result = OPI_GoogleDrive.GetObjectInformation(Token, Identifier);

    OPI_TestDataRetrieval.WriteLog(Result, "GetObjectInformation");

    OPI_TestDataRetrieval.ExpectsThat(Result[MimeType_]).Равно("application/vnd.google-apps.folder");
    OPI_TestDataRetrieval.ExpectsThat(Result[Name_]).Заполнено();

    OPI_Tools.Pause(5);

EndProcedure

Procedure GD_UploadDeleteFile() Export

    ExtraBytes = 2;

    Kind_     = "kind";
    Content_  = "content";
    MIME_     = "MIME";
    MimeType_ = "mimeType";
    Name_     = "name";
    Id_       = "id";

    ArrayOfDeletions = New Array;
    Token            = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Image            = OPI_TestDataRetrieval.GetBinary("Picture");
    ReplacementImage = OPI_TestDataRetrieval.GetBinary("Picture2");
    Directory        = OPI_TestDataRetrieval.GetParameter("GD_Catalog");

    Description = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);

    Result = OPI_GoogleDrive.UploadFile(Token, Image, Description);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile");

    OPI_TestDataRetrieval.ExpectsThat(Result[MimeType_]).Равно(Description[MIME_]);
    OPI_TestDataRetrieval.ExpectsThat(Result[Name_]).Равно(Description["Name"]);

    Identifier = Result[Id_];
    ArrayOfDeletions.Add(Identifier);

    NewName = "CopiedFile.jpeg";
    Result  = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, "root");

    OPI_TestDataRetrieval.WriteLog(Result, "CopyObject");

    OPI_Tools.Pause(5);

    OPI_TestDataRetrieval.ExpectsThat(Result[MimeType_]).Равно(Description[MIME_]);
    OPI_TestDataRetrieval.ExpectsThat(Result[Name_]).Равно(NewName);

    ArrayOfDeletions.Add(Result[Id_]);

    Result = OPI_GoogleDrive.DownloadFile(Token, Identifier);

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile");

    OPI_TestDataRetrieval.ExpectsThat(Result.Size()).Равно(Image.Size() + ExtraBytes);
    OPI_Tools.Pause(5);

    NewName = "UpdatedFile.jpg";
    Result  = OPI_GoogleDrive.UpdateFile(Token, Identifier, ReplacementImage, NewName);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateFile");

    OPI_TestDataRetrieval.ExpectsThat(Result[MimeType_]).Равно(Description[MIME_]);
    OPI_TestDataRetrieval.ExpectsThat(Result[Name_]).Равно(NewName);

    OPI_Tools.Pause(5);

    Comment = "Yo";
    Result  = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateComment");

    OPI_TestDataRetrieval.ExpectsThat(Result[Content_]).Равно(Comment);
    OPI_TestDataRetrieval.ExpectsThat(Result[Kind_]).Равно("drive#comment");

    OPI_Tools.Pause(5);

    For Each Deletable In ArrayOfDeletions Do
        Result = OPI_GoogleDrive.DeleteObject(Token, Deletable);

        OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject");

        OPI_TestDataRetrieval.ExpectsThat(ValueIsFilled(Result)).Равно(False);
        OPI_Tools.Pause(2);
    EndDo;

    OPI_Tools.Pause(5);

EndProcedure

Procedure GD_CreateDeleteComment() Export

    Kind_     = "kind";
    Content_  = "content";
    Id_       = "id";
    Comments_ = "comments";
    Token     = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Directory = OPI_TestDataRetrieval.GetParameter("GD_Catalog");
    Image     = OPI_TestDataRetrieval.GetBinary("Picture");

    Description = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);

    Result     = OPI_GoogleDrive.UploadFile(Token, Image, Description);
    Identifier = Result[Id_];

    Comment     = "NewComment";
    ResultArray = New Array;
    Result      = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateComment");

    CommentID = Result[Id_];

    ResultArray.Add(Result);

    Result = OPI_GoogleDrive.GetComment(Token, Identifier, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetComment");

    ResultArray.Add(Result);

    Result = OPI_GoogleDrive.GetCommentList(Token, Identifier);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCommentList");

    Comments      = Result[Comments_];
    CommentObject = Comments[Comments.UBound()];

    ResultArray.Add(CommentObject);

    For Each Result In ResultArray Do
        OPI_TestDataRetrieval.ExpectsThat(Result[Content_]).Равно(Comment);
        OPI_TestDataRetrieval.ExpectsThat(Result[Kind_]).Равно("drive#comment");
    EndDo;

    Result = OPI_GoogleDrive.DeleteComment(Token, Identifier, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteComment");

    OPI_TestDataRetrieval.ExpectsThat(ValueIsFilled(Result)).Равно(False);

    OPI_GoogleDrive.DeleteObject(Token, Identifier);

EndProcedure

Procedure GD_CreateCatalog() Export

    Name_     = "name";
    Name      = "TestFolder";
    Token     = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Directory = OPI_TestDataRetrieval.GetParameter("GD_Catalog");

    ResultArray = New Array;

    ResultArray.Add(OPI_GoogleDrive.CreateFolder(Token, Name));
    ResultArray.Add(OPI_GoogleDrive.CreateFolder(Token, Name, Directory));

    For Each Result In ResultArray Do

        OPI_TestDataRetrieval.WriteLog(Result, "CreateFolder");

        CatalogID = Result["id"];

        OPI_TestDataRetrieval.ExpectsThat(Result[Name_]).Равно(Name);

        OPI_GoogleDrive.DeleteObject(Token, CatalogID);

    EndDo;

EndProcedure

#EndRegion

#Region GoogleSheets

Procedure GT_CreateTable() Export

    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Name  = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    Result = OPI_GoogleSheets.CreateSpreadsheet(Token, Name, SheetArray);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSpreadsheet");

    OPI_TestDataRetrieval.ExpectsThat(Result["properties"]["title"]).Равно(Name);

    For N = 0 To SheetArray.UBound() Do

        SheetName = Result["sheets"][N]["properties"]["title"];
        OPI_TestDataRetrieval.ExpectsThat(SheetName).Равно(SheetArray[N]);
        Sheet     = Result["sheets"][N]["properties"]["sheetId"];
        Sheet     = OPI_Tools.NumberToString(Sheet);

    EndDo;

    Spreadsheet = Result["spreadsheetId"];

    OPI_TestDataRetrieval.WriteParameter("GS_Spreadsheet", Spreadsheet);
    OPI_TestDataRetrieval.WriteParameter("GS_Sheet"      , Sheet);

    Name   = "Test table (new.)";
    Result = OPI_GoogleSheets.CreateSpreadsheet(Token, Name, SheetArray);

    OPI_TestDataRetrieval.WriteLog(Result, "CopySheet (new.)");

    Spreadsheet2 = Result["spreadsheetId"];

    Result = OPI_GoogleSheets.CopySheet(Token, Spreadsheet, Spreadsheet2, Sheet);

    OPI_TestDataRetrieval.WriteLog(Result, "CopySheet");

    OPI_TestDataRetrieval.ExpectsThat(Result["title"]).Заполнено();

    Name = "TestSheet";

    Result = OPI_GoogleSheets.AddSheet(Token, Spreadsheet, Name);

    OPI_TestDataRetrieval.WriteLog(Result, "AddSheet");

    NewSheet = Result["replies"][0]["addSheet"]["properties"]["sheetId"];
    NewSheet = OPI_Tools.NumberToString(NewSheet);

    OPI_TestDataRetrieval.ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);

    Result = OPI_GoogleSheets.DeleteSheet(Token, Spreadsheet, NewSheet);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSheet");

    OPI_TestDataRetrieval.ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);

    Name = "Test table (changed.)";

    Result = OPI_GoogleSheets.EditSpreadsheetTitle(Token, Spreadsheet, Name);

    OPI_TestDataRetrieval.WriteLog(Result, "EditSpreadsheetTitle");

    OPI_TestDataRetrieval.ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);

EndProcedure

Procedure GT_GetTable() Export

    Token       = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Spreadsheet = OPI_TestDataRetrieval.GetParameter("GS_Spreadsheet");
    Name        = "Test table (changed.)";

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Spreadsheet);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTable");

    OPI_TestDataRetrieval.ExpectsThat(Result["properties"]["title"]).Равно(Name);

EndProcedure

Procedure GT_FillClearCells() Export

    Token       = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Spreadsheet = OPI_TestDataRetrieval.GetParameter("GS_Spreadsheet");
    Sheet       = "Sheet2";

    CellStructure = New Map;
    CellStructure.Insert("A1", "ThisIsA1");
    CellStructure.Insert("A2", "ThisIsA2");
    CellStructure.Insert("B2", "ThisIsB2");
    CellStructure.Insert("B3", "ThisIsB3");
    CellStructure.Insert("A3", "ThisIsA3");
    CellStructure.Insert("A4", "ThisIsA4");
    CellStructure.Insert("B1", "ThisIsB1");
    CellStructure.Insert("B4", "ThisIsB4");

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Result = OPI_GoogleSheets.SetCellValues(Token, Spreadsheet, CellStructure, Sheet);

    OPI_TestDataRetrieval.WriteLog(Result, "SetCellValues");

    OPI_TestDataRetrieval.ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);
    OPI_TestDataRetrieval.ExpectsThat(Result["totalUpdatedCells"]).Равно(CellStructure.Count());

    Result = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, CellsArray, Sheet);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCellValues");

    OPI_TestDataRetrieval.ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);
    OPI_TestDataRetrieval.ExpectsThat(Result["valueRanges"].Count()).Равно(CellsArray.Count());

    Result = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, , Sheet);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCellValues");

    OPI_TestDataRetrieval.ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Result = OPI_GoogleSheets.ClearCells(Token, Spreadsheet, CellsArray, Sheet);

    OPI_TestDataRetrieval.WriteLog(Result, "ClearCells");

    OPI_TestDataRetrieval.ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);
    OPI_TestDataRetrieval.ExpectsThat(Result["clearedRanges"].Count()).Равно(CellsArray.Count());

EndProcedure

#EndRegion

#Region Twitter

Procedure Twitter_GetAuthorizationLink() Export

    Parameters = GetTwitterParameters();
    Result     = OPI_Twitter.GetAuthorizationLink(Parameters);

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("String").Заполнено();

    OPI_TestDataRetrieval.WriteParameter("Twitter_URL", Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Twitter_UpdateToken() Export

    Parameters = GetTwitterParameters();
    Result     = OPI_Twitter.RefreshToken(Parameters);

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["access_token"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["refresh_token"]).Заполнено();

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

Procedure Twitter_CreateTextTweet() Export

    Parameters = GetTwitterParameters();
    Text       = "TestTweet" + String(New UUID);

    Result = OPI_Twitter.CreateTextTweet(Text, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTextTweet");

    Check_TwitterText(Result, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Twitter_CreateTweetWithImage() Export

    Parameters = GetTwitterParameters();
    Text       = "TestTweet" + String(New UUID);
    Image      = OPI_TestDataRetrieval.GetBinary("Picture");
    TFN        = GetTempFileName("png");
    Image.Write(TFN);

    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateImageTweet");

    Check_TwitterText(Result, Text);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, TFN, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateImageTweet");

    Check_TwitterText(Result, Text);

    DeleteFiles(TFN);

    OPI_Tools.Pause(20);

EndProcedure

Procedure Twitter_CreateTweetWithVideo() Export

    Parameters = GetTwitterParameters();
    Text       = "TestTweet" + String(New UUID);
    Video      = OPI_TestDataRetrieval.GetBinary("Video");
    TFN        = GetTempFileName("mp4");
    Video.Write(TFN);

    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateVideoTweet");

    Check_TwitterText(Result, Text);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, TFN, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateVideoTweet");

    Check_TwitterText(Result, Text);

    DeleteFiles(TFN);

    OPI_Tools.Pause(20);

EndProcedure

Procedure Twitter_CreateTweetWithGif() Export

    Parameters = GetTwitterParameters();
    Text       = "TestTweet" + String(New UUID);
    GIF        = OPI_TestDataRetrieval.GetBinary("GIF");
    TFN        = GetTempFileName("gif");
    GIF.Write(TFN);

    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateGifTweet");

    Check_TwitterText(Result, Text);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, TFN, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateGifTweet");

    Check_TwitterText(Result, Text);

    DeleteFiles(TFN);

    OPI_Tools.Pause(20);

EndProcedure

Procedure Twitter_CreateTweetWithPoll() Export

    Parameters   = GetTwitterParameters();
    Text         = "TestTweet" + String(New UUID);
    AnswersArray = New Array;
    AnswersArray.Add("Option 1");
    AnswersArray.Add("Option 2");

    Result = OPI_Twitter.CreatePollTweet(Text, AnswersArray, 60, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePollTweet");

    Check_TwitterText(Result, Text);

    OPI_Tools.Pause(20);

EndProcedure

#EndRegion

#Region Notion

Procedure Notion_CreatePage() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    Parent = OPI_TestDataRetrieval.GetParameter("Notion_Parent");
    Title  = "TestTitle";

    Result = OPI_Notion.CreatePage(Token, Parent, Title);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePage");

    Check_NotionObject(Result);

EndProcedure

Procedure Notion_CreateEditDatabase() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    Parent = OPI_TestDataRetrieval.GetParameter("Notion_Parent");
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

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDatabase");

    Check_NotionObject(Result, "database");

    Base        = Result["id"];
    Title       = "TestTitle";
    Description = "TestDescription";

    Properties = New Map;
    Properties.Insert("Email", "rich_text"); // Type fields "Email" will changed with email to text
    Properties.Insert("Website"); // Field "Website" will deleted

    Result = OPI_Notion.EditDatabaseProperties(Token, Base, Properties, Title, Description);

    OPI_TestDataRetrieval.WriteLog(Result, "EditDatabaseProperties");

    Check_NotionObject(Result, "database");

EndProcedure

Procedure Notion_GetPageInfo() Export

    Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    Page  = OPI_TestDataRetrieval.GetParameter("Notion_Page");

    Result = OPI_Notion.GetPage(Token, Page);

    OPI_TestDataRetrieval.WriteLog(Result, "GetPage");

    Check_NotionObject(Result);

EndProcedure

Procedure Notion_GetDatabaseInfo() Export

    Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    Base  = OPI_TestDataRetrieval.GetParameter("Notion_Base");

    Result = OPI_Notion.GetDatabase(Token, Base);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDatabase");

    Check_NotionObject(Result, "database");

EndProcedure

Procedure Notion_CreatePageInDatabase() Export

    Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    Base  = OPI_TestDataRetrieval.GetParameter("Notion_Base");

    Image = New Map;
    Image.Insert("Logo", OPI_TestDataRetrieval.GetParameter("Picture"));

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

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePageInDatabase");

    Check_NotionObject(Result);

    Parent = StrReplace(Result["parent"]["database_id"], "-", "");
    OPI_TestDataRetrieval.ExpectsThat(Parent).Равно(Base);

EndProcedure

Procedure Notion_EditPageProperties() Export

    Token   = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    Page    = OPI_TestDataRetrieval.GetParameter("Notion_Page");
    Icon    = OPI_TestDataRetrieval.GetParameter("Picture");
    Cover   = OPI_TestDataRetrieval.GetParameter("Picture2");
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

    OPI_TestDataRetrieval.WriteLog(Result, "EditPageProperties");

    Check_NotionObject(Result);

EndProcedure

Procedure Notion_CreateDeleteBlock() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    Parent = OPI_TestDataRetrieval.GetParameter("Notion_Parent");
    Block  = OPI_TestDataRetrieval.GetParameter("Notion_Block");

    Result = OPI_Notion.ReturnBlock(Token, Block);

    OPI_TestDataRetrieval.WriteLog(Result, "ReturnBlock");

    Check_NotionObject(Result, "block");

    Result = OPI_Notion.CreateBlock(Token, Parent, Result);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateBlock");

    Check_NotionObject(Result, "list");

    Block  = Result["results"][0]["id"];
    Result = OPI_Notion.ReturnChildBlocks(Token, Block);

    OPI_TestDataRetrieval.WriteLog(Result, "ReturnChildBlocks");

    Check_NotionObject(Result, "list");

    Result = OPI_Notion.DeleteBlock(Token, Block);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteBlock");

    Check_NotionObject(Result, "block");

EndProcedure

Procedure Notion_GetUsers() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    Result = OPI_Notion.UserList(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "UserList");

    Check_NotionObject(Result, "list");

EndProcedure

Procedure Notion_GetUserData() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Notion_Token");
    User   = OPI_TestDataRetrieval.GetParameter("Notion_User");
    Result = OPI_Notion.GetUserData(Token, User);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserData");

    Check_NotionObject(Result, "user");

EndProcedure

#EndRegion

#Region Slack

Procedure Slack_GetBotInfo() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Result = OPI_Slack.GetBotInformation(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetBotInformation");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["bot_id"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["user_id"]).Заполнено();

EndProcedure

Procedure Slack_GetUserList() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Result = OPI_Slack.GetUserList(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["members"]).ИмеетТип("Array");

EndProcedure

Procedure Slack_GetRegionList() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Result = OPI_Slack.GetWorkspaceList(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetWorkspaceList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["teams"]).ИмеетТип("Array");

EndProcedure

Procedure Slack_SendDeleteMessage() Export

    Token   = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    Text    = "TestMessage1";
    Text2   = "TestMessage2";
    Tags    = New Array;
    Image   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1";

    Result = OPI_Slack.SendMessage(Token, Channel, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["ts"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["message"]["text"]).Равно(Text);

    Timestamp = Result["ts"];

    Result = OPI_Slack.EditMessage(Token, Channel, Timestamp, Text2);

    OPI_TestDataRetrieval.WriteLog(Result, "EditMessage");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["ts"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["message"]["text"]).Равно(Text2);

    Result = OPI_Slack.GetMessageReplyList(Token, Channel, Timestamp);

    OPI_TestDataRetrieval.WriteLog(Result, "GetMessageReplyList");

    OPI_TestDataRetrieval.ExpectsThat(Result["messages"]).ИмеетТип("Array");

    Result = OPI_Slack.GetMessageLink(Token, Channel, Timestamp);

    OPI_TestDataRetrieval.WriteLog(Result, "GetMessageLink");

    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["permalink"]).Заполнено();

    Check_SlackOk(Result);

    Tags.Add(Timestamp);

    BlockArray = New Array;
    Block      = OPI_Slack.GenerateImageBlock(Image, "Yo");
    BlockArray.Add(Block);

    Result = OPI_Slack.SendMessage(Token, Channel, Text, , BlockArray);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (picture)");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["ts"]).Заполнено();

    Tags.Add(Result["ts"]);

    Block     = OPI_Slack.GenerateImageBlock(Image, "Yo");
    JSONBlock = OPI_Tools.JSONString(Block);

    TFN = GetTempFileName("json");

    TextDocument = New TextDocument();
    TextDocument.SetText(JSONBlock);
    TextDocument.Write(TFN);

    Result = OPI_Slack.SendMessage(Token, Channel, Text, , TFN);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (json)");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["ts"]).Заполнено();

    Tags.Add(Result["ts"]);

    Blocks = "['" + TFN + "','" + TFN + "']";
    Result = OPI_Slack.SendMessage(Token, Channel, Text, , Blocks);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (json array)");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["ts"]).Заполнено();

    Tags.Add(Result["ts"]);

    DeleteFiles(TFN);

    For Each Timestamp In Tags Do

        Result = OPI_Slack.DeleteMessage(Token, Channel, Timestamp);

        OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage");

        Check_SlackOk(Result);
        OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
        OPI_TestDataRetrieval.ExpectsThat(Result["ts"]).Заполнено();

    EndDo;

    Hour    = 3600;
    Day     = 24;
    Sending = OPI_Tools.GetCurrentDate() + (Day * Hour);
    Result  = OPI_Slack.SendMessage(Token, Channel, Text, Sending);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (scheduled)");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["scheduled_message_id"]).Заполнено();

    Timestamp = Result["scheduled_message_id"];
    Result    = OPI_Slack.DeleteMessage(Token, Channel, Timestamp, True);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage");

    Check_SlackOk(Result);

EndProcedure

Procedure Slack_SendDeleteEphemeral() Export

    Token   = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    User    = OPI_TestDataRetrieval.GetParameter("Slack_User");
    Image   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1";
    Text    = "TestMessage1";

    Block  = OPI_Slack.GenerateImageBlock(Image, "Yo");
    Result = OPI_Slack.SendEphemeralMessage(Token, Channel, Text, User, Block);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["message_ts"]).Заполнено();

EndProcedure

Procedure Slack_GetScheduledMessages() Export

    Token   = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");

    Result = OPI_Slack.GetDelayedMessageList(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDelayedMessageList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["scheduled_messages"]).ИмеетТип("Array");

EndProcedure

Procedure Slack_CreateArchiveChannel() Export

    Token   = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    User    = OPI_TestDataRetrieval.GetParameter("Slack_User");
    Name    = "testconv" + String(New UUID);
    Topic   = "TestTopic";
    Purpose = "TestGoal";

    #Region CreateChannel
    Result = OPI_Slack.CreateChannel(Token, Name);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateChannel");

    Data    = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(Name);
    #EndRegion

    #Region SetChannelTopic
    Result = OPI_Slack.SetChannelTopic(Token, Channel, Topic);

    OPI_TestDataRetrieval.WriteLog(Result, "SetChannelTopic");

    Data    = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(Name);
    OPI_TestDataRetrieval.ExpectsThat(Data["topic"]["value"]).Равно(Topic);
    #EndRegion

    #Region SetChannelGoal
    Result = OPI_Slack.SetChannelGoal(Token, Channel, Purpose);

    OPI_TestDataRetrieval.WriteLog(Result, "SetChannelGoal");

    Check_SlackOk(Result);
    #EndRegion

    #Region GetChannel
    Result = OPI_Slack.GetChannel(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannel");

    Data    = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(Name);
    #EndRegion

    #Region InviteUsersToChannel
    Result = OPI_Slack.InviteUsersToChannel(Token, Channel, User);

    OPI_TestDataRetrieval.WriteLog(Result, "InviteUsersToChannel");

    Data    = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(Name);
    #EndRegion

    #Region KickUserFromChannel
    Result = OPI_Slack.KickUserFromChannel(Token, Channel, User);

    OPI_TestDataRetrieval.WriteLog(Result, "KickUserFromChannel");

    Check_SlackOk(Result);
    #EndRegion

    #Region GetChannelHistory
    Result = OPI_Slack.GetChannelHistory(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelHistory");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["messages"]).ИмеетТип("Array");
    #EndRegion

    #Region GetChannelUserList
    Result = OPI_Slack.GetChannelUserList(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelUserList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["members"]).ИмеетТип("Array");
    #EndRegion

    #Region LeaveChannel
    Result = OPI_Slack.LeaveChannel(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "LeaveChannel");

    Check_SlackOk(Result);
    #EndRegion

    #Region JoinChannel
    Result = OPI_Slack.JoinChannel(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "JoinChannel");

    Data    = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(Name);
    #EndRegion

    #Region RenameChannel
    NewName = "testconv" + String(New UUID);
    Result  = OPI_Slack.RenameChannel(Token, Channel, NewName);

    OPI_TestDataRetrieval.WriteLog(Result, "RenameChannel");

    Data    = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(NewName);
    #EndRegion

    #Region ArchiveChannel
    Result = OPI_Slack.ArchiveChannel(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "ArchiveChannel");

    Check_SlackOk(Result);
    #EndRegion

EndProcedure

Procedure Slack_GetChannelList() Export

    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");

    Result = OPI_Slack.GetChannelList(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channels"]).ИмеетТип("Array");

EndProcedure

Procedure Slack_OpenCloseDialog() Export

    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    User  = OPI_TestDataRetrieval.GetParameter("Slack_User");
    Text  = "Yo, dude";

    Result = OPI_Slack.OpenDialog(Token, User);

    OPI_TestDataRetrieval.WriteLog(Result, "OpenDialog");

    Dialog = Result["channel"]["id"];
    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Dialog).Заполнено();

    Result = OPI_Slack.SendMessage(Token, Dialog, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage");

    Check_SlackOk(Result);

    Result = OPI_Slack.CloseDialog(Token, Dialog);

    OPI_TestDataRetrieval.WriteLog(Result, "CloseDialog");

    Check_SlackOk(Result);

EndProcedure

Procedure Slack_GetFileList() Export

    Token   = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");

    Result = OPI_Slack.GetFilesList(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["files"]).ИмеетТип("Array");

EndProcedure

Procedure Slack_UploadDeleteFile() Export

    Token        = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    File         = OPI_TestDataRetrieval.GetBinary("Document");
    Channel      = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    ArrayOfFiles = New Array;
    FileName     = "megadoc.docx";
    Title        = "NewFile";

    Result = OPI_Slack.UploadFile(Token, File, FileName, Title);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile");

    UploadedFile = Result["files"][0];
    ArrayOfFiles.Add(UploadedFile["id"]);

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(UploadedFile["name"]).Равно(FileName);

    Result = OPI_Slack.UploadFile(Token, File, FileName, Title, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile (to channel)");

    UploadedFile = Result["files"][0];
    ArrayOfFiles.Add(UploadedFile["id"]);

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(UploadedFile["name"]).Равно(FileName);

    Result = OPI_Slack.GetFileData(Token, UploadedFile["id"]);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFile");

    UploadedFile = Result["file"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(UploadedFile["name"]).Равно(FileName);

    For Each UploadedFile In ArrayOfFiles Do

        Result = OPI_Slack.DeleteFile(Token, UploadedFile);

        OPI_TestDataRetrieval.WriteLog(Result, "DeleteFile");

        Check_SlackOk(Result);

    EndDo;

EndProcedure

Procedure Slack_GetExternalFileList() Export

    Token   = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");

    Result = OPI_Slack.GetExternalFileList(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetExternalFileList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["files"]).ИмеетТип("Array");

    Result = OPI_Slack.GetExternalFileList(Token, Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "GetExternalFileList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["files"]).ИмеетТип("Array");

EndProcedure

Procedure Slack_UploadDeleteExternalFile() Export

    Token   = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    File    = OPI_TestDataRetrieval.GetParameter("Document");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    Title   = "NewFile";

    Result = OPI_Slack.AddExternalFile(Token, File, Title);

    OPI_TestDataRetrieval.WriteLog(Result, "AddExternalFile");

    UploadedFile = Result["file"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(UploadedFile["title"]).Равно(Title);

    Result = OPI_Slack.GetExternalFile(Token, UploadedFile["id"]);

    OPI_TestDataRetrieval.WriteLog(Result, "GetExternalFile");

    UploadedFile = Result["file"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(UploadedFile["title"]).Равно(Title);

    Result = OPI_Slack.SendExternalFile(Token, UploadedFile["id"], Channel);

    OPI_TestDataRetrieval.WriteLog(Result, "SendExternalFile");

    Check_SlackOk(Result);

    Result = OPI_Slack.DeleteExternalFile(Token, UploadedFile["id"]);

    OPI_TestDataRetrieval.WriteLog(Result, "SendExternalFile");

    Check_SlackOk(Result);

EndProcedure

#EndRegion

#Region Airtable

Procedure AT_CreateDatabase() Export

    Token  = OPI_TestDataRetrieval.GetParameter("Airtable_Token");
    Region = OPI_TestDataRetrieval.GetParameter("Airtable_Workspace");
    Name   = "TestDatabase";

    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    FieldArray.Add(OPI_Airtable.GetStringField("String"));

    TableName = "TestTable";

    TableMapping = New Map;
    TableMapping.Insert(TableName, FieldArray);

    Result = OPI_Airtable.CreateDatabase(Token, Region, Name, TableMapping);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDatabase");

    OPI_TestDataRetrieval.ExpectsThat(Result["id"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["tables"][0]["name"]).Равно(TableName);

    Base = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Base", Base);

    Result = OPI_Airtable.GetDatabaseTables(Token, Base);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDatabaseTables");

    OPI_TestDataRetrieval.ExpectsThat(Result["tables"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["tables"]).ИмеетТип("Array");

    Result = OPI_Airtable.GetListOfBases(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetListOfBases");

    OPI_TestDataRetrieval.ExpectsThat(Result["bases"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["bases"]).ИмеетТип("Array");

EndProcedure

Procedure AT_CreateTable() Export

    Token = OPI_TestDataRetrieval.GetParameter("Airtable_Token");
    Base  = OPI_TestDataRetrieval.GetParameter("Airtable_Base");

    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    OPI_TestDataRetrieval.WriteLog(FieldArray[0], "GetNumberField");

    FieldArray.Add(OPI_Airtable.GetStringField("String"));
    OPI_TestDataRetrieval.WriteLog(FieldArray[1], "GetStringField");

    FieldArray.Add(OPI_Airtable.GetAttachmentField("Attachment"));
    OPI_TestDataRetrieval.WriteLog(FieldArray[2], "GetAttachmentField");

    FieldArray.Add(OPI_Airtable.GetCheckboxField("Checkbox"));
    OPI_TestDataRetrieval.WriteLog(FieldArray[3], "GetCheckboxField");

    FieldArray.Add(OPI_Airtable.GetDateField("Date"));
    OPI_TestDataRetrieval.WriteLog(FieldArray[4], "GetDateField");

    FieldArray.Add(OPI_Airtable.GetPhoneField("Phone"));
    OPI_TestDataRetrieval.WriteLog(FieldArray[5], "GetPhoneField");

    FieldArray.Add(OPI_Airtable.GetEmailField("Email"));
    OPI_TestDataRetrieval.WriteLog(FieldArray[6], "GetEmailField");

    FieldArray.Add(OPI_Airtable.GetLinkField("Link"));
    OPI_TestDataRetrieval.WriteLog(FieldArray[7], "GetLinkField");

    TableName   = "TestTable2";
    Description = "NewTable";

    Result = OPI_Airtable.CreateTable(Token, Base, TableName, FieldArray, Description);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTable");

    OPI_TestDataRetrieval.ExpectsThat(Result["name"]).Равно(TableName);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно(Description);

    Table       = Result["id"];
    TableName   = "Test table 2 (change.)";
    Description = "New table (change.)";

    OPI_TestDataRetrieval.WriteParameter("Airtable_Table", Table);

    Result = OPI_Airtable.ModifyTable(Token, Base, Table, TableName, Description);

    OPI_TestDataRetrieval.WriteLog(Result, "ModifyTable");

    OPI_TestDataRetrieval.ExpectsThat(Result["name"]).Равно(TableName);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно(Description);

EndProcedure

Procedure AT_CreateField() Export

    Token = OPI_TestDataRetrieval.GetParameter("Airtable_Token");
    Base  = OPI_TestDataRetrieval.GetParameter("Airtable_Base");
    Table = OPI_TestDataRetrieval.GetParameter("Airtable_Table");
    Name  = String(New UUID);

    Field = OPI_Airtable.GetNumberField(Name);

    Result = OPI_Airtable.CreateField(Token, Base, Table, Field);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateField");

    OPI_TestDataRetrieval.ExpectsThat(Result["name"]).Равно(Name);

    Field       = Result["id"];
    Name        = Name + "(change.)";
    Description = "New description";

    Result = OPI_Airtable.ModifyField(Token, Base, Table, Field, Name, Description);

    OPI_TestDataRetrieval.WriteLog(Result, "ModifyField");

    OPI_TestDataRetrieval.ExpectsThat(Result["name"]).Равно(Name);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно(Description);

EndProcedure

Procedure AT_CreateDeleteRecords() Export

    Token = OPI_TestDataRetrieval.GetParameter("Airtable_Token");
    Base  = OPI_TestDataRetrieval.GetParameter("Airtable_Base");
    Table = OPI_TestDataRetrieval.GetParameter("Airtable_Table");

    Numeric    = 10;
    StringType = "Hello";

    RowDescription1 = New Structure("Number,String", Numeric, StringType);
    RowDescription2 = New Structure("Number,String", Numeric, StringType);

    ArrayOfDeletions    = New Array;
    ArrayOfDescriptions = New Array;
    ArrayOfDescriptions.Add(RowDescription1);
    ArrayOfDescriptions.Add(RowDescription2);

    Result = OPI_Airtable.CreatePosts(Token, Base, Table, ArrayOfDescriptions);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePosts");

    OPI_TestDataRetrieval.ExpectsThat(Result["records"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["records"].Count()).Равно(2);

    For Each Record In Result["records"] Do
        ArrayOfDeletions.Add(Record["id"]);
    EndDo;

    Result = OPI_Airtable.CreatePosts(Token, Base, Table, RowDescription1);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateRecords (one)");

    SingleRecord = Result["id"];
    OPI_TestDataRetrieval.ExpectsThat(SingleRecord).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["createdTime"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["fields"]["Number"]).Равно(Numeric);
    OPI_TestDataRetrieval.ExpectsThat(TrimAll(Result["fields"]["String"])).Равно(StringType);

    Result = OPI_Airtable.GetRecord(Token, Base, Table, SingleRecord);

    OPI_TestDataRetrieval.WriteLog(Result, "GetRecord");

    OPI_TestDataRetrieval.ExpectsThat(Result["id"]).Равно(SingleRecord);

    Text   = "TestComment";
    Result = OPI_Airtable.CreateComment(Token, Base, Table, SingleRecord, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateComment");

    OPI_TestDataRetrieval.ExpectsThat(Result["text"]).Равно(Text);

    Comment = Result["id"];
    Text    = "Test comment (change.)";
    Result  = OPI_Airtable.EditComment(Token, Base, Table, SingleRecord, Comment, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "EditComment");

    OPI_TestDataRetrieval.ExpectsThat(Result["text"]).Равно(Text);

    Result = OPI_Airtable.GetComments(Token, Base, Table, SingleRecord);

    OPI_TestDataRetrieval.WriteLog(Result, "GetComments");

    OPI_TestDataRetrieval.ExpectsThat(Result["comments"]).ИмеетТип("Array");

    Result = OPI_Airtable.DeleteComment(Token, Base, Table, SingleRecord, Comment);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteComment");

    OPI_TestDataRetrieval.ExpectsThat(Result["deleted"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["id"]).Равно(Comment);

    Result = OPI_Airtable.GetListOfRecords(Token, Base, Table);

    OPI_TestDataRetrieval.WriteLog(Result, "GetListOfRecords");

    OPI_TestDataRetrieval.ExpectsThat(Result["records"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["records"]).Заполнено();

    Result = OPI_Airtable.DeletePosts(Token, Base, Table, ArrayOfDeletions);

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePosts");

    OPI_TestDataRetrieval.ExpectsThat(Result["records"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["records"]).Заполнено();

    Result = OPI_Airtable.DeletePosts(Token, Base, Table, SingleRecord);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteRecords (one)");

    OPI_TestDataRetrieval.ExpectsThat(Result["records"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["records"]).Заполнено();

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
    Bitrix24_MakeCopyFile(TestParameters);
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

    OPI_Tools.Pause(5);

    Bitrix24_SetMessageReaction(TestParameters);
    Bitrix24_DeleteMessage(TestParameters);
    Bitrix24_GetChatFilesFolder(TestParameters);
    Bitrix24_SendFile(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_ReadAll(TestParameters);
    Bitrix24_ChangeChatOwner(TestParameters);
    Bitrix24_LeaveChat(TestParameters);

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

Function GetTwitterParameters()

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

#Region Checks

Procedure Check_Empty(Val Result)

    If Not Lower(String(Result)) = "null" Then
        OPI_TestDataRetrieval.ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

EndProcedure

Procedure Check_String(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("String");
EndProcedure

Procedure Check_BinaryData(Val Result, Val Size = Undefined)

    MinimumSize = 500000;

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("BinaryData");

    If Not Size = Undefined Then
        OPI_TestDataRetrieval.ExpectsThat(Result.Size() >= Size).Равно(True);
    Else
        OPI_TestDataRetrieval.ExpectsThat(Result.Size() > MinimumSize).Равно(True);
    EndIf;

EndProcedure

Procedure Check_Array(Val Result, Val Count = Undefined)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Array");

    If Not Count = Undefined Then
       OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетДлину(Count);
    EndIf;

EndProcedure

Procedure Check_Map(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();

EndProcedure

Procedure Check_Structure(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

EndProcedure

Procedure Check_TelegramTrue(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).Равно(True);

EndProcedure

Procedure Check_TelegramBotInformation(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["username"]).Заполнено();

EndProcedure

Procedure Check_TelegramArray(Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map") .Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");

EndProcedure

Procedure Check_TelegramWebhookSetup(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно("Webhook was set");

EndProcedure

Procedure Check_TelegramWebhookDeletion(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Заполнено();

EndProcedure

Procedure Check_TelegramMessage(Val Result, Val Text)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["text"]).Равно(Text);

EndProcedure

Procedure Check_TelegramImage(Val Result, Val Text)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map") .Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["caption"]).Равно(Text);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["photo"]).ИмеетТип("Array");

EndProcedure

Procedure Check_TelegramVideo(Val Result, Val Text)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["caption"]).Равно(Text);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["video"]["mime_type"]).Равно("video/mp4");

EndProcedure

Procedure Check_TelegramAudio(Val Result, Val Text)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["caption"]).Равно(Text);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["audio"]["mime_type"]).Равно("audio/mpeg");

EndProcedure

Procedure Check_TelegramDocument(Val Result, Val Text)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["caption"]).Равно(Text);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["document"]).ИмеетТип("Map").Заполнено();

EndProcedure

Procedure Check_TelegramGif(Val Result, Val Text)

    Result_ = "result";

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result[Result_]["caption"]).Равно(Text);
    OPI_TestDataRetrieval.ExpectsThat(Result[Result_]["document"]).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result[Result_]["animation"]["mime_type"]).Равно("video/mp4");

EndProcedure

Procedure Check_TelegramMediaGroup(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");

EndProcedure

Procedure Check_TelegramLocation(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["location"]).ИмеетТип("Map").Заполнено();

EndProcedure

Procedure Check_TelegramContact(Val Result, Val Name)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["contact"]).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["contact"]["first_name"]).Равно(Name);

EndProcedure

Procedure Check_TelegramPoll(Val Result, Val Question)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["poll"]).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["poll"]["question"]).Равно(Question);

EndProcedure

Procedure Check_TelegramForward(Val Result, Val MessageID)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["forward_origin"]["message_id"]).Равно(Number(MessageID));

EndProcedure

Procedure Check_TelegramBan(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно("Bad Request: can't remove chat owner");

EndProcedure

Procedure Check_TelegramInvitation(Val Result, Val Title, Val UnixExpiration)

    Result_ = "result";
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result[Result_]["member_limit"]).Равно(200);
    OPI_TestDataRetrieval.ExpectsThat(Result[Result_]["name"]).Равно(Title);
    OPI_TestDataRetrieval.ExpectsThat(Result[Result_]["expire_date"]).Равно(Number(UnixExpiration));

EndProcedure

Procedure Check_TelegramNumber(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Number");

EndProcedure

Procedure Check_TelegramOk(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);

EndProcedure

Procedure Check_TelegramCreateTopic(Val Result, Val Name, Icon)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["name"]).Равно(Name);
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["icon_custom_emoji_id"]).Равно(Icon);

EndProcedure

Procedure Check_VKPost(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["post_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKTrue(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

EndProcedure

Procedure Check_VKAlbum(Val Result, Val Description)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["description"]).Равно(Description);

EndProcedure

Procedure Check_VKAlbumPicture(Val Result, Val ImageDescription, Val AlbumID)

    Response = "response";

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result[Response][0]["text"]).Равно(ImageDescription);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response][0]["album_id"]).Равно(AlbumID);

EndProcedure

Procedure Check_VKStory(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["count"]).ИмеетТип("Number").Равно(1);
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_VKDiscussion(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKLike(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["likes"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKRepost(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["success"]).ИмеетТип("Number").Равно(1);
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["wall_repost_count"]).ИмеетТип("Number").Равно(1);

EndProcedure

Procedure Check_VKComment(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["comment_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKStatistic(Val Result)

    TypeMap = "Map";

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"][0]["visitors"]).ИмеетТип(TypeMap).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"][0]["reach"]).ИмеетТип(TypeMap).Заполнено();

EndProcedure

Procedure Check_VKPostsStatistic(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Array").ИмеетДлину(2);

EndProcedure

Procedure Check_VKNumber(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKCollection(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["albums_count"]).ИмеетТип("Number").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["market_album_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKProduct(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["market_item_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKProp(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["property_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKPropVariant(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["variant_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKProductData(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").ИмеетДлину(2);

EndProcedure

Procedure Check_VKProductsGroup(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]["item_group_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKVideo(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["video_id"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["video_hash"]).Заполнено();

EndProcedure

Procedure Check_YaDiskDrive(Val Result)

    Map_ = "Map";

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(Map_).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["system_folders"]).ИмеетТип(Map_);
    OPI_TestDataRetrieval.ExpectsThat(Result["user"]).ИмеетТип(Map_);

EndProcedure

Procedure Check_YaDiskFolder(Val Result, Val Path)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Равно("dir");
    OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Равно("disk:" + Path);

EndProcedure

Procedure Check_YaDiskPath(Val Result, Val Path = "", Val Public = Undefined)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Равно("file");

    If ValueIsFilled(Path) Then
        OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Равно("disk:" + Path);
    Else
        OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Заполнено();
    EndIf;

    If Not Public = Undefined Then

        If Public Then
             OPI_TestDataRetrieval.ExpectsThat(Result["public_url"]).ИмеетТип("String").Заполнено();
        Else
            OPI_TestDataRetrieval.ExpectsThat(Result["public_url"]).ИмеетТип("Undefined");
        EndIf;

    EndIf;

EndProcedure

Procedure Check_YaDiskLink(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["method"]).Равно("GET");
    OPI_TestDataRetrieval.ExpectsThat(Result["href"]).ИмеетТип("String").Заполнено();

EndProcedure

Procedure Check_YaDiskProc(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["href"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["method"]).Заполнено();

EndProcedure

Procedure Check_YaDiskFilesList(Val Result, Val Count, Val Indent)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["limit"]).Равно(Count);
    OPI_TestDataRetrieval.ExpectsThat(Result["offset"]).Равно(Indent);
    OPI_TestDataRetrieval.ExpectsThat(Result["items"]).ИмеетТип("Array");


EndProcedure

Procedure Check_GKObject(Val Result, Val Name, Val Description)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["summary"]).Равно(Name);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно(Description);
    OPI_TestDataRetrieval.ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

EndProcedure

Procedure Check_TwitterText(Val Result, Val Text)

    ReplyText = Result["data"]["text"];
    ReplyText = Left(ReplyText, StrLen(Text));

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(ReplyText).Равно(Text);

EndProcedure

Procedure Check_ViberOk(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["status_message"]).Равно("ok");
    OPI_TestDataRetrieval.ExpectsThat(Result["status"]).Равно(0);

EndProcedure

Procedure Check_ViberUser(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["chat_hostname"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["status_message"]).Заполнено();

EndProcedure

Procedure Check_ViberOnline(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["status_message"]).Равно("ok");
    OPI_TestDataRetrieval.ExpectsThat(Result["status"]).Равно(0);
    OPI_TestDataRetrieval.ExpectsThat(Result["users"]).ИмеетТип("Array");

EndProcedure

Procedure Check_ViberMessage(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["status_message"]).Равно("ok");
    OPI_TestDataRetrieval.ExpectsThat(Result["status"]).Равно(0);

EndProcedure

Procedure Check_NotionObject(Val Result, Val View = "page")

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["object"]).Равно(View);

EndProcedure

Procedure Check_SlackOk(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);

EndProcedure

Procedure Check_DropboxFile(Val Result, Val Path)

    OPI_TestDataRetrieval.ExpectsThat(Result["path_display"]).Равно(Path);

EndProcedure

Procedure Check_DropboxMetadata(Val Result, Val Path)

    OPI_TestDataRetrieval.ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

EndProcedure

Procedure Check_DropboxArray(Val Result, Val Count = Undefined)

    OPI_TestDataRetrieval.ExpectsThat(Result["entries"]).ИмеетТип("Array");

    If Not Count = Undefined Then
        OPI_TestDataRetrieval.ExpectsThat(Result["entries"].Count()).Равно(Count);
    EndIf;

EndProcedure

Procedure Check_DropboxWork(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["async_job_id"]).Заполнено();
EndProcedure

Procedure Check_DropboxStatus(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result[".tag"]).Равно("complete");
EndProcedure

Procedure Check_DropboxTags(Val Result, Val Count)

    OPI_TestDataRetrieval.ExpectsThat(Result["paths_to_tags"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["paths_to_tags"].Count()).Равно(Count);

EndProcedure

Procedure Check_DropboxAccount(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["account_id"]).Заполнено();
EndProcedure

Procedure Check_DropboxSpace(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["used"]).Заполнено();
EndProcedure

Procedure Check_DropboxMember(Val Result, Val Email, Val ViewOnly)
    OPI_TestDataRetrieval.ExpectsThat(Result[0]["result"][".tag"]).Равно("success");
    OPI_TestDataRetrieval.ExpectsThat(Result[0]["member"]["email"]).Равно(Email);
    OPI_TestDataRetrieval.ExpectsThat(
        Result[0]["result"]["success"][".tag"]).Равно(?(ViewOnly, "viewer", "editor"));
EndProcedure

Procedure Check_DropboxPublicFolder(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["shared_folder_id"]).Заполнено();
EndProcedure

Procedure Check_BitrixTime(Val Result)

    Time = Result["result"];

    If Not TypeOf(Time) = Type("Date") Then
       Time             = XMLValue(Type("Date"), Time);
    EndIf;

    OPI_TestDataRetrieval.ExpectsThat(Time).ИмеетТип("Date").Заполнено();

EndProcedure

Procedure Check_BitrixAuth(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["access_token"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["refresh_token"]).Заполнено();

EndProcedure

Procedure Check_BitrixNumber(Val Result)
   OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();
EndProcedure

Procedure Check_BitrixTrue(Val Result)
   OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);
EndProcedure

Procedure Check_BitrixBool(Val Result)
   OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Boolean");
EndProcedure

Procedure Check_BitrixString(Val Result)
   OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("String").Заполнено();
EndProcedure

Procedure Check_BitrixArray(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
EndProcedure

Procedure Check_BitrixMap(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
EndProcedure

Procedure Check_BitrixList(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["list"]).ИмеетТип("Array");
EndProcedure

Procedure Check_BitrixObjectsArray(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["ID"]).Заполнено();

EndProcedure

Procedure Check_BitrixFields(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["fields"]).Заполнено();

EndProcedure

Procedure Check_BitrixTask(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["task"]).Заполнено();

EndProcedure

Procedure Check_BitrixTasksList(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["tasks"]).ИмеетТип("Array");
EndProcedure

Procedure Check_BitrixStorage(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["total"]).Заполнено();
EndProcedure

Procedure Check_BitrixObject(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["ID"]).Заполнено();

EndProcedure

Procedure Check_BitrixLead(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["PHONE"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["NAME"]).Заполнено();

EndProcedure

Procedure Check_BitrixDeal(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["ID"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["BEGINDATE"]).Заполнено();

EndProcedure

Procedure Check_BitrixAttachment(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["attachmentId"]).Заполнено();
EndProcedure

Procedure Check_BitrixAvailableActions(Val Result, Val Count)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");

    Actions = Result["result"]["allowedActions"];
    OPI_TestDataRetrieval.ExpectsThat(Actions).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Actions.Count()).Равно(Count);

EndProcedure

Procedure Check_BitrixComment(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["POST_MESSAGE"]).Заполнено();

EndProcedure

Procedure Check_BitrixResult(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["text"]).Заполнено();

EndProcedure

Procedure Check_BitrixUndefined(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Undefined");
    OPI_TestDataRetrieval.ExpectsThat(Result["time"]).Заполнено();

EndProcedure

Procedure Check_BitrixCommentsList(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["POST_MESSAGE"]).Заполнено();

EndProcedure

Procedure Check_BitrixResultsList(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["text"]).Заполнено();

EndProcedure

Procedure Check_BitrixMessages(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["messages"]).ИмеетТип("Array");

EndProcedure

Procedure Check_BitrixDialog(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["dialogId"]).Заполнено();

EndProcedure

Procedure Check_BitrixMessage(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["id"]).Заполнено();

EndProcedure

Procedure Check_BitrixFileMessage(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["MESSAGE_ID"]).Заполнено();

EndProcedure

Procedure Check_BitrixTimekeeping(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["STATUS"]).Заполнено();

EndProcedure

Procedure Check_BitrixTimekeepingSettings(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["UF_TIMEMAN"]).ИмеетТип("Boolean");

EndProcedure

Procedure Check_VKTUser(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["userId"]).Заполнено();

EndProcedure

Procedure Check_VKTEvents(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["events"]).ИмеетТип("Array");

EndProcedure

Procedure Check_VKTMessage(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["msgId"]).Заполнено();

EndProcedure

Procedure Check_VKTTrue(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);

EndProcedure

Procedure Check_VKTFile(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["ok"]).Равно(True);
    OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["size"]).Заполнено();

EndProcedure

Procedure Check_VKTList(Val Result, Val FieldName)

    OPI_TestDataRetrieval.ExpectsThat(Result[FieldName]).ИмеетТип("Array");

EndProcedure

Procedure Check_VKTChat(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["inviteLink"]).Заполнено();

EndProcedure

Procedure Check_VKTPending(Val Result)

    If Not Result["ok"] Then
        OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно("User is not pending or nobody in pending list");
    EndIf;

EndProcedure

Procedure Check_OzonCategoryList(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["category_name"]).Заполнено();

EndProcedure

Procedure Check_OzonAttributesList(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["description"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["id"]).Заполнено();

EndProcedure

Procedure Check_OzonListOfAttributesValues(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["value"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["id"]).Заполнено();

EndProcedure

Procedure Check_OzonUploadTask(Val Result, Val Embedded = True)

    If Embedded Then
        TaskID = Result["result"]["task_id"];
    Else
        TaskID = Result["task_id"];
    EndIf;

    OPI_TestDataRetrieval.ExpectsThat(TaskID).Заполнено();

EndProcedure

Procedure Check_OzonNewProducts(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["items"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["items"][0]["status"]).Равно("imported");

EndProcedure

Procedure Check_OzonObjectsArray(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["items"]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonUpdatedArray(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["updated"]).Равно(True);

EndProcedure

Procedure Check_OzonRatingArray(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["products"]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonProduct(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["id"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["name"]).Заполнено();

EndProcedure

Procedure Check_OzonProducts(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["items"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["items"][0]["name"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["items"][0]["id"]).Заполнено();

EndProcedure

Procedure Check_OzonLimits(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["daily_create"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["daily_update"]).Заполнено();

EndProcedure

Procedure Check_OzonPictures(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["pictures"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_OzonNoErrors(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["errors"].Count()).Равно(0);

EndProcedure

Procedure Check_OzonTrue(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).Равно(True);

EndProcedure

Procedure Check_OzonArray(Val Result, Val Field = "result")

    OPI_TestDataRetrieval.ExpectsThat(Result[Field]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonProductsDeleting(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["status"][0]["is_deleted"]).Равно(True);

EndProcedure

Procedure Check_OzonNewCodes(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["status"]).Равно("imported");

EndProcedure

Procedure Check_OzonSubscribers(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["result"][0]["count"]).ИмеетТип("Number");

EndProcedure

Procedure Check_OzonSKU(Val Result)

    OPI_TestDataRetrieval.ExpectsThat(Result["items"]).ИмеетТип("Array");
    OPI_TestDataRetrieval.ExpectsThat(Result["items"][0]["availability"]).Заполнено();

EndProcedure

#EndRegion

#Region AtomicTests

#Region Telegram

Procedure Telegram_GetBotInformation(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetBotInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetBotInformation", "Telegram");

    Check_TelegramBotInformation(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_GetUpdates(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetUpdates(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUpdates", "Telegram");

    Check_TelegramArray(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    URL   = FunctionParameters["Telegram_URL"];

    Result = OPI_Telegram.SetWebhook(Token, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetWebhook", "Telegram");

    Check_TelegramWebhookSetup(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_DeleteWebhook(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.DeleteWebhook(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteWebhook", "Telegram");

    Check_TelegramWebhookDeletion(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendTextMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];

    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage", "Telegram");

    Check_TelegramMessage(Result, Text); // SKIP

    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (channel)");

    Check_TelegramMessage(Result, Text);

    MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
    OPI_TestDataRetrieval.WriteParameter("Telegram_ChannelMessageID", MessageID);

    Text = "<b>Text html %F0%9F%93%9E 10%</b>";

    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text, , "HTML");

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (HTML)");

    Check_TelegramOk(Result);

    Text = "%F0%9F%A4%BC";

    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (emoji)");

    Check_TelegramOk(Result);

    Text = "Text %F0%9F%A5%9D and emoji \(10%\)";

    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text, , "MarkdownV2");

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (text and emoji)");

    Check_TelegramOk(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendPicture(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Image     = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    ImageDD = New BinaryData(ImagePath);

    Result = OPI_Telegram.SendImage(Token, ChatID, Text, Image);

    OPI_TestDataRetrieval.WriteLog(Result, "SendImage", "Telegram");

    Check_TelegramImage(Result, Text); // SKIP

    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImagePath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendPicture (Path)");

    Check_TelegramImage(Result, Text); // SKIP

    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImageDD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendPicture (DD)");

    Check_TelegramImage(Result, Text);

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
    CopyFile(Video, VideoPath);

    VideoDD = New BinaryData(VideoPath);

    Result = OPI_Telegram.SendVideo(Token, ChatID, Text, Video);

    OPI_TestDataRetrieval.WriteLog(Result, "SendVideo", "Telegram");

    Check_TelegramVideo(Result, Text); // SKIP

    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoPath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendVideo (Path)");

    Check_TelegramVideo(Result, Text); // SKIP

    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoDD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendVideo (DD)");

    Check_TelegramVideo(Result, Text);

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
    CopyFile(Audio, AudioPath);

    AudioDD = New BinaryData(AudioPath);

    Result = OPI_Telegram.SendAudio(Token, ChatID, Text, Audio);

    OPI_TestDataRetrieval.WriteLog(Result, "SendAudio", "Telegram");

    Check_TelegramAudio(Result, Text); // SKIP

    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioPath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendAudio (Path)");

    Check_TelegramAudio(Result, Text); // SKIP

    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioDD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendAudio (DD)");

    Check_TelegramAudio(Result, Text);

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
    CopyFile(Document, DocumentPath);

    DocumentDD = New BinaryData(DocumentPath);

    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document);

    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument", "Telegram");

    Check_TelegramDocument(Result, Text); // SKIP

    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document, , , "customname.docx");

    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument (with name)", "Telegram");

    Check_TelegramDocument(Result, Text); // SKIP

    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentPath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument (Path)");

    Check_TelegramDocument(Result, Text); // SKIP

    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentDD, , , "customname.docx");

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument (DD)");

    Check_TelegramDocument(Result, Text);

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
    CopyFile(GIF, GifPath);

    GifDD = New BinaryData(GifPath);

    Result = OPI_Telegram.SendGif(Token, ChatID, Text, GIF);

    OPI_TestDataRetrieval.WriteLog(Result, "SendGif", "Telegram");

    Check_TelegramGif(Result, Text); // SKIP

    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifPath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendGif (Path)");

    Check_TelegramGif(Result, Text); // SKIP

    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifDD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendGif (DD)");

    Check_TelegramGif(Result, Text);

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
    CopyFile(Image, ImagePath);

    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);

    VideoDD = New BinaryData(VideoPath);

    MediaGroup = New Map;
    MediaGroup.Insert(ImagePath, "photo");
    MediaGroup.Insert(VideoDD  , "video");

    Result = OPI_Telegram.SendMediaGroup(Token, ChatID, Text, MediaGroup);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendMediaGroup", "Telegram");

    Check_TelegramMediaGroup(Result);

    DocumentURL  = FunctionParameters["Document"];
    DocumentPath = GetTempFileName("docx");
    ChannelID    = FunctionParameters["Telegram_ChannelID"];

    CopyFile(DocumentURL, DocumentPath);

    MediaGroup = New Map;
    MediaGroup.Insert(DocumentURL , "document");
    MediaGroup.Insert(DocumentPath, "document");

    Result = OPI_Telegram.SendMediaGroup(Token, ChannelID, Text, MediaGroup);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMediaGroup (docs)", "Telegram");

    Check_TelegramMediaGroup(Result);

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

    Check_TelegramLocation(Result); // SKIP

    Result = OPI_Telegram.SendLocation(Token, ChannelID, Width, Longitude);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendLocation (channel)");

    Check_TelegramLocation(Result);

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

    Check_TelegramContact(Result, Name); // SKIP
    OPI_Tools.Pause(20); // SKIP

    Result = OPI_Telegram.SendContact(Token, ChannelID, Name, LastName, Phone);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendContact (channel)");

    Check_TelegramContact(Result, Name);

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

    Check_TelegramPoll(Result, Question); // SKIP

    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, AnswersArray, True);

    OPI_TestDataRetrieval.WriteLog(Result, "SendPoll (channel)");

    Check_TelegramPoll(Result, Question); // SKIP

    // END

    StringArray = "['Red', 'Yellow', 'Green', 'Blue']";

    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, StringArray, True);

    OPI_TestDataRetrieval.WriteLog(Result, "SendPoll (string array)");

    Check_TelegramPoll(Result, Question);

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

    Check_TelegramForward(Result, MessageID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_Ban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.Ban(Token, ChannelID, UserID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "Ban", "Telegram");

    Check_TelegramBan(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_Unban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.Unban(Token, ChannelID, UserID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "Unban", "Telegram");

    Check_TelegramBan(Result);
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

    Check_TelegramInvitation(Result, Title, UnixExpiration);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_PinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.PinMessage(Token, ChannelID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PinMessage", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.UnpinMessage(Token, ChannelID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnpinMessage", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_GetParticipantCount(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.GetParticipantCount(Token, ChannelID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetParticipantCount", "Telegram");

    Check_TelegramNumber(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_GetForumAvatarList(FunctionParameters)

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

    Check_TelegramCreateTopic(Result, Name, Icon);

    ChatTopic = Chat + "*" + Topic;
    Text      = FunctionParameters["String"];
    Result    = OPI_Telegram.SendTextMessage(Token, ChatTopic, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (forum)");

    Check_TelegramMessage(Result, Text);

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

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_CloseForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    OPI_Telegram.OpenForumThread(Token, Chat); // SKIP

    Result = OPI_Telegram.CloseForumThread(Token, Chat); // Closes main topic

    OPI_TestDataRetrieval.WriteLog(Result, "CloseForumTopic (main)");

    Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.CloseForumThread(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CloseForumThread", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure Telegram_OpenForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.OpenForumThread(Token, Chat); // Opens main topic

    OPI_TestDataRetrieval.WriteLog(Result, "OpenForumTopic (main)");

    Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.OpenForumThread(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "OpenForumThread", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure Telegram_DeleteForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.DeleteForumTopic(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteForumTopic", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure Telegram_ClearPinnedMessagesList(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat);

    OPI_TestDataRetrieval.WriteLog(Result, "ClearPinnedMessagesList (main)");

    Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ClearThreadPinnedMessagesList", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_HideMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.HideMainForumTopic(Token, Chat);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "HideMainForumTopic", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_ShowMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ShowMainForumTopic", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_ChangeMainTopicName(FunctionParameters)

    Title = "New main thread name " + String(New UUID);
    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.EditMainForumTopicName(Token, Chat, Title);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditMainForumTopicName", "Telegram");

    Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.DeleteMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage", "Telegram");

    Check_TelegramTrue(Result);

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
    CopyFile(Image2, TFN);

    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(TFN);

    Result = OPI_VK.CreatePost(Text, ImageArray, True, URL, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost", "VK");

    Check_VKPost(Result); // SKIP
    PostID = Result["response"]["post_id"]; // SKIP
    Result = OPI_VK.DeletePost(PostID, Parameters); // SKIP

    Result = OPI_VK.CreatePost(Text, Image, False , , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost (one picture)");

    Check_VKPost(Result);

    PostID = Result["response"]["post_id"];
    Result = OPI_VK.DeletePost(PostID, Parameters);

    OPI_Tools.Pause(5);

    Result = OPI_VK.CreatePost(Text, TFN , True, URL, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost (one path)");

    Check_VKPost(Result);

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

    Check_VKTrue(Result);

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

    Check_VKPost(Result);
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

    Check_VKPost(Result);

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

    Check_VKAlbum(Result, Description);

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
    CopyFile(Image, TFN);

    Image = New BinaryData(TFN);

    Result = OPI_VK.SaveImageToAlbum(AlbumID, Image, ImageDescription, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "SaveImageToAlbum", "VK");

    Check_VKAlbumPicture(Result, ImageDescription, AlbumID); // SKIP

    ImageID = Result["response"][0]["id"]; // SKIP
    Result  = OPI_VK.DeleteImage(ImageID, Parameters); // SKIP

    Result = OPI_VK.SaveImageToAlbum(AlbumID, TFN, ImageDescription, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SavePictureToAlbum (path)");

    Check_VKAlbumPicture(Result, ImageDescription, AlbumID); // SKIP

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

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteAlbum(FunctionParameters)

    Parameters = GetVKParameters();
    AlbumID    = FunctionParameters["VK_AlbumID"];

    Result = OPI_VK.DeleteAlbum(AlbumID, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteAlbum", "VK");

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateStory(FunctionParameters)

    Parameters = GetVKParameters();
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, Path to file or Binary Data
    TFN   = GetTempFileName("png");
    CopyFile(Image, TFN);
    Image = New BinaryData(TFN);

    Result = OPI_VK.CreateStory(Image , URL, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStory", "VK");

    Check_VKStory(Result); // SKIP

    Result = OPI_VK.CreateStory(TFN, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStory (path)");

    Check_VKStory(Result);

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

    Check_VKDiscussion(Result);

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

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_OpenDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result       = OPI_VK.OpenDiscussion(DiscussionID, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "OpenDiscussion", "VK");

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_PostToDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Message      = "I like yellow more";

    Result = OPI_VK.WriteInDiscussion(DiscussionID, Message, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "WriteInDiscussion", "VK");

    Check_VKDiscussion(Result);

EndProcedure

Procedure VK_LikePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Result = OPI_VK.LikePost(PostID, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "LikePost", "VK");

    Check_VKLike(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_MakeRepost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = 2571;
    WallID     = -218704372;

    Result = OPI_VK.MakeRepost(PostID, WallID, , , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MakeRepost", "VK");

    Check_VKRepost(Result);

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

    Check_VKComment(Result);

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

    Check_VKStatistic(Result);

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

    Check_VKPostsStatistic(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateAdCampaign(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    Name      = "New campaign";

    Result = OPI_VK.CreateAdvertisingCampaign(AccountID, Name, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateAdvertisingCampaign", "VK");

    Check_Map(Result);

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

    Check_Map(Result);

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

    Check_Map(Result);

EndProcedure

Procedure VK_FormKeyboard(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Keyboard = OPI_VK.FormKeyboard(ButtonArray);

    // END

    Check_String(Keyboard);

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

    Check_VKNumber(Result);

EndProcedure

Procedure VK_GetProductCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Result = OPI_VK.GetProductCategoryList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCategoryList", "VK");

    Check_Map(Result);

EndProcedure

Procedure CreateProductCollection(FunctionParameters)

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

    Check_VKCollection(Result);

    OPI_Tools.Pause(5);

    SelectionID = Result["response"]["market_album_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketAlbumID", SelectionID);
    FunctionParameters.Insert("VK_MarketAlbumID", SelectionID);

EndProcedure

Procedure EditProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name      = "EditedCollection";
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.EditProductCollection(Name, Selection, , , , Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "EditProductCollection", "VK");

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_AddProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Image1    = FunctionParameters["Picture"]; // URL, Path to file or binary Data
    Image2    = FunctionParameters["Picture2"]; // URL, Path to file or binary Data
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

    Check_VKProduct(Result);

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

    Check_VKTrue(Result);

EndProcedure

Procedure VK_AddProductToCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.AddProductToCollection(Product, Selection, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddProductToCollection", "VK");

    Check_VKNumber(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_RemoveProductFromCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.RemoveProductFromSelection(Product, Selection, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveProductFromSelection", "VK");

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    Result = OPI_VK.DeleteProduct(Product, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProduct", "VK");

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.DeleteSelection(Selection, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSelection", "VK");

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name = "Color";

    Result = OPI_VK.CreateProductProperty(Name, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductProperty", "VK");

    Check_VKProp(Result);

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

    Check_VKTrue(Result);

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

        Check_VKPropVariant(Result); // SKIP
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

    Check_VKTrue(Result);

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

    Check_VKProduct(Result);

    ProductID = Result["response"]["market_item_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketItemID2", ProductID);
    FunctionParameters.Insert("VK_MarketItemID2", ProductID);

    Product.Insert("Name"          , "Test product (another)");
    Product.Insert("PropertyValues", PropVariant2);

    Result = OPI_VK.AddProduct(Product, , Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "ProductWithProp2");

    Check_VKProduct(Result);

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

    Check_VKProductData(Result);

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

    Check_VKProductsGroup(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Option = FunctionParameters["VK_PropVarID1"];

    Result = OPI_VK.DeleteProductPropertyVariant(Option, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductPropertyVariant", "VK");

    Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];

    Result = OPI_VK.DeleteProductProperty(Property, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductProperty");

    OPI_Tools.Pause(5);

    Check_VKTrue(Result);

EndProcedure

Procedure VK_GetProductList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetProductList(, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductList", "VK");

    Check_Array(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetSelectionList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetSelectionList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetSelectionList", "VK");

    Check_Array(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetPropertyList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetPropertyList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPropertyList", "VK");

    Check_Array(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetOrderList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetOrderList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetOrderList", "VK");

    Check_Array(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_UploadVideoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Video       = FunctionParameters["Video"];
    Name        = "NewVideo";
    Description = "Video description";

    Result = OPI_VK.UploadVideoToServer(Video, Name, Description, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadVideoToServer", "VK");

    Check_VKVideo(Result);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region YandexDisk

Procedure YandexDisk_GetDiskInfo(FunctionParameters)

    Token  = FunctionParameters["YandexDisk_Token"];
    Result = OPI_YandexDisk.GetDiskInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDiskInformation", "YandexDisk");

    Check_YaDiskDrive(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_CreateFolder(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = "/" + String(New UUID);

    Result = OPI_YandexDisk.CreateFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateFolder", "YandexDisk");

    Check_YaDiskFolder(Result, Path);

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

    Check_YaDiskProc(Result);

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

    Check_YaDiskPath(Result, Path);

EndProcedure

Procedure YandexDisk_DeleteObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);

    // END

    OPI_Tools.Pause(5);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject", "YandexDisk");

    Check_Empty(Result);

EndProcedure

Procedure YandexDisk_UploadFile(FunctionParameters)

    Path1 = "/" + String(New UUID) + ".png";
    Path2 = "/" + String(New UUID) + ".png";

    Token = FunctionParameters["YandexDisk_Token"];
    Image = FunctionParameters["Picture"]; // URL

    TFN = GetTempFileName("png"); // Path
    CopyFile(Image, TFN);

    Result = OPI_YandexDisk.UploadFile(Token, Path1, Image, True);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile (URL)", "YandexDisk");

    Check_Empty(Result); // SKIP

    OPI_Tools.Pause(5); // SKIP

    Result = OPI_YandexDisk.UploadFile(Token, Path2, TFN, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile", "YandexDisk");

    Check_Empty(Result);

    OPI_Tools.Pause(5);

    Result = OPI_YandexDisk.DeleteObject(Token, Path1, False);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject (URL)", "YandexDisk");

    Check_Empty(Result);

    Result = OPI_YandexDisk.DeleteObject(Token, Path2, False);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject (Path)", "YandexDisk");

    Check_Empty(Result);

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

    Check_YaDiskPath(Result, Path);

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

    Check_YaDiskLink(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_DownloadFile(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Result = OPI_YandexDisk.DownloadFile(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile", "YandexDisk");

    Check_BinaryData(Result);

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

    Check_YaDiskFilesList(Result, Count, OffsetFromStart);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_MoveObject(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.MoveObject(Token, Original, Path, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MoveObject", "YandexDisk");

    Check_YaDiskPath(Result, Path);

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

    Check_YaDiskFilesList(Result, Count, OffsetFromStart);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_PublishObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Result = OPI_YandexDisk.PublishObject(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PublishObject", "YandexDisk");

    Check_YaDiskPath(Result, Path, True);

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

    Check_YaDiskLink(Result);

EndProcedure

Procedure YandexDisk_GetPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.GetPublicObject(Token, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPublicObject");

    Check_YaDiskPath(Result, "", True);

EndProcedure

Procedure YandexDisk_SavePublicObjectToDisk(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.SavePublicObjectToDisk(Token, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SavePublicObjectToDisk");

    Check_YaDiskPath(Result, "", False);

EndProcedure

Procedure YandexDisk_CancelObjectPublication(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Result = OPI_YandexDisk.CancelObjectPublication(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CancelObjectPublication", "YandexDisk");

    Check_YaDiskPath(Result, Path, False);

EndProcedure

#EndRegion

#Region Viber

Procedure Viber_GetChannelInformation(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    Result = OPI_Viber.GetChannelInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelInformation", "Viber");

    Check_ViberOk(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_GetUserData(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Result = OPI_Viber.GetUserData(Token, UserID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserData", "Viber");

    Check_ViberUser(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_GetOnlineUsers(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Result = OPI_Viber.GetOnlineUsers(Token, UserID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetOnlineUsers", "Viber");

    Check_ViberOnline(Result);

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
    Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (channel)", "Viber");

    Check_ViberMessage(Result);

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
    Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendPicture (channel)", "Viber");

    Check_ViberMessage(Result);

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
    Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile (channel)", "Viber");

    Check_ViberMessage(Result);

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
    Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendContact (channel)", "Viber");

    Check_ViberMessage(Result);

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
    Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendLocation (channel)", "Viber");

    Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_SendLink(FunctionParameters)

    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    OPI_TestDataRetrieval.WriteLog(Result, "SendLink", "Viber"); // SKIP
    Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendLink (channel)", "Viber");

    Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

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

    Check_DropboxFile(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetPreview(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.GetPreview(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPreview", "Dropbox");

    Check_BinaryData(Result, 120000);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_UploadFile(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];
    Image = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    Result = OPI_Dropbox.UploadFile(Token, ImagePath, Path, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile", "Dropbox");

    Check_DropboxFile(Result, Path);
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

    Check_DropboxWork(Result);

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

    Check_DropboxStatus(Result);

    Path   = "/New/url_doc.docx";
    Result = OPI_Dropbox.DeleteObject(Token, Path);

    Check_DropboxMetadata(Result, Path);
    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_DeleteObject(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.DeleteObject(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject", "Dropbox");

    Check_DropboxMetadata(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_CopyObject(FunctionParameters)

    Original = "/New/pic.png";
    Copy     = "/New/pic_copy.png";
    Token    = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.CopyObject(Token, Original, Copy);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CopyObject", "Dropbox");

    Check_DropboxMetadata(Result, Copy);

    Result = OPI_Dropbox.DeleteObject(Token, Copy);
    Check_DropboxMetadata(Result, Copy);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_MoveObject(FunctionParameters)

    OriginalPath = "/New/pic.png";
    TargetPath   = "/pic.png";
    Token        = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.MoveObject(Token, OriginalPath, TargetPath);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MoveObject", "Dropbox");

    Check_DropboxMetadata(Result, TargetPath);

    Result = OPI_Dropbox.MoveObject(Token, TargetPath, OriginalPath);
    Check_DropboxMetadata(Result, OriginalPath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_CreateFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New catalog";

    Result = OPI_Dropbox.CreateFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateFolder", "Dropbox");

    Check_DropboxMetadata(Result, Path);

    Result = OPI_Dropbox.DeleteObject(Token, Path);
    Check_DropboxMetadata(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_DownloadFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.DownloadFile(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile", "Dropbox");

    Check_BinaryData(Result, 2000000);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_DownloadFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Result = OPI_Dropbox.DownloadFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFolder", "Dropbox");

    Check_BinaryData(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetFolderFileList(FunctionParameters)

    Path  = "/New";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetListOfFolderFiles(Token, Path, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetListOfFolderFiles", "Dropbox");

    Check_DropboxArray(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetObjectVersionList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.GetObjectVersionList(Token, Path, 1);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetObjectVersionList", "Dropbox");

   Check_DropboxArray(Result, 1);

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

    Check_DropboxFile(Result, Path);

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

    Check_DropboxTags(Result, PathsArray.Count());

    Result = OPI_Dropbox.GetTagList(Token, "/New/mydoc.docx");

    OPI_TestDataRetrieval.WriteLog(Result, "GetTagList (single)");

    Check_DropboxTags(Result, 1);

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

    Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_DeleteTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.DeleteTag(Token, Path, Tag);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTag", "Dropbox");

    Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetAccountInformation(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetAccountInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAccountInformation", "Dropbox");

    Check_DropboxAccount(Result);

    Result = OPI_Dropbox.GetAccountInformation(Token, Result["account_id"]);

    OPI_TestDataRetrieval.WriteLog(Result, "GetAccountInformation (third-party)");

    Check_DropboxAccount(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetSpaceUsageData(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetSpaceUsageData(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetSpaceUsageData", "Dropbox");

    Check_DropboxSpace(Result);

EndProcedure

Procedure Dropbox_AddUsersToFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Email = FunctionParameters["Dropbox_OtherUser"];
    File  = FunctionParameters["Dropbox_FileID"];

    Result = OPI_Dropbox.AddUsersToFile(Token, File, Email, False);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToFile", "Dropbox");

    Check_DropboxMember(Result, Email, False);

    Mails = New Array;
    Mails.Add(Email);

    Result = OPI_Dropbox.AddUsersToFile(Token, File, Mails, True);

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToFile (new.) ");

    Check_DropboxMember(Result, Email, True);

EndProcedure

Procedure Dropbox_PublishFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Result = OPI_Dropbox.PublishFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PublishFolder", "Dropbox");

    Check_DropboxPublicFolder(Result);

    FolderID = Result["shared_folder_id"];

    FunctionParameters.Insert("Dropbox_SharedFolder", FolderID);
    OPI_TestDataRetrieval.WriteParameter("Dropbox_SharedFolder", FolderID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_CancelFolderPublication(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Folder = FunctionParameters["Dropbox_SharedFolder"];

    Result        = OPI_Dropbox.CancelFolderPublication(Token, Folder);
    CurrentStatus = "in_progress";
    JobID         = Result["async_job_id"];

    WHile CurrentStatus = "in_progress" Do
        Result          = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
        CurrentStatus   = Result[".tag"];
        OPI_Tools.Pause(3);
    EndDo;

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CancelFolderPublication", "Dropbox");

   Check_DropboxStatus(Result);

   OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_AddUsersToFolder(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Email  = FunctionParameters["Dropbox_OtherUser"];
    Folder = FunctionParameters["Dropbox_SharedFolder"]; // shared_folder_id

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Email, False);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToFolder", "Dropbox");

    Check_Empty(Result);

    Mails = New Array;
    Mails.Add(Email);

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Mails, True);

    Check_Empty(Result);

EndProcedure

Procedure Dropbox_CancelFilePublication(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    File  = FunctionParameters["Dropbox_FileID"];

    Result = OPI_Dropbox.CancelFilePublication(Token, File);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CancelFilePublication", "Dropbox");

    Check_Empty(Result);

EndProcedure

#EndRegion

#Region Bitrix24

Procedure Bitrix24_GetAppAuthLink(FunctionParameters)

    Domain   = FunctionParameters["Bitrix24_Domain"];
    ClientID = FunctionParameters["Bitrix24_ClientID"];

    Result = OPI_Bitrix24.GetAppAuthLink(Domain, ClientID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAppAuthLink", "Bitrix24");

    Check_String(Result);

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

    Check_BitrixAuth(Result);

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Token"  , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);
    EndIf;

EndProcedure

Procedure Bitrix24_ServerTime(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.ServerTime(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "ServerTime (wh)", "Bitrix24");

    Check_BitrixTime(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.ServerTime(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ServerTime", "Bitrix24");

    Check_BitrixTime(Result);

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

    Check_BitrixNumber(Result); // SKIP

    PostID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookPostID", PostID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookPostID", PostID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost", "Bitrix24");

    Check_BitrixNumber(Result);

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

    Check_BitrixNumber(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    PostID = FunctionParameters["Bitrix24_HookPostID"];

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdatePost", "Bitrix24");

    Check_BitrixNumber(Result);

EndProcedure

Procedure Bitrix24_DeletePost(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetImportantPostViewers(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetImportantPostViewers (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetImportantPostViewers", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetPosts(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetPosts(URL, PostID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetPosts (wh)", "Bitrix24");

    Check_BitrixObjectsArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetPosts(URL, PostID, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPosts", "Bitrix24");

    Check_BitrixObjectsArray(Result);

EndProcedure

Procedure Bitrix24_AddPostComment(FunctionParameters)

    Text   = "Comment for post";
    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "AddPostComment (wh)", "Bitrix24");

    Check_BitrixNumber(Result); // SKIP

    Text  = "Another comment";
    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddPostComment", "Bitrix24");

    Check_BitrixNumber(Result);

EndProcedure

Procedure Bitrix24_AddPostRecipients(FunctionParameters)

    Visibility = "UA";
    PostID     = FunctionParameters["Bitrix24_PostID"];
    URL        = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility);

    OPI_TestDataRetrieval.WriteLog(Result, "AddPostRecipients (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddPostRecipients", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetTaskFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskFieldsStructure (wh)", "Bitrix24");

    Check_BitrixFields(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskFieldsStructure", "Bitrix24");

    Check_BitrixFields(Result);

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

    Check_BitrixTask(Result); // SKIP

    TaskID = Result["result"]["task"]["id"]; // SKIP

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookTaskID", TaskID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookTaskID", TaskID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTask", "Bitrix24");

    Check_BitrixTask(Result);

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

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_GetTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_ApproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "ApproveTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ApproveTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_DisapproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID);

    Check_Map(Result); // SKIP

    OPI_TestDataRetrieval.WriteLog(Result, "DisapproveTask (wh)", "Bitrix24");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID, Token);

    // END

    Check_Map(Result);

    OPI_TestDataRetrieval.WriteLog(Result, "DisapproveTask", "Bitrix24");

EndProcedure

Procedure Bitrix24_CompleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.CompleteTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.CompleteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_RenewTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.RenewTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "RenewTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.RenewTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenewTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_DeferTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DeferTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeferTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DeferTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeferTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_StartTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StartTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "StartTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StartTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "StartTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_StartWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "StartWatchingTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "StartWatchingTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_StopWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_PauseTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.PauseTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "PauseTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.PauseTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PauseTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_DeleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_DelegateTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID);

    OPI_TestDataRetrieval.WriteLog(Result, "DelegateTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DelegateTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_AddTaskToFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskToFavorites", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_RemoveTaskFromFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveTaskFromFavorites (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveTaskFromFavorites", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetTaskHistory(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskHistory (wh)", "Bitrix24");

    Check_BitrixList(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskHistory", "Bitrix24");

    Check_BitrixList(Result);

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

    Check_BitrixTasksList(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTasksList(URL, , Indent, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksList", "Bitrix24");

    Check_BitrixTasksList(Result);

EndProcedure

Procedure Bitrix24_GetStoragesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Result = OPI_Bitrix24.GetStoragesList(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetStoragesList (wh)", "Bitrix24");

    Check_BitrixStorage(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStoragesList(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetStoragesList", "Bitrix24");

    Check_BitrixStorage(Result);

EndProcedure

Procedure Bitrix24_GetAppStorage(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetAppSotrage(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAppSotrage", "Bitrix24");

    Check_BitrixObject(Result);

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

    Check_BitrixObject(Result); // SKIP

    FileID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookFileID", FileID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookFileID", FileID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileToStorage", "Bitrix24");

    Check_BitrixObject(Result);

    FileID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_FileID", FileID);
    FunctionParameters.Insert("Bitrix24_FileID", FileID);

EndProcedure

Procedure Bitrix24_DeleteFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_HookFileID"];

    Result = OPI_Bitrix24.DeleteFile(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFile (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFile", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_CreateStorageFolder(FunctionParameters)

    StorageID = 3;
    Name      = "New catalog";
    Filename2 = "New folder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Filename2);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStorageFolder (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    FolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookFolderID", FolderID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookFolderID", FolderID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStorageFolder", "Bitrix24");

    Check_BitrixObject(Result);

    FolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_FolderID", FolderID); // SKIP
    FunctionParameters.Insert("Bitrix24_FolderID", FolderID); // SKIP

EndProcedure

Procedure Bitrix24_DeleteFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_HookFolderID"];

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFolder (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFolder", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetStorage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorage(URL, StorageID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetStorage (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStorage(URL, StorageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetStorage", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetStorageObjects(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetStorageObjects (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetStorageObjects", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_RenameStorage(FunctionParameters)

    Name      = "New storage name";
    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    StorageID = FunctionParameters["Bitrix24_StorageID"];

    Result = OPI_Bitrix24.RenameStorage(URL, StorageID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenameStorage", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetFolderInformation(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderInformation (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderInformation", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_CreateSubfolder(FunctionParameters)

    FolderID  = FunctionParameters["Bitrix24_FolderID"];
    Name      = "New subfolder";
    Filename2 = "New subfolder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Filename2);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSubfolder (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    SubfolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookSubfolderID", SubfolderID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookSubfolderID", SubfolderID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSubfolder", "Bitrix24");

    Check_BitrixObject(Result);

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

    Check_BitrixObject(Result); // SKIP

    DestinationID = FunctionParameters["Bitrix24_SubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MakeFolderCopy(URL, FolderID, DestinationID, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "MakeFolderCopy", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetFolderExternalLink(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderExternalLink (wh)", "Bitrix24");

    Check_BitrixString(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderExternalLink", "Bitrix24");

    Check_BitrixString(Result);

EndProcedure

Procedure Bitrix24_GetFolderFilterStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetFolderFilterStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderFilterStructure (wh)", "Bitrix24");

    Check_Structure(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderFilterStructure(URL, True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderFilterStructure", "Bitrix24");

    Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetFolderItems(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderItems (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderItems", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_MarkFolderAsDeleted(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "MarkFolderAsDeleted (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MarkFolderAsDeleted", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_RestoreFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreFolder (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreFolder", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_MoveFolder(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveFolder (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    FolderID = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveFolder", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_RenameFolder(FunctionParameters)

    Name      = "New catalog";
    Filename2 = "New folder 2";

    FolderID2 = FunctionParameters["Bitrix24_HookFolderID"];
    URL       = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID2, Filename2);

    OPI_TestDataRetrieval.WriteLog(Result, "RenameFolder (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];
    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenameFolder", "Bitrix24");

    Check_BitrixObject(Result);

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

    Check_BitrixObject(Result); // SKIP

    FileID = Result["result"]["ID"]; // SKIP
    OPI_Bitrix24.DeleteFile(URL, FileID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Name, Image, DestinationID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileToFolder", "Bitrix24");

    Check_BitrixObject(Result);

    FileID = Result["result"]["ID"];
    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);

EndProcedure

Procedure Bitrix24_MakeCopyFile(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MakeCopyFile(URL, FileID, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "MakeCopyFile (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MakeCopyFile(URL, FileID, FolderID, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "MakeCopyFile", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetFileInformation(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileInformation (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileInformation", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetFileExternalLink(FunctionParameters)

    OPI_Tools.Pause(20); // SKIP

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileExternalLink (wh)", "Bitrix24");

    // Check_BitrixString(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileExternalLink", "Bitrix24");

    // Check_BitrixString(Result);

EndProcedure

Procedure Bitrix24_MarkFileAsDeleted(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "MarkFileAsDeleted (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MarkFileAsDeleted", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_RestoreFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.RestoreFile(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreFile (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RestoreFile(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreFile", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_RenameFile(FunctionParameters)

    Name      = "New file name.jpg";
    Filename2 = "New file name 2.jpg";

    FileID2 = FunctionParameters["Bitrix24_HookFileID"];
    URL     = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.RenameFile(URL, FileID2, Filename2);

    OPI_TestDataRetrieval.WriteLog(Result, "RenameFile (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    FileID = FunctionParameters["Bitrix24_FileID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenameFile(URL, FileID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenameFile", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_MoveFileToFolder(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookSubFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveFileToFolder (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    FolderID = FunctionParameters["Bitrix24_SubFolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveFileToFolder", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_AttachFileToTopic(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    FileID = FunctionParameters["Bitrix24_TaskFileID"];

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "AttachFileToTopic (wh)", "Bitrix24");

    Check_BitrixAttachment(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AttachFileToTopic", "Bitrix24");

    Check_BitrixAttachment(Result);

EndProcedure

Procedure Bitrix24_CheckTaskAccesses(FunctionParameters)

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("1");
    ArrayOfUsers.Add("10");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers);

    OPI_TestDataRetrieval.WriteLog(Result, "CheckTaskAccesses (wh)", "Bitrix24");

    Check_BitrixAvailableActions(Result, ArrayOfUsers.Count()); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CheckTaskAccesses", "Bitrix24");

    Check_BitrixAvailableActions(Result, ArrayOfUsers.Count());

EndProcedure

Procedure Bitrix24_MuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.MuteTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "MuteTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.MuteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MuteTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_UnmuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.UnmuteTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "UnmuteTask (wh)", "Bitrix24");

    Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.UnmuteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnmuteTask", "Bitrix24");

    Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_AddTaskComment(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Text = "Task impossible, let's split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskComment (wh)", "Bitrix24");

    Check_BitrixNumber(Result); // SKIP

    CommentID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCommentID", CommentID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookCommentID", CommentID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text = "Task uninpossible, don't split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskComment", "Bitrix24");

    Check_BitrixNumber(Result);

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

    Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTaskComment", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_CreateResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateResultFromComment (wh)", "Bitrix24");

    Check_BitrixResult(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateResultFromComment", "Bitrix24");

    Check_BitrixResult(Result);

EndProcedure

Procedure Bitrix24_DeleteResultFromComment(FunctionParameters) Export

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "Delete result from comment)", "Bitrix24");

    Check_BitrixUndefined(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteResultFromComment", "Bitrix24");

    Check_BitrixUndefined(Result);

EndProcedure

Procedure Bitrix24_GetResultsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetResultsList (wh)", "Bitrix24");

    Check_BitrixResultsList(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetResultsList", "Bitrix24");

    Check_BitrixResultsList(Result);

EndProcedure

Procedure Bitrix24_GetTaskCommentsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskCommentsList (wh)", "Bitrix24");

    Check_BitrixCommentsList(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskCommentsList", "Bitrix24");

    Check_BitrixCommentsList(Result);

EndProcedure

Procedure Bitrix24_GetTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskComment (wh)", "Bitrix24");

    Check_BitrixComment(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskComment", "Bitrix24");

    Check_BitrixComment(Result);

EndProcedure

Procedure Bitrix24_UpdateTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Text = "The task has been changed, do not split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTaskComment (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Text = "The task has been changed, let's split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTaskComment", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_CreateTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTasksDependencies (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTasksDependencies (wh)", "Bitrix24");

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTasksDependencies", "Bitrix24");

    Check_BitrixArray(Result);

    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTasksDependencies", "Bitrix24");

EndProcedure

Procedure Bitrix24_AddKanbanStage(FunctionParameters)

    Name  = "New stage";
    Color = "0026FF";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, 6);

    OPI_TestDataRetrieval.WriteLog(Result, "AddKanbanStage (wh)", "Bitrix24");

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

    StageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_StageID", StageID);
    FunctionParameters.Insert("Bitrix24_StageID", StageID);

EndProcedure

Procedure Bitrix24_DeleteKanbanStage(FunctionParameters)

    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, True);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteKanbanStage (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteKanbanStage", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetKanbanStages(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetKanbanStages(URL, , True);

    OPI_TestDataRetrieval.WriteLog(Result, "GetKanbanStages (wh)", "Bitrix24");

    Check_BitrixMap(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetKanbanStages(URL, , , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetKanbanStages", "Bitrix24");

    Check_BitrixMap(Result);

EndProcedure

Procedure Bitrix24_MoveTaskToKanbanStage(FunctionParameters)

    TaskID  = FunctionParameters["Bitrix24_KanbanTaskID"];
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveTaskToKanbanStage (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID, , , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MoveTaskToKanbanStage", "Bitrix24");

    Check_BitrixTrue(Result);

    OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, 2, , , Token);

EndProcedure

Procedure Bitrix24_UpdateKanbansStage(FunctionParameters)

    Name    = "New stage name";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateKanbansStage (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    Name    = "New stage name 2";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color, 6, True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateKanbansStage", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_AddTasksChecklistElement(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Text = "Checklist element";

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, True);

    OPI_TestDataRetrieval.WriteLog(Result, "AddTasksChecklistElement (wh)", "Bitrix24");

    Check_BitrixNumber(Result); // SKIP

    ElementID = Result["result"]; // SKIP

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCheckElementID", ElementID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookCheckElementID", ElementID); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddTasksChecklistElement", "Bitrix24");

    Check_BitrixNumber(Result);

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

    Check_BitrixUndefined(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTasksChecklistElement", "Bitrix24");

    Check_BitrixUndefined(Result);

EndProcedure

Procedure Bitrix24_DeleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTasksChecklistElement (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTasksChecklistElement", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetTasksChecklist(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksChecklist (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksChecklist", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksChecklistElement (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksChecklistElement", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_CompleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTasksChecklistElement (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTasksChecklistElement", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_RenewTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.WriteLog(Result, "RenewTasksChecklistElement (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenewTasksChecklistElement", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_AddTaskTimeAccounting(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Time = 3600;

    Result = OPI_Bitrix24.AddTaskTimeAccounting(URL, TaskID, Time);

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskTimeAccounting (wh)", "Bitrix24");

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

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

    Check_BitrixUndefined(Result); // SKIP

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

    Check_BitrixUndefined(Result);

EndProcedure

Procedure Bitrix24_DeleteTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTaskTimeAccounting (wh)", "Bitrix24");

    Check_BitrixUndefined(Result); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTaskTimeAccounting", "Bitrix24");

    Check_BitrixUndefined(Result);

EndProcedure

Procedure Bitrix24_GetTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskTimeAccounting (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskTimeAccounting", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetTaskTimeAccountingList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskTimeAccountingList (wh)", "Bitrix24");

    Check_BitrixObjectsArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskTimeAccountingList", "Bitrix24");

    Check_BitrixObjectsArray(Result);

EndProcedure

Procedure Bitrix24_GetDailyPlan(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDailyPlan(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDailyPlan (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetDailyPlan(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDailyPlan", "Bitrix24");

    Check_BitrixArray(Result);

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

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

    ChatID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatID", ChatID); // SKIP
    FunctionParameters.Insert("Bitrix24_ChatID", ChatID); // SKIP

EndProcedure

Procedure Bitrix24_GetChatUsers(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatUsers (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatUsers", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_LeaveChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "LeaveChat (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "LeaveChat", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DeleteUserFromChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteUserFromChat (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteUserFromChat", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_AddUsersToChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserIDs);

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToChat (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];
    UserID = 10;

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserID, True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToChat", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeChatTitle(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Title = "New chat title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatTitle (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Title = "Another title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatTitle", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeChatColor(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Color = "AZURE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatColor (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Color = "PURPLE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatColor", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeChatPicture(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Image = FunctionParameters["Picture2"];

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DisableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "DisableChatNotifications (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DisableChatNotifications", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_EnableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "EnableChatNotifications (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EnableChatNotifications", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeChatOwner(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatOwner (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatOwner", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetChatMessagesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat4";

    Result = OPI_Bitrix24.GetChatMessagesList(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMessagesList (wh)", "Bitrix24");

    Check_BitrixMessages(Result); // SKIP

    MessageID = Result["result"]["messages"][0]["id"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatMessageID", MessageID); // SKIP
    FunctionParameters.Insert("Bitrix24_ChatMessageID", MessageID); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMessagesList(URL, UserID, , 0, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMessagesList", "Bitrix24");

    Check_BitrixMessages(Result);

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

    Check_BitrixDialog(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, UserID, MessageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MarkMessageAsReaded", "Bitrix24");

    Check_BitrixDialog(Result);

EndProcedure

Procedure Bitrix24_MarkMessageAsUnreaded(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    ChatID    = "chat" + FunctionParameters["Bitrix24_HookChatID"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, ChatID, MessageID);

    OPI_TestDataRetrieval.WriteLog(Result, "MarkMessageAsUnreaded)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, UserID, MessageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MarkMessageAsUnreaded", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetDialog(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetDialog(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDialog (wh)", "Bitrix24");

    Check_BitrixMessage(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetDialog(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDialog", "Bitrix24");

    Check_BitrixMessage(Result);

EndProcedure

Procedure Bitrix24_GetChatMembersList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatMembersList(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMembersList)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMembersList(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMembersList", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_SendWritingNotification(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.SendWritingNotification(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "SendWritingNotification (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.SendWritingNotification(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendWritingNotification", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ReadAll(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.ReadAll(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "ReadAll (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.ReadAll(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ReadAll", "Bitrix24");

    Check_BitrixTrue(Result);

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

    Check_BitrixNumber(Result); // SKIP

    MessageID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatMessageID", MessageID); // SKIP
    FunctionParameters.Insert("Bitrix24_ChatMessageID", MessageID); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.SendMessage(URL, UserID, Text, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage", "Bitrix24");

    Check_BitrixNumber(Result);

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

    Check_BitrixTrue(Result); // SKIP

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

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DeleteMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_SetMessageReaction(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID);

    OPI_TestDataRetrieval.WriteLog(Result, "SetMessageReaction (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetMessageReaction", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetChatFilesFolder(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatFilesFolder)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatFilesFolder", "Bitrix24");

    Check_BitrixObject(Result);

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

    Check_BitrixFileMessage(Result); // SKIP

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

    Check_BitrixFileMessage(Result);

EndProcedure

Procedure Bitrix24_GetUsers(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    ArrayOfUsers = New Array;

    ArrayOfUsers.Add(1);
    ArrayOfUsers.Add(10);

    Result = OPI_Bitrix24.GetUsers(URL, ArrayOfUsers);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUsers (wh)", "Bitrix24");

    Check_BitrixMap(Result); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    UserIDs = 10;

    Result = OPI_Bitrix24.GetUsers(URL, UserIDs, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUsers", "Bitrix24");

    Check_BitrixMap(Result);

EndProcedure

Procedure Bitrix24_GetUserStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetUserStatus(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserStatus (wh)", "Bitrix24");

    Check_BitrixString(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetUserStatus(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserStatus", "Bitrix24");

    Check_BitrixString(Result);

EndProcedure

Procedure Bitrix24_SetUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Status = "dnd";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status);

    OPI_TestDataRetrieval.WriteLog(Result, "SetUserStatus (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Status = "away";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetUserStatus", "Bitrix24");

    Check_BitrixTrue(Result);

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

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

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

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_SystemNotifyID", MessageID);
    FunctionParameters.Insert("Bitrix24_SystemNotifyID", MessageID);

EndProcedure

Procedure Bitrix24_DeleteNotification(FunctionParameters)

    URL            = FunctionParameters["Bitrix24_URL"];
    NotificationID = FunctionParameters["Bitrix24_PersoalHookNotifyID"];

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteNotification", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL            = FunctionParameters["Bitrix24_Domain"];
    Token          = FunctionParameters["Bitrix24_Token"];
    NotificationID = FunctionParameters["Bitrix24_PersoalNotifyID"];

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteNotification (app)", "Bitrix24");

    Check_BitrixBool(Result);

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

    Result = OPI_Bitrix24.GetCustomTaskField(URL, FieldID, );

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

    Result = OPI_Bitrix24.DeleteCustomTaskField(URL, FieldID, );

    // END

EndProcedure

Procedure Bitrix24_CreateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Name     = "Main department";
    ParentID = 1;

    Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDepartment (wh)", "Bitrix24");

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

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

    Check_BitrixTrue(Result); // SKIP

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

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DeleteDepartment(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteDepartment (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL          = FunctionParameters["Bitrix24_Domain"];
    Token        = FunctionParameters["Bitrix24_Token"];
    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteDepartment", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetDepartments(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Result = OPI_Bitrix24.GetDepartments(URL, DepartmentID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDepartments (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    HeadID = 1;

    Result = OPI_Bitrix24.GetDepartments(URL, , , , HeadID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDepartments", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetCurrentUser(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCurrentUser(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCurrentUser (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCurrentUser(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCurrentUser", "Bitrix24");

    Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetUserFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserFieldsStructure (wh)", "Bitrix24");

    Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserFieldsStructure", "Bitrix24");

    Check_BitrixObject(Result);

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

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

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

    Check_BitrixTrue(Result); // SKIP

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

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeUserStatus (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeUserStatus", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Result = OPI_Bitrix24.GetUser(URL, UserID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUser (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.GetUser(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUser", "Bitrix24");

    Check_BitrixArray(Result);

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

    Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FilterStructure = New Structure;
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Bitrix");

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "FindUsers", "Bitrix24");

    Check_BitrixArray(Result);

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

    Result = OPI_Bitrix24.StartTimekeeping(URL, UserID, Time, Report, );

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

    Result = OPI_Bitrix24.StopTimekeeping(URL, UserID, Time, Report, );

EndProcedure

Procedure Bitrix24_PauseTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.PauseTimekeeping(URL);

    Hour = 3600;

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.PauseTimekeeping(URL, UserID);

    // END

EndProcedure

Procedure Bitrix24_GetTimekeepingStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTimekeepingStatus(URL);

    Hour = 3600;

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.GetTimekeepingStatus(URL, UserID);

EndProcedure

Procedure Bitrix24_GetTimekeepingSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTimekeepingSettings(URL);

    Hour = 3600;

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.GetTimekeepingSettings(URL, UserID);

    // END

EndProcedure

Procedure Bitrix24_GetLeadFilterStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetLeadFilterStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadFilterStructure", "Bitrix24");

    Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetLeadStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetLeadStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadStructure (wh)", "Bitrix24");

    Check_BitrixLead(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetLeadStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadStructure", "Bitrix24");

    Check_BitrixLead(Result);

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

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

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

    Check_BitrixTrue(Result); // SKIP

    FieldsStructure.Insert("NAME"      , "Evgeniy");
    FieldsStructure.Insert("LAST_NAME" , "Evgeniev");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateLead", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DeleteLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteLead (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteLead", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.GetLead(URL, LeadID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetLead (wh)", "Bitrix24");

    Check_BitrixLead(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.GetLead(URL, LeadID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetLead", "Bitrix24");

    Check_BitrixLead(Result);

EndProcedure

Procedure Bitrix24_GetLeadsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetLeadsList(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadsList (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"    , "MegaClient");
    Filter.Insert("HAS_EMAIL", "Y");

    Result = OPI_Bitrix24.GetLeadsList(URL, Filter, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadsList", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetDealsFilterStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetDealsFilterStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealsFilterStructure", "Bitrix24");

    Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetDealStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDealStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealStructure (wh)", "Bitrix24");

    Check_BitrixDeal(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetDealStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealStructure", "Bitrix24");

    Check_BitrixDeal(Result);

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

    Check_BitrixNumber(Result); // SKIP

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

    Check_BitrixNumber(Result);

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

    Check_BitrixTrue(Result); // SKIP

    FieldsStructure.Insert("TITLE"    , "Future deal in RUB");
    FieldsStructure.Insert("BEGINDATE", "2025-01-01");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateDeal", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.GetDeal(URL, DealID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDeal (wh)", "Bitrix24");

    Check_BitrixDeal(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.GetDeal(URL, DealID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDeal", "Bitrix24");

    Check_BitrixDeal(Result);

EndProcedure

Procedure Bitrix24_DeleteDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteDeal (wh)", "Bitrix24");

    Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteDeal", "Bitrix24");

    Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetDealsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDealsList(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealsList (wh)", "Bitrix24");

    Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"      , "Sale in RUB");
    Filter.Insert("CURRENCY_ID", "RUB");

    Result = OPI_Bitrix24.GetDealsList(URL, Filter, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealsList", "Bitrix24");

    Check_BitrixArray(Result);

EndProcedure

#EndRegion

#Region VKTeams

Procedure VKTeams_CheckToken(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    Result = OPI_VKTeams.CheckToken(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CheckToken", "VkTeams");

    Check_VKTUser(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_GetEvents(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    LastID = 0;

    For N = 1 To 5 Do // In real work - endless loop

        Result = OPI_VKTeams.GetEvents(Token, LastID, 3);

        OPI_TestDataRetrieval.WriteLog(Result, "GetEvents", "VkTeams");

        Check_VKTEvents(Result); // SKIP

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

    Check_VKTMessage(Result); // SKIP

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

    Check_VKTMessage(Result);

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

    Check_VKTMessage(Result); // SKIP

    Text = "Additional text";

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ForwardMessage", "VkTeams");

    Check_VKTMessage(Result);

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

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile (URL)", "VkTeams");

    Check_VKTMessage(Result); // SKIP

    Result = OPI_VKTeams.SendFile(Token, ChatID, FilePath, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile (Path)", "VkTeams");

    Check_VKTMessage(Result); // SKIP

    Result = OPI_VKTeams.SendFile(Token, ChatID, FileBD, Text, "ImportantDocument.docx");

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile", "VkTeams");

    Check_VKTMessage(Result);

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

    Result = OPI_VKTeams.ResendFile(Token, ChatID, FileID, Text, "SameDoc.docx");

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ResendFile", "VkTeams");

    Check_VKTMessage(Result);

EndProcedure

Procedure VKTeams_GetFileInformation(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    FileID = FunctionParameters["VkTeams_FileID"];

    Result = OPI_VKTeams.GetFileInformation(Token, FileID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileInformation", "VkTeams");

    Check_VKTFile(Result);

EndProcedure

Procedure VKTeams_EditMessageText(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];
    Text      = "New message text";

    Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "EditMessageText (simple)", "VkTeams");

    Check_VKTTrue(Result); // SKIP

    Text   = "<b>New bold message text</b>";
    Markup = "HTML";

    Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text, Markup);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditMessageText", "VkTeams");

    Check_VKTTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.DeleteMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage", "VkTeams");

    Check_VKTTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_SendVoice(FunctionParameters)

    Token   = FunctionParameters["VkTeams_Token"];
    ChatID  = FunctionParameters["VkTeams_ChatID2"];
    ReplyID = FunctionParameters["VkTeams_MessageID"];
    Text    = "File caption";

    File     = FunctionParameters["Audio2"] ; // URL
    FilePath = GetTempFileName("m4a"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.SendVoice(Token, ChatID, File);

    OPI_TestDataRetrieval.WriteLog(Result, "SendVoice (URL)", "VkTeams");

    Check_VKTMessage(Result); // SKIP

    Result = OPI_VKTeams.SendVoice(Token, ChatID, FilePath, ,ReplyID);

    OPI_TestDataRetrieval.WriteLog(Result, "SendVoice (Path)", "VkTeams");

    Check_VKTMessage(Result); // SKIP

    Result = OPI_VKTeams.SendVoice(Token, ChatID, FileBD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendVoice", "VkTeams");

    Check_VKTMessage(Result);

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

    Check_VKTMessage(Result);

EndProcedure

Procedure VKTeams_RemoveChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.RemoveChatMembers(Token, ChatID, User);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveChatMembers", "VkTeams");

    Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_ChangeChatPicture(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    File     = FunctionParameters["Picture3"]; // URL
    FilePath = GetTempFileName("png"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, File);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture (URL)", "VkTeams");

    Check_VKTTrue(Result); // SKIP

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FilePath);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture (Path)", "VkTeams");

    Check_VKTTrue(Result); // SKIP

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FileBD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture", "VkTeams");

    Check_VKTTrue(Result);

    DeleteFiles(FilePath);

EndProcedure

Procedure VKTeams_GetChatInfo(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatInfo(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatInfo", "VkTeams");

    Check_VKTChat(Result);

EndProcedure

Procedure VKTeams_GetChatAdmins(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatAdmins(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatAdmins", "VkTeams");

    Check_VKTList(Result, "admins");

EndProcedure

Procedure VKTeams_GetChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatMembers(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMembers", "VkTeams");

    Check_VKTList(Result, "members");

EndProcedure

Procedure VKTeams_GetChatBlockedUsers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatBlockedUsers(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatBlockedUsers", "VkTeams");

    Check_VKTList(Result, "users");

EndProcedure

Procedure VKTeams_GetChatJoinRequests(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatJoinRequests(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatJoinRequests", "VkTeams");

    Check_VKTList(Result, "users");

EndProcedure

Procedure VKTeams_BlockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.BlockChatUser(Token, ChatID, User, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "BlockChatUser", "VkTeams");

    Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_UnblockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.UnblockChatUser(Token, ChatID, User);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnblockChatUser", "VkTeams");

    Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_PinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.PinMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PinMessage", "VkTeams");

    Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.UnpinMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnpinMessage", "VkTeams");

    Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_ApprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.ApprovePending(Token, ChatID, User);

    OPI_TestDataRetrieval.WriteLog(Result, "ApprovePending (single)", "VkTeams");

    Check_VKTPending(Result); // SKIP

    Result = OPI_VKTeams.ApprovePending(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ApprovePending", "VkTeams");

    Check_VKTPending(Result);

EndProcedure

Procedure VKTeams_DisapprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.DisapprovePending(Token, ChatID, User);

    OPI_TestDataRetrieval.WriteLog(Result, "DisapprovePending (single)", "VkTeams");

    Check_VKTPending(Result); // SKIP

    Result = OPI_VKTeams.DisapprovePending(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DisapprovePending", "VkTeams");

    Check_VKTPending(Result);

EndProcedure

Procedure VKTeams_SetChatTitle(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New title";

    Result = OPI_VKTeams.SetChatTitle(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetChatTitle", "VkTeams");

    Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_SetChatDescription(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New description";

    Result = OPI_VKTeams.SetChatDescription(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetChatDescription", "VkTeams");

    Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_SetChatRules(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "Text of the new rules";

    Result = OPI_VKTeams.SetChatRules(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetChatRules", "VkTeams");

    Check_VKTTrue(Result);

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

                    Check_VKTTrue(Result); // SKIP

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

    Check_OzonCategoryList(Result); // SKIP

    Result = OPI_Ozon.GetCategoriesAndProductTypesTree(ClientID, APIKey);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCategoriesAndProductTypesTree", "Ozon");

    Check_OzonCategoryList(Result);

EndProcedure

Procedure Ozon_GetCategoryAttributes(FunctionParameters)

    ClientID   = FunctionParameters["Ozon_ClientID"];
    APIKey     = FunctionParameters["Ozon_ApiKey"];
    CategoryID = 17029016;
    TypeID     = 970778135;

    Result = OPI_Ozon.GetCategoryAttributes(ClientID, APIKey, CategoryID, TypeID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCategoryAttributes", "Ozon");

    Check_OzonAttributesList(Result);

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

    Check_OzonListOfAttributesValues(Result);

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

    Check_OzonListOfAttributesValues(Result);

EndProcedure

Procedure Ozon_GetProductStructure(FunctionParameters)

    Result = OPI_Ozon.GetProductStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductStructure", "Ozon");

    Check_Structure(Result);

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

    Check_OzonUploadTask(Result);

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

    Check_Structure(ItemStructure);

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

    Check_Structure(ItemStructure);

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

    Check_Structure(ItemStructure);

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

    Check_OzonNewProducts(Result);

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

    Check_OzonUploadTask(Result);

    TaskID = Result["result"]["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_SkuTaskID", TaskID);
    FunctionParameters.Insert("Ozon_SkuTaskID", TaskID);

    Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    WHile Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    EndDo;

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCreationStatus (SKU)", "Ozon");

    Check_OzonNewProducts(Result);

EndProcedure

Procedure Ozon_GetSimplifiedProductStructure(FunctionParameters)

    Result = OPI_Ozon.GetSimplifiedProductStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetSimplifiedProductStructure", "Ozon");

    Check_Structure(Result);

EndProcedure

Procedure Ozon_GetAttributesUpdateStructure(FunctionParameters)

    Result = OPI_Ozon.GetAttributesUpdateStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAttributesUpdateStructure", "Ozon");

    Check_Structure(Result);

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

    Check_OzonUploadTask(Result, False);

    TaskID = Result["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_AttUpdateTaskID", TaskID);
    FunctionParameters.Insert("Ozon_AttUpdateTaskID", TaskID);

    Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    WHile Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    EndDo;

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCreationStatus (att.)", "Ozon");

    Check_OzonNewProducts(Result);

EndProcedure

Procedure Ozon_GetProductsFilterStructure(FunctionParameters)

    Result = OPI_Ozon.GetProductsFilterStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsFilterStructure", "Ozon");

    Check_Structure(Result);

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

    Check_OzonObjectsArray(Result);

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

    Check_OzonArray(Result);

EndProcedure

Procedure Ozon_GetProductsContentRating(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Result = OPI_Ozon.GetProductsContentRating(ClientID, APIKey, SKU);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsContentRating", "Ozon");

    Check_OzonRatingArray(Result);

EndProcedure

Procedure Ozon_GetProductsInformation(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Article  = "143210609";

    Result = OPI_Ozon.GetProductsInformation(ClientID, APIKey, , , Article);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsInformation", "Ozon");

    Check_OzonProducts(Result);

EndProcedure

Procedure Ozon_GetProductDescription(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Article  = "143210609";

    Result = OPI_Ozon.GetProductDescription(ClientID, APIKey, , Article);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductDescription", "Ozon");

    Check_OzonProduct(Result);

EndProcedure

Procedure Ozon_GetProductsRequestsLimits(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Result = OPI_Ozon.GetProductsRequestsLimits(ClientID, APIKey);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsRequestsLimits", "Ozon");

    Check_OzonLimits(Result);

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

    Check_OzonPictures(Result);

EndProcedure

Procedure Ozon_CheckProductsImagesUpload(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.CheckProductsImagesUpload(ClientID, APIKey, ProductID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CheckProductsImagesUpload", "Ozon");

    Check_OzonPictures(Result);

EndProcedure

Procedure Ozon_UpdateProductsArticles(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210609", "143210612");

    Result = OPI_Ozon.UpdateProductsArticles(ClientID, APIKey, ArticlesMap);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsArticles", "Ozon");

    Check_OzonNoErrors(Result);

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210612", "143210609");

    Result = OPI_Ozon.UpdateProductsArticles(ClientID, APIKey, ArticlesMap);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsArticles (reverse)", "Ozon");

    Check_OzonNoErrors(Result);

EndProcedure

Procedure Ozon_ArchiveProducts(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.ArchiveProducts(ClientID, APIKey, ProductID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ArchiveProducts", "Ozon");

    Check_OzonTrue(Result);

EndProcedure

Procedure Ozon_UnarchiveProducts(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.UnarchiveProducts(ClientID, APIKey, ProductID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnarchiveProducts", "Ozon");

    Check_OzonTrue(Result);

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

    //Check_OzonUploadTask(Result);

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

    //Check_OzonCodesUpload(Result);

EndProcedure

Procedure Ozon_GetProductSubscribersCount(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Result = OPI_Ozon.GetProductSubscribersCount(ClientID, APIKey, SKU);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductSubscribersCount", "Ozon");

    Check_OzonSubscribers(Result);

EndProcedure

Procedure Ozon_GetRelatedSKUs(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Result = OPI_Ozon.GetRelatedSKUs(ClientID, APIKey, SKU);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetRelatedSKUs", "Ozon");

    Check_OzonSKU(Result);

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

    Check_OzonNoErrors(Result);

EndProcedure

Procedure Ozon_GetWarehousesList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Result = OPI_Ozon.GetWarehousesList(ClientID, APIKey);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetWarehousesList", "Ozon");

    Check_OzonArray(Result);

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

    Check_OzonObjectsArray(Result);

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

    Check_OzonUpdatedArray(Result);

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

    Check_OzonObjectsArray(Result);

EndProcedure

Procedure Ozon_GetDiscountInformation(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Result = OPI_Ozon.GetDiscountInformation(ClientID, APIKey, SKU);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDiscountInformation", "Ozon");

    Check_OzonArray(Result, "items");

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

    Check_OzonArray(Result);

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

    Check_Structure(Result);

EndProcedure

Procedure Ozon_GetProductPriceStructure(FunctionParameters)

    Result = OPI_Ozon.GetProductPriceStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductPriceStructure", "Ozon");

    Check_Structure(Result);

EndProcedure

#EndRegion

#EndRegion

#EndRegion
