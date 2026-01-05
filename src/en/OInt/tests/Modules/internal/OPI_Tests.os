// OneScript: ./OInt/tests/Modules/internal/OPI_Tests.os

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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

#Region Service

Procedure CheckIBToLastBuildCompliance() Export

    If OPI_TestDataRetrieval.IsCLITest() Then

        //@skip-check use-non-recommended-method
        Message("CLI test check for hash sum");
        BuildSum = OPI_TestDataRetrieval.ExecuteTestCLI("hashsum", "", New Structure);

    Else

        BuildSum = OPI_Tools.GetLastBuildHashSum();

    EndIf;

    URL = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/service/last_build_hash.txt";

    LastSum = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .ProcessRequest("GET")
        .ReturnResponseAsString(False, True);

    Process(BuildSum, "BuildCheck", "CheckIBToLastBuildCompliance", , LastSum);

EndProcedure

#EndRegion

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
    OPI_TestDataRetrieval.ParameterToCollection("VK_AppID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VK_GroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VK_Token"  , TestParameters);

    VK_CreateTokenRetrievalLink(TestParameters);
    VK_GetAuthParameters(TestParameters);

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

    // !DISABLED! VK_CreateAdvertisingCampaign(TestParameters);
    // !DISABLED! VK_CreateAd(TestParameters);
    // !DISABLED! VK_PauseAdvertising(TestParameters);
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

Procedure YDisk_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_RefreshToken", TestParameters);

    YandexDisk_GetConfirmationCode(TestParameters);
    YandexDisk_ConvertCodeToToken(TestParameters);
    YandexDisk_RefreshToken(TestParameters);

EndProcedure

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
    OPI_TestDataRetrieval.ParameterToCollection("Audio"           , TestParameters);

    YandexDisk_UploadFileInParts(TestParameters);
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

Procedure GC_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ServiceData" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Access_Token"       , TestParameters);

    GoogleCalendar_FormCodeRetrievalLink(TestParameters);
    GoogleCalendar_GetTokenByCode(TestParameters);
    GoogleCalendar_RefreshToken(TestParameters);
    GoogleCalendar_GetServiceAccountToken(TestParameters);

EndProcedure

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

Procedure GD_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ServiceData" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Access_Token"       , TestParameters);

    GoogleDrive_FormCodeRetrievalLink(TestParameters);
    GoogleDrive_GetTokenByCode(TestParameters);
    GoogleDrive_RefreshToken(TestParameters);
    GoogleDrive_GetServiceAccountToken(TestParameters);

EndProcedure

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

Procedure GT_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ServiceData" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Access_Token"       , TestParameters);

    GoogleSheets_FormCodeRetrievalLink(TestParameters);
    GoogleSheets_GetTokenByCode(TestParameters);
    GoogleSheets_RefreshToken(TestParameters);
    GoogleSheets_GetServiceAccountToken(TestParameters);

EndProcedure

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
    // !DISABLED! Twitter_UpdateToken(TestParameters);

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
    // !DISABLED! Bitrix24_CreateResultFromComment(TestParameters);
    // !DISABLED! Bitrix24_GetResultsList(TestParameters);
    // !DISABLED! Bitrix24_DeleteResultFromComment(TestParameters);
    // !DISABLED! Bitrix24_GetTaskCommentsList(TestParameters);
    // !DISABLED! Bitrix24_GetTaskComment(TestParameters);
    // !DISABLED! Bitrix24_DeleteTaskComment(TestParameters);
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
    OPI_TestDataRetrieval.ParameterToCollection("Proxy_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Proxy_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Socks5_IP"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Socks5_Port"   , TestParameters);

    TCP_CreateConnection(TestParameters);
    TCP_CloseConnection(TestParameters);
    TCP_ReadBinaryData(TestParameters);
    TCP_SendBinaryData(TestParameters);
    TCP_ReadLine(TestParameters);
    TCP_SendLine(TestParameters);
    TCP_ProcessRequest(TestParameters);
    TCP_GetTLSSettings(TestParameters);
    TCP_GetLastError(TestParameters);
    TCP_GetProxySettings(TestParameters);

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

    OPI_Tools.RemoveFileWithTry(Base, "Database file deletion error");

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

    OPI_Tools.RemoveFileWithTry(Base, "Database file deletion error");

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
    // !DISABLED! GreenMax_RebootInstance(TestParameters);
    // !DISABLED! GreenAPI_GetAuthorizationCode(TestParameters);
    // !DISABLED! GreenAPI_LogoutInstance(TestParameters);
    // !DISABLED! GreenAPI_GetQR(TestParameters);

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
    // !DISABLED! GreenAPI_DownloadMessageFile(TestParameters);
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
    HTTPClient_MaxRedirects(TestParameters);
    HTTPClient_MaxAttempts(TestParameters);
    HTTPClient_ReturnSettings(TestParameters);

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
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    HTTPClient_ProcessRequest(TestParameters);
    HTTPClient_ExecuteRequest(TestParameters);
    HTTPClient_ReturnRequest(TestParameters);
    HTTPClient_ReturnConnection(TestParameters);
    HTTPClient_SendDataInParts(TestParameters);
    HTTPClient_SendPart(TestParameters);

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

    EndDo;

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

#Region SSH

Procedure SShell_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetSSHParameterOptions();

    For Each TestParameters In OptionArray Do

        SSH_CreateConnection(TestParameters);
        SSH_GetConnectionConfiguration(TestParameters);
        SSH_ExecuteCommand(TestParameters);
        SSH_CloseConnection(TestParameters);
        SSH_IsConnector(TestParameters);
        SSH_GetSettingsLoginPassword(TestParameters);
        SSH_GetSettingsPrivateKey(TestParameters);
        SSH_GetSettingsViaAgent(TestParameters);
        SSH_GetProxySettings(TestParameters);

    EndDo;

    OPI_Tools.RemoveFileWithTry(OptionArray[0]["SSH_Key"], "Error deleting file after test");

EndProcedure

#EndRegion

#Region SFTP

Procedure SF_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetSSHParameterOptions();

    For Each TestParameters In OptionArray Do

        SFTP_CreateConnection(TestParameters);
        SFTP_GetConnectionConfiguration(TestParameters);
        SFTP_IsConnector(TestParameters);
        SFTP_CloseConnection(TestParameters);
        SFTP_GetSettingsLoginPassword(TestParameters);
        SFTP_GetSettingsPrivateKey(TestParameters);
        SFTP_GetSettingsViaAgent(TestParameters);
        SFTP_GetProxySettings(TestParameters);

    EndDo;

    OPI_Tools.RemoveFileWithTry(OptionArray[0]["SSH_Key"], "Error deleting file after test");

EndProcedure

Procedure SF_DirectoryManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetSSHParameterOptions();

    For Each TestParameters In OptionArray Do

        SFTP_GetCurrentDirectory(TestParameters);
        SFTP_ListObjects(TestParameters);
        SFTP_CreateNewDirectory(TestParameters);
        SFTP_DeleteDirectory(TestParameters);

    EndDo;

    OPI_Tools.RemoveFileWithTry(OptionArray[0]["SSH_Key"], "Error deleting file after test");

EndProcedure

Procedure SF_FileManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetSSHParameterOptions();

    For Each TestParameters In OptionArray Do

        SFTP_UploadFile(TestParameters);
        SFTP_GetFileInformation(TestParameters);
        SFTP_GetFileData(TestParameters);
        SFTP_SaveFile(TestParameters);
        SFTP_UpdatePath(TestParameters);
        SFTP_DeleteFile(TestParameters);

    EndDo;

    OPI_Tools.RemoveFileWithTry(OptionArray[0]["SSH_Key"], "Error deleting file after test");

EndProcedure

#EndRegion

#Region GreenMax

Procedure GMax_Account() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    //OPI_TestDataRetrieval.ParameterToCollection("GreenMax_TestGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);

    GreenMax_FormAccessParameters(TestParameters);
    // !DISABLED! GreenMax_LogoutInstance(TestParameters);
    // !DISABLED! GreenMax_GetAuthorizationCode(TestParameters);
    // !DISABLED! GreenMax_SendAuthorizationCode(TestParameters);
    GreenMax_GetInstanceStatus(TestParameters);
    GreenMax_GetInstanceSettings(TestParameters);
    GreenMax_SetInstanceSettings(TestParameters);
    GreenMax_GetInstanceSettingsStructure(TestParameters);
    GreenMax_SetProfilePicture(TestParameters);
    GreenMax_GetAccountInformation(TestParameters);
    GreenMax_CheckAccount(TestParameters);
    GreenMax_GetContactList(TestParameters);
    GreenMax_GetContactInformation(TestParameters);
    GreenMax_GetChatList(TestParameters);
    GreenMax_GetChatAvatar(TestParameters);
    GreenMax_RebootInstance(TestParameters);

EndProcedure

Procedure GMax_GroupManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MainGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture3"            , TestParameters);

    GreenMax_GetContactList(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_CreateGroup(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetGroupInformation(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_UpdateGroupName(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_ChangeGroupSettings(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SetAdminRights(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_RevokeAdminRights(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_RemoveGroupMember(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_AddGroupMember(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SetGroupPicture(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_LeaveGroup(TestParameters);
    GreenMax_GetGroupSettingsStructure(TestParameters);

EndProcedure

Procedure GMax_MessageSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"               , TestParameters);

    GreenMax_GetContactList(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_CreateGroup(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SendTextMessage(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SendFile(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SendFileByURL(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_RemoveGroupMember(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_LeaveGroup(TestParameters);
    OPI_Tools.Pause(1);

EndProcedure

Procedure GMax_Notifications() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);

    GreenMax_GetNotification(TestParameters);
    GreenMax_DeleteNotification(TestParameters);

EndProcedure

Procedure GMax_MessageHistory() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MainGroupID", TestParameters);

    GreenMax_MarkMessagesAsRead(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetChatMessageHistory(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetChatMessage(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetIncomingMessageLog(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetOutgoingMessageLog(TestParameters);
    OPI_Tools.Pause(1);

EndProcedure

Procedure GMax_Queues() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MainGroupID", TestParameters);

    GreenMax_GetOutgoingMessageCount(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetOutgoingMessageQueue(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_ClearOutgoingMessageQueue(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetIncomingNotificationCount(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_ClearIncomingNotificationQueue(TestParameters);
    OPI_Tools.Pause(1);

EndProcedure

#EndRegion

#Region MongoDB

Procedure Mongo_CommonMethods() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_GenerateConnectionString(TestParameters);
    MongoDB_CreateConnection(TestParameters);
    MongoDB_CloseConnection(TestParameters);
    MongoDB_IsConnector(TestParameters);
    MongoDB_ExecuteCommand(TestParameters);

EndProcedure

Procedure Mong_DatabaseManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_GetDatabase(TestParameters);
    MongoDB_GetListOfBases(TestParameters);
    MongoDB_DeleteDatabase(TestParameters);

EndProcedure

Procedure Mongo_CollectionManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_CreateCollection(TestParameters);
    MongoDB_GetCollectionList(TestParameters);
    MongoDB_DeleteCollection(TestParameters);

EndProcedure

Procedure Mongo_DocumentsManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    MongoDB_InsertDocuments(TestParameters);
    MongoDB_GetDocuments(TestParameters);
    MongoDB_GetCursor(TestParameters);
    MongoDB_GetDocumentBatch(TestParameters);
    MongoDB_UpdateDocuments(TestParameters);
    MongoDB_DeleteDocuments(TestParameters);
    MongoDB_GetDocumentUpdateStructure(TestParameters);
    MongoDB_GetDocumentDeletionStructure(TestParameters);

EndProcedure

Procedure Mongo_UserManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_CreateUser(TestParameters);
    MongoDB_UpdateUser(TestParameters);
    MongoDB_GetUsers(TestParameters);
    MongoDB_GetDatabaseUsers(TestParameters);
    MongoDB_DeleteUser(TestParameters);

EndProcedure

Procedure Mongo_RoleManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_CreateRole(TestParameters);
    MongoDB_GetRoles(TestParameters);
    MongoDB_GrantRoles(TestParameters);
    MongoDB_RevokeRoles(TestParameters);
    MongoDB_UpdateRole(TestParameters);
    MongoDB_DeleteRole(TestParameters);
    MongoDB_GetRolePrivilegeStructure(TestParameters);

EndProcedure

#EndRegion

#Region GRPC

Procedure GR_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Address"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_AddressNoTls", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Proto"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoTS"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoImport" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"         , TestParameters);

    GRPC_CreateConnection(TestParameters);
    GRPC_CloseConnection(TestParameters);
    GRPC_IsConnector(TestParameters);
    GRPC_SetMetadata(TestParameters);
    GRPC_ExecuteMethod(TestParameters);
    GRPC_GetTlsSettings(TestParameters);
    GRPC_GetConnectionParameters(TestParameters);

EndProcedure

Procedure GR_Introspection() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Address"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Proto"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoImport", TestParameters);

    GRPC_GetServiceList(TestParameters);
    GRPC_GetMethodList(TestParameters);
    GRPC_GetMethod(TestParameters);

EndProcedure

Procedure GR_Streaming() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Address"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_AddressNoTls", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Proto"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoTS"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoImport" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"         , TestParameters);

    GRPC_InitializeServerStream(TestParameters);
    GRPC_InitializeClientStream(TestParameters);
    GRPC_InitializeBidirectionalStream(TestParameters);
    GRPC_SendMessage(TestParameters);
    GRPC_GetMessage(TestParameters);
    GRPC_CloseStream(TestParameters);
    GRPC_ProcessServerStream(TestParameters);
    GRPC_ProcessClientStream(TestParameters);
    GRPC_ProcessBidirectionalStream(TestParameters);
    GRPC_CompleteSend(TestParameters);

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

    ServerToken = OPI_TestDataRetrieval.GetParameter("Access_Token");

    URL = OPI_TestDataRetrieval.GetParameter("Twitter_TokenURL");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization(ServerToken) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    Token = Result["data"];

    Parameters.Insert("redirect_uri"      , OPI_TestDataRetrieval.GetParameter("Twitter_Redirect"));
    Parameters.Insert("client_id"         , OPI_TestDataRetrieval.GetParameter("Twitter_ClinetID"));
    Parameters.Insert("client_secret"     , OPI_TestDataRetrieval.GetParameter("Twitter_ClientSecret"));
    Parameters.Insert("access_token"      , Token);
    Parameters.Insert("refresh_token"     , OPI_TestDataRetrieval.GetParameter("Twitter_Refresh"));
    Parameters.Insert("oauth_token"       , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthToken"));
    Parameters.Insert("oauth_token_secret", OPI_TestDataRetrieval.GetParameter("Twitter_OAuthSecret"));

    Parameters.Insert("oauth_consumer_key"   , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthConsumerKey"));
    Parameters.Insert("oauth_consumer_secret", OPI_TestDataRetrieval.GetParameter(
        "Twitter_OAuthConsumerSecret"));

    Return Parameters;

EndFunction

//@skip-check method-too-many-params
Procedure Process(Val Result
    , Val Library
    , Val Method
    , Val Option = ""
    , AddParam1 = Undefined
    , AddParam2 = Undefined
    , AddParam3 = Undefined)

    CLITestsMark = 0;

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
    Result = OPI_Telegram.GetBotInformation(Token);

    // END

    Process(Result, "Telegram", "GetBotInformation");

EndProcedure

Procedure Telegram_GetUpdates(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetUpdates(Token);

    // END

    Process(Result, "Telegram", "GetUpdates");

EndProcedure

Procedure Telegram_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    URL   = FunctionParameters["Telegram_URL"];

    Result = OPI_Telegram.SetWebhook(Token, URL);

    // END

    Process(Result, "Telegram", "SetWebhook");

EndProcedure

Procedure Telegram_DeleteWebhook(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.DeleteWebhook(Token);

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

    // With keyboard, in chat
    Keyboard = OPI_Telegram.FormKeyboardFromButtonArray(KeyboardButtonsArray, True);
    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text, Keyboard);

    Process(Result, "Telegram", "SendTextMessage", , FunctionParameters, Text); // SKIP

    // Simple, to channel
    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text);

    // END

    Process(Result, "Telegram", "SendTextMessage", "Channel", FunctionParameters, Text);

    Text   = "<b>Text html %F0%9F%93%9E 10%</b>";
    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text, , "HTML");

    Process(Result, "Telegram", "SendTextMessage", "HTML");

    Text   = "%F0%9F%A4%BC";
    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);

    Process(Result, "Telegram", "SendTextMessage", "Emoji");

    Text   = "Text %F0%9F%A5%9D and emoji \(10%\)";
    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text, , "MarkdownV2");

    Process(Result, "Telegram", "SendTextMessage", "Text + Emoji");

    Keyboard = OPI_Tools.JsonToStructure(Keyboard, False);
    Result   = OPI_Telegram.SendTextMessage(Token, ChatID, Text, Keyboard);

    Process(Result, "Telegram", "SendTextMessage", "Keyboard structure");

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

    Process(Result, "Telegram", "SendTextMessage", "Complex");

EndProcedure

Procedure Telegram_FormKeyboardFromButtonArray(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Result = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray);

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

    // In chat, by URL
    Result = OPI_Telegram.SendImage(Token, ChatID, Text, Image);

    Process(Result, "Telegram", "SendImage", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImagePath);

    Process(Result, "Telegram", "SendImage", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImageDD);

    // END

    Process(Result, "Telegram", "SendImage", "Binary", FunctionParameters, Text);

    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Keyboard = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray, True);
    Result   = OPI_Telegram.SendImage(Token, ChatID, Text, Image, Keyboard);

    Process(Result, "Telegram", "SendImage", "Keyboard", FunctionParameters, Text);

    Keyboard = OPI_Tools.JsonToStructure(Keyboard);
    Result   = OPI_Telegram.SendImage(Token, ChannelID, Text, Image, Keyboard);

    Process(Result, "Telegram", "SendImage", "Keyboard collection", FunctionParameters, Text);

    Text   = "Text %F0%9F%A5%9D and emoji \(10%\)";
    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, Image, , "MarkdownV2");

    Process(Result, "Telegram", "SendImage", "Text + Emoji");

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

    Process(Result, "Telegram", "SendImage", "Complex");

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
    CopyFile(Video, VideoPath);

    VideoDD = New BinaryData(VideoPath);

    // In chat, by URL
    Result = OPI_Telegram.SendVideo(Token, ChatID, Text, Video);

    Process(Result, "Telegram", "SendVideo", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoPath);

    Process(Result, "Telegram", "SendVideo", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoDD);

    // END

    OPI_Tools.RemoveFileWithTry(VideoPath, "Failed to delete the temporary file after the test!!");
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

    // In chat, by URL
    Result = OPI_Telegram.SendAudio(Token, ChatID, Text, Audio);

    Process(Result, "Telegram", "SendAudio", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioPath);

    Process(Result, "Telegram", "SendAudio", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioDD);

    // END

    OPI_Tools.RemoveFileWithTry(AudioPath, "Failed to delete the temporary file after the test!!");
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

    // In chat, by URL
    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document);

    Process(Result, "Telegram", "SendDocument", , FunctionParameters, Text); // SKIP

    // In chat, by URL, with file name
    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document, , , "customname.docx");

    Process(Result, "Telegram", "SendDocument", "With name", FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentPath);

    Process(Result, "Telegram", "SendDocument", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data, with file name
    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentDD, , , "customname.docx");

    // END

    OPI_Tools.RemoveFileWithTry(DocumentPath, "Failed to delete the temporary file after the test!!");
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

    // In chat, by URL
    Result = OPI_Telegram.SendGif(Token, ChatID, Text, GIF);

    Process(Result, "Telegram", "SendGif", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifPath);

    Process(Result, "Telegram", "SendGif", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifDD);

    // END

    OPI_Tools.RemoveFileWithTry(GifPath, "Failed to delete the temporary file after the test!!");
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

    Result = OPI_Telegram.SendMediaGroup(Token, ChatID, Text, MediaGroup);

    // END

    Process(Result, "Telegram", "SendMediaGroup");

    DocumentURL  = FunctionParameters["Document"];
    DocumentPath = GetTempFileName("docx");
    ChannelID    = FunctionParameters["Telegram_ChannelID"];

    CopyFile(DocumentURL, DocumentPath);

    MediaGroup = New Map;
    MediaGroup.Insert(DocumentURL , "document");
    MediaGroup.Insert(DocumentPath, "document");

    Result = OPI_Telegram.SendMediaGroup(Token, ChannelID, Text, MediaGroup);

    OPI_Tools.RemoveFileWithTry(VideoPath   , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(ImagePath   , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(DocumentPath, "Failed to delete the temporary file after the test!!");

    Process(Result, "Telegram", "SendMediaGroup", "Documents");

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendLocation(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Width     = FunctionParameters["Lat"];
    Longitude = FunctionParameters["Long"];

    Result = OPI_Telegram.SendLocation(Token, ChatID, Width, Longitude);

    Process(Result, "Telegram", "SendLocation"); // SKIP

    Result = OPI_Telegram.SendLocation(Token, ChannelID, Width, Longitude);

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

    Result = OPI_Telegram.SendContact(Token, ChatID, Name, LastName, Phone);

    Process(Result, "Telegram", "SendContact", , Name); // SKIP

    Result = OPI_Telegram.SendContact(Token, ChannelID, Name, LastName, Phone);

    // END

    Process(Result, "Telegram", "SendContact", "Channel", Name);

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

    Process(Result, "Telegram", "SendPoll", , Question); // SKIP

    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, AnswersArray, True);

    Process(Result, "Telegram", "SendPoll", "Channel", Question); // SKIP

    // END

    StringArray = "['Red', 'Yellow', 'Green', 'Blue']";

    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, StringArray, True);

    Process(Result, "Telegram", "SendPoll", "Questions as string", Question);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_DownloadFile(FunctionParameters)

    FileID = FunctionParameters["Telegram_FileID"];
    Token  = FunctionParameters["Telegram_Token"];

    Result = OPI_Telegram.DownloadFile(Token, FileID);

    // END

    Process(Result, "Telegram", "DownloadFile");

EndProcedure

Procedure Telegram_ForwardMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.ForwardMessage(Token, MessageID, ChannelID, ChatID);

    // END

    Process(Result, "Telegram", "ForwardMessage", , MessageID);

EndProcedure

Procedure Telegram_Ban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.Ban(Token, ChannelID, UserID);

    // END

    Process(Result, "Telegram", "Ban");

EndProcedure

Procedure Telegram_Unban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.Unban(Token, ChannelID, UserID);

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

    Result = OPI_Telegram.CreateInvitationLink(Token, ChannelID, Title, Expiration, 200);

    // END

    Process(Result, "Telegram", "CreateInvitationLink", , Title, UnixExpiration);

EndProcedure

Procedure Telegram_PinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.PinMessage(Token, ChannelID, MessageID);

    // END

    Process(Result, "Telegram", "PinMessage");

EndProcedure

Procedure Telegram_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.UnpinMessage(Token, ChannelID, MessageID);

    // END

    Process(Result, "Telegram", "UnpinMessage");

EndProcedure

Procedure Telegram_GetParticipantCount(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.GetParticipantCount(Token, ChannelID);

    // END

    Process(Result, "Telegram", "GetParticipantCount");

EndProcedure

Procedure Telegram_GetAvatarIconList(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetAvatarIconList(Token);

    // END

    Process(Result, "Telegram", "GetAvatarIconList");

EndProcedure

Procedure Telegram_CreateForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Icon  = "5357419403325481346";
    Name  = "TestTopic " + String(New UUID);

    Result = OPI_Telegram.CreateForumTopic(Token, Chat, Name, Icon);

    // END

    Process(Result, "Telegram", "CreateForumTopic", , FunctionParameters, Name, Icon);

    ChatTopic = Chat + "*" + FunctionParameters["Telegram_TopicID"];
    Text      = FunctionParameters["String"];

    Result = OPI_Telegram.SendTextMessage(Token, ChatTopic, Text);

    Process(Result, "Telegram", "CreateForumTopic", "Message", FunctionParameters, Text);

EndProcedure

Procedure Telegram_EditForumTopic(FunctionParameters)

    Token   = FunctionParameters["Telegram_Token"];
    Chat    = FunctionParameters["Telegram_ForumID"];
    Topic   = FunctionParameters["Telegram_TopicID"];
    NewName = "NewTestTitle";
    NewIcon = "5310132165583840589";

    Result = OPI_Telegram.EditForumTopic(Token, Chat, Topic, NewName, NewIcon);

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

    Result = OPI_Telegram.CloseForumTopic(Token, Chat, Topic);

    // END

    Process(Result, "Telegram", "CloseForumTopic");

EndProcedure

Procedure Telegram_OpenForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.OpenForumTopic(Token, Chat); // Opens main topic

    Process(Result, "Telegram", "OpenForumTopic", "Main"); // SKIP

    Result = OPI_Telegram.OpenForumTopic(Token, Chat, Topic);

    // END

    Process(Result, "Telegram", "OpenForumTopic");

EndProcedure

Procedure Telegram_DeleteForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.DeleteForumTopic(Token, Chat, Topic);

    // END

    Process(Result, "Telegram", "DeleteForumTopic");

EndProcedure

Procedure Telegram_ClearTopicPinnedMessagesList(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.ClearTopicPinnedMessagesList(Token, Chat);

    Process(Result, "Telegram", "ClearTopicPinnedMessagesList", "Main"); // SKIP

    // END

    Process(Result, "Telegram", "ClearTopicPinnedMessagesList");

EndProcedure

Procedure Telegram_HideMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.HideMainForumTopic(Token, Chat);

    // END

    Process(Result, "Telegram", "HideMainForumTopic");

EndProcedure

Procedure Telegram_ShowMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);

    // END

    Process(Result, "Telegram", "ShowMainForumTopic");

EndProcedure

Procedure Telegram_EditMainForumTopicName(FunctionParameters)

    Title = "New main topic name " + String(New UUID);
    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.EditMainForumTopicName(Token, Chat, Title);

    // END

    Process(Result, "Telegram", "EditMainForumTopicName");

EndProcedure

Procedure Telegram_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.DeleteMessage(Token, ChatID, MessageID);

    // END

    Process(Result, "Telegram", "DeleteMessage");

EndProcedure

Procedure Telegram_ReplaceMessageText(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    Text      = "New message text";

    Result = OPI_Telegram.ReplaceMessageText(Token, ChatID, MessageID, Text);

    // END

    Process(Result, "Telegram", "ReplaceMessageText", , Text);

    Result = OPI_Telegram.ReplaceMessageText(Token, ChatID, MessageID, "<b>Bold text</b>", "HTML");

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

    Keyboard = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray, True, False);

    Result = OPI_Telegram.ReplaceMessageKeyboard(Token, ChatID, MessageID, Keyboard);

    // END

    Process(Result, "Telegram", "ReplaceMessageKeyboard", , Keyboard);

EndProcedure

Procedure Telegram_ReplaceMessageCaption(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    MessageID = FunctionParameters["Telegram_PicMessageID"];

    Description = "New picture description";
    Result      = OPI_Telegram.ReplaceMessageCaption(Token, ChatID, MessageID, Description);

    // END

    Process(Result, "Telegram", "ReplaceMessageCaption", , Description);

EndProcedure

#EndRegion

#Region VK

Procedure VK_CreateTokenRetrievalLink(FunctionParameters)

    Application = FunctionParameters["VK_AppID"];
    Result      = OPI_VK.CreateTokenRetrievalLink(Application);

    // END

    Process(Result, "VK", "CreateTokenRetrievalLink");

EndProcedure

Procedure VK_GetAuthParameters(FunctionParameters)

    GroupID = FunctionParameters["VK_GroupID"];
    AppID   = FunctionParameters["VK_AppID"];
    Token   = FunctionParameters["VK_Token"];

    Result = OPI_VK.GetAuthParameters(GroupID, AppID, Token);

    // END

    Process(Result, "VK", "GetAuthParameters");

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

    Process(Result, "VK", "CreatePost", , Parameters); // SKIP

    PostID = Result["response"]["post_id"]; // SKIP
    OPI_VK.DeletePost(PostID, Parameters); // SKIP

    Result = OPI_VK.CreatePost(Text, Image, False, , Parameters);

    // END

    Process(Result, "VK", "CreatePost", "Image", Parameters);

    PostID = Result["response"]["post_id"];
    OPI_VK.DeletePost(PostID, Parameters);

    Result = OPI_VK.CreatePost(Text, TFN, True, URL, Parameters);

    Process(Result, "VK", "CreatePost", "Path", FunctionParameters);

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VK_DeletePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Result = OPI_VK.DeletePost(PostID, Parameters);

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

    Process(Result, "VK", "CreateCompositePost");
    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VK_CreatePoll(FunctionParameters)

    Parameters = GetVKParameters();
    Question   = "What's your favorite color??";

    OptionArray = New Array;
    OptionArray.Add("Red");
    OptionArray.Add("Yellow");
    OptionArray.Add("Green");

    Result = OPI_VK.CreatePoll(Question, OptionArray, , "Post text", Parameters);

    Process(Result, "VK", "CreatePoll", "Text"); // SKIP

    // With picture

    Image = FunctionParameters["Picture"]; // URL, File path or Binary Data

    Result = OPI_VK.CreatePoll(Question, OptionArray, Image, , Parameters);

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

    Result = OPI_VK.CreateAlbum(Name, Description, Parameters);

    // END

    Process(Result, "VK", "CreateAlbum", , FunctionParameters, Description);

EndProcedure

Procedure VK_SaveImageToAlbum(FunctionParameters)

    Parameters       = GetVKParameters();
    ImageDescription = "AutoTestImage";
    AlbumID          = FunctionParameters["VK_AlbumID"];

    Image = FunctionParameters["Picture"]; // URL, File path or Binary Data

    Result = OPI_VK.SaveImageToAlbum(AlbumID, Image, ImageDescription, Parameters);

    // END

    Process(Result, "VK", "SaveImageToAlbum", , FunctionParameters, ImageDescription, AlbumID);

EndProcedure

Procedure VK_DeleteImage(FunctionParameters)

    Parameters = GetVKParameters();
    ImageID    = FunctionParameters["VK_PictureID"];

    Result = OPI_VK.DeleteImage(ImageID, Parameters);

    // END

    Process(Result, "VK", "DeleteImage");

EndProcedure

Procedure VK_DeleteAlbum(FunctionParameters)

    Parameters = GetVKParameters();
    AlbumID    = FunctionParameters["VK_AlbumID"];

    Result = OPI_VK.DeleteAlbum(AlbumID, Parameters);

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

    Result = OPI_VK.CreateStory(Image, URL, Parameters);

    Process(Result, "VK", "CreateStory"); // SKIP

    // END

    Result = OPI_VK.CreateStory(TFN, , Parameters);

    Process(Result, "VK", "CreateStory", "Path");

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VK_CreateDiscussion(FunctionParameters)

    Parameters = GetVKParameters();
    Name       = "Discussing: Which color is better??";
    Message    = "Red, yellow, blue, or some other??";

    Result = OPI_VK.CreateDiscussion(Name, Message, Parameters);

    // END

    Process(Result, "VK", "CreateDiscussion", , FunctionParameters);

EndProcedure

Procedure VK_CloseDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result       = OPI_VK.CloseDiscussion(DiscussionID, False, Parameters);

    // END

    Process(Result, "VK", "CloseDiscussion");

EndProcedure

Procedure VK_OpenDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result       = OPI_VK.OpenDiscussion(DiscussionID, Parameters);

    // END

    Process(Result, "VK", "OpenDiscussion");

EndProcedure

Procedure VK_WriteInDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Message      = "I like yellow more";

    Result = OPI_VK.WriteInDiscussion(DiscussionID, Message, Parameters);

    // END

    Process(Result, "VK", "WriteInDiscussion");

EndProcedure

Procedure VK_LikePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Result = OPI_VK.LikePost(PostID, , Parameters);

    // END

    Process(Result, "VK", "LikePost");

EndProcedure

Procedure VK_MakeRepost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = 2571;
    WallID     = -218704372;

    Result = OPI_VK.MakeRepost(PostID, WallID, , , Parameters);

    // END

    Process(Result, "VK", "MakeRepost", , FunctionParameters);

EndProcedure

Procedure VK_WriteComment(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "NewComment";
    PostID     = FunctionParameters["VK_PostID"];
    WallID     = Parameters["owner_id"];

    Result = OPI_VK.WriteComment(PostID, WallID, Text, Parameters);

    // END

    Process(Result, "VK", "WriteComment");

EndProcedure

Procedure VK_GetStatistics(FunctionParameters)

    Parameters = GetVKParameters();

    CurrentDate = OPI_Tools.GetCurrentDate();
    StartDate   = BegOfDay(CurrentDate);
    EndDate     = EndOfDay(StartDate);

    Result = OPI_VK.GetStatistics(StartDate, EndDate, Parameters);

    // END

    Process(Result, "VK", "GetStatistics");

EndProcedure

Procedure VK_GetPostStatistics(FunctionParameters)

    Parameters = GetVKParameters();

    ArrayOfPosts = New Array;
    ArrayOfPosts.Add(214);
    ArrayOfPosts.Add(215);

    Result = OPI_VK.GetPostStatistics(ArrayOfPosts, Parameters);

    // END

    Process(Result, "VK", "GetPostStatistics");

EndProcedure

Procedure VK_CreateAdvertisingCampaign(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    Name      = "New campaign";

    Result = OPI_VK.CreateAdvertisingCampaign(AccountID, Name, Parameters);

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

    Result = OPI_VK.CreateAd(CampaignNumber
        , DailyLimit
        , CategoryNumber
        , PostID
        , AccountID
        , Parameters);

    // END

    Process(Result, "VK", "CreateAd", , FunctionParameters);

EndProcedure

Procedure VK_PauseAdvertising(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    AdID      = FunctionParameters["VK_AdsPostID"];

    Result = OPI_VK.PauseAdvertising(AccountID, AdID, Parameters);

    // END

    Process(Result, "VK", "PauseAdvertising");

EndProcedure

Procedure VK_FormKeyboard(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Result = OPI_VK.FormKeyboard(ButtonArray);

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

    Keyboard = OPI_VK.FormKeyboard(ButtonArray);
    Result   = OPI_VK.WriteMessage(Text, UserID, Communitytoken, Keyboard, Parameters);

    // END

    Process(Result, "VK", "WriteMessage");

EndProcedure

Procedure VK_GetProductCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Result = OPI_VK.GetProductCategoryList(Parameters);

    // END

    Process(Result, "VK", "GetProductCategoryList");

EndProcedure

Procedure VK_CreateProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name   = "TestCollection";
    Image  = FunctionParameters["Picture"];
    Main   = True;
    Hidden = False;

    Result = OPI_VK.CreateProductCollection(Name, Image, Main, Hidden, Parameters);

    // END

    Process(Result, "VK", "CreateProductCollection", , FunctionParameters);

EndProcedure

Procedure VK_EditProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name      = "EditedCollection";
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.EditProductCollection(Name, Selection, , , , Parameters);

    // END

    Process(Result, "VK", "EditProductCollection");

EndProcedure

Procedure VK_GetSelectionsByID(FunctionParameters)

    Parameters = GetVKParameters();
    Selection  = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.GetSelectionsByID(Selection, Parameters);

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

    Result = OPI_VK.AddProduct(ProductDescription, Selection, Parameters);

    // END

    Process(Result, "VK", "AddProduct", , FunctionParameters);

EndProcedure

Procedure VK_EditProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    ProductDescription = New Map;
    ProductDescription.Insert("Name", "EditedTestProduct");

    Result = OPI_VK.EditProduct(Product, ProductDescription, , Parameters);

    // END

    Process(Result, "VK", "EditProduct");

EndProcedure

Procedure VK_AddProductToCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.AddProductToCollection(Product, Selection, Parameters);

    // END

    Process(Result, "VK", "AddProductToCollection");

EndProcedure

Procedure VK_RemoveProductFromSelection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.RemoveProductFromSelection(Product, Selection, Parameters);

    // END

    Process(Result, "VK", "RemoveProductFromSelection");

EndProcedure

Procedure VK_DeleteProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    Result = OPI_VK.DeleteProduct(Product, Parameters);

    // END

    Process(Result, "VK", "DeleteProduct");

EndProcedure

Procedure VK_DeleteSelection(FunctionParameters)

    Parameters = GetVKParameters();

    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.DeleteSelection(Selection, Parameters);

    // END

    Process(Result, "VK", "DeleteSelection");

EndProcedure

Procedure VK_CreateProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name = "Color";

    Result = OPI_VK.CreateProductProperty(Name, Parameters);

    // END

    Process(Result, "VK", "CreateProductProperty", , FunctionParameters);

EndProcedure

Procedure VK_EditProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name     = "Color (change.)";
    Property = FunctionParameters["VK_PropID"];

    Result = OPI_VK.EditProductProperty(Name, Property, Parameters);

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

    Result = OPI_VK.EditProductPropertyVariant(Value, Property, Option, Parameters);

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

    Result = OPI_VK.AddProduct(Product, , Parameters);

    // END

    Process(Result, "VK", "CreateProductWithProp", "First", FunctionParameters, 2);

    Product.Insert("Name"          , "Test product (another)");
    Product.Insert("PropertyValues", PropVariant2);

    Result = OPI_VK.AddProduct(Product, , Parameters);

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

    Result = OPI_VK.GetProductsByID(ProductsArray, Parameters);

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

    Result = OPI_VK.GroupProducts(ProductsArray, , Parameters);

    // END

    Process(Result, "VK", "GroupProducts");

EndProcedure

Procedure VK_DeleteProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Option = FunctionParameters["VK_PropVarID1"];

    Result = OPI_VK.DeleteProductPropertyVariant(Option, Parameters);

    // END

    Process(Result, "VK", "DeleteProductPropertyVariant");

EndProcedure

Procedure VK_DeleteProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];

    Result = OPI_VK.DeleteProductProperty(Property, Parameters);

    // END

    Process(Result, "VK", "DeleteProductProperty");

EndProcedure

Procedure VK_GetProductList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetProductList( , Parameters);

    // END

    Process(Result, "VK", "GetProductList");

EndProcedure

Procedure VK_GetSelectionList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetSelectionList(Parameters);

    // END

    Process(Result, "VK", "GetSelectionList");

EndProcedure

Procedure VK_GetPropertyList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetPropertyList(Parameters);

    // END

    Process(Result, "VK", "GetPropertyList");

EndProcedure

Procedure VK_GetOrderList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetOrderList(Parameters);

    // END

    Process(Result, "VK", "GetOrderList");

EndProcedure

Procedure VK_UploadVideoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Video       = FunctionParameters["Video"]; // URL, Binary Data or File path
    Name        = "NewVideo";
    Description = "Video description";

    Result = OPI_VK.UploadVideoToServer(Video, Name, Description, , Parameters);

    // END

    Process(Result, "VK", "UploadVideoToServer");

EndProcedure

Procedure VK_UploadPhotoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Image = FunctionParameters["Picture"]; // URL, Binary Data or File path
    View  = "Post";

    Result = OPI_VK.UploadPhotoToServer(Image, Parameters, View);

    // END

    Process(Result, "VK", "UploadPhotoToServer");

EndProcedure

Procedure VK_ShortenLink(FunctionParameters)

    Parameters = GetVKParameters();

    Result = OPI_VK.ShortenLink("https://github.com/Bayselonarrend/OpenIntegrations", Parameters);

    // END

    Process(Result, "VK", "ShortenLink");

EndProcedure

Procedure VK_GetAdvertisingCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Result = OPI_VK.GetAdvertisingCategoryList(Parameters);

    // END

    Process(Result, "VK", "GetAdvertisingCategoryList");

EndProcedure

Procedure VK_GetProductDescription(FunctionParameters)

    Clear  = False;
    Result = OPI_VK.GetProductDescription(Clear);

    // END

    Process(Result, "VK", "GetProductDescription");

EndProcedure

#EndRegion

#Region YandexDisk

Procedure YandexDisk_GetConfirmationCode(FunctionParameters)

    ClientID = FunctionParameters["YandexDisk_ClientID"];

    Result = OPI_YandexDisk.GetConfirmationCode(ClientID);

    // END

    Process(Result, "YandexDisk", "GetConfirmationCode");

EndProcedure

Procedure YandexDisk_ConvertCodeToToken(FunctionParameters)

    ClientID     = FunctionParameters["YandexDisk_ClientID"];
    ClientSecret = FunctionParameters["YandexDisk_ClientSecret"];
    DeviceCode   = "12345678";

    Result = OPI_YandexDisk.ConvertCodeToToken(ClientID, ClientSecret, DeviceCode);

    // END

    Process(Result, "YandexDisk", "ConvertCodeToToken", , FunctionParameters);

EndProcedure

Procedure YandexDisk_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["YandexDisk_ClientID"];
    ClientSecret = FunctionParameters["YandexDisk_ClientSecret"];
    RefreshToken = FunctionParameters["YandexDisk_RefreshToken"];

    Result = OPI_YandexDisk.RefreshToken(ClientID, ClientSecret, RefreshToken);

    // END

    Process(Result, "YandexDisk", "RefreshToken", , FunctionParameters);

EndProcedure

Procedure YandexDisk_GetDiskInformation(FunctionParameters)

    Token  = FunctionParameters["YandexDisk_Token"];
    Result = OPI_YandexDisk.GetDiskInformation(Token);

    // END

    Process(Result, "YandexDisk", "GetDiskInformation");

EndProcedure

Procedure YandexDisk_CreateFolder(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = "/" + String(New UUID);

    Result = OPI_YandexDisk.CreateFolder(Token, Path);

    // END

    Process(Result, "YandexDisk", "CreateFolder", , Token, Path);

    OPI_YandexDisk.DeleteObject(Token, Path, False);

EndProcedure

Procedure YandexDisk_UploadFileByURL(FunctionParameters)

    Token   = FunctionParameters["YandexDisk_Token"];
    Address = FunctionParameters["Picture"];
    Path    = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.UploadFileByURL(Token, Path, Address);

    // END

    Process(Result, "YandexDisk", "UploadFileByURL", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Result = OPI_YandexDisk.GetObject(Token, Path);

    // END

    Process(Result, "YandexDisk", "GetObject", , Path);

EndProcedure

Procedure YandexDisk_DeleteObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);

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

    Result = OPI_YandexDisk.UploadFile(Token, Path1, Image, True);

    Process(Result, "YandexDisk", "UploadFile", "URL"); // SKIP

    OPI_YandexDisk.DeleteObject(Token, Path1, False); // SKIP

    Result = OPI_YandexDisk.UploadFile(Token, Path2, TFN, True);

    // END

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

    Process(Result, "YandexDisk", "UploadFile");

    OPI_YandexDisk.DeleteObject(Token, Path2, False); // SKIP

EndProcedure

Procedure YandexDisk_CreateObjectCopy(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.CreateObjectCopy(Token, Original, Path, True);

    // END

    Process(Result, "YandexDisk", "CreateObjectCopy", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetDownloadLink(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Result = OPI_YandexDisk.GetDownloadLink(Token, Path);

    // END

    Process(Result, "YandexDisk", "GetDownloadLink");

EndProcedure

Procedure YandexDisk_DownloadFile(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Result = OPI_YandexDisk.DownloadFile(Token, Path);

    // END

    Process(Result, "YandexDisk", "DownloadFile");

EndProcedure

Procedure YandexDisk_GetFilesList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;
    FilterByType    = "image";

    Result = OPI_YandexDisk.GetFilesList(Token, Count, OffsetFromStart, FilterByType);

    // END

    Process(Result, "YandexDisk", "GetFilesList", , Count, OffsetFromStart);

EndProcedure

Procedure YandexDisk_MoveObject(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.MoveObject(Token, Original, Path, True);

    // END

    Process(Result, "YandexDisk", "MoveObject", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetPublishedObjectsList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;

    Result = OPI_YandexDisk.GetPublishedObjectsList(Token, Count, OffsetFromStart);

    // END

    Process(Result, "YandexDisk", "GetPublishedObjectsList", , Count, OffsetFromStart);

EndProcedure

Procedure YandexDisk_PublishObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Result = OPI_YandexDisk.PublishObject(Token, Path);

    // END

    Process(Result, "YandexDisk", "PublishObject", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetDownloadLinkForPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.GetDownloadLinkForPublicObject(Token, URL);

    // END

    Process(Result, "YandexDisk", "GetDownloadLinkForPublicObject");

EndProcedure

Procedure YandexDisk_GetPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.GetPublicObject(Token, URL);

    // END

    Process(Result, "YandexDisk", "GetPublicObject");

EndProcedure

Procedure YandexDisk_SavePublicObjectToDisk(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.SavePublicObjectToDisk(Token, URL);

    // END

    Process(Result, "YandexDisk", "SavePublicObjectToDisk");

EndProcedure

Procedure YandexDisk_CancelObjectPublication(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Result = OPI_YandexDisk.CancelObjectPublication(Token, Path);

    // END

    Process(Result, "YandexDisk", "CancelObjectPublication", , Path);

EndProcedure

Procedure YandexDisk_UploadFileInParts(FunctionParameters)

    Path = "/song.mp3";

    Token = FunctionParameters["YandexDisk_Token"];
    File  = FunctionParameters["Audio"]; // URL, Binary or File path

    ChunkSize = 1048576; // 1 MB

    Result = OPI_YandexDisk.UploadFileInParts(Token, Path, File, ChunkSize, True);

    // END

    Process(Result, "YandexDisk", "UploadFileInParts", , File);

    Result = OPI_YandexDisk.DownloadFile(Token, Path);

    Process(Result, "YandexDisk", "UploadFileInParts", "Downloading", File);

    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);

    Process(Result, "YandexDisk", "UploadFileInParts", "Deletion");

EndProcedure

#EndRegion

#Region Viber

Procedure Viber_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Viber_ChannelToken"];
    URL   = "http://api.athenaeum.digital/hs/viber";

    Result = OPI_Viber.SetWebhook(Token, URL);

    // END

    Process(Result, "Viber", "SetWebhook");

EndProcedure

Procedure Viber_GetChannelInformation(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    Result = OPI_Viber.GetChannelInformation(Token);

    // END

    Process(Result, "Viber", "GetChannelInformation");

EndProcedure

Procedure Viber_GetUserData(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Result = OPI_Viber.GetUserData(Token, UserID);

    // END

    Process(Result, "Viber", "GetUserData");

EndProcedure

Procedure Viber_GetOnlineUsers(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Result = OPI_Viber.GetOnlineUsers(Token, UserID);

    // END

    Process(Result, "Viber", "GetOnlineUsers");

EndProcedure

Procedure Viber_CreateKeyboardFromArrayButton(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Result = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);

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

    Keyboard = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);

    Process(Result, "Viber", "SendTextMessage"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);

    // END

    Process(Result, "Viber", "SendTextMessage", "Channel");

EndProcedure

Procedure Viber_SendImage(FunctionParameters)

    Description = "TestMessage";
    URL         = FunctionParameters["Picture"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);

    Process(Result, "Viber", "SendImage"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);

    // END

    Process(Result, "Viber", "SendImage", "Channel");

EndProcedure

Procedure Viber_SendFile(FunctionParameters)

    Extension = "docx";
    URL       = FunctionParameters["Document"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    Process(Result, "Viber", "SendFile"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    // END

    Process(Result, "Viber", "SendFile", "Channel");

EndProcedure

Procedure Viber_SendContact(FunctionParameters)

    Name  = "Petr Petrov";
    Phone = "+123456789";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);

    Process(Result, "Viber", "SendContact"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);

    // END

    Process(Result, "Viber", "SendContact", "Channel");

EndProcedure

Procedure Viber_SendLocation(FunctionParameters)

    Latitude  = "48.87373649724122";
    Longitude = "2.2954639195323967";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);

    Process(Result, "Viber", "SendLocation"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);

    // END

    Process(Result, "Viber", "SendLocation", "Channel");

EndProcedure

Procedure Viber_SendLink(FunctionParameters)

    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    Process(Result, "Viber", "SendLink"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    // END

    Process(Result, "Viber", "SendLink", "Channel");

EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure GoogleWorkspace_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Result   = OPI_GoogleWorkspace.FormCodeRetrievalLink(ClientID);

    // END

    Process(Result, "GoogleWorkspace", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleWorkspace_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Result = OPI_GoogleWorkspace.GetTokenByCode(ClientID, ClientSecret, Code);

    // END

    Process(Result, "GoogleWorkspace", "GetTokenByCode");

EndProcedure

Procedure GoogleWorkspace_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Result = OPI_GoogleWorkspace.RefreshToken(ClientID, ClientSecret, RefreshToken);

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

    Result = OPI_GoogleWorkspace.GetServiceAccountToken(Data, Scope);

    // END

    Process(Result, "GoogleWorkspace", "GetServiceAccountToken");

EndProcedure

#EndRegion

#Region GoogleCalendar

Procedure GoogleCalendar_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Result   = OPI_GoogleCalendar.FormCodeRetrievalLink(ClientID);

    // END

    Process(Result, "GoogleCalendar", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleCalendar_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Result = OPI_GoogleCalendar.GetTokenByCode(ClientID, ClientSecret, Code);

    // END

    Process(Result, "GoogleCalendar", "GetTokenByCode");

EndProcedure

Procedure GoogleCalendar_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Result = OPI_GoogleCalendar.RefreshToken(ClientID, ClientSecret, RefreshToken);

    // END

    Process(Result, "GoogleCalendar", "RefreshToken");

EndProcedure

Procedure GoogleCalendar_GetServiceAccountToken(FunctionParameters)

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

    Result = OPI_GoogleCalendar.GetServiceAccountToken(Data, Scope);

    // END

    Process(Result, "GoogleCalendar", "GetServiceAccountToken");

EndProcedure

Procedure GoogleCalendar_GetCalendarList(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    Result = OPI_GoogleCalendar.GetCalendarList(Token);

    // END

    Process(Result, "GoogleCalendar", "GetCalendarList");

EndProcedure

Procedure GoogleCalendar_CreateCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestCalendar";

    Result = OPI_GoogleCalendar.CreateCalendar(Token, Name);

    // END

    Process(Result, "GoogleCalendar", "CreateCalendar", , FunctionParameters, Name);

EndProcedure

Procedure GoogleCalendar_EditCalendarMetadata(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New name";
    Description = "New description";

    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token, Calendar, Name, Description);

    // END

    Process(Result, "GoogleCalendar", "EditCalendarMetadata", , Name, Description);

EndProcedure

Procedure GoogleCalendar_GetCalendarMetadata(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetCalendarMetadata(Token, Calendar);

    // END

    Name        = "New name";
    Description = "New description";

    Process(Result, "GoogleCalendar", "GetCalendarMetadata", , Name, Description);

EndProcedure

Procedure GoogleCalendar_AddCalendarToList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.AddCalendarToList(Token, Calendar);

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

    Result = OPI_GoogleCalendar.EditListCalendar(Token, Calendar, PrimaryColor, SecondaryColor, Hidden);

    // END

    Process(Result, "GoogleCalendar", "EditListCalendar", , PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_GetListCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetListCalendar(Token, Calendar);

    // END

    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";

    Process(Result, "GoogleCalendar", "GetListCalendar", , PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_ClearMainCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);

    // END

    Process(Result, "GoogleCalendar", "ClearMainCalendar");

EndProcedure

Procedure GoogleCalendar_DeleteCalendarFromList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);

    // END

    Process(Result, "GoogleCalendar", "DeleteCalendarFromList");

EndProcedure

Procedure GoogleCalendar_DeleteCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.DeleteCalendar(Token, Calendar);

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

    Result = OPI_GoogleCalendar.CreateEvent(Token, Calendar, EventDescription);

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

    Result = OPI_GoogleCalendar.EditEvent(Token, Calendar, EventDescription, Event);

    // END

    Name = "New event";

    Process(Result, "GoogleCalendar", "EditEvent", , Name, Description);

EndProcedure

Procedure GoogleCalendar_GetEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Result = OPI_GoogleCalendar.GetEvent(Token, Calendar, Event);

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

    Result = OPI_GoogleCalendar.MoveEvent(Token, SourceCalendar, TargetCalendar, Event);

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

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);

    // END

    Process(Result, "GoogleCalendar", "DeleteEvent");

EndProcedure

Procedure GoogleCalendar_GetEventList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetEventList(Token, Calendar);

    // END

    Process(Result, "GoogleCalendar", "GetEventList");

EndProcedure

Procedure GoogleCalendar_GetEventDescription(FunctionParameters)

    Clear  = False;
    Result = OPI_GoogleCalendar.GetEventDescription(Clear);

    // END

    Process(Result, "GoogleCalendar", "GetEventDescription");

EndProcedure

#EndRegion

#Region GoogleDrive

Procedure GoogleDrive_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Result   = OPI_GoogleDrive.FormCodeRetrievalLink(ClientID);

    // END

    Process(Result, "GoogleDrive", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleDrive_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Result = OPI_GoogleDrive.GetTokenByCode(ClientID, ClientSecret, Code);

    // END

    Process(Result, "GoogleDrive", "GetTokenByCode");

EndProcedure

Procedure GoogleDrive_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Result = OPI_GoogleDrive.RefreshToken(ClientID, ClientSecret, RefreshToken);

    // END

    Process(Result, "GoogleDrive", "RefreshToken");

EndProcedure

Procedure GoogleDrive_GetServiceAccountToken(FunctionParameters)

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

    Result = OPI_GoogleDrive.GetServiceAccountToken(Data, Scope);

    // END

    Process(Result, "GoogleDrive", "GetServiceAccountToken");

EndProcedure

Procedure GoogleDrive_GetDirectoriesList(FunctionParameters)

    Name  = "TestFolder";
    Token = FunctionParameters["Google_Token"];

    Result = OPI_GoogleDrive.GetDirectoriesList(Token, Name, True);

    // END

    Process(Result, "GoogleDrive", "GetDirectoriesList", , FunctionParameters);

EndProcedure

Procedure GoogleDrive_GetObjectInformation(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_Catalog"];

    Result = OPI_GoogleDrive.GetObjectInformation(Token, Identifier);

    // END

    Process(Result, "GoogleDrive", "GetObjectInformation");

EndProcedure

Procedure GoogleDrive_UploadFile(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Directory = FunctionParameters["GD_Catalog"];
    Image     = FunctionParameters["Picture"]; // URL, Binary Data or File path

    Clear       = False;
    Description = OPI_GoogleDrive.GetFileDescription(Clear);

    Description.Insert("Parent", Directory);

    Result = OPI_GoogleDrive.UploadFile(Token, Image, Description);

    // END

    Process(Result, "GoogleDrive", "UploadFile", , FunctionParameters, Description);

    If Not OPI_Tools.IsOneScript() And FunctionParameters.Property("Big") Then

        BigFile = FunctionParameters["Big"];
        Description.Insert("Name", "big.rar");

        Result = OPI_GoogleDrive.UploadFile(Token, BigFile, Description);

        Process(Result, "GoogleDrive", "UploadFile", "Big", FunctionParameters, Description);

        Result = OPI_GoogleDrive.DownloadFile(Token, Result["id"]);

        Process(Result, "GoogleDrive", "UploadFile", "Check", FunctionParameters, Description);

    EndIf;

EndProcedure

Procedure GoogleDrive_CopyObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    NewName    = "CopiedFile.jpeg";
    NewParent  = "root";

    Result = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, NewParent);

    // END

    Process(Result, "GoogleDrive", "CopyObject", , FunctionParameters, NewName);

EndProcedure

Procedure GoogleDrive_DownloadFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Result = OPI_GoogleDrive.DownloadFile(Token, Identifier);

    // END

    Process(Result, "GoogleDrive", "DownloadFile", , FunctionParameters);

EndProcedure

Procedure GoogleDrive_UpdateFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    NewName    = "UpdatedFile.jpg";
    Identifier = FunctionParameters["GD_File"];
    File       = FunctionParameters["Picture2"]; // URL, Binary Data or File path

    Result = OPI_GoogleDrive.UpdateFile(Token, Identifier, File, NewName);

    // END

    Process(Result, "GoogleDrive", "UpdateFile", , NewName);

EndProcedure

Procedure GoogleDrive_GetFilesList(FunctionParameters)

    Token        = FunctionParameters["Google_Token"];
    Directory    = "root";
    NameContains = "data";

    Result = OPI_GoogleDrive.GetFilesList(Token, NameContains, Directory);

    // END

    Process(Result, "GoogleDrive", "GetFilesList");

EndProcedure

Procedure GoogleDrive_DeleteObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Result = OPI_GoogleDrive.DeleteObject(Token, Identifier);

    // END

    Process(Result, "GoogleDrive", "DeleteObject");

    For Each Deletable In FunctionParameters["ArrayOfDeletions"] Do

        Result = OPI_GoogleDrive.DeleteObject(Token, Deletable);

        Process(Result, "GoogleDrive", "DeleteObject", "Additional");

        OPI_Tools.Pause(2);

    EndDo;

EndProcedure

Procedure GoogleDrive_GetFileDescription(FunctionParameters)

    Result = OPI_GoogleDrive.GetFileDescription();

    // END

    Process(Result, "GoogleDrive", "GetFileDescription");

EndProcedure

Procedure GoogleDrive_CreateComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    Comment    = "Comment text";

    Result = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);

    // END

    Process(Result, "GoogleDrive", "CreateComment", , FunctionParameters, Comment);

EndProcedure

Procedure GoogleDrive_GetComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Result = OPI_GoogleDrive.GetComment(Token, Identifier, CommentID);

    // END

    Process(Result, "GoogleDrive", "GetComment");

EndProcedure

Procedure GoogleDrive_GetCommentList(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Result = OPI_GoogleDrive.GetCommentList(Token, Identifier);

    // END

    Process(Result, "GoogleDrive", "GetCommentList");

EndProcedure

Procedure GoogleDrive_DeleteComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Result = OPI_GoogleDrive.DeleteComment(Token, Identifier, CommentID);

    // END

    Process(Result, "GoogleDrive", "DeleteComment");

EndProcedure

Procedure GoogleDrive_CreateFolder(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Directory = FunctionParameters["GD_Catalog"];
    Name      = "TestFolder";

    Result = OPI_GoogleDrive.CreateFolder(Token, Name, Directory);

    // END

    Process(Result, "GoogleDrive", "CreateFolder");

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

    Result = OPI_GoogleDrive.CreateFolder(Token, Name);

    Process(Result, "GoogleDrive", "CreateFolder", "Root");

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

EndProcedure

#EndRegion

#Region GoogleSheets

Procedure GoogleSheets_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Result   = OPI_GoogleSheets.FormCodeRetrievalLink(ClientID);

    // END

    Process(Result, "GoogleSheets", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleSheets_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Result = OPI_GoogleSheets.GetTokenByCode(ClientID, ClientSecret, Code);

    // END

    Process(Result, "GoogleSheets", "GetTokenByCode");

EndProcedure

Procedure GoogleSheets_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Result = OPI_GoogleSheets.RefreshToken(ClientID, ClientSecret, RefreshToken);

    // END

    Process(Result, "GoogleSheets", "RefreshToken");

EndProcedure

Procedure GoogleSheets_GetServiceAccountToken(FunctionParameters)

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

    Result = OPI_GoogleSheets.GetServiceAccountToken(Data, Scope);

    // END

    Process(Result, "GoogleSheets", "GetServiceAccountToken");

EndProcedure

Procedure GoogleSheets_CreateSpreadsheet(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    Result = OPI_GoogleSheets.CreateSpreadsheet(Token, Name, SheetArray);

    // END

    Process(Result, "GoogleSheets", "CreateSpreadsheet", , FunctionParameters, Name, SheetArray);

    Name   = "Test table (new.)";
    Result = OPI_GoogleSheets.CreateSpreadsheet(Token, Name, SheetArray);

    Process(Result, "GoogleSheets", "CreateSpreadsheet", "Additionally", FunctionParameters, Name);

EndProcedure

Procedure GoogleSheets_GetSpreadsheet(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GS_Spreadsheet"];

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Identifier);

    // END

    Process(Result, "GoogleSheets", "GetSpreadsheet");

EndProcedure

Procedure GoogleSheets_CopySheet(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    From   = FunctionParameters["GS_Spreadsheet"];
    Target = FunctionParameters["GS_Spreadsheet2"];
    Sheet  = FunctionParameters["GS_Sheet"];

    Result = OPI_GoogleSheets.CopySheet(Token, From, Target, Sheet);

    // END

    Process(Result, "GoogleSheets", "CopySheet");

EndProcedure

Procedure GoogleSheets_AddSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "TestSheet";

    Result = OPI_GoogleSheets.AddSheet(Token, Spreadsheet, Name);

    // END

    Process(Result, "GoogleSheets", "AddSheet");

EndProcedure

Procedure GoogleSheets_DeleteSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = FunctionParameters["GS_Sheet"];

    Result = OPI_GoogleSheets.DeleteSheet(Token, Spreadsheet, Sheet);

    // END

    Process(Result, "GoogleSheets", "DeleteSheet", , Spreadsheet);

EndProcedure

Procedure GoogleSheets_EditSpreadsheetTitle(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "Test table (changed.)";

    Result = OPI_GoogleSheets.EditSpreadsheetTitle(Token, Spreadsheet, Name);

    // END

    Process(Result, "GoogleSheets", "EditSpreadsheetTitle", , Spreadsheet);

EndProcedure

Procedure GoogleSheets_GetTable(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Spreadsheet);

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

    Result = OPI_GoogleSheets.SetCellValues(Token, Spreadsheet, ValueMapping, Sheet);

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

    Result = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, CellsArray, Sheet);

    // END

    Process(Result, "GoogleSheets", "GetCellValues", , CellsArray.Count());

    Result = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, , Sheet);

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

    Result = OPI_GoogleSheets.ClearCells(Token, Spreadsheet, CellsArray, Sheet);

    // END

    Process(Result, "GoogleSheets", "ClearCells", , CellsArray.Count());

EndProcedure

#EndRegion

#Region Slack

Procedure Slack_GetBotInformation(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Result = OPI_Slack.GetBotInformation(Token);

    // END

    Process(Result, "Slack", "GetBotInformation");

EndProcedure

Procedure Slack_GetUserList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Result = OPI_Slack.GetUserList(Token);

    // END

    Process(Result, "Slack", "GetUserList");

EndProcedure

Procedure Slack_GetWorkspaceList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Result = OPI_Slack.GetWorkspaceList(Token);

    // END

    Process(Result, "Slack", "GetWorkspaceList");

EndProcedure

Procedure Slack_SendMessage(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    // Text

    Text   = "TestMessage1";
    Result = OPI_Slack.SendMessage(Token, Channel, Text);

    Process(Result, "Slack", "SendMessage", , FunctionParameters, Text, Channel); // SKIP

    // With attachments (picture block in the example)

    Text       = "Message with picture";
    Image      = FunctionParameters["Picture"];
    BlockArray = New Array;

    Block = OPI_Slack.GenerateImageBlock(Image, "Image");
    BlockArray.Add(Block);

    Result = OPI_Slack.SendMessage(Token, Channel, Text, , BlockArray);

    Process(Result, "Slack", "SendMessage", "Image", FunctionParameters, Text, Channel); // SKIP

    // Sheduled

    Text = "Sheduled message";
    Hour = 3600;
    Day  = 24;

    SendingDate = OPI_Tools.GetCurrentDate() + (Day * Hour);
    Result      = OPI_Slack.SendMessage(Token, Channel, Text, SendingDate);

    // END

    Process(Result, "Slack", "SendMessage", "Sheduled", FunctionParameters, Text, Channel);

    Token     = FunctionParameters["Slack_Token"];
    Timestamp = Result["scheduled_message_id"];

    OPI_Slack.DeleteMessage(Token, Channel, Timestamp, True);

EndProcedure

Procedure Slack_GenerateImageBlock(FunctionParameters)

    Image = FunctionParameters["Picture"];

    Result = OPI_Slack.GenerateImageBlock(Image, "Image");

    // END

    Process(Result, "Slack", "GenerateImageBlock");

EndProcedure

Procedure Slack_EditMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Text = "TestMessage2";

    Result = OPI_Slack.EditMessage(Token, Channel, Timestamp, Text);

    // END

    Process(Result, "Slack", "EditMessage", , Text, Channel);

EndProcedure

Procedure Slack_GetMessageReplyList(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.GetMessageReplyList(Token, Channel, Timestamp);

    // END

    Process(Result, "Slack", "GetMessageReplyList");

EndProcedure

Procedure Slack_GetMessageLink(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.GetMessageLink(Token, Channel, Timestamp);

    // END

    Process(Result, "Slack", "GetMessageLink", , Channel);

EndProcedure

Procedure Slack_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.DeleteMessage(Token, Channel, Timestamp);

    // END

    Process(Result, "Slack", "DeleteMessage");

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

    Process(Result, "Slack", "SendEphemeralMessage");

EndProcedure

Procedure Slack_GetDelayedMessageList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetDelayedMessageList(Token, Channel);

    // END

    Process(Result, "Slack", "GetDelayedMessageList");

EndProcedure

Procedure Slack_CreateChannel(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Name  = "testconv" + String(New UUID);

    Result = OPI_Slack.CreateChannel(Token, Name);

    // END

    Process(Result, "Slack", "CreateChannel", , FunctionParameters, Name);

EndProcedure

Procedure Slack_SetChannelTopic(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Topic   = "TestTopic";

    Result = OPI_Slack.SetChannelTopic(Token, Channel, Topic);

    // END

    Process(Result, "Slack", "SetChannelTopic", , Topic);

EndProcedure

Procedure Slack_SetChannelGoal(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Purpose = "TestGoal";

    Result = OPI_Slack.SetChannelGoal(Token, Channel, Purpose);

    // END

    Process(Result, "Slack", "SetChannelGoal");

EndProcedure

Procedure Slack_GetChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannel(Token, Channel);

    // END

    Process(Result, "Slack", "GetChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_InviteUsersToChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Result = OPI_Slack.InviteUsersToChannel(Token, Channel, User);

    // END

    Process(Result, "Slack", "InviteUsersToChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_KickUserFromChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Result = OPI_Slack.KickUserFromChannel(Token, Channel, User);

    // END

    Process(Result, "Slack", "KickUserFromChannel");

EndProcedure

Procedure Slack_GetChannelHistory(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannelHistory(Token, Channel);

    // END

    Process(Result, "Slack", "GetChannelHistory");

EndProcedure

Procedure Slack_GetChannelUserList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannelUserList(Token, Channel);

    // END

    Process(Result, "Slack", "GetChannelUserList");

EndProcedure

Procedure Slack_LeaveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.LeaveChannel(Token, Channel);

    // END

    Process(Result, "Slack", "LeaveChannel");

EndProcedure

Procedure Slack_JoinChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.JoinChannel(Token, Channel);

    // END

    Process(Result, "Slack", "JoinChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_RenameChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Name    = "testconv" + String(New UUID);

    Result = OPI_Slack.RenameChannel(Token, Channel, Name);

    // END

    Process(Result, "Slack", "RenameChannel", , Name);

EndProcedure

Procedure Slack_ArchiveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.ArchiveChannel(Token, Channel);

    // END

    Process(Result, "Slack", "ArchiveChannel");

EndProcedure

Procedure Slack_GetChannelList(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Result = OPI_Slack.GetChannelList(Token);

    // END

    Process(Result, "Slack", "GetChannelList");

EndProcedure

Procedure Slack_OpenDialog(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    User  = FunctionParameters["Slack_User"];

    Result = OPI_Slack.OpenDialog(Token, User);

    // END

    Process(Result, "Slack", "OpenDialog", , FunctionParameters);

    Channel = Result["channel"]["id"];

    Result = OPI_Slack.SendMessage(Token, Channel, "Test dialog");

    Process(Result, "Slack", "OpenDialog", "Message", FunctionParameters);

EndProcedure

Procedure Slack_CloseDialog(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Dialog = FunctionParameters["Slack_Dialog"];

    Result = OPI_Slack.CloseDialog(Token, Dialog);

    // END

    Process(Result, "Slack", "CloseDialog");

EndProcedure

Procedure Slack_GetFilesList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetFilesList(Token, Channel);

    // END

    Process(Result, "Slack", "GetFilesList");

    Result = OPI_Slack.GetFilesList(Token);

    Process(Result, "Slack", "GetFilesList", "All");

EndProcedure

Procedure Slack_UploadFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    File    = FunctionParameters["Document"]; // URL, Binary Data or File path

    FileName = "megadoc.docx";
    Title    = "NewFile";

    Result = OPI_Slack.UploadFile(Token, File, FileName, Title);

    Process(Result, "Slack", "UploadFile", , FunctionParameters, FileName); // SKIP
    Process(Result, "Slack", "MakeFilePublic"); // SKIP
    Process(Result, "Slack", "MakeFilePrivate"); // SKIP

    Result = OPI_Slack.UploadFile(Token, File, FileName, Title, Channel);

    // END

    Process(Result, "Slack", "UploadFile", "Channel", FunctionParameters, FileName);
    OPI_Slack.DeleteFile(FunctionParameters["Slack_Token"], Result["files"][0]["id"]);

EndProcedure

Procedure Slack_MakeFilePublic(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.MakeFilePublic(Token, FileID);

    // END

    Process(Result, "Slack", "MakeFilePublic", "No record");

EndProcedure

Procedure Slack_MakeFilePrivate(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.MakeFilePrivate(Token, FileID);

    // END

    Process(Result, "Slack", "MakeFilePrivate", "No record");

EndProcedure

Procedure Slack_GetFileData(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.GetFileData(Token, FileID);

    // END

    Process(Result, "Slack", "GetFileData", , "megadoc.docx");

EndProcedure

Procedure Slack_DeleteFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.DeleteFile(Token, FileID);

    // END

    Process(Result, "Slack", "DeleteFile");

EndProcedure

Procedure Slack_GetExternalFileList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetExternalFileList(Token, Channel);

    // END

    Process(Result, "Slack", "GetExternalFileList");

    Result = OPI_Slack.GetExternalFileList(Token);

    Process(Result, "Slack", "GetExternalFileList", "All");

EndProcedure

Procedure Slack_AddExternalFile(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Title = "NewFile";
    File  = FunctionParameters["Document"];

    Result = OPI_Slack.AddExternalFile(Token, File, Title);

    // END

    Process(Result, "Slack", "AddExternalFile", , FunctionParameters, Title);

EndProcedure

Procedure Slack_GetExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.GetExternalFile(Token, FileID);

    // END

    Process(Result, "Slack", "GetExternalFile");

EndProcedure

Procedure Slack_SendExternalFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    FileID  = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.SendExternalFile(Token, FileID, Channel);

    // END

    Process(Result, "Slack", "SendExternalFile");

EndProcedure

Procedure Slack_DeleteExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.DeleteExternalFile(Token, FileID);

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

    Result = OPI_Airtable.CreateDatabase(Token, Region, Name, TableMapping);

    // END

    Process(Result, "Airtable", "CreateDatabase", , FunctionParameters, TableName);

EndProcedure

Procedure Airtable_GetDatabaseTables(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];

    Result = OPI_Airtable.GetDatabaseTables(Token, Base);

    // END

    Process(Result, "Airtable", "GetDatabaseTables");

EndProcedure

Procedure Airtable_GetListOfBases(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];

    Result = OPI_Airtable.GetListOfBases(Token);

    // END

    Process(Result, "Airtable", "GetListOfBases");

EndProcedure

Procedure Airtable_GetNumberField(FunctionParameters)

    Result = OPI_Airtable.GetNumberField("Number");

    // END

    Process(Result, "Airtable", "GetNumberField");

EndProcedure

Procedure Airtable_GetStringField(FunctionParameters)

    Result = OPI_Airtable.GetStringField("String");

    // END

    Process(Result, "Airtable", "GetStringField");

EndProcedure

Procedure Airtable_GetAttachmentField(FunctionParameters)

    Result = OPI_Airtable.GetAttachmentField("Attachment");

    // END

    Process(Result, "Airtable", "GetAttachmentField");

EndProcedure

Procedure Airtable_GetCheckboxField(FunctionParameters)

    Result = OPI_Airtable.GetCheckboxField("Checkbox");

    // END

    Process(Result, "Airtable", "GetCheckboxField");

EndProcedure

Procedure Airtable_GetDateField(FunctionParameters)

    Result = OPI_Airtable.GetDateField("Date");

    // END

    Process(Result, "Airtable", "GetDateField");

EndProcedure

Procedure Airtable_GetPhoneField(FunctionParameters)

    Result = OPI_Airtable.GetPhoneField("Phone");

    // END

    Process(Result, "Airtable", "GetPhoneField");

EndProcedure

Procedure Airtable_GetEmailField(FunctionParameters)

    Result = OPI_Airtable.GetEmailField("Email");

    // END

    Process(Result, "Airtable", "GetEmailField");

EndProcedure

Procedure Airtable_GetLinkField(FunctionParameters)

    Result = OPI_Airtable.GetLinkField("Link");

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

    Result = OPI_Airtable.CreateTable(Token, Base, Name, FieldArray, Description);

    // END

    Process(Result, "Airtable", "CreateTable", , FunctionParameters, Name, Description);

EndProcedure

Procedure Airtable_ModifyTable(FunctionParameters)

    Token       = FunctionParameters["Airtable_Token"];
    Base        = FunctionParameters["Airtable_Base"];
    Table       = FunctionParameters["Airtable_Table"];
    Name        = "Test table 2 (change.)";
    Description = "New table (change.)";

    Result = OPI_Airtable.ModifyTable(Token, Base, Table, Name, Description);

    // END

    Process(Result, "Airtable", "ModifyTable", , Name, Description);

EndProcedure

Procedure Airtable_CreateField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Name  = String(New UUID);

    Field  = OPI_Airtable.GetNumberField(Name);
    Result = OPI_Airtable.CreateField(Token, Base, Table, Field);

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

    Result = OPI_Airtable.ModifyField(Token, Base, Table, Field, Name, Description);

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

    Result = OPI_Airtable.CreatePosts(Token, Base, Table, ArrayOfDescriptions);

    // END

    Process(Result, "Airtable", "CreatePosts", , FunctionParameters);

    ArrayOfDeletions = New Array;

    For Each Record In Result["records"] Do

        CurrentRecord = Record["id"];
        ArrayOfDeletions.Add(CurrentRecord);

    EndDo;

    OPI_Airtable.DeleteRecords(Token, Base, Table, ArrayOfDeletions);

    // Single

    Result = OPI_Airtable.CreatePosts(Token, Base, Table, RowDescription1);

    Process(Result, "Airtable", "CreatePosts", "Single", FunctionParameters, Number, String);

EndProcedure

Procedure Airtable_GetRecord(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Result = OPI_Airtable.GetRecord(Token, Base, Table, Record);

    // END

    Process(Result, "Airtable", "GetRecord", , Record);

EndProcedure

Procedure Airtable_CreateComment(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];
    Text   = "TestComment";

    Result = OPI_Airtable.CreateComment(Token, Base, Table, Record, Text);

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
    Result = OPI_Airtable.EditComment(Token, Base, Table, Record, Comment, Text);

    // END

    Process(Result, "Airtable", "EditComment", , Text);

EndProcedure

Procedure Airtable_GetComments(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Result = OPI_Airtable.GetComments(Token, Base, Table, Record);

    // END

    Process(Result, "Airtable", "GetComments");

EndProcedure

Procedure Airtable_DeleteComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Result = OPI_Airtable.DeleteComment(Token, Base, Table, Record, Comment);

    // END

    Process(Result, "Airtable", "DeleteComment", , Comment);

EndProcedure

Procedure Airtable_GetListOfRecords(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];

    Result = OPI_Airtable.GetListOfRecords(Token, Base, Table);

    // END

    Process(Result, "Airtable", "GetListOfRecords");

EndProcedure

Procedure Airtable_DeleteRecords(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Result = OPI_Airtable.DeleteRecords(Token, Base, Table, Record);

    // END

    Process(Result, "Airtable", "DeleteRecords");

EndProcedure

#EndRegion

#Region Twitter

Procedure Twitter_GetToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Code       = "123456";

    Result = OPI_Twitter.GetToken(Code, Parameters);

    // END

    Process(Result, "Twitter", "GetToken");

EndProcedure

Procedure Twitter_GetAuthorizationLink(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Result     = OPI_Twitter.GetAuthorizationLink(Parameters);

    // END

    Process(Result, "Twitter", "GetAuthorizationLink");

EndProcedure

Procedure Twitter_RefreshToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Result     = OPI_Twitter.RefreshToken(Parameters);

    // END

    Process(Result, "Twitter", "RefreshToken");

EndProcedure

Procedure Twitter_CreateTextTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Result = OPI_Twitter.CreateTextTweet(Text, Parameters);

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

    Result = OPI_Twitter.CreateImageTweet(Text, ImageArray, Parameters);

    Process(Result, "Twitter", "CreateImageTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters);

    // END

    Process(Result, "Twitter", "CreateImageTweet", "Single", Text);

    Image = OPI_HTTPRequests.Get(Image);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters);

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

    Result = OPI_Twitter.CreateVideoTweet(Text, VideosArray, Parameters);

    Process(Result, "Twitter", "CreateVideoTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);

    // END

    Process(Result, "Twitter", "CreateVideoTweet", "Single", Text);

    Video = OPI_HTTPRequests.Get(Video);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);

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

    Result = OPI_Twitter.CreateGifTweet(Text, GifsArray, Parameters);

    Process(Result, "Twitter", "CreateGifTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);

    // END

    Process(Result, "Twitter", "CreateGifTweet", "Single", Text);

    GIF = OPI_HTTPRequests.Get(GIF);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);

    Process(Result, "Twitter", "CreateGifTweet", "Binary", Text);

EndProcedure

Procedure Twitter_CreatePollTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    AnswersArray = New Array;
    AnswersArray.Add("Option 1");
    AnswersArray.Add("Option 2");

    Result = OPI_Twitter.CreatePollTweet(Text, AnswersArray, 60, Parameters);

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

    MediaArray = OPI_Twitter.UploadAttachmentsArray(ImageArray, "tweet_image", Parameters);
    Result     = OPI_Twitter.CreateCustomTweet(Text, MediaArray, , , Parameters);

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

    Result = OPI_Twitter.UploadAttachmentsArray(ImageArray, "tweet_image", Parameters);

    // END

    Process(Result, "Twitter", "UploadAttachmentsArray");

EndProcedure

#EndRegion

#Region Notion

Procedure Notion_CreatePage(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Title  = "TestTitle";

    Result = OPI_Notion.CreatePage(Token, Parent, Title);

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

    Result = OPI_Notion.CreateDatabase(Token, Parent, Title, Properties);

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

    Result = OPI_Notion.EditDatabaseProperties(Token, Base, Properties, Title, Description);

    // END

    Process(Result, "Notion", "EditDatabaseProperties");

EndProcedure

Procedure Notion_GetPage(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Page  = FunctionParameters["Notion_Page"];

    Result = OPI_Notion.GetPage(Token, Page);

    // END

    Process(Result, "Notion", "GetPage");

EndProcedure

Procedure Notion_GetDatabase(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Result = OPI_Notion.GetDatabase(Token, Base);

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

    Result = OPI_Notion.CreatePageInDatabase(Token, Base, Properties);

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

    Result = OPI_Notion.EditPageProperties(Token, Page, Properties, Icon, Cover, Archive);

    // END

    Process(Result, "Notion", "EditPageProperties");

EndProcedure

Procedure Notion_ReturnBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_Block"];

    Result = OPI_Notion.ReturnBlock(Token, Block);

    // END

    Process(Result, "Notion", "ReturnBlock");

EndProcedure

Procedure Notion_CreateBlock(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Block  = FunctionParameters["Notion_Block"];

    BlockData = OPI_Notion.ReturnBlock(Token, Block);
    Result    = OPI_Notion.CreateBlock(Token, Parent, BlockData);

    // END

    Process(Result, "Notion", "CreateBlock", , FunctionParameters);

EndProcedure

Procedure Notion_ReturnChildBlocks(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Result = OPI_Notion.ReturnChildBlocks(Token, Block);

    // END

    Process(Result, "Notion", "ReturnChildBlocks");

EndProcedure

Procedure Notion_DeleteBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Result = OPI_Notion.DeleteBlock(Token, Block);

    // END

    Process(Result, "Notion", "DeleteBlock");

EndProcedure

Procedure Notion_UserList(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];

    Result = OPI_Notion.UserList(Token);

    // END

    Process(Result, "Notion", "UserList");

EndProcedure

Procedure Notion_GetUserData(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    User  = FunctionParameters["Notion_User"];

    Result = OPI_Notion.GetUserData(Token, User);

    // END

    Process(Result, "Notion", "GetUserData");

EndProcedure

#EndRegion

#Region Dropbox

Procedure Dropbox_GetAuthorizationLink(FunctionParameters)

    AppKey = FunctionParameters["Dropbox_Appkey"];
    Result = OPI_Dropbox.GetAuthorizationLink(AppKey);

    // END

    Process(Result, "Dropbox", "GetAuthorizationLink");

EndProcedure

Procedure Dropbox_GetToken(FunctionParameters)

    AppKey    = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    Code      = FunctionParameters["Dropbox_Code"];

    Result = OPI_Dropbox.GetToken(AppKey, AppSecret, Code);

    // END

    Process(Result, "Dropbox", "GetToken");

EndProcedure

Procedure Dropbox_RefreshToken(FunctionParameters)

    AppKey       = FunctionParameters["Dropbox_Appkey"];
    AppSecret    = FunctionParameters["Dropbox_Appsecret"];
    RefreshToken = FunctionParameters["Dropbox_Refresh"];

    Result = OPI_Dropbox.RefreshToken(AppKey, AppSecret, RefreshToken);

    // END

    Process(Result, "Dropbox", "RefreshToken");

EndProcedure

Procedure Dropbox_GetObjectInformation(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetObjectInformation(Token, Path, True);

    // END

    Process(Result, "Dropbox", "GetObjectInformation", , Path);

EndProcedure

Procedure Dropbox_GetPreview(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.GetPreview(Token, Path);

    // END

    Process(Result, "Dropbox", "GetPreview");

EndProcedure

Procedure Dropbox_UploadFile(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];
    Image = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    Result = OPI_Dropbox.UploadFile(Token, ImagePath, Path, True);

    // END

    Process(Result, "Dropbox", "UploadFile", , Path);

    OPI_Tools.RemoveFileWithTry(ImagePath, "Failed to delete the temporary file after the test!!");

    If Not OPI_Tools.IsOneScript() And FunctionParameters.Property("Big") Then

        BigFile = FunctionParameters["Big"];

        Path   = "/giant.tmp";
        Result = OPI_Dropbox.UploadFile(Token, BigFile, Path, True);

        Process(Result, "Dropbox", "UploadFile", "Big", Path);

    EndIf;

EndProcedure

Procedure Dropbox_UploadFileByURL(FunctionParameters)

    Path  = "/New/url_doc.docx";
    Token = FunctionParameters["Dropbox_Token"];
    URL   = FunctionParameters["Document"];

    Result = OPI_Dropbox.UploadFileByURL(Token, URL, Path);

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
    Result = OPI_Dropbox.DeleteObject(Token, Path);

    Process(Result, "Dropbox", "GetUploadStatusByURL", "Deletion", Path);

EndProcedure

Procedure Dropbox_DeleteObject(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.DeleteObject(Token, Path);

    // END

    Process(Result, "Dropbox", "DeleteObject", , Path);

EndProcedure

Procedure Dropbox_CopyObject(FunctionParameters)

    Original = "/New/pic.png";
    Copy     = "/New/pic_copy.png";
    Token    = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.CopyObject(Token, Original, Copy);

    // END

    Process(Result, "Dropbox", "CopyObject", , Copy);

    Result = OPI_Dropbox.DeleteObject(Token, Copy);

    Process(Result, "Dropbox", "CopyObject", "Deletion", Copy);

EndProcedure

Procedure Dropbox_MoveObject(FunctionParameters)

    OriginalPath = "/New/pic.png";
    TargetPath   = "/pic.png";
    Token        = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.MoveObject(Token, OriginalPath, TargetPath);

    // END

    Process(Result, "Dropbox", "MoveObject", , TargetPath);

    Result = OPI_Dropbox.MoveObject(Token, TargetPath, OriginalPath);

    Process(Result, "Dropbox", "MoveObject", "Deletion", OriginalPath);

EndProcedure

Procedure Dropbox_CreateFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New catalog";

    Result = OPI_Dropbox.CreateFolder(Token, Path);

    // END

    Process(Result, "Dropbox", "CreateFolder", , Path);

    OPI_Dropbox.DeleteObject(Token, Path);

EndProcedure

Procedure Dropbox_DownloadFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.DownloadFile(Token, Path);

    // END

    Process(Result, "Dropbox", "DownloadFile");

EndProcedure

Procedure Dropbox_DownloadFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Result = OPI_Dropbox.DownloadFolder(Token, Path);

    // END

    Process(Result, "Dropbox", "DownloadFolder");

EndProcedure

Procedure Dropbox_GetListOfFolderFiles(FunctionParameters)

    Path  = "/New";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetListOfFolderFiles(Token, Path, True);

    // END

    Process(Result, "Dropbox", "GetListOfFolderFiles");

EndProcedure

Procedure Dropbox_GetObjectVersionList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.GetObjectVersionList(Token, Path, 1);

    // END

    Process(Result, "Dropbox", "GetObjectVersionList", , FunctionParameters);

EndProcedure

Procedure Dropbox_RestoreObjectToVersion(FunctionParameters)

    Version = FunctionParameters["Dropbox_FileRevision"];
    Token   = FunctionParameters["Dropbox_Token"];
    Path    = "/New/pic.png";

    Result = OPI_Dropbox.RestoreObjectToVersion(Token, Path, Version);

    // END

    Process(Result, "Dropbox", "RestoreObjectToVersion", , Path);

EndProcedure

Procedure Dropbox_GetTagList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    PathsArray = New Array;
    PathsArray.Add("/New/Dogs.mp3");
    PathsArray.Add("/New/mydoc.docx");

    Result = OPI_Dropbox.GetTagList(Token, PathsArray);

    // END

    Process(Result, "Dropbox", "GetTagList", , FunctionParameters, PathsArray);

EndProcedure

Procedure Dropbox_AddTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.AddTag(Token, Path, Tag);

    // END

    Process(Result, "Dropbox", "AddTag");

EndProcedure

Procedure Dropbox_DeleteTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.DeleteTag(Token, Path, Tag);

    // END

    Process(Result, "Dropbox", "DeleteTag");

EndProcedure

Procedure Dropbox_GetAccountInformation(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetAccountInformation(Token);

    // END

    Process(Result, "Dropbox", "GetAccountInformation");

    AccountID = Result["account_id"];
    Result    = OPI_Dropbox.GetAccountInformation(Token, AccountID);

    Process(Result, "Dropbox", "GetAccountInformation", "By ID");

EndProcedure

Procedure Dropbox_GetSpaceUsageData(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetSpaceUsageData(Token);

    // END

    Process(Result, "Dropbox", "GetSpaceUsageData");

EndProcedure

Procedure Dropbox_AddUsersToFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Email = FunctionParameters["Dropbox_OtherUser"];
    File  = FunctionParameters["Dropbox_FileID"];

    Result = OPI_Dropbox.AddUsersToFile(Token, File, Email, False);

    // END

    Process(Result, "Dropbox", "AddUsersToFile", , Email, False);

    Mails = New Array;
    Mails.Add(Email);

    Result = OPI_Dropbox.AddUsersToFile(Token, File, Mails, True);

    Process(Result, "Dropbox", "AddUsersToFile", , Email, True);

EndProcedure

Procedure Dropbox_PublishFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Result = OPI_Dropbox.PublishFolder(Token, Path);

    // END

    Process(Result, "Dropbox", "PublishFolder", , FunctionParameters);

EndProcedure

Procedure Dropbox_CancelFolderPublication(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Folder = FunctionParameters["Dropbox_SharedFolder"];

    Result = OPI_Dropbox.CancelFolderPublication(Token, Folder);

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

    Result = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);

    // END

    Process(Result, "Dropbox", "GetAsynchronousChangeStatus");

EndProcedure

Procedure Dropbox_AddUsersToFolder(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Email  = FunctionParameters["Dropbox_OtherUser"];
    Folder = FunctionParameters["Dropbox_SharedFolder"]; // shared_folder_id

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Email, False);

    // END

    Process(Result, "Dropbox", "AddUsersToFolder");

    Mails = New Array;
    Mails.Add(Email);

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Mails, True);

    Process(Result, "Dropbox", "AddUsersToFolder", "Additional");

EndProcedure

Procedure Dropbox_CancelFilePublication(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    File  = FunctionParameters["Dropbox_FileID"];

    Result = OPI_Dropbox.CancelFilePublication(Token, File);

    // END

    Process(Result, "Dropbox", "CancelFilePublication");

EndProcedure

#EndRegion

#Region Bitrix24

Procedure Bitrix24_GetAppAuthLink(FunctionParameters)

    Domain   = FunctionParameters["Bitrix24_Domain"];
    ClientID = FunctionParameters["Bitrix24_ClientID"];

    Result = OPI_Bitrix24.GetAppAuthLink(Domain, ClientID);

    // END

    Process(Result, "Bitrix24", "GetAppAuthLink");

EndProcedure

Procedure Bitrix24_GetToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Code         = FunctionParameters["Bitrix24_Code"];

    Result = OPI_Bitrix24.GetToken(ClientID, ClientSecret, Code);

    // END

    Process(Result, "Bitrix24", "GetToken");

EndProcedure

Procedure Bitrix24_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Refresh      = FunctionParameters["Bitrix24_Refresh"];

    Result = OPI_Bitrix24.RefreshToken(ClientID, ClientSecret, Refresh);

    // END

    Process(Result, "Bitrix24", "RefreshToken");

EndProcedure

Procedure Bitrix24_ServerTime(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.ServerTime(URL);

    Process(Result, "Bitrix24", "ServerTime", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.ServerTime(URL, Token);

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

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, True);

    Process(Result, "Bitrix24", "CreatePost", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, , Token);

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

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title);

    Process(Result, "Bitrix24", "UpdatePost", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    PostID = FunctionParameters["Bitrix24_HookPostID"];

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title, Token);

    // END

    Process(Result, "Bitrix24", "UpdatePost");

EndProcedure

Procedure Bitrix24_DeletePost(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID);

    Process(Result, "Bitrix24", "DeletePost", "Hook"); // SKIP

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID, Token);

    // END

    Process(Result, "Bitrix24", "DeletePost");

EndProcedure

Procedure Bitrix24_GetImportantPostViewers(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID);

    Process(Result, "Bitrix24", "GetImportantPostViewers", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID, Token);

    // END

    Process(Result, "Bitrix24", "GetImportantPostViewers");

EndProcedure

Procedure Bitrix24_GetPosts(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetPosts(URL, PostID);

    Process(Result, "Bitrix24", "GetPosts", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetPosts(URL, PostID, , Token);

    // END

    Process(Result, "Bitrix24", "GetPosts");

EndProcedure

Procedure Bitrix24_AddPostComment(FunctionParameters)

    Text   = "Comment for post";
    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text);

    Process(Result, "Bitrix24", "AddPostComment", "Hook"); // SKIP

    Text  = "Another comment";
    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text, Token);

    // END

    Process(Result, "Bitrix24", "AddPostComment");

EndProcedure

Procedure Bitrix24_AddPostRecipients(FunctionParameters)

    Visibility = "UA";
    PostID     = FunctionParameters["Bitrix24_PostID"];
    URL        = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility);

    Process(Result, "Bitrix24", "AddPostRecipients", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility, Token);

    // END

    Process(Result, "Bitrix24", "AddPostRecipients");

EndProcedure

Procedure Bitrix24_GetTaskFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL);

    Process(Result, "Bitrix24", "GetTaskFieldsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL, Token);

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

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);

    Process(Result, "Bitrix24", "CreateTask", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData, Token);

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

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData);

    Process(Result, "Bitrix24", "UpdateTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData, Token);

    // END

    Process(Result, "Bitrix24", "UpdateTask");

EndProcedure

Procedure Bitrix24_GetTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTask(URL, TaskID);

    Process(Result, "Bitrix24", "GetTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "GetTask");

EndProcedure

Procedure Bitrix24_ApproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID);

    Process(Result, "Bitrix24", "ApproveTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "ApproveTask");

EndProcedure

Procedure Bitrix24_DisapproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID);

    Process(Result, "Bitrix24", "DisapproveTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "DisapproveTask");

EndProcedure

Procedure Bitrix24_CompleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.CompleteTask(URL, TaskID);

    Process(Result, "Bitrix24", "CompleteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.CompleteTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "CompleteTask");

EndProcedure

Procedure Bitrix24_RenewTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.RenewTask(URL, TaskID);

    Process(Result, "Bitrix24", "RenewTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.RenewTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "RenewTask");

EndProcedure

Procedure Bitrix24_DeferTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DeferTask(URL, TaskID);

    Process(Result, "Bitrix24", "DeferTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DeferTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "DeferTask");

EndProcedure

Procedure Bitrix24_StartTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StartTask(URL, TaskID);

    Process(Result, "Bitrix24", "StartTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StartTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "StartTask");

EndProcedure

Procedure Bitrix24_StartWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID);

    Process(Result, "Bitrix24", "StartWatchingTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "StartWatchingTask");

EndProcedure

Procedure Bitrix24_StopWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID);

    Process(Result, "Bitrix24", "StopWatchingTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "StopWatchingTask");

EndProcedure

Procedure Bitrix24_PauseTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.PauseTask(URL, TaskID);

    Process(Result, "Bitrix24", "PauseTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.PauseTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "PauseTask");

EndProcedure

Procedure Bitrix24_DeleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID);

    Process(Result, "Bitrix24", "DeleteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteTask");

EndProcedure

Procedure Bitrix24_DelegateTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID);

    Process(Result, "Bitrix24", "DelegateTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID, Token);

    // END

    Process(Result, "Bitrix24", "DelegateTask");

EndProcedure

Procedure Bitrix24_AddTaskToFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID);

    Process(Result, "Bitrix24", "AddTaskToFavorites", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "AddTaskToFavorites");

EndProcedure

Procedure Bitrix24_RemoveTaskFromFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID);

    Process(Result, "Bitrix24", "RemoveTaskFromFavorites", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "RemoveTaskFromFavorites");

EndProcedure

Procedure Bitrix24_GetTaskHistory(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID);

    Process(Result, "Bitrix24", "GetTaskHistory", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID, Token);

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

    Result = OPI_Bitrix24.GetTasksList(URL, Filter, , , Fields);

    Process(Result, "Bitrix24", "GetTasksList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTasksList(URL, , Indent, Token);

    // END

    Process(Result, "Bitrix24", "GetTasksList");

EndProcedure

Procedure Bitrix24_GetStoragesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Result = OPI_Bitrix24.GetStoragesList(URL);

    Process(Result, "Bitrix24", "GetStoragesList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStoragesList(URL, Token);

    // END

    Process(Result, "Bitrix24", "GetStoragesList");

EndProcedure

Procedure Bitrix24_GetAppStorage(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetAppStorage(URL, Token);

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

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Filename2, Image2, DestinationID);

    Process(Result, "Bitrix24", "UploadFileToStorage", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID, , Token);

    // END

    Process(Result, "Bitrix24", "UploadFileToStorage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_HookFileID"];

    Result = OPI_Bitrix24.DeleteFile(URL, FileID);

    Process(Result, "Bitrix24", "DeleteFile", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteFile");

EndProcedure

Procedure Bitrix24_CreateStorageFolder(FunctionParameters)

    StorageID = 3;
    Name      = "New catalog";
    Filename2 = "New folder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Filename2);

    Process(Result, "Bitrix24", "CreateStorageFolder", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Name, Token);

    // END

    Process(Result, "Bitrix24", "CreateStorageFolder", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_HookFolderID"];

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID);

    Process(Result, "Bitrix24", "DeleteFolder", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteFolder");

EndProcedure

Procedure Bitrix24_GetStorage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorage(URL, StorageID);

    Process(Result, "Bitrix24", "GetStorage", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStorage(URL, StorageID, Token);

    // END

    Process(Result, "Bitrix24", "GetStorage");

EndProcedure

Procedure Bitrix24_GetStorageObjects(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID);

    Process(Result, "Bitrix24", "GetStorageObjects", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID, Token);

    // END

    Process(Result, "Bitrix24", "GetStorageObjects");

EndProcedure

Procedure Bitrix24_RenameStorage(FunctionParameters)

    Name      = "New storage name";
    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    StorageID = FunctionParameters["Bitrix24_StorageID"];

    Result = OPI_Bitrix24.RenameStorage(URL, StorageID, Name, Token);

    // END

    Process(Result, "Bitrix24", "RenameStorage");

EndProcedure

Procedure Bitrix24_GetFolderInformation(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID);

    Process(Result, "Bitrix24", "GetFolderInformation", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID, Token);

    // END

    Process(Result, "Bitrix24", "GetFolderInformation");

EndProcedure

Procedure Bitrix24_CreateSubfolder(FunctionParameters)

    FolderID  = FunctionParameters["Bitrix24_FolderID"];
    Name      = "New subfolder";
    Filename2 = "New subfolder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Filename2);

    Process(Result, "Bitrix24", "CreateSubfolder", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Name, Token);

    // END

    Process(Result, "Bitrix24", "CreateSubfolder", , FunctionParameters);

EndProcedure

Procedure Bitrix24_MakeFolderCopy(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookSubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MakeFolderCopy(URL, FolderID, DestinationID);

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

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID);

    Process(Result, "Bitrix24", "GetFolderExternalLink", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID, Token);

    // END

    Process(Result, "Bitrix24", "GetFolderExternalLink");

EndProcedure

Procedure Bitrix24_GetFolderFilterStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetFolderFilterStructure(URL);

    Process(Result, "Bitrix24", "GetFolderFilterStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderFilterStructure(URL, True, Token);

    // END

    Process(Result, "Bitrix24", "GetFolderFilterStructure");

EndProcedure

Procedure Bitrix24_GetFolderItems(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID);

    Process(Result, "Bitrix24", "GetFolderItems", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID, , Token);

    // END

    Process(Result, "Bitrix24", "GetFolderItems");

EndProcedure

Procedure Bitrix24_MarkFolderAsDeleted(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID);

    Process(Result, "Bitrix24", "MarkFolderAsDeleted", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID, Token);

    // END

    Process(Result, "Bitrix24", "MarkFolderAsDeleted");

EndProcedure

Procedure Bitrix24_RestoreFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID);

    Process(Result, "Bitrix24", "RestoreFolder", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID, Token);

    // END

    Process(Result, "Bitrix24", "RestoreFolder");

EndProcedure

Procedure Bitrix24_MoveFolder(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID);

    Process(Result, "Bitrix24", "MoveFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID, Token);

    // END

    Process(Result, "Bitrix24", "MoveFolder");

EndProcedure

Procedure Bitrix24_RenameFolder(FunctionParameters)

    Name      = "New catalog";
    Filename2 = "New folder 2";

    FolderID2 = FunctionParameters["Bitrix24_HookFolderID"];
    URL       = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID2, Filename2);

    Process(Result, "Bitrix24", "RenameFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];
    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID, Name, Token);

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

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Filename2, Image2, DestinationID);

    Process(Result, "Bitrix24", "UploadFileToFolder", "Hook", URL); // SKIP

    FileID = Result["result"]["ID"]; // SKIP
    OPI_Bitrix24.DeleteFile(URL, FileID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Name, Image, DestinationID, Token);

    // END

    Process(Result, "Bitrix24", "UploadFileToFolder", , URL, Token);

    FileID = Result["result"]["ID"];

    OPI_Bitrix24.DeleteFile(URL, FileID, Token);

EndProcedure

Procedure Bitrix24_MakeFileCopy(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MakeFileCopy(URL, FileID, FolderID);

    Process(Result, "Bitrix24", "MakeFileCopy", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MakeFileCopy(URL, FileID, FolderID, Token);

    // END

    Process(Result, "Bitrix24", "MakeFileCopy");

EndProcedure

Procedure Bitrix24_GetFileInformation(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID);

    Process(Result, "Bitrix24", "GetFileInformation", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID, Token);

    // END

    Process(Result, "Bitrix24", "GetFileInformation");

EndProcedure

Procedure Bitrix24_GetFileExternalLink(FunctionParameters)

    OPI_Tools.Pause(20); // SKIP

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID);

    Process(Result, "Bitrix24", "GetFileExternalLink", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID, Token);

    // END

    Process(Result, "Bitrix24", "GetFileExternalLink");

EndProcedure

Procedure Bitrix24_MarkFileAsDeleted(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID);

    Process(Result, "Bitrix24", "MarkFileAsDeleted", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID, Token);

    // END

    Process(Result, "Bitrix24", "MarkFileAsDeleted");

EndProcedure

Procedure Bitrix24_RestoreFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.RestoreFile(URL, FileID);

    Process(Result, "Bitrix24", "RestoreFile", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RestoreFile(URL, FileID, Token);

    // END

    Process(Result, "Bitrix24", "RestoreFile");

EndProcedure

Procedure Bitrix24_RenameFile(FunctionParameters)

    Name      = "New file name.jpg";
    Filename2 = "New file name 2.jpg";

    FileID2 = FunctionParameters["Bitrix24_HookFileID"];
    URL     = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.RenameFile(URL, FileID2, Filename2);

    Process(Result, "Bitrix24", "RenameFile", "Hook"); // SKIP

    FileID = FunctionParameters["Bitrix24_FileID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenameFile(URL, FileID, Name, Token);

    // END

    Process(Result, "Bitrix24", "RenameFile");

EndProcedure

Procedure Bitrix24_MoveFileToFolder(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookSubFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID);

    Process(Result, "Bitrix24", "MoveFileToFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_SubFolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID, Token);

    // END

    Process(Result, "Bitrix24", "MoveFileToFolder");

EndProcedure

Procedure Bitrix24_AttachFileToTopic(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    FileID = FunctionParameters["Bitrix24_TaskFileID"];

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID);

    Process(Result, "Bitrix24", "AttachFileToTopic", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID, Token);

    // END

    Process(Result, "Bitrix24", "AttachFileToTopic");

EndProcedure

Procedure Bitrix24_CheckTaskAccesses(FunctionParameters)

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("1");
    ArrayOfUsers.Add("10");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers);

    Process(Result, "Bitrix24", "CheckTaskAccesses", "Hook", ArrayOfUsers.Count()); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers, Token);

    // END

    Process(Result, "Bitrix24", "CheckTaskAccesses", , ArrayOfUsers.Count());

EndProcedure

Procedure Bitrix24_MuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.MuteTask(URL, TaskID);

    Process(Result, "Bitrix24", "MuteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.MuteTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "MuteTask");

EndProcedure

Procedure Bitrix24_UnmuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.UnmuteTask(URL, TaskID);

    Process(Result, "Bitrix24", "UnmuteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.UnmuteTask(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "UnmuteTask");

EndProcedure

Procedure Bitrix24_AddTaskComment(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Text = "Task impossible, let's split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text);

    Process(Result, "Bitrix24", "AddTaskComment", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text = "Task uninpossible, don't split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text, Token);

    // END

    Process(Result, "Bitrix24", "AddTaskComment", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID);

    Process(Result, "Bitrix24", "DeleteTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteTaskComment");

EndProcedure

Procedure Bitrix24_CreateResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID);

    Process(Result, "Bitrix24", "CreateResultFromComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID, Token);

    // END

    Process(Result, "Bitrix24", "CreateResultFromComment");

EndProcedure

Procedure Bitrix24_DeleteResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID);

    Process(Result, "Bitrix24", "DeleteResultFromComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteResultFromComment");

EndProcedure

Procedure Bitrix24_GetResultsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID);

    Process(Result, "Bitrix24", "GetResultsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "GetResultsList");

EndProcedure

Procedure Bitrix24_GetTaskCommentsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID);

    Process(Result, "Bitrix24", "GetTaskCommentsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "GetTaskCommentsList");

EndProcedure

Procedure Bitrix24_GetTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID);

    Process(Result, "Bitrix24", "GetTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID, Token);

    // END

    Process(Result, "Bitrix24", "GetTaskComment");

EndProcedure

Procedure Bitrix24_UpdateTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Text = "The task has been changed, do not split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text);

    Process(Result, "Bitrix24", "UpdateTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Text = "The task has been changed, let's split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text, Token);

    // END

    Process(Result, "Bitrix24", "UpdateTaskComment");

EndProcedure

Procedure Bitrix24_CreateTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType);

    Process(Result, "Bitrix24", "CreateTasksDependencies", "Hook"); // SKIP

    OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    // END

    Process(Result, "Bitrix24", "CreateTasksDependencies");

    OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

EndProcedure

Procedure Bitrix24_DeleteTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP
    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType);

    Process(Result, "Bitrix24", "DeleteTasksDependencies", "Hook"); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token); // SKIP
    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    // END

    Process(Result, "Bitrix24", "DeleteTasksDependencies");

EndProcedure

Procedure Bitrix24_AddKanbanStage(FunctionParameters)

    Name  = "New stage";
    Color = "0026FF";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, 6);

    Process(Result, "Bitrix24", "AddKanbanStage", "Hook", FunctionParameters); // SKIP

    Name  = "New stage 2";
    Color = "0026FF";

    URL         = FunctionParameters["Bitrix24_Domain"];
    Token       = FunctionParameters["Bitrix24_Token"];
    PrevStageID = Result["result"];

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, PrevStageID, , True, Token);

    // END

    Process(Result, "Bitrix24", "AddKanbanStage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteKanbanStage(FunctionParameters)

    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, True);

    Process(Result, "Bitrix24", "DeleteKanbanStage", "Hook"); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, , Token);

    // END

    Process(Result, "Bitrix24", "DeleteKanbanStage");

EndProcedure

Procedure Bitrix24_GetKanbanStages(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetKanbanStages(URL, , True);

    Process(Result, "Bitrix24", "GetKanbanStages", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetKanbanStages(URL, , , Token);

    // END

    Process(Result, "Bitrix24", "GetKanbanStages");

EndProcedure

Procedure Bitrix24_MoveTaskToKanbanStage(FunctionParameters)

    TaskID  = FunctionParameters["Bitrix24_KanbanTaskID"];
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID);

    Process(Result, "Bitrix24", "MoveTaskToKanbanStage", "Hook"); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID, , , Token);

    // END

    Process(Result, "Bitrix24", "MoveTaskToKanbanStage");

    OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, 2, , , Token);

EndProcedure

Procedure Bitrix24_UpdateKanbansStage(FunctionParameters)

    Name    = "New stage name";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color);

    Process(Result, "Bitrix24", "UpdateKanbansStage", "Hook"); // SKIP

    Name    = "New stage name 2";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color, 6, True, Token);

    // END

    Process(Result, "Bitrix24", "UpdateKanbansStage");

EndProcedure

Procedure Bitrix24_AddTasksChecklistElement(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Text = "Checklist element";

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, True);

    Process(Result, "Bitrix24", "AddTasksChecklistElement", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, , Token);

    // END

    Process(Result, "Bitrix24", "AddTasksChecklistElement", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Text = "New elements text";

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text);

    Process(Result, "Bitrix24", "UpdateTasksChecklistElement", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text, Token);

    // END

    Process(Result, "Bitrix24", "UpdateTasksChecklistElement");

EndProcedure

Procedure Bitrix24_DeleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID);

    Process(Result, "Bitrix24", "DeleteTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteTasksChecklistElement");

EndProcedure

Procedure Bitrix24_GetTasksChecklist(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID);

    Process(Result, "Bitrix24", "GetTasksChecklist", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "GetTasksChecklist");

EndProcedure

Procedure Bitrix24_GetTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID);

    Process(Result, "Bitrix24", "GetTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    Process(Result, "Bitrix24", "GetTasksChecklistElement");

EndProcedure

Procedure Bitrix24_CompleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID);

    Process(Result, "Bitrix24", "CompleteTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    Process(Result, "Bitrix24", "CompleteTasksChecklistElement");

EndProcedure

Procedure Bitrix24_RenewTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID);

    Process(Result, "Bitrix24", "RenewTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    Process(Result, "Bitrix24", "RenewTasksChecklistElement");

EndProcedure

Procedure Bitrix24_AddTaskTimeAccounting(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Time = 3600;

    Result = OPI_Bitrix24.AddTaskTimeAccounting(URL, TaskID, Time);

    Process(Result, "Bitrix24", "AddTaskTimeAccounting", "Hook", FunctionParameters); // SKIP

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

    Process(Result, "Bitrix24", "AddTaskTimeAccounting", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Text = "The text I forgot last time";
    Time = 4800;

    Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL, TaskID, RecordID, Time, Text);

    Process(Result, "Bitrix24", "UpdateTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Text      = "New time record";
    Time      = 4800;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL, TaskID, RecordID, Time, Text, SetupDate, Token);

    // END

    Process(Result, "Bitrix24", "UpdateTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_DeleteTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID);

    Process(Result, "Bitrix24", "DeleteTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_GetTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID);

    Process(Result, "Bitrix24", "GetTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID, Token);

    // END

    Process(Result, "Bitrix24", "GetTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_GetTaskTimeAccountingList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID);

    Process(Result, "Bitrix24", "GetTaskTimeAccountingList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID, Token);

    // END

    Process(Result, "Bitrix24", "GetTaskTimeAccountingList");

EndProcedure

Procedure Bitrix24_GetDailyPlan(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDailyPlan(URL);

    Process(Result, "Bitrix24", "GetDailyPlan", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetDailyPlan(URL, Token);

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

    Result = OPI_Bitrix24.CreateChat(URL, ChatStructure);

    Process(Result, "Bitrix24", "CreateChat", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE" , "CHAT");
    ChatStructure.Insert("TITLE", "Private chat");
    ChatStructure.Insert("USERS", MembersArray);

    Result = OPI_Bitrix24.CreateChat(URL, ChatStructure, Token);

    // END

    Process(Result, "Bitrix24", "CreateChat", , FunctionParameters);

EndProcedure

Procedure Bitrix24_GetChatUsers(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID);

    Process(Result, "Bitrix24", "GetChatUsers", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID, Token);

    // END

    Process(Result, "Bitrix24", "GetChatUsers");

EndProcedure

Procedure Bitrix24_LeaveChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID);

    Process(Result, "Bitrix24", "LeaveChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID, Token);

    // END

    Process(Result, "Bitrix24", "LeaveChat");

EndProcedure

Procedure Bitrix24_DeleteUserFromChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID);

    Process(Result, "Bitrix24", "DeleteUserFromChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteUserFromChat");

EndProcedure

Procedure Bitrix24_AddUsersToChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserIDs);

    Process(Result, "Bitrix24", "AddUsersToChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];
    UserID = 10;

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserID, True, Token);

    // END

    Process(Result, "Bitrix24", "AddUsersToChat");

EndProcedure

Procedure Bitrix24_ChangeChatTitle(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Title = "New chat title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title);

    Process(Result, "Bitrix24", "ChangeChatTitle", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Title = "Another title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title, Token);

    // END

    Process(Result, "Bitrix24", "ChangeChatTitle");

EndProcedure

Procedure Bitrix24_ChangeChatColor(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Color = "AZURE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color);

    Process(Result, "Bitrix24", "ChangeChatColor", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Color = "PURPLE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color, Token);

    // END

    Process(Result, "Bitrix24", "ChangeChatColor");

EndProcedure

Procedure Bitrix24_ChangeChatPicture(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Image = FunctionParameters["Picture2"];

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image);

    Process(Result, "Bitrix24", "ChangeChatPicture", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image, Token);

    // END

    Process(Result, "Bitrix24", "ChangeChatPicture");

EndProcedure

Procedure Bitrix24_DisableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID);

    Process(Result, "Bitrix24", "DisableChatNotifications", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID, Token);

    // END

    Process(Result, "Bitrix24", "DisableChatNotifications");

EndProcedure

Procedure Bitrix24_EnableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID);

    Process(Result, "Bitrix24", "EnableChatNotifications", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID, Token);

    // END

    Process(Result, "Bitrix24", "EnableChatNotifications");

EndProcedure

Procedure Bitrix24_ChangeChatOwner(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID);

    Process(Result, "Bitrix24", "ChangeChatOwner", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID, Token);

    // END

    Process(Result, "Bitrix24", "ChangeChatOwner");

EndProcedure

Procedure Bitrix24_GetChatMessagesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat4";

    Result = OPI_Bitrix24.GetChatMessagesList(URL, ChatID);

    Process(Result, "Bitrix24", "GetChatMessagesList", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMessagesList(URL, UserID, , 0, Token);

    // END

    Process(Result, "Bitrix24", "GetChatMessagesList", , FunctionParameters);

EndProcedure

Procedure Bitrix24_MarkMessageAsReaded(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);
    ChatString = "chat" + ChatID;

    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, ChatString, MessageID);

    Process(Result, "Bitrix24", "MarkMessageAsReaded", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, UserID, MessageID, Token);

    // END

    Process(Result, "Bitrix24", "MarkMessageAsReaded");

EndProcedure

Procedure Bitrix24_MarkMessageAsUnreaded(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;
    MessageID  = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, ChatString, MessageID);

    Process(Result, "Bitrix24", "MarkMessageAsUnreaded", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, UserID, MessageID, Token);

    // END

    Process(Result, "Bitrix24", "MarkMessageAsUnreaded");

EndProcedure

Procedure Bitrix24_GetDialog(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Result = OPI_Bitrix24.GetDialog(URL, ChatString);

    Process(Result, "Bitrix24", "GetDialog", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetDialog(URL, UserID, Token);

    // END

    Process(Result, "Bitrix24", "GetDialog");

EndProcedure

Procedure Bitrix24_GetChatMembersList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Result = OPI_Bitrix24.GetChatMembersList(URL, ChatString);

    Process(Result, "Bitrix24", "GetChatMembersList", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMembersList(URL, UserID, Token);

    // END

    Process(Result, "Bitrix24", "GetChatMembersList");

EndProcedure

Procedure Bitrix24_SendWritingNotification(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Result = OPI_Bitrix24.SendWritingNotification(URL, ChatString);

    Process(Result, "Bitrix24", "SendWritingNotification", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.SendWritingNotification(URL, UserID, Token);

    // END

    Process(Result, "Bitrix24", "SendWritingNotification");

EndProcedure

Procedure Bitrix24_ReadAll(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.ReadAll(URL);

    Process(Result, "Bitrix24", "ReadAll", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.ReadAll(URL, Token);

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

    Result = OPI_Bitrix24.SendMessage(URL, ChatString, Text, Attachments);

    Process(Result, "Bitrix24", "SendMessage", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.SendMessage(URL, UserID, Text, , Token);

    // END

    Process(Result, "Bitrix24", "SendMessage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_EditMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Text = "New message text";

    Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text);

    Process(Result, "Bitrix24", "EditMessage", "Hook"); // SKIP

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

    Process(Result, "Bitrix24", "EditMessage");

EndProcedure

Procedure Bitrix24_DeleteMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID);

    Process(Result, "Bitrix24", "DeleteMessage", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteMessage");

EndProcedure

Procedure Bitrix24_SetMessageReaction(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID);

    Process(Result, "Bitrix24", "SetMessageReaction", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID, Token);

    // END

    Process(Result, "Bitrix24", "SetMessageReaction");

EndProcedure

Procedure Bitrix24_GetChatFilesFolder(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);

    Process(Result, "Bitrix24", "GetChatFilesFolder", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);

    // END

    Process(Result, "Bitrix24", "GetChatFilesFolder");

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

    Process(Result, "Bitrix24", "SendFile", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);
    FolderID  = Directory["result"]["ID"];

    UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID, Token);
    FileID       = UploadedFile["result"]["ID"];

    Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description, Token);

    // END

    Process(Result, "Bitrix24", "SendFile");

EndProcedure

Procedure Bitrix24_GetUsers(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    ArrayOfUsers = New Array;

    ArrayOfUsers.Add(1);
    ArrayOfUsers.Add(10);

    Result = OPI_Bitrix24.GetUsers(URL, ArrayOfUsers);

    Process(Result, "Bitrix24", "GetUsers", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    UserIDs = 10;

    Result = OPI_Bitrix24.GetUsers(URL, UserIDs, Token);

    // END

    Process(Result, "Bitrix24", "GetUsers");

EndProcedure

Procedure Bitrix24_GetUserStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetUserStatus(URL);

    Process(Result, "Bitrix24", "GetUserStatus", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetUserStatus(URL, Token);

    // END

    Process(Result, "Bitrix24", "GetUserStatus");

EndProcedure

Procedure Bitrix24_SetUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Status = "dnd";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status);

    Process(Result, "Bitrix24", "SetUserStatus", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Status = "away";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status, Token);

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

    Result = OPI_Bitrix24.CreatePersonalNotification(URL, UserID, Text, , Attachments);

    Process(Result, "Bitrix24", "CreatePersonalNotification", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Result = OPI_Bitrix24.CreatePersonalNotification(URL, UserID, Text, Tag, , Token);

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

    Result = OPI_Bitrix24.CreateSystemNotification(URL, UserID, Text, , Attachments);

    Process(Result, "Bitrix24", "CreateSystemNotification", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Result = OPI_Bitrix24.CreateSystemNotification(URL, UserID, Text, Tag, , Token);

    // END

    Process(Result, "Bitrix24", "CreateSystemNotification", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteNotification(FunctionParameters)

    URL            = FunctionParameters["Bitrix24_URL"];
    NotificationID = FunctionParameters["Bitrix24_PersoalHookNotifyID"];

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID);

    Process(Result, "Bitrix24", "DeleteNotification", "Hook"); // SKIP

    URL            = FunctionParameters["Bitrix24_Domain"];
    Token          = FunctionParameters["Bitrix24_Token"];
    NotificationID = FunctionParameters["Bitrix24_PersoalNotifyID"];

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteNotification");

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

    Result = OPI_Bitrix24.GetCustomTaskField(URL, FieldID, Token);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskFieldsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCustomTaskFieldsList(URL);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCustomTaskFieldsList(URL, Token);

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

    Process(Result, "Bitrix24", "CreateDepartment", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Name     = "Subordinate department";
    ParentID = FunctionParameters["Bitrix24_HookDepID"];
    HeadID   = 1;

    Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID, HeadID, Token);

    // END

    Process(Result, "Bitrix24", "CreateDepartment", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];
    ParentID     = 7;

    Result = OPI_Bitrix24.UpdateDepartment(URL, DepartmentID, , ParentID);

    Process(Result, "Bitrix24", "UpdateDepartment", "Hook"); // SKIP

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

    Process(Result, "Bitrix24", "UpdateDepartment");

EndProcedure

Procedure Bitrix24_DeleteDepartment(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID);

    Process(Result, "Bitrix24", "DeleteDepartment", "Hook"); // SKIP

    URL          = FunctionParameters["Bitrix24_Domain"];
    Token        = FunctionParameters["Bitrix24_Token"];
    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteDepartment");

EndProcedure

Procedure Bitrix24_GetDepartments(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Result = OPI_Bitrix24.GetDepartments(URL, DepartmentID);

    Process(Result, "Bitrix24", "GetDepartments", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    HeadID = 1;

    Result = OPI_Bitrix24.GetDepartments(URL, , , , HeadID, Token);

    // END

    Process(Result, "Bitrix24", "GetDepartments");

EndProcedure

Procedure Bitrix24_GetCurrentUser(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCurrentUser(URL);

    Process(Result, "Bitrix24", "GetCurrentUser", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCurrentUser(URL, Token);

    // END

    Process(Result, "Bitrix24", "GetCurrentUser");

EndProcedure

Procedure Bitrix24_GetUserFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL);

    Process(Result, "Bitrix24", "GetUserFieldsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL, Token);

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

    Result = OPI_Bitrix24.CreateUser(URL, UserStructure);

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

    Result = OPI_Bitrix24.CreateUser(URL, UserStructure, Token);

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

    Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure);

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

    Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure, Token);

    // END

    Process(Result, "Bitrix24", "UpdateUser");

EndProcedure

Procedure Bitrix24_ChangeUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True);

    Process(Result, "Bitrix24", "ChangeUserStatus", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True, Token);

    // END

    Process(Result, "Bitrix24", "ChangeUserStatus");

EndProcedure

Procedure Bitrix24_GetUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Result = OPI_Bitrix24.GetUser(URL, UserID);

    Process(Result, "Bitrix24", "GetUser", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.GetUser(URL, UserID, Token);

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

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure);

    Process(Result, "Bitrix24", "FindUsers", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FilterStructure = New Structure;
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Bitrix");

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure, Token);

    // END

    Process(Result, "Bitrix24", "FindUsers");

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

    Clear  = False;
    Result = OPI_Bitrix24.GetLeadFilterStructure(Clear);

    // END

    Process(Result, "Bitrix24", "GetLeadFilterStructure");

EndProcedure

Procedure Bitrix24_GetLeadStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetLeadStructure(URL);

    Process(Result, "Bitrix24", "GetLeadStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetLeadStructure(URL, Token);

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

    Result = OPI_Bitrix24.CreateLead(URL, FieldsStructure);

    Process(Result, "Bitrix24", "CreateLead", "Hook", FunctionParameters); // SKIP

    FieldsStructure.Insert("NAME"     , "Ivan");
    FieldsStructure.Insert("LAST_NAME", "Ivanov");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateLead(URL, FieldsStructure, Token);

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

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure);

    Process(Result, "Bitrix24", "UpdateLead", "Hook"); // SKIP

    FieldsStructure.Insert("NAME"     , "Evgeniy");
    FieldsStructure.Insert("LAST_NAME", "Evgeniev");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure, Token);

    // END

    Process(Result, "Bitrix24", "UpdateLead");

EndProcedure

Procedure Bitrix24_DeleteLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID);

    Process(Result, "Bitrix24", "DeleteLead", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteLead");

EndProcedure

Procedure Bitrix24_GetLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.GetLead(URL, LeadID);

    Process(Result, "Bitrix24", "GetLead", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.GetLead(URL, LeadID, Token);

    // END

    Process(Result, "Bitrix24", "GetLead");

EndProcedure

Procedure Bitrix24_GetLeadsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetLeadsList(URL);

    Process(Result, "Bitrix24", "GetLeadsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"    , "MegaClient");
    Filter.Insert("HAS_EMAIL", "Y");

    Result = OPI_Bitrix24.GetLeadsList(URL, Filter, , Token);

    // END

    Process(Result, "Bitrix24", "GetLeadsList");

EndProcedure

Procedure Bitrix24_GetDealsFilterStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetDealsFilterStructure(Clear);

    // END

    Process(Result, "Bitrix24", "GetDealsFilterStructure");

EndProcedure

Procedure Bitrix24_GetDealStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDealStructure(URL);

    Process(Result, "Bitrix24", "GetDealStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetDealStructure(URL, Token);

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

    Result = OPI_Bitrix24.CreateDeal(URL, FieldsStructure);

    Process(Result, "Bitrix24", "CreateDeal", "Hook", FunctionParameters); // SKIP

    FieldsStructure.Insert("TITLE"    , "Another deal");
    FieldsStructure.Insert("CLOSEDATE", "2031-01-01");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateDeal(URL, FieldsStructure, Token);

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

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure);

    Process(Result, "Bitrix24", "UpdateDeal", "Hook"); // SKIP

    FieldsStructure.Insert("TITLE"    , "Future deal in RUB");
    FieldsStructure.Insert("BEGINDATE", "2025-01-01");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure, Token);

    // END

    Process(Result, "Bitrix24", "UpdateDeal");

EndProcedure

Procedure Bitrix24_GetDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.GetDeal(URL, DealID);

    Process(Result, "Bitrix24", "GetDeal", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.GetDeal(URL, DealID, Token);

    // END

    Process(Result, "Bitrix24", "GetDeal");

EndProcedure

Procedure Bitrix24_DeleteDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID);

    Process(Result, "Bitrix24", "DeleteDeal", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteDeal");

EndProcedure

Procedure Bitrix24_GetDealsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDealsList(URL);

    Process(Result, "Bitrix24", "GetDealsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"      , "Sale in RUB");
    Filter.Insert("CURRENCY_ID", "RUB");

    Result = OPI_Bitrix24.GetDealsList(URL, Filter, , Token);

    // END

    Process(Result, "Bitrix24", "GetDealsList");

EndProcedure

Procedure Bitrix24_GetTasksFilterStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetTasksFilterStructure(Clear);

    // END

    Process(Result, "Bitrix24", "GetTasksFilterStructure");

EndProcedure

Procedure Bitrix24_GetCommentStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetCommentStructure(Clear);

    // END

    Process(Result, "Bitrix24", "GetCommentStructure");

EndProcedure

Procedure Bitrix24_GetChatStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetChatStructure(Clear);

    // END

    Process(Result, "Bitrix24", "GetChatStructure");

EndProcedure

Procedure Bitrix24_GetPictureBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Picture"];

    Result = OPI_Bitrix24.GetPictureBlock(Name, URL);

    // END

    Process(Result, "Bitrix24", "GetPictureBlock");

EndProcedure

Procedure Bitrix24_GetFileBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Document"];

    Result = OPI_Bitrix24.GetFileBlock(Name, URL);

    // END

    Process(Result, "Bitrix24", "GetFileBlock");

EndProcedure

Procedure Bitrix24_GetUserFilterStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetUserFilterStructure(Clear);

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

    Result = OPI_Bitrix24.CreateCalendar(URL, CalendarsStructure);

    Process(Result, "Bitrix24", "CreateCalendar", "Hook", FunctionParameters); // SKIP

    CalendarsStructure.Insert("name"       , "Another calendar");
    CalendarsStructure.Insert("description", "My other new calendar");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateCalendar(URL, CalendarsStructure, Token);

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

    Result = OPI_Bitrix24.UpdateCalendar(URL, CalendarID, CalendarsStructure);

    Process(Result, "Bitrix24", "UpdateCalendar", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Result = OPI_Bitrix24.UpdateCalendar(URL, CalendarID, CalendarsStructure, Token);

    // END

    Process(Result, "Bitrix24", "UpdateCalendar");

EndProcedure

Procedure Bitrix24_DeleteCalendar(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];
    OwnerID    = 1;
    Type       = "user";

    Result = OPI_Bitrix24.DeleteCalendar(URL, CalendarID, OwnerID, Type);

    Process(Result, "Bitrix24", "DeleteCalendar", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Result = OPI_Bitrix24.DeleteCalendar(URL, CalendarID, OwnerID, Type, Token);

    // END

    Process(Result, "Bitrix24", "DeleteCalendar");

EndProcedure

Procedure Bitrix24_GetCalendarStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCalendarStructure();

    // END

    Process(Result, "Bitrix24", "GetCalendarStructure");

    Result = OPI_Bitrix24.GetCalendarStructure(True);

    Process(Result, "Bitrix24", "GetCalendarStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCalendarList(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Result = OPI_Bitrix24.GetCalendarList(URL, OwnerID, Type);

    Process(Result, "Bitrix24", "GetCalendarList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCalendarList(URL, OwnerID, Type, Token);

    // END

    Process(Result, "Bitrix24", "GetCalendarList");

EndProcedure

Procedure Bitrix24_GetCalendarSettingsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCalendarSettingsStructure(URL);

    Process(Result, "Bitrix24", "GetCalendarSettingsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCalendarSettingsStructure(URL, Token);

    // END

    Process(Result, "Bitrix24", "GetCalendarSettingsStructure");

EndProcedure

Procedure Bitrix24_GetCalednarCustomSettingsStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCalednarCustomSettingsStructure();

    // END

    Process(Result, "Bitrix24", "GetCalednarCustomSettingsStructure");

    Result = OPI_Bitrix24.GetCalednarCustomSettingsStructure(True);

    Process(Result, "Bitrix24", "GetCalednarCustomSettingsStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCustomCalendarSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCustomCalendarSettings(URL);

    Process(Result, "Bitrix24", "GetCustomCalendarSettings", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCustomCalendarSettings(URL, Token);

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

    Result = OPI_Bitrix24.SetCustomCalendarSettings(URL, CalendarsStructure);

    Process(Result, "Bitrix24", "SetCustomCalendarSettings", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.SetCustomCalendarSettings(URL, CalendarsStructure, Token);

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

    Result = OPI_Bitrix24.GetUserBusy(URL, User, StartDate, EndDate);

    Process(Result, "Bitrix24", "GetUserBusy", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Result = OPI_Bitrix24.GetUserBusy(URL, User, StartDate, EndDate, Token);

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

    Result = OPI_Bitrix24.CreateCalendarEvent(URL, EventStucture);

    Process(Result, "Bitrix24", "CreateCalendarEvent", "Hook", FunctionParameters); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    EventStucture.Insert("section", CalendarID);

    Result = OPI_Bitrix24.CreateCalendarEvent(URL, EventStucture, Token);

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

    Result = OPI_Bitrix24.UpdateCalendarEvent(URL, EventID, EventStucture);

    Process(Result, "Bitrix24", "UpdateCalendarEvent", "Hook", FunctionParameters); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    EventID    = FunctionParameters["Bitrix24_CEventID"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Result = OPI_Bitrix24.UpdateCalendarEvent(URL, EventID, EventStucture, Token);

    // END

    Process(Result, "Bitrix24", "UpdateCalendarEvent", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Result = OPI_Bitrix24.DeleteCalendarEvent(URL, EventID);

    Process(Result, "Bitrix24", "DeleteCalendarEvent", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Result = OPI_Bitrix24.DeleteCalendarEvent(URL, EventID, Token);

    // END

    Process(Result, "Bitrix24", "DeleteCalendarEvent");

EndProcedure

Procedure Bitrix24_GetCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Result = OPI_Bitrix24.GetCalendarEvent(URL, EventID);

    Process(Result, "Bitrix24", "GetCalendarEvent", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Result = OPI_Bitrix24.GetCalendarEvent(URL, EventID, Token);

    // END

    Process(Result, "Bitrix24", "GetCalendarEvent");

EndProcedure

Procedure Bitrix24_GetCalendarEvents(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Result = OPI_Bitrix24.GetCalendarEvents(URL, OwnerID, Type);

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

    Result = OPI_Bitrix24.GetCalendarEvents(URL, OwnerID, Type, Filter, Token);

    // END

    Process(Result, "Bitrix24", "GetCalendarEvents");

EndProcedure

Procedure Bitrix24_SetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];
    Status  = "Y";

    Result = OPI_Bitrix24.SetUserParticipationStatus(URL, EventID, Status);

    Process(Result, "Bitrix24", "SetUserParticipationStatus", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Result = OPI_Bitrix24.SetUserParticipationStatus(URL, EventID, Status, Token);

    // END

    Process(Result, "Bitrix24", "SetUserParticipationStatus");

EndProcedure

Procedure Bitrix24_GetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Result = OPI_Bitrix24.GetUserParticipationStatus(URL, EventID);

    Process(Result, "Bitrix24", "GetUserParticipationStatus", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Result = OPI_Bitrix24.GetUserParticipationStatus(URL, EventID, Token);

    // END

    Process(Result, "Bitrix24", "GetUserParticipationStatus");

EndProcedure

Procedure Bitrix24_GetCalendarEventsStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCalendarEventsStructure();

    // END

    Process(Result, "Bitrix24", "GetCalendarEventsStructure");

    Result = OPI_Bitrix24.GetCalendarEventsStructure(True);

    Process(Result, "Bitrix24", "GetCalendarEventsStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCalendarEventsFilterStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCalendarEventsFilterStructure();

    // END

    Process(Result, "Bitrix24", "GetCalendarEventsFilterStructure");

    Result = OPI_Bitrix24.GetCalendarEventsFilterStructure(True);

    Process(Result, "Bitrix24", "GetCalendarEventsFilterStructure", "Clear");

EndProcedure

#EndRegion

#Region VKTeams

Procedure VKTeams_CheckToken(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    Result = OPI_VKTeams.CheckToken(Token);

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

    Result = OPI_VKTeams.SendTextMessage(Token, ChatID, Text);

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

    Result = OPI_VKTeams.SendTextMessage(Token, ChatID, Text, ReplyID, Keyboard, Markup);

    // END

    Process(Result, "VKTeams", "SendTextMessage", , FunctionParameters);

EndProcedure

Procedure VKTeams_ForwardMessage(FunctionParameters)

    Token      = FunctionParameters["VkTeams_Token"];
    ChatID     = FunctionParameters["VkTeams_ChatID"];
    FromChatID = FunctionParameters["VkTeams_ChatID2"];
    MessageID  = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID);

    Process(Result, "VKTeams", "ForwardMessage", "Simple"); // SKIP

    Text = "Additional text";

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID, Text);

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

    Result = OPI_VKTeams.SendFile(Token, ChatID, File);

    Process(Result, "VKTeams", "SendFile", "URL", FunctionParameters); // SKIP

    Result = OPI_VKTeams.SendFile(Token, ChatID, FilePath, Text);

    Process(Result, "VKTeams", "SendFile", "Path", FunctionParameters); // SKIP

    Result = OPI_VKTeams.SendFile(Token, ChatID, FileBD, Text, "ImportantDocument.docx");

    // END

    Process(Result, "VKTeams", "SendFile", , FunctionParameters);

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_ResendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_FileID"];
    Text   = "File caption";

    Result = OPI_VKTeams.ResendFile(Token, ChatID, FileID, Text);

    // END

    Process(Result, "VKTeams", "ResendFile");

EndProcedure

Procedure VKTeams_GetFileInformation(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    FileID = FunctionParameters["VkTeams_FileID"];

    Result = OPI_VKTeams.GetFileInformation(Token, FileID);

    // END

    Process(Result, "VKTeams", "GetFileInformation");

EndProcedure

Procedure VKTeams_EditMessageText(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];
    Text      = "New message text";

    Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text);

    Process(Result, "VKTeams", "EditMessageText", "Path"); // SKIP

    Text   = "<b>New bold message text</b>";
    Markup = "HTML";

    Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text, Markup);

    // END

    Process(Result, "VKTeams", "EditMessageText");

EndProcedure

Procedure VKTeams_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.DeleteMessage(Token, ChatID, MessageID);

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

    Result = OPI_VKTeams.SendVoice(Token, ChatID, File);

    Process(Result, "VKTeams", "SendVoice", "URL", FunctionParameters); // SKIP

    Result = OPI_VKTeams.SendVoice(Token, ChatID, FilePath, , ReplyID);

    Process(Result, "VKTeams", "SendVoice", "Path", FunctionParameters); // SKIP

    Result = OPI_VKTeams.SendVoice(Token, ChatID, FileBD);

    // END

    Process(Result, "VKTeams", "SendVoice", , FunctionParameters);

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_ResendVoice(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_VoiceID"];

    Result = OPI_VKTeams.ResendVoice(Token, ChatID, FileID);

    // END

    Process(Result, "VKTeams", "ResendVoice");

EndProcedure

Procedure VKTeams_RemoveChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.RemoveChatMembers(Token, ChatID, User);

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

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, File);

    Process(Result, "VKTeams", "ChangeChatPicture", "URL");

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FilePath);

    Process(Result, "VKTeams", "ChangeChatPicture", "Path");

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FileBD);

    // END

    Process(Result, "VKTeams", "ChangeChatPicture");

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_GetChatInfo(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatInfo(Token, ChatID);

    // END

    Process(Result, "VKTeams", "GetChatInfo");

EndProcedure

Procedure VKTeams_GetChatAdmins(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatAdmins(Token, ChatID);

    // END

    Process(Result, "VKTeams", "GetChatAdmins");

EndProcedure

Procedure VKTeams_GetChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatMembers(Token, ChatID);

    // END

    Process(Result, "VKTeams", "GetChatMembers");

EndProcedure

Procedure VKTeams_GetChatBlockedUsers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatBlockedUsers(Token, ChatID);

    // END

    Process(Result, "VKTeams", "GetChatBlockedUsers");

EndProcedure

Procedure VKTeams_GetChatJoinRequests(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatJoinRequests(Token, ChatID);

    // END

    Process(Result, "VKTeams", "GetChatJoinRequests");

EndProcedure

Procedure VKTeams_BlockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.BlockChatUser(Token, ChatID, User, True);

    // END

    Process(Result, "VKTeams", "BlockChatUser");

EndProcedure

Procedure VKTeams_UnblockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.UnblockChatUser(Token, ChatID, User);

    // END

    Process(Result, "VKTeams", "UnblockChatUser");

EndProcedure

Procedure VKTeams_PinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.PinMessage(Token, ChatID, MessageID);

    // END

    Process(Result, "VKTeams", "PinMessage");

EndProcedure

Procedure VKTeams_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.UnpinMessage(Token, ChatID, MessageID);

    // END

    Process(Result, "VKTeams", "UnpinMessage");

EndProcedure

Procedure VKTeams_ApprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.ApprovePending(Token, ChatID, User);

    Process(Result, "VKTeams", "ApprovePending", "One"); // SKIP

    Result = OPI_VKTeams.ApprovePending(Token, ChatID);

    // END

    Process(Result, "VKTeams", "ApprovePending");

EndProcedure

Procedure VKTeams_DisapprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.DisapprovePending(Token, ChatID, User);

    Process(Result, "VKTeams", "DisapprovePending", "One"); // SKIP

    Result = OPI_VKTeams.DisapprovePending(Token, ChatID);

    // END

    Process(Result, "VKTeams", "DisapprovePending");

EndProcedure

Procedure VKTeams_SetChatTitle(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New title";

    Result = OPI_VKTeams.SetChatTitle(Token, ChatID, Text);

    // END

    Process(Result, "VKTeams", "SetChatTitle");

EndProcedure

Procedure VKTeams_SetChatDescription(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New description";

    Result = OPI_VKTeams.SetChatDescription(Token, ChatID, Text);

    // END

    Process(Result, "VKTeams", "SetChatDescription");

EndProcedure

Procedure VKTeams_SetChatRules(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "Text of the new rules";

    Result = OPI_VKTeams.SetChatRules(Token, ChatID, Text);

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
                    Result  = OPI_VKTeams.AnswerButtonEvent(Token, EventID, "Get it!!");

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

#Region Neocities

Procedure Neocities_UploadFile(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Data  = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Path  = "testfolder/test_pic.png";

    Result = OPI_Neocities.UploadFile(Token, Path, Data);

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

    Result = OPI_Neocities.UploadFiles(Token, FileMapping);

    // END

    Process(Result, "Neocities", "UploadFiles");

EndProcedure

Procedure Neocities_DeleteSelectedFiles(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    Paths = New Array;
    Paths.Add("/test/pic1.png");
    Paths.Add("/test/gif.gif");
    Paths.Add("/pic2.png");

    Result = OPI_Neocities.DeleteSelectedFiles(Token, Paths);

    // END

    Process(Result, "Neocities", "DeleteSelectedFiles");

    Result = OPI_Neocities.DeleteSelectedFiles(Token, "/testfolder");

    Process(Result, "Neocities", "DeleteSelectedFiles", "Directory 1");

    Result = OPI_Neocities.DeleteSelectedFiles(Token, "/test");

    Process(Result, "Neocities", "DeleteSelectedFiles", "Directory 2");

EndProcedure

Procedure Neocities_GetFilesList(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Path  = "test";

    Result = OPI_Neocities.GetFilesList(Token, Path);

    // END

    Process(Result, "Neocities", "GetFilesList");

    Result = OPI_Neocities.GetFilesList(Token);

    Process(Result, "Neocities", "GetFilesList", "All");

EndProcedure

Procedure Neocities_GetSiteData(FunctionParameters)

    Token   = FunctionParameters["NC_Token"];
    Website = "2athenaeum";

    Result = OPI_Neocities.GetSiteData(Token);

    Process(Result, "Neocities", "GetSiteData"); // SKIP

    Result = OPI_Neocities.GetSiteData(Token, Website);

    // END

    Process(Result, "Neocities", "GetSiteData", "Website");

EndProcedure

Procedure Neocities_GetToken(FunctionParameters)

    Login    = FunctionParameters["NC_Login"];
    Password = FunctionParameters["NC_Password"];

    Result = OPI_Neocities.GetToken(Login, Password);

    // END

    Result["api_key"] = "***";

    Process(Result, "Neocities", "GetToken");

EndProcedure

Procedure Neocities_SynchronizeFolders(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    LocalFolder  = "C:\test_site";
    RemoteFolder = "test_sync";

    Result = OPI_Neocities.SynchronizeFolders(Token, LocalFolder, RemoteFolder);

    // END

    Process(Result, "Neocities", "SynchronizeFolders");

EndProcedure

#EndRegion

#Region CDEK

Procedure CDEK_GetToken(FunctionParameters)

    Account  = FunctionParameters["CDEK_Account"];
    Password = FunctionParameters["CDEK_Password"];

    Result = OPI_CDEK.GetToken(Account, Password, True);

    // END

    Process(Result, "CDEK", "GetToken", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrderDescription(FunctionParameters)

    Result = OPI_CDEK.GetOrderDescription();

    // END

    Process(Result, "CDEK", "GetOrderDescription");

    Result = OPI_CDEK.GetOrderDescription(True);

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

    Result = OPI_CDEK.CreateOrder(Token, OrderDescription, True, True);

    // END

    Process(Result, "CDEK", "CreateOrder", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.GetOrder(Token, UUID, True);

    // END

    Process(Result, "CDEK", "GetOrder", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrderByNumber(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    OrderNumber = FunctionParameters["CDEK_OrderIMN"];
    Result      = OPI_CDEK.GetOrderByNumber(Token, OrderNumber, True, True);

    // END

    Process(Result, "CDEK", "GetOrderByNumber");

EndProcedure

Procedure CDEK_UpdateOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    OrderDescription = New Structure("comment", "NewComment");

    Result = OPI_CDEK.UpdateOrder(Token, UUID, OrderDescription, True);

    // END

    Process(Result, "CDEK", "UpdateOrder");

EndProcedure

Procedure CDEK_DeleteOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.DeleteOrder(Token, UUID, True);

    // END

    Process(Result, "CDEK", "DeleteOrder");

EndProcedure

Procedure CDEK_CreateCustomerRefund(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Tariff = 139;

    Result = OPI_CDEK.CreateCustomerRefund(Token, UUID, Tariff, True);

    // END

    Process(Result, "CDEK", "CreateCustomerRefund");

EndProcedure

Procedure CDEK_CreateRefusal(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.CreateRefusal(Token, UUID, True);

    // END

    Process(Result, "CDEK", "CreateRefusal");

EndProcedure

Procedure CDEK_GetCourierInvitationsDescription(FunctionParameters)

    Result = OPI_CDEK.GetCourierInvitationsDescription();

    // END

    Process(Result, "CDEK", "GetCourierInvitationsDescription");

    Result = OPI_CDEK.GetCourierInvitationsDescription(True);

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

    Result = OPI_CDEK.CreateCourierInvitation(Token, InvitationDescription, True);

    // END

    Process(Result, "CDEK", "CreateCourierInvitation", , FunctionParameters);

EndProcedure

Procedure CDEK_GetCourierInvitation(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_IntakeUUID"];

    Result = OPI_CDEK.GetCourierInvitation(Token, UUID, True);

    // END

    Process(Result, "CDEK", "GetCourierInvitation");

EndProcedure

Procedure CDEK_DeleteCourierInvitation(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_IntakeUUID"];

    Result = OPI_CDEK.DeleteCourierInvitation(Token, UUID, True);

    // END

    Process(Result, "CDEK", "DeleteCourierInvitation");

EndProcedure

Procedure CDEK_CreateReceipt(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Type   = "tpl_russia";
    Copies = 1;

    Result = OPI_CDEK.CreateReceipt(Token, UUID, Type, Copies, True);

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

    Result = OPI_CDEK.CreateBarcode(Token, UUID, Copies, Format, , True);

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

    Result = OPI_CDEK.GetAvailableDeliveryIntervals(Token, UUID, True);

    // END

    Process(Result, "CDEK", "GetAvailableDeliveryIntervals");

EndProcedure

Procedure CDEK_GetAppointmentDescription(FunctionParameters)

    Result = OPI_CDEK.GetAppointmentDescription();

    // END

    Process(Result, "CDEK", "GetAppointmentDescription");

    Result = OPI_CDEK.GetAppointmentDescription(True);

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

    Result = OPI_CDEK.RegisterDeliveryAppointment(Token, Appointment, True);

    // END

    Process(Result, "CDEK", "RegisterDeliveryAppointment", , FunctionParameters);

EndProcedure

Procedure CDEK_GetDeliveryAppointment(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_ApptUUID"];

    Result = OPI_CDEK.GetDeliveryAppointment(Token, UUID, True);

    // END

    Process(Result, "CDEK", "GetDeliveryAppointment");

EndProcedure

Procedure CDEK_CreatePrealert(FunctionParameters)

    Token        = FunctionParameters["CDEK_Token"];
    UUID         = FunctionParameters["CDEK_OrderUUID"];
    Point        = "NSK27";
    TransferDate = OPI_Tools.GetCurrentDate() + 60 * 60 * 24;

    Result = OPI_CDEK.CreatePrealert(Token, UUID, TransferDate, Point, True);

    // END

    Process(Result, "CDEK", "CreatePrealert", , FunctionParameters);

EndProcedure

Procedure CDEK_GetPrealert(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_PrealertUUID"];

    Result = OPI_CDEK.GetPrealert(Token, UUID, True);

    // END

    Process(Result, "CDEK", "GetPrealert");

EndProcedure

Procedure CDEK_GetPassportDataStatus(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.GetPassportDataStatus(Token, UUID, True);

    // END

    Process(Result, "CDEK", "GetPassportDataStatus");

EndProcedure

Procedure CDEK_GetCashboxCheck(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.GetCashboxCheck(Token, UUID, True);

    // END

    Process(Result, "CDEK", "GetCashboxCheck");

EndProcedure

Procedure CDEK_GetCashboxChecksByDate(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Result = OPI_CDEK.GetCashboxChecksByDate(Token, ReceivingDate, True);

    // END

    Process(Result, "CDEK", "GetCashboxChecksByDate");

EndProcedure

Procedure CDEK_GetDeliveryCashRegistry(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Result = OPI_CDEK.GetDeliveryCashRegistry(Token, ReceivingDate, True);

    // END

    Process(Result, "CDEK", "GetDeliveryCashRegistry");

EndProcedure

Procedure CDEK_GetDeliveryCashTransfers(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Result = OPI_CDEK.GetDeliveryCashTransfers(Token, ReceivingDate, True);

    // END

    Process(Result, "CDEK", "GetDeliveryCashTransfers");

EndProcedure

Procedure CDEK_GetOfficeFilterDescription(FunctionParameters)

    Result = OPI_CDEK.GetOfficeFilterDescription();

    // END

    Process(Result, "CDEK", "GetOfficeFilterDescription");

    Result = OPI_CDEK.GetOfficeFilterDescription(True);

    Process(Result, "CDEK", "GetOfficeFilterDescription", "Clear");

EndProcedure

Procedure CDEK_GetOfficeList(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    Filter = New Structure;
    Filter.Insert("weight_max" , 50);
    Filter.Insert("city_code"  , 270);
    Filter.Insert("allowed_cod", True);

    Result = OPI_CDEK.GetOfficeList(Token, Filter, True);

    // END

    Process(Result, "CDEK", "GetOfficeList");

EndProcedure

Procedure CDEK_GetRegionsList(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    Result = OPI_CDEK.GetRegionsList(Token, , , , True);

    // END

    Process(Result, "CDEK", "GetRegionsList");

EndProcedure

#EndRegion

#Region YandexMetrika

Procedure YandexMetrika_GetTagsList(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];

    Result = OPI_YandexMetrika.GetTagsList(Token);

    // END

    Process(Result, "YandexMetrika", "GetTagsList");

EndProcedure

Procedure YandexMetrika_CreateTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    Name  = "New tag";

    Result = OPI_YandexMetrika.CreateTag(Token, Name);

    // END

    Process(Result, "YandexMetrika", "CreateTag", , FunctionParameters, Name);

EndProcedure

Procedure YandexMetrika_DeleteTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];

    Result = OPI_YandexMetrika.DeleteTag(Token, TagID);

    // END

    Process(Result, "YandexMetrika", "DeleteTag");

EndProcedure

Procedure YandexMetrika_UpdateTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];
    Name  = "New tag title";

    Result = OPI_YandexMetrika.UpdateTag(Token, TagID, Name);

    // END

    Process(Result, "YandexMetrika", "UpdateTag", , Name);

EndProcedure

Procedure YandexMetrika_GetTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];

    Result = OPI_YandexMetrika.GetTag(Token, TagID);

    // END

    Process(Result, "YandexMetrika", "GetTag");

EndProcedure

Procedure YandexMetrika_GetCounterStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_YandexMetrika.GetCounterStructure(Clear);

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

    Result = OPI_YandexMetrika.CreateCounter(Token, CounterStructure);

    // END

    Process(Result, "YandexMetrika", "CreateCounter", , FunctionParameters);

EndProcedure

Procedure YandexMetrika_DeleteCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Result = OPI_YandexMetrika.DeleteCounter(Token, CounterID);

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

    Result = OPI_YandexMetrika.UpdateCounter(Token, CounterID, CounterStructure);

    // END

    Process(Result, "YandexMetrika", "UpdateCounter");

EndProcedure

Procedure YandexMetrika_GetCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Result = OPI_YandexMetrika.GetCounter(Token, CounterID);

    // END

    Process(Result, "YandexMetrika", "GetCounter");

EndProcedure

Procedure YandexMetrika_RestoreCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Result = OPI_YandexMetrika.RestoreCounter(Token, CounterID);

    // END

    Process(Result, "YandexMetrika", "RestoreCounter");

EndProcedure

Procedure YandexMetrika_GetCountersList(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Result = OPI_YandexMetrika.GetCountersList(Token);

    Process(Result, "YandexMetrika", "GetCountersList"); // SKIP

    // filter by IDs list

    Filter = New Structure;

    CountersArray = New Array;
    CountersArray.Add(CounterID);

    Filter.Insert("counter_ids", CountersArray);

    Result = OPI_YandexMetrika.GetCountersList(Token, Filter);

    // END

    Process(Result, "YandexMetrika", "GetCountersList", "Filter");

EndProcedure

Procedure YandexMetrika_GetActionsList(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Result = OPI_YandexMetrika.GetActionsList(Token, CounterID);

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

    Result = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    // END

    Process(Result, "S3", "GetBasicDataStructure");

EndProcedure

Procedure S3_SendRequestWithoutBody(FunctionParameters)

    URL       = FunctionParameters["S3_URL"] + "/opi-newbucket2";
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);
    Method    = "GET";

    Result = OPI_S3.SendRequestWithoutBody(Method, BasicData);

    // END

    Process(Result, "S3", "SendRequestWithoutBody");

EndProcedure

Procedure S3_SendRequestWithBody(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Method = "PUT";
    Body   = "C:\test_data\document.docx"; // URL, Path or Binary Data

    Result = OPI_S3.SendRequestWithBody(Method, BasicData, Body);

    // END

    Process(Result, "S3", "SendRequestWithBody");

EndProcedure

Procedure S3_CreateBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.DeleteBucket(Name, BasicData, Directory); // SKIP
    Process(Result, "S3", "CreateBucket", "Deletion"); // SKIP

    Result = OPI_S3.CreateBucket(Name, BasicData, Directory);

    // END

    Process(Result, "S3", "CreateBucket");

EndProcedure

Procedure S3_DeleteBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.DeleteBucket(Name, BasicData, Directory);

    // END

    Process(Result, "S3", "DeleteBucket");

EndProcedure

Procedure S3_ListBuckets(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);
    Result    = OPI_S3.ListBuckets(BasicData);

    // END

    Process(Result, "S3", "ListBuckets");

EndProcedure

Procedure S3_HeadBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.HeadBucket(Name, BasicData, Directory);

    Process(Result, "S3", "HeadBucket"); // SKIP

    Result = OPI_S3.HeadBucket(Name, BasicData, Directory, "1234");

    // END

    Process(Result, "S3", "HeadBucket", "Account");

EndProcedure

Procedure S3_GetBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.GetBucketEncryption(Name, BasicData, Directory);

    // END

    Process(Result, "S3", "GetBucketEncryption");

EndProcedure

Procedure S3_DeleteBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.DeleteBucketEncryption(Name, BasicData, Directory);

    // END

    Process(Result, "S3", "DeleteBucketEncryption");

EndProcedure

Procedure S3_PutBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    XmlConfig = "<ServerSideEncryptionConfiguration xmlns=""http://s3.amazonaws.com/doc/2006-03-01/"">
                      | <Rule>
                      | <ApplyServerSideEncryptionByDefault>
                      | <SSEAlgorithm>AES256</SSEAlgorithm>
                      | </ApplyServerSideEncryptionByDefault>
                      | </Rule>
                      |</ServerSideEncryptionConfiguration>";

    TFN       = GetTempFileName("xml"); // SKIP
    GetBinaryDataFromString(XmlConfig).Write(TFN); // SKIP
    XmlConfig = TFN; // SKIP

    Result = OPI_S3.PutBucketEncryption(Name, BasicData, XmlConfig, Directory);

    // END

    OPI_Tools.RemoveFileWithTry(XmlConfig, "Error deleting file after test");

    Process(Result, "S3", "PutBucketEncryption");

EndProcedure

Procedure S3_GetBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.GetBucketTagging(Name, BasicData, Directory);

    // END

    Process(Result, "S3", "GetBucketTagging");

EndProcedure

Procedure S3_PutBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    TagStructure = New Structure;
    TagStructure.Insert("MyTag1", "SomeValue");
    TagStructure.Insert("MyTag2", "AnotherOne");

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.PutBucketTagging(Name, BasicData, TagStructure);

    // END

    Process(Result, "S3", "PutBucketTagging");

EndProcedure

Procedure S3_DeleteBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.DeleteBucketTagging(Name, BasicData);

    // END

    Process(Result, "S3", "DeleteBucketTagging");

EndProcedure

Procedure S3_GetBucketVersioning(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.GetBucketVersioning(Name, BasicData);

    // END

    Process(Result, "S3", "GetBucketVersioning");

EndProcedure

Procedure S3_PutBucketVersioning(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);
    Status    = True;

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.PutBucketVersioning(Name, BasicData, Status);

    // END

    Process(Result, "S3", "PutBucketVersioning");

EndProcedure

Procedure S3_PutObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Name   = "picture.jpg";
    Entity = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_S3.PutObject(Name, Bucket, Entity, BasicData, , Directory);

    Process(Result, "S3", "PutObject"); // SKIP

    Name   = "fileChunked.mp3";
    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data

    BasicData.Insert("ChunkSize", 5242880); // Size parts for upload in multiple of requests

    Result = OPI_S3.PutObject(Name, Bucket, Entity, BasicData, , Directory);

    // END

    Process(Result, "S3", "PutObject", "ByParts");

    OPI_S3.DeleteObject(Name, Bucket, BasicData, , , Directory);

EndProcedure

Procedure S3_UploadFullObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name   = "pictureSmall.jpg";
    Entity = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.UploadFullObject(Name, Bucket, Entity, BasicData, , Directory);

    // END

    Process(Result, "S3", "UploadFullObject");

    OPI_S3.DeleteObject(Name, Bucket, BasicData, , , Directory);

EndProcedure

Procedure S3_DeleteObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.DeleteObject(Name, Bucket, BasicData, , , Directory);

    // END

    Process(Result, "S3", "DeleteObject");

EndProcedure

Procedure S3_HeadObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.HeadObject(Name, Bucket, BasicData, , , Directory);

    // END

    Process(Result, "S3", "HeadObject");

EndProcedure

Procedure S3_CopyObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    SourcePath        = "picture.jpg";
    DestinationBucket = "newbucket2";

    DestinationPath = "new_picture.jpg";
    SourceBucket    = FunctionParameters["S3_DB"];
    SourceBucket    = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.CopyObject(SourcePath, DestinationBucket, DestinationPath, SourceBucket, BasicData, , Directory);

    // END

    Process(Result, "S3", "CopyObject");

    OPI_S3.DeleteObject(DestinationPath, SourceBucket, BasicData, , , Directory);

EndProcedure

Procedure S3_PutObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    TagStructure = New Structure;

    TagStructure.Insert("MyTag1", "SomeValue");
    TagStructure.Insert("MyTag2", "AnotherOne");

    Result = OPI_S3.PutObjectTagging(Name, Bucket, BasicData, TagStructure, , Directory);

    // END

    Process(Result, "S3", "PutObjectTagging");

EndProcedure

Procedure S3_GetObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.GetObjectTagging(Name, Bucket, BasicData, , , Directory);

    // END

    Process(Result, "S3", "GetObjectTagging");

EndProcedure

Procedure S3_DeleteObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.DeleteObjectTagging(Name, Bucket, BasicData, , , Directory);

    // END

    Process(Result, "S3", "DeleteObjectTagging");

EndProcedure

Procedure S3_ListObjects(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.ListObjects(Bucket, BasicData, , , , Directory);

    // END

    Process(Result, "S3", "ListObjects");

EndProcedure

Procedure S3_ListObjectVersions(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Prefix = "pic";
    Result = OPI_S3.ListObjectVersions(Bucket, BasicData, Prefix, , , Directory);

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

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.GetObject(Name, Bucket, BasicData, , , , Directory);

    Process(Result, "S3", "GetObject", , RequiredSize); // SKIP

    TempFile = GetTempFileName();
    BasicData.Insert("ChunkSize", 200000);

    Result = OPI_S3.GetObject(Name, Bucket, BasicData, , , TempFile);

    // END

    Process(Result, "S3", "GetObject", "File", RequiredSize);

    Name   = "bigfile.exe";
    Bucket = "newbucket2";

    BigTempFile = GetTempFileName();
    Result      = OPI_S3.GetObject(Name, Bucket, BasicData, , , BigTempFile);

    Process(Result, "S3", "GetObject", "Big file", 34432400);

    Result = OPI_S3.GetObject(Name, Bucket, BasicData);

    Process(Result, "S3", "GetObject", "Big BD", 34432400);

    OPI_Tools.RemoveFileWithTry(BigTempFile, "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(TempFile   , "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure S3_InitPartsUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Result = OPI_S3.InitPartsUpload(Name, Bucket, BasicData, , Directory);
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

    Result = OPI_S3.FinishPartsUpload(Name, Bucket, BasicData, UploadID, TagsArray, , Directory);

    // END

    Process(Result, "S3", "InitPartsUpload", "Completion");

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure S3_FinishPartsUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Result = OPI_S3.InitPartsUpload(Name, Bucket, BasicData, , Directory);

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

    Result = OPI_S3.FinishPartsUpload(Name, Bucket, BasicData, UploadID, TagsArray, , Directory);
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

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Result = OPI_S3.InitPartsUpload(Name, Bucket, BasicData, , Directory);

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

    Result = OPI_S3.FinishPartsUpload(Name, Bucket, BasicData, UploadID, TagsArray, , Directory);

    // END

    Process(Result, "S3", "UploadObjectPart", "Completion"); // SKIP

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure S3_AbortMultipartUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Start    = OPI_S3.InitPartsUpload(Name, Bucket, BasicData, , Directory);
    UploadID = Start["response"]["InitiateMultipartUploadResult"]["UploadId"];

    Result = OPI_S3.AbortMultipartUpload(Name, Bucket, BasicData, UploadID, , Directory);

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

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.GetObjectDownloadLink(Name, Bucket, BasicData, 7200, , Directory);

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

    BasicData = OPI_S3.GetBasicDataStructure(URL, AccessKey, SecretKey, Region);

    Name = "pictureU.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "newbucket2";

    Result = OPI_S3.GetObjectUploadLink(Name, Bucket, BasicData, 7200, , Directory);

    // END

    Process(Result, "S3", "GetObjectUploadLink");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(Result)
        .SetBinaryBody(Image)
        .ProcessRequest("PUT");

    Process(Result, "S3", "GetObjectUploadLink", "Upload");

    Check = OPI_S3.HeadObject(Name, Bucket, BasicData);

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

    Address = "tcpbin.com:4243";
    Tls     = OPI_TCP.GetTLSSettings(True);

    ProxtUser     = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];
    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];

    ProxyAddress = ?(ProxyAddress = "127.0.0.1", OPI_TestDataRetrieval.GetLocalhost(), ProxyAddress); // SKIP

    Proxy = OPI_TCP.GetProxySettings(ProxyAddress, ProxyPort, "socks5", ProxtUser, ProxyPassword);
    Tls   = OPI_TCP.GetTLSSettings(True);

    Connection = OPI_TCP.CreateConnection(Address, TLS, Proxy);

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

    Result = OPI_TCP.ProcessRequest(Address, Data);

    Process(Result, "TCP", "ProcessRequest", , "Echo this!" + Chars.LF); // SKIP

    Address = FunctionParameters["TCP_AddressTLS"];

    ProxtUser     = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];
    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];

    ProxyAddress = ?(ProxyAddress = "127.0.0.1", OPI_TestDataRetrieval.GetLocalhost(), ProxyAddress); // SKIP

    Proxy = OPI_TCP.GetProxySettings(ProxyAddress, ProxyPort, "socks5", ProxtUser, ProxyPassword);
    Tls   = OPI_TCP.GetTLSSettings(True);

    Result = OPI_TCP.ProcessRequest(Address, Data, , Tls, Proxy);

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

    Result = OPI_TCP.GetTLSSettings(True);

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

Procedure TCP_GetProxySettings(FunctionParameters)

    ProxyType = "socks5"; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    Result = OPI_TCP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    // END

    Process(Result, "TCP", "GetProxySettings");

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

    OPI_Tools.RemoveFileWithTry(TFN, "Database file deletion error");

EndProcedure

Procedure SQLite_CloseConnection(FunctionParameters)

    TFN = GetTempFileName("sqlite");

    Connection = OPI_SQLite.CreateConnection(TFN);

    Process(Connection, "SQLite", "CloseConnection", "Openning"); // SKIP

    Closing = OPI_SQLite.CloseConnection(Connection);

    // END

    Process(Closing, "SQLite", "CloseConnection");

    OPI_Tools.RemoveFileWithTry(TFN, "Database file deletion error");

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

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, , , Connection);

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

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, ParameterArray, , Connection);

    Process(Result, "SQLite", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT id, name, age, salary, is_active, created_at, data FROM test_table;";

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, , , Connection);

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

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, , , Connection);

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

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, , , Connection, ExtensionMap);

    Process(Result, "SQLite", "ExecuteSQLQuery", "Extension"); // SKIP

    Closing = OPI_SQLite.CloseConnection(Connection);

    // END

    Process(Result, "SQLite", "ExecuteSQLQuery", "Closing");

    OPI_Tools.RemoveFileWithTry(TFN, "Database file deletion error");

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

    Result = OPI_SQLite.CreateTable(Table, ColoumnsStruct, Base);

    // END

    Process(Result, "SQLite", "CreateTable");

    ColoumnsMap = New Map;
    ColoumnsMap.Insert("id"                 , "INTEGER PRIMARY KEY");
    ColoumnsMap.Insert("[An obscure column]", "TEXT");

    Result = OPI_SQLite.CreateTable("test1", ColoumnsMap, Base);

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

    Result = OPI_SQLite.AddRecords(Table, DataArray, , Base);

    // END

    Process(Result, "SQLite", "AddRecords");

    Result = OPI_SQLite.AddRecords(Table, DataArray, False, Base);

    Process(Result, "SQLite", "AddRecords", "No transaction");

    RowStrucutre1.Insert("error", "Lesha");
    DataArray.Add(RowStrucutre1);

    Result = OPI_SQLite.AddRecords(Table, DataArray, , Base);
    Process(Result, "SQLite", "AddRecords", "Field error");

    Result = OPI_SQLite.AddRecords(Table, DataArray, False, Base);
    Process(Result, "SQLite", "AddRecords", "Error without transaction");

    Result = OPI_SQLite.AddRecords(Table, "not valid json", , Base);
    Process(Result, "SQLite", "AddRecords", "JSON Error");

    RowMap = New Map;
    RowMap.Insert("[An obscure column]", "yo");

    Result = OPI_SQLite.AddRecords("test1", RowMap, , Base);
    Process(Result, "SQLite", "AddRecords", "An obscure column");

    OPI_Tools.RemoveFileWithTry(PictureFile, "Failed to delete the temporary file after the test!!");

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

    Result = OPI_SQLite.GetRecords(Table, Fields, Filters, Sort, Count, Base);

    // END

    Process(Result, "SQLite", "GetRecords");

    Result = OPI_SQLite.GetRecords(Table, "['name','age','salary','is_active','created_at']", , , , Base);

    Process(Result, "SQLite", "GetRecords", "No parameters");

    FilterStructure2.Insert("type", "BEETWEEN");
    Filters.Add(FilterStructure2);

    Result = OPI_SQLite.GetRecords(Table
        , "['name','age','salary','is_active','created_at']"
        , Filters
        ,
        ,
        , Base);

    Process(Result, "SQLite", "GetRecords", "Error");

    Result = OPI_SQLite.GetRecords("test1", , , , , Base);

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

    Result = OPI_SQLite.UpdateRecords(Table, FieldsStructure, FilterStructure, Base);

    // END

    Process(Result, "SQLite", "UpdateRecords");

    FilterStructure.Insert("value", "Vitaly A.");

    Filters = New Array;
    Filters.Add(FilterStructure);

    Check = OPI_SQLite.GetRecords(Table, "['name','salary']", Filters, , , Base);

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

    Result = OPI_SQLite.DeleteRecords(Table, FilterStructure, Base);

    // END

    Process(Result, "SQLite", "DeleteRecords");

    Check = OPI_SQLite.GetRecords(Table, "['name','salary']", Filters, , , Base);

    Process(Check, "SQLite", "DeleteRecords", "Check");

EndProcedure

Procedure SQLite_GetTableInformation(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Result = OPI_SQLite.GetTableInformation(Table, Base);

    // END

    Process(Result, "SQLite", "GetTableInformation");

EndProcedure

Procedure SQLite_GetRecordsFilterStrucutre(FunctionParameters)

    Result = OPI_SQLite.GetRecordsFilterStrucutre();

    // END

    Process(Result, "SQLite", "GetRecordsFilterStrucutre");

    Result = OPI_SQLite.GetRecordsFilterStrucutre(True);

    Process(Result, "SQLite", "GetRecordsFilterStrucutre", "Clear");

EndProcedure

Procedure SQLite_DeleteTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Result = OPI_SQLite.DeleteTable(Table, Base);

    // END

    Process(Result, "SQLite", "DeleteTable");

    Check = OPI_SQLite.GetTableInformation(Table, Base);

    Process(Check, "SQLite", "DeleteTable", "Check");

    OPI_SQLite.DeleteTable("test1", Base);

EndProcedure

Procedure SQLite_ClearTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Result = OPI_SQLite.ClearTable(Table, Base);

    // END

    Process(Result, "SQLite", "ClearTable");

    Check = OPI_SQLite.GetTableInformation(Table, Base);

    Process(Check, "SQLite", "ClearTable", "Table");

    Check = OPI_SQLite.GetRecords(Table, , , , , Base);

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

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting extension file");

EndProcedure

Procedure SQLite_AddTableColumn(FunctionParameters)

    Base     = FunctionParameters["SQLite_DB"];
    Table    = "test";
    Name     = "new_col";
    DataType = "TEXT";

    Result = OPI_SQLite.AddTableColumn(Table, Name, DataType, Base);

    // END

    Process(Result, "SQLite", "AddTableColumn");

    Result = OPI_SQLite.GetTableInformation(Table, Base);

    Process(Result, "SQLite", "AddTableColumn", "Check");

EndProcedure

Procedure SQLite_DeleteTableColumn(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";
    Name  = "new_col";

    Result = OPI_SQLite.DeleteTableColumn(Table, Name, Base);

    // END

    Process(Result, "SQLite", "DeleteTableColumn");

    Result = OPI_SQLite.GetTableInformation(Table, Base);

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

    Result = OPI_SQLite.EnsureTable(Table, ColoumnsStruct, Base);

    // END

    Process(Result, "SQLite", "EnsureTable");

    Check = OPI_SQLite.GetTableInformation(Table, Base);

    Process(Check, "SQLite", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Result = OPI_SQLite.EnsureTable(Table, ColoumnsStruct, Base);

    Process(Result, "SQLite", "EnsureTable", "New");

    Check = OPI_SQLite.GetTableInformation(Table, Base);

    Process(Check, "SQLite", "EnsureTable", "Check 2", ColoumnsStruct);

EndProcedure

#EndRegion

#Region PostgreSQL

Procedure PostgreSQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    Result = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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

    Result = OPI_PostgreSQL.ExecuteSQLQuery(QueryText, , , Connection);

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

    Result = OPI_PostgreSQL.ExecuteSQLQuery(QueryText, ParameterArray, , Connection);

    Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT id, name, age, salary, is_active, created_at, data FROM test_table;";

    Result = OPI_PostgreSQL.ExecuteSQLQuery(QueryText, , , Connection);

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

    Result = OPI_PostgreSQL.ExecuteSQLQuery(QueryText, , , Connection);

    Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Transaction"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL"]; // Binary Data, URL or path to file

    Result = OPI_PostgreSQL.ExecuteSQLQuery(SQLFile, , , Connection);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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
    Result = OPI_PostgreSQL.CreateDatabase(Base, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "CreateDatabase");

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "PostgreSQL", "CreateDatabase", "Openning");

    Result = OPI_PostgreSQL.CreateDatabase(Base, Connection);

    Process(Result, "PostgreSQL", "CreateDatabase", "Existing");

    Base = "testbase2";

    OPI_PostgreSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);
    Result = OPI_PostgreSQL.CreateDatabase(Base, Connection);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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
    ColoumnsStruct.Insert("numeric_field"    , "NUMERIC(15, 2)");

    OPI_PostgreSQL.DeleteTable(Table, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "CreateTable");

    Table = "ABC DEF";

    Result = OPI_PostgreSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    Process(Result, "PostgreSQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Result = OPI_PostgreSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "GetTableInformation");

    Table = "heyho";

    Result = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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
    RecordStructure.Insert("numeric_field"    , New Structure("NUMERIC"                 , "15.2"));

    RecordsArray.Add(RecordStructure);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.AddRecords(Table, RecordsArray, True, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    Process(Result, "PostgreSQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, "test_data", Login, Password, Port);

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

    Result = OPI_PostgreSQL.GetRecords(Table
        , Fields
        , Filters
        , Sort
        , Count
        , ConnectionString
        , TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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
    Result = OPI_PostgreSQL.DeleteRecords(Table, Filters, ConnectionString, TLSSettings);

    // END

    Process(Obtaining, "PostgreSQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    Process(Result, "PostgreSQL", "DeleteRecords");

    Result = OPI_PostgreSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.DeleteTable(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);
    Result           = OPI_PostgreSQL.DeleteTable(Table, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "PostgreSQL", "DeleteDatabase", "Openning");

    Result = OPI_PostgreSQL.DisableAllDatabaseConnections(Base, Connection);

    Process(Result, "PostgreSQL", "DeleteDatabase", "Shutdown");

    Result = OPI_PostgreSQL.DeleteDatabase(Base, Connection);

    Process(Result, "PostgreSQL", "DeleteDatabase", "Deletion");

    Result = OPI_PostgreSQL.DeleteDatabase(Base, Connection);

    Process(Result, "PostgreSQL", "DeleteDatabase", "Error");

    Closing = OPI_PostgreSQL.CloseConnection(Connection);

    Process(Closing, "PostgreSQL", "DeleteDatabase", "Closing");

    Result = OPI_PostgreSQL.DeleteDatabase(Base, Connection);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.ClearTable(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "ClearTable");

    Result = OPI_PostgreSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.DisableAllDatabaseConnections(Base, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "DisableAllDatabaseConnections");

EndProcedure

Procedure PostgreSQL_GetRecordsFilterStrucutre(FunctionParameters)

    Result = OPI_PostgreSQL.GetRecordsFilterStrucutre();

    // END

    Process(Result, "PostgreSQL", "GetRecordsFilterStrucutre");

    Result = OPI_PostgreSQL.GetRecordsFilterStrucutre(True);

    Process(Result, "PostgreSQL", "GetRecordsFilterStrucutre", "Clear");

EndProcedure

Procedure PostgreSQL_GetTLSSettings(FunctionParameters)

    Result = OPI_PostgreSQL.GetTLSSettings(True);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table    = "testtable";
    Name     = "new_field";
    DataType = "TEXT";

    Result = OPI_PostgreSQL.AddTableColumn(Table, Name, DataType, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "AddTableColumn");

    Result = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";
    Name  = "new_field";

    Result = OPI_PostgreSQL.DeleteTableColumn(Table, Name, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "DeleteTableColumn");

    Result = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "SMALLINT");
    ColoumnsStruct.Insert("uuid_field"     , "uuid");
    ColoumnsStruct.Insert("bigint_field"   , "BIGINT");
    ColoumnsStruct.Insert("custom_field"   , "TEXT");

    Result = OPI_PostgreSQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    Process(Result, "PostgreSQL", "EnsureTable");

    Check = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    Process(Check, "PostgreSQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Result = OPI_PostgreSQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    Process(Result, "PostgreSQL", "EnsureTable", "New");

    Check = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    Process(Check, "PostgreSQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

#EndRegion

#Region MySQL

Procedure MySQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    Result = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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

    Result = OPI_MySQL.ExecuteSQLQuery(QueryText, , , Connection);

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

    Result = OPI_MySQL.ExecuteSQLQuery(QueryText, ParameterArray, , Connection);

    Process(Result, "MySQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT name, age, salary, amount, type, date, time, data FROM test_table;";

    Result = OPI_MySQL.ExecuteSQLQuery(QueryText, , , Connection);

    Process(Result, "MySQL", "ExecuteSQLQuery", , Image); // SKIP

    Result = OPI_MySQL.ExecuteSQLQuery("create table test_data (id INT,first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(50),gender VARCHAR(50),ip_address VARCHAR(20));", , , Connection); // SKIP
    Process(Result, "MySQL", "ExecuteSQLQuery", "Test data"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL2"]; // Binary Data, URL or path to file

    Result = OPI_MySQL.ExecuteSQLQuery(SQLFile, , , Connection);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    OPI_MySQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MySQL.CreateDatabase(Base, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "CreateDatabase");

    Base = "testbase2";
    OPI_MySQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "MySQL", "CreateDatabase", "Openning");

    Result = OPI_MySQL.CreateDatabase(Base, Connection, TLSSettings);

    Process(Result, "MySQL", "CreateDatabase", "Creation");

    Result = OPI_MySQL.CreateDatabase(Base, Connection, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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
    Result = OPI_MySQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "CreateTable");

    Table = "ABC DEF";

    Result = OPI_MySQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    Process(Result, "MySQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Result = OPI_MySQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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
    Result = OPI_MySQL.AddRecords(Table, RecordsArray, True, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MySQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    Process(Result, "MySQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, "test_data", Login, Password, Port);

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

    Result = OPI_MySQL.GetRecords(Table, Fields, Filters, Sort, Count, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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
    Result = OPI_MySQL.UpdateRecords(Table, FieldsStructure, FilterStructure, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "UpdateRecords");

    Check = OPI_MySQL.GetRecords(Table, "['ip_address']", Filters, , , ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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
    Result = OPI_MySQL.DeleteRecords(Table, Filters, ConnectionString, TLSSettings);

    // END

    Process(Obtaining, "MySQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    Process(Result, "MySQL", "DeleteRecords");

    Result = OPI_MySQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MySQL.DeleteTable(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);
    Result           = OPI_MySQL.DeleteTable(Table, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MySQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "MySQL", "DeleteDatabase", "Openning");

    Result = OPI_MySQL.DeleteDatabase(Base, Connection);

    Process(Result, "MySQL", "DeleteDatabase", "Deletion");

    Result = OPI_MySQL.DeleteDatabase(Base, Connection);

    Process(Result, "MySQL", "DeleteDatabase", "Error");

    Closing = OPI_MySQL.CloseConnection(Connection);

    Process(Closing, "MySQL", "DeleteDatabase", "Closing");

    Result = OPI_MySQL.DeleteDatabase(Base, Connection);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MySQL.ClearTable(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "ClearTable");

    Result = OPI_MySQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    Process(Result, "MySQL", "ClearTable", "Check");

EndProcedure

Procedure MySQL_GetRecordsFilterStrucutre(FunctionParameters)

    Result = OPI_MySQL.GetRecordsFilterStrucutre();

    // END

    Process(Result, "MySQL", "GetRecordsFilterStrucutre");

    Result = OPI_MySQL.GetRecordsFilterStrucutre(True);

    Process(Result, "MySQL", "GetRecordsFilterStrucutre", "Clear");

EndProcedure

Procedure MySQL_GetTLSSettings(FunctionParameters)

    Result = OPI_MySQL.GetTLSSettings(True);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MySQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "GetTableInformation");

    Table = "heyho";

    Result = OPI_MySQL.GetTableInformation(Table, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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
    Result = OPI_MySQL.AddTableColumn(Table, Name, DataType, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "AddTableColumn");

    Result = OPI_MySQL.GetTableInformation(Table, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";
    Name  = "new_field";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MySQL.DeleteTableColumn(Table, Name, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "DeleteTableColumn");

    Result = OPI_MySQL.GetTableInformation(Table, ConnectionString, TLSSettings);

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

    ConnectionString = OPI_MySQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_MySQL.GetTLSSettings(True);
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
    Result = OPI_MySQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    Process(Result, "MySQL", "EnsureTable");

    Check = OPI_MySQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    Process(Check, "MySQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Result = OPI_MySQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    Process(Result, "MySQL", "EnsureTable", "New");

    Check = OPI_MySQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    Process(Check, "MySQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

#EndRegion

#Region GreenAPI

Procedure GreenAPI_FormAccessParameters(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Result = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    // END

    Process(Result, "GreenAPI", "FormAccessParameters");

EndProcedure

Procedure GreenAPI_GetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetInstanceSettings(AccessParameters);

    // END

    Process(Result, "GreenAPI", "GetInstanceSettings", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetAccountInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetAccountInformation(AccessParameters);

    // END

    Process(Result, "GreenAPI", "GetAccountInformation");

EndProcedure

Procedure GreenAPI_GetInstanceSettingsStructure(FunctionParameters)

    Result = OPI_GreenAPI.GetInstanceSettingsStructure();

    // END

    Process(Result, "GreenAPI", "GetInstanceSettingsStructure");

    Result = OPI_GreenAPI.GetInstanceSettingsStructure(True);

    Process(Result, "GreenAPI", "GetInstanceSettingsStructure", "Clear");

EndProcedure

Procedure GreenAPI_SetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    SettingsStructure = New Structure;
    SettingsStructure.Insert("pollMessageWebhook"       , "yes");
    SettingsStructure.Insert("incomingBlockWebhook"     , "no");
    SettingsStructure.Insert("incomingCallWebhook"      , "no");
    SettingsStructure.Insert("editedMessageWebhook"     , "yes");
    SettingsStructure.Insert("deletedMessageWebhook"    , "yes");
    SettingsStructure.Insert("outgoingAPIMessageWebhook", "yes");

    Result = OPI_GreenAPI.SetInstanceSettings(SettingsStructure, AccessParameters);

    // END

    Process(Result, "GreenAPI", "SetInstanceSettings");

EndProcedure

Procedure GreenAPI_GetInstanceStatus(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetInstanceStatus(AccessParameters);

    // END

    Process(Result, "GreenAPI", "GetInstanceStatus");

EndProcedure

Procedure GreenAPI_RebootInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.RebootInstance(AccessParameters);

    // END

    Process(Result, "GreenAPI", "RebootInstance");

EndProcedure

Procedure GreenAPI_GetQR(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetQR(AccessParameters);

    // END

    Process(Result, "GreenAPI", "GetQR");

EndProcedure

Procedure GreenAPI_LogoutInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.LogoutInstance(AccessParameters);

    // END

    Process(Result, "GreenAPI", "LogoutInstance");

EndProcedure

Procedure GreenAPI_GetAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    PhoneNumber = 441234567890;

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetAuthorizationCode(AccessParameters, PhoneNumber);

    // END

    Process(Result, "GreenAPI", "GetAuthorizationCode");

EndProcedure

Procedure GreenAPI_SetProfilePicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SetProfilePicture(AccessParameters, Image);

    // END

    Process(Result, "GreenAPI", "SetProfilePicture");

EndProcedure

Procedure GreenAPI_CreateGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Name = "New group";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.CreateGroup(AccessParameters, Name);

    // END

    Process(Result, "GreenAPI", "CreateGroup", , FunctionParameters);

EndProcedure

Procedure GreenAPI_LeaveGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.LeaveGroup(AccessParameters, GroupID);

    // END

    Process(Result, "GreenAPI", "LeaveGroup");

EndProcedure

Procedure GreenAPI_GetGroupInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetGroupInformation(AccessParameters, GroupID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.UpdateGroupName(AccessParameters, GroupID, Name);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.AddGroupMember(AccessParameters, GroupID, UserID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.ExcludeGroupMember(AccessParameters, GroupID, UserID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SetAdminRights(AccessParameters, GroupID, UserID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.RevokeAdminRights(AccessParameters, GroupID, UserID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SetGroupPicture(AccessParameters, GroupID, Image);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendTextMessage(AccessParameters, ChatID, Text);

    // END

    Process(Result, "GreenAPI", "SendTextMessage", , FunctionParameters);

    MessageID = Result["idMessage"];
    Result    = OPI_GreenAPI.SendTextMessage(AccessParameters, ChatID, Text, MessageID);

    Process(Result, "GreenAPI", "SendTextMessage", "Quote");

EndProcedure

Procedure GreenAPI_DeleteMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.DeleteMessage(AccessParameters, ChatID, MessageID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.EditMessageText(AccessParameters, ChatID, MessageID, Text);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendFile(AccessParameters, ChatID, File, FileName, Description);

    // END

    Process(Result, "GreenAPI", "SendFile", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Result    = OPI_GreenAPI.SendFile(AccessParameters, ChatID, File, FileName, Description, MessageID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendFileByURL(AccessParameters, ChatID, File, FileName, Description);

    // END

    Process(Result, "GreenAPI", "SendFileByURL", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Result    = OPI_GreenAPI.SendFileByURL(AccessParameters, ChatID, File, FileName, Description, MessageID);

    Process(Result, "GreenAPI", "SendFileByURL", "Quote");

EndProcedure

Procedure GreenAPI_SendPoll(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];
    Text   = "What's your favorite color??";

    Variants = New Array;
    Variants.Add("Red");
    Variants.Add("Yellow");
    Variants.Add("Green");

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendPoll(AccessParameters, ChatID, Text, Variants);

    // END

    Process(Result, "GreenAPI", "SendPoll", , FunctionParameters);

    MessageID = Result["idMessage"];
    Result    = OPI_GreenAPI.SendPoll(AccessParameters, ChatID, Text, Variants, True, MessageID);

    Process(Result, "GreenAPI", "SendPoll", "Quote");

EndProcedure

Procedure GreenAPI_GetLocationDescription(FunctionParameters)

    Latitude  = 53.908522;
    Longitude = 27.574821;
    Address   = "Victory Square, Minsk";
    Name      = "Victory sq.";

    Result = OPI_GreenAPI.GetLocationDescription(Latitude, Longitude, Address, Name);

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

    Location = OPI_GreenAPI.GetLocationDescription(Latitude, Longitude, Address, Name);

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendLocation(AccessParameters, ChatID, Location);

    // END

    Process(Result, "GreenAPI", "SendLocation", , FunctionParameters);

    MessageID = Result["idMessage"];
    Location  = OPI_GreenAPI.GetLocationDescription(Latitude, Longitude);
    Result    = OPI_GreenAPI.SendLocation(AccessParameters, ChatID, Location, MessageID);

    Process(Result, "GreenAPI", "SendLocation", "Quote");

EndProcedure

Procedure GreenAPI_GetContactDescription(FunctionParameters)

    Phone      = 79001234568;
    Name       = "Artem";
    LastName   = "Evpatoriysky";
    Patronymic = "Petrovich";
    Company    = "Bicycle";

    Result = OPI_GreenAPI.GetContactDescription(Phone, Name, LastName, Patronymic, Company);

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

    Contact = OPI_GreenAPI.GetContactDescription(Phone, Name, LastName, Patronymic, Company);

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendContact(AccessParameters, ChatID, Contact);

    // END

    Process(Result, "GreenAPI", "SendContact", , FunctionParameters);

    MessageID = Result["idMessage"];
    Contact   = OPI_GreenAPI.GetContactDescription(Phone, , , , Company);
    Result    = OPI_GreenAPI.SendContact(AccessParameters, ChatID, Contact, MessageID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.ForwardMessages(AccessParameters, From, Target, Message);

    // END

    Process(Result, "GreenAPI", "ForwardMessages");

EndProcedure

Procedure GreenAPI_GetNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetNotification(AccessParameters);

    // END

    Process(Result, "GreenAPI", "GetNotification", , FunctionParameters);

EndProcedure

Procedure GreenAPI_DeleteNotificationFromQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ReceiptID = FunctionParameters["GreenAPI_ReceiptID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.DeleteNotificationFromQueue(AccessParameters, ReceiptID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.DownloadMessageFile(AccessParameters, ChatID, MessageID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SetReadMark(AccessParameters, ChatID, MessageID);

    // END

    Process(Result, "GreenAPI", "SetReadMark");

EndProcedure

Procedure GreenAPI_GetMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetMessageQueue(AccessParameters);

    // END

    Process(Result, "GreenAPI", "GetMessageQueue");

EndProcedure

Procedure GreenAPI_ClearMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.ClearMessageQueue(AccessParameters);

    // END

    Process(Result, "GreenAPI", "ClearMessageQueue");

EndProcedure

Procedure GreenAPI_GetChatHistory(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetChatHistory(AccessParameters, ChatID);

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

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetMessage(AccessParameters, ChatID, MessageID);

    // END

    Process(Result, "GreenAPI", "GetMessage", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetIncomingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetIncomingMessageLog(AccessParameters);

    // END

    Process(Result, "GreenAPI", "GetIncomingMessageLog", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetOutgoingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetOutgoingMessageLog(AccessParameters);

    // END

    Process(Result, "GreenAPI", "GetOutgoingMessageLog", , FunctionParameters);

EndProcedure

Procedure GreenAPI_ArchiveChat(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    OPI_GreenAPI.UnarchiveChat(AccessParameters, ChatID); // SKIP

    Result = OPI_GreenAPI.ArchiveChat(AccessParameters, ChatID);

    // END

    Process(Result, "GreenAPI", "ArchiveChat");

EndProcedure

Procedure GreenAPI_UnarchiveChat(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.UnarchiveChat(AccessParameters, ChatID);

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

    Result = OPI_RCON.FormConnectionParameters(URL, Password, ReadTimeout, WriteTimeout);

    // END

    Process(Result, "RCON", "FormConnectionParameters");

EndProcedure

Procedure RCON_CreateConnection(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    ConnectionParams = OPI_RCON.FormConnectionParameters(URL, Password, ReadTimeout, WriteTimeout);
    Result           = OPI_RCON.CreateConnection(ConnectionParams);

    // END

    Process(Result, "RCON", "CreateConnection");

EndProcedure

Procedure RCON_ExecuteCommand(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    ConnectionParams = OPI_RCON.FormConnectionParameters(URL, Password, ReadTimeout, WriteTimeout);
    Connection       = OPI_RCON.CreateConnection(ConnectionParams);

    Command = "list";
    Result  = OPI_RCON.ExecuteCommand(Command, Connection);

    // END

    Process(Result, "RCON", "ExecuteCommand");

    Command = "list";
    Result  = OPI_RCON.ExecuteCommand(Command, ConnectionParams);

    Process(Result, "RCON", "ExecuteCommand", "No connection");

EndProcedure

Procedure RCON_IsConnector(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    ConnectionParams = OPI_RCON.FormConnectionParameters(URL, Password, ReadTimeout, WriteTimeout);
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

    Result = OPI_Ollama.GetResponse(URL, Model, Prompt, , AdditionalHeaders);

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

    Result = OPI_Ollama.GetResponse(URL, Model, Prompt, AdditionalParameters, AdditionalHeaders);

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

    Question1 = OPI_Ollama.GetContextMessageStructure("user", "What is 1C:Enterprise?");
    Question2 = OPI_Ollama.GetContextMessageStructure("user", "When the first version was released?"); // Question without specifics

    // Adding the first question to the context
    MessagesArray.Add(Question1);

    Response1 = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, , AdditionalHeaders);

    Process(Response1, "Ollama", "GetContextResponse", "Preliminary"); // SKIP

    MessagesArray.Add(Response1["message"]); // Add response to first question in context
    MessagesArray.Add(Question2); // Add second question in context

    Response2 = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, , AdditionalHeaders);

    MessagesArray.Add(Response2["message"]);

    // ...

    // END

    Process(Response2, "Ollama", "GetContextResponse");

    MessagesArray = New Array;

    Question = New Structure("role,content", "user", "Hello!");
    MessagesArray.Add(Question);

    Options              = New Structure("seed,temperature", 101, 0);
    AdditionalParameters = New Structure("options", Options);

    Result = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, AdditionalParameters, AdditionalHeaders);

    Process(Result, "Ollama", "GetContextResponse", "Seed 1");

    Message1 = Result["message"]["content"];

    Result = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, AdditionalParameters, AdditionalHeaders);

    Process(Result, "Ollama", "GetContextResponse", "Seed 2");

    Message2 = Result["message"]["content"];

    Options              = New Structure("seed,temperature", 555, 10);
    AdditionalParameters = New Structure("options", Options);

    Result = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, AdditionalParameters, AdditionalHeaders);

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

    Result = OPI_Ollama.LoadModelToMemory(URL, Model, Period, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "LoadModelToMemory");

EndProcedure

Procedure Ollama_UnloadModelFromMemory(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.UnloadModelFromMemory(URL, Model, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "UnloadModelFromMemory");

EndProcedure

Procedure Ollama_GetRequestParameterStructure(FunctionParameters)

    Result = OPI_Ollama.GetRequestParameterStructure();

    // END

    Process(Result, "Ollama", "GetRequestParameterStructure");

    Result = OPI_Ollama.GetRequestParameterStructure(True);

    Process(Result, "Ollama", "GetRequestParameterStructure", "Clear");

EndProcedure

Procedure Ollama_GetContextParameterStructure(FunctionParameters)

    Result = OPI_Ollama.GetContextParameterStructure();

    // END

    Process(Result, "Ollama", "GetContextParameterStructure");

    Result = OPI_Ollama.GetContextParameterStructure(True);

    Process(Result, "Ollama", "GetContextParameterStructure", "Clear");

EndProcedure

Procedure Ollama_GetContextMessageStructure(FunctionParameters)

    Result = OPI_Ollama.GetContextMessageStructure("user", "Hello!");

    // END

    Process(Result, "Ollama", "GetContextMessageStructure");

EndProcedure

Procedure Ollama_GetModelSettingsStructure(FunctionParameters)

    Result = OPI_Ollama.GetModelSettingsStructure();

    // END

    Process(Result, "Ollama", "GetModelSettingsStructure");

    Result = OPI_Ollama.GetModelSettingsStructure(True);

    Process(Result, "Ollama", "GetModelSettingsStructure", "Clear");

EndProcedure

Procedure Ollama_CreateModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Settings = New Structure("from,system", "tinyllama", "You are Mario from Super Mario Bros.");

    Result = OPI_Ollama.CreateModel(URL, Model, Settings, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "CreateModel");

    Result = OPI_Ollama.GetResponse(URL, Model, "How are you?", , AdditionalHeaders);

    Process(Result, "Ollama", "CreateModel", "Request");

EndProcedure

Procedure Ollama_DeleteModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.DeleteModel(URL, Model, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "DeleteModel");

    Result = OPI_Ollama.DeleteModel(URL, "library/tinyllama:latest", AdditionalHeaders);
    Process(Result, "Ollama", "DeleteModel", "Tiny");

    Result = OPI_Ollama.DeleteModel(URL, "bayselonarrend/tinyllama:latest", AdditionalHeaders);
    Process(Result, "Ollama", "DeleteModel", "Tiny, account");

    Result = OPI_Ollama.GetModelList(URL, AdditionalHeaders);

    Process(Result, "Ollama", "DeleteModel", "List");

EndProcedure

Procedure Ollama_GetModelList(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.GetModelList(URL, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "GetModelList");

EndProcedure

Procedure Ollama_ListRunningModels(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.ListRunningModels(URL, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "ListRunningModels");

EndProcedure

Procedure Ollama_GetModelInformation(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.GetModelInformation(URL, Model, False, AdditionalHeaders);

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

    Result = OPI_Ollama.CopyModel(URL, Model, Name, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "CopyModel");

    OPI_Ollama.DeleteModel(URL, Name, AdditionalHeaders);

EndProcedure

Procedure Ollama_GetVersion(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.GetVersion(URL, AdditionalHeaders);

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

    Result = OPI_Ollama.GetEmbeddings(URL, Model, StingsArray, , AdditionalHeaders);

    // END

    Process(Result, "Ollama", "GetEmbeddings");

EndProcedure

Procedure Ollama_GetEmbeddingsParameterStructure(FunctionParameters)

    Result = OPI_Ollama.GetEmbeddingsParameterStructure();

    // END

    Process(Result, "Ollama", "GetEmbeddingsParameterStructure");

    Result = OPI_Ollama.GetEmbeddingsParameterStructure(True);

    Process(Result, "Ollama", "GetEmbeddingsParameterStructure", "Clear");

EndProcedure

Procedure Ollama_PushModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "bayselonarrend/tinyllama:latest";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.PushModel(URL, Model, , AdditionalHeaders);

    // END

    Process(Result, "Ollama", "PushModel");

EndProcedure

Procedure Ollama_PullModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.PullModel(URL, Model, , AdditionalHeaders);

    // END

    Process(Result, "Ollama", "PullModel");

    Result = OPI_Ollama.PullModel(URL, "bayselonarrend/tinyllama:latest", , AdditionalHeaders);

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

    Result = OPI_Ollama.PushBlob(URL, Image, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "PushBlob", , FunctionParameters);

EndProcedure

Procedure Ollama_CheckBlob(FunctionParameters)

    URL    = FunctionParameters["Ollama_URL"];
    Token  = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama
    SHA256 = FunctionParameters["Ollama_Blob"];

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.CheckBlob(URL, SHA256, AdditionalHeaders);

    // END

    Process(Result, "Ollama", "CheckBlob");

    Result = OPI_Ollama.CheckBlob(URL, "yoyoyo", AdditionalHeaders);

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

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure HTTPClient_SetDataType(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    MIMEType = "text/markdown";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetStringBody("# Hello world!!")
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

    Text     = "Hello world!!";
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

    Text     = "Hello world!!";
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

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

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

Procedure HTTPClient_SendDataInParts(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/put";

    ChunkSize = 524288;
    Image     = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .SendDataInParts(ChunkSize) // <---
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SendDataInParts");

EndProcedure

Procedure HTTPClient_SendPart(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/put";

    ChunkSize = 524288;
    Data      = GetBinaryDataFromString("Some data for sending");

    // Sending only "data for"
    StartPosition = 5;
    Bytes = 8;

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Data)
        .SendPart(StartPosition, Bytes) // <---
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SendPart");

EndProcedure

Procedure HTTPClient_MaxAttempts(FunctionParameters)

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .MaxAttempts(10)
        .ReturnSettings();

    // END

    Process(Result, "HTTPClient", "MaxAttempts");

EndProcedure

Procedure HTTPClient_MaxRedirects(FunctionParameters)

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .MaxRedirects(15)
        .ReturnSettings();

    // END

    Process(Result, "HTTPClient", "MaxRedirects");

EndProcedure

Procedure HTTPClient_ReturnSettings(FunctionParameters)

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .ReturnSettings();

    // END

    Process(Result, "HTTPClient", "ReturnSettings");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .ReturnSettings("EncodeRequestBody");

    Process(Result, "HTTPClient", "ReturnSettings", "Single");

    SettingArray = New Array;
    SettingArray.Add("MaxAttempts");
    SettingArray.Add("MaxRedirects");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .MaxAttempts(5)
        .ReturnSettings(SettingArray);

    Process(Result, "HTTPClient", "ReturnSettings", "Array");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .ReturnSettings("AAA");

    Process(Result, "HTTPClient", "ReturnSettings", "Nonexistent");

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

    Result = OPI_OpenAI.GetResponse(URL, Token, Model, Messages);

    Process(Result, "OpenAI", "GetResponse"); // SKIP

    // Pictures

    Model       = "moondream2-20250414";
    File        = FunctionParameters["Picture"]; // URL, Path or Binary Data
    FileName    = StrTemplate("%1.png", String(New UUID()));
    Destination = "user_data";

    Messages = New Array;

    ImageUpload = OPI_OpenAI.UploadFile(URL, Token, FileName, File, Destination);

    Process(ImageUpload, "OpenAI", "GetResponse", "Image upload"); // SKIP

    ImageID = ImageUpload["id"];

    Description = OPI_OpenAI.GetImageMessageStructure("user", ImageID, "What is in this image?");

    Messages.Add(Description);

    Result = OPI_OpenAI.GetResponse(URL, Token, Model, Messages);

    OPI_OpenAI.DeleteFile(URL, Token, ImageID);

    // END

    Process(Result, "OpenAI", "GetResponse", "Image");

EndProcedure

Procedure OpenAI_GetEmbeddings(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Text  = "What is 1C:Enterprise?";
    Model = "arcee-ai_afm-4.5b";

    Result = OPI_OpenAI.GetEmbeddings(URL, Token, Model, Text);

    // END

    Process(Result, "OpenAI", "GetEmbeddings");

EndProcedure

Procedure OpenAI_CreateAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Instruction = "You are a personal math tutor. When asked a question, write and run Python code to answer the question.";
    Model       = "smolvlm-256m-instruct";
    Name        = "Math tutor";

    Result = OPI_OpenAI.CreateAssistant(URL, Token, Model, Name, Instruction);

    // END

    Process(Result, "OpenAI", "CreateAssistant", , FunctionParameters);

EndProcedure

Procedure OpenAI_DeleteAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    AssistantID = FunctionParameters["OpenAI_Assistant"];

    Result = OPI_OpenAI.DeleteAssistant(URL, Token, AssistantID);

    // END

    Process(Result, "OpenAI", "DeleteAssistant", , AssistantID);

EndProcedure

Procedure OpenAI_RetrieveAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    AssistantID = FunctionParameters["OpenAI_Assistant"];

    Result = OPI_OpenAI.RetrieveAssistant(URL, Token, AssistantID);

    // END

    Process(Result, "OpenAI", "RetrieveAssistant");

EndProcedure

Procedure OpenAI_GetAssistantsList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Count                = 2;
    AdditionalParameters = New Structure("after,order", "asst_2", "desc");

    Result = OPI_OpenAI.GetAssistantsList(URL, Token, Count, AdditionalParameters);

    // END

    Process(Result, "OpenAI", "GetAssistantsList");

EndProcedure

Procedure OpenAI_UploadFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    File = FunctionParameters["Picture"]; // URL, Path or Binary Data

    FileName    = StrTemplate("%1.png", String(New UUID()));
    Destination = "assistants";

    Result = OPI_OpenAI.UploadFile(URL, Token, FileName, File, Destination);

    // END

    OPI_TypeConversion.GetBinaryData(File);
    Process(Result, "OpenAI", "UploadFile", , FunctionParameters, FileName, File.Size() + 2);

EndProcedure

Procedure OpenAI_DeleteFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Result = OPI_OpenAI.DeleteFile(URL, Token, FileID);

    // END

    Process(Result, "OpenAI", "DeleteFile", , FileID);

EndProcedure

Procedure OpenAI_GetFileInformation(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Result = OPI_OpenAI.GetFileInformation(URL, Token, FileID);

    // END

    Process(Result, "OpenAI", "GetFileInformation");

EndProcedure

Procedure OpenAI_GetFilesList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Result = OPI_OpenAI.GetFilesList(URL, Token);

    // END

    Process(Result, "OpenAI", "GetFilesList");

EndProcedure

Procedure OpenAI_DownloadFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Result = OPI_OpenAI.DownloadFile(URL, Token, FileID);

    // END

    Process(Result, "OpenAI", "DownloadFile", , FunctionParameters);

EndProcedure

Procedure OpenAI_GetMessageStructure(FunctionParameters)

    Result = OPI_OpenAI.GetMessageStructure("user", "What is 1C:Enterprise?");

    // END

    Process(Result, "OpenAI", "GetMessageStructure");

EndProcedure

Procedure OpenAI_GetImageMessageStructure(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];
    Image = FunctionParameters["OpenAI_File"];

    Result = OPI_OpenAI.GetImageMessageStructure("user", Image, "What is in this image?");

    // END

    Process(Result, "OpenAI", "GetImageMessageStructure");

EndProcedure

Procedure OpenAI_GenerateSpeech(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Text  = "Attack ships on fire off the shoulder of Orion bright as magnesium";
    Model = "bark-cpp-small";

    AdditionalParameters = New Structure("response_format", "wav");

    Result = OPI_OpenAI.GenerateSpeech(URL, Token, Model, Text, , AdditionalParameters);

    // END

    Process(Result, "OpenAI", "GenerateSpeech", , FunctionParameters);

EndProcedure

Procedure OpenAI_CreateTranscription(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Audio = FunctionParameters["OpenAI_Speech"];
    Model = "whisper-1";

    Result = OPI_OpenAI.CreateTranscription(URL, Token, Model, Audio, "audio/wav");

    // END

    OPI_Tools.RemoveFileWithTry(Audio, "Failed to delete the temporary file after the test!!");

    Process(Result, "OpenAI", "CreateTranscription");

EndProcedure

Procedure OpenAI_GetImages(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Model       = "sd-1.5-ggml";
    Description = OPI_OpenAI.GetImageDescriptionStructure("Yellow alpaca", 1, , "64x64");
    Result      = OPI_OpenAI.GetImages(URL, Token, Model, Description);

    // END

    Process(Result, "OpenAI", "GetImages");

EndProcedure

Procedure OpenAI_GetModelList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Result = OPI_OpenAI.GetModelList(URL, Token);

    // END

    Process(Result, "OpenAI", "GetModelList");

EndProcedure

Procedure OpenAI_GetAssistantMessage(FunctionParameters)

    Result = OPI_OpenAI.GetAssistantMessage("What is 1C:Enterprise?");

    // END

    Check  = OPI_OpenAI.GetMessageStructure("assistant", "What is 1C:Enterprise?");
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    Process(Result, "OpenAI", "GetAssistantMessage", , Check);

EndProcedure

Procedure OpenAI_GetUserMessage(FunctionParameters)

    Result = OPI_OpenAI.GetUserMessage("What is 1C:Enterprise?", "Vitaly");

    // END

    Check  = OPI_OpenAI.GetMessageStructure("user", "What is 1C:Enterprise?", "Vitaly");
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    Process(Result, "OpenAI", "GetUserMessage", , Check);

EndProcedure

Procedure OpenAI_GetSystemMessage(FunctionParameters)

    Result = OPI_OpenAI.GetSystemMessage("What is 1C:Enterprise?");

    // END

    Check  = OPI_OpenAI.GetMessageStructure("system", "What is 1C:Enterprise?");
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

    Result = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);

    // END

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    Process(Result, "MSSQL", "GenerateConnectionString");

EndProcedure

Procedure MSSQL_CreateConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);
    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);

    Result = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "CreateConnection");

EndProcedure

Procedure MSSQL_CloseConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);
    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);

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

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);
    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);

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

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);
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

    Result = OPI_MSSQL.ExecuteSQLQuery(QueryText, , , Connection);

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

    Result = OPI_MSSQL.ExecuteSQLQuery(QueryText, ParameterArray, , Connection);

    Process(Result, "MSSQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT FirstName, LastName, BirthDate, IsEmployed, Salary, CreatedAt, Age, RowGuid, Data FROM test_table;";

    Result = OPI_MSSQL.ExecuteSQLQuery(QueryText, , , Connection);

    Process(Result, "MSSQL", "ExecuteSQLQuery", , Image); // SKIP

    QueryText = "create table test_data (id INT,first_name NVARCHAR(50),last_name NVARCHAR(50),email NVARCHAR(50),gender NVARCHAR(50),ip_address NVARCHAR(20));"; // SKIP
    Result    = OPI_MSSQL.ExecuteSQLQuery(QueryText, , , Connection); // SKIP
    Process(Result, "MSSQL", "ExecuteSQLQuery", "Test data"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL2"]; // Binary Data, URL or path to file

    Result = OPI_MSSQL.ExecuteSQLQuery(SQLFile, , , Connection);

    Process(Result, "MSSQL", "ExecuteSQLQuery", "File"); // SKIP

    Closing = OPI_MSSQL.CloseConnection(Connection);

    // END

    Process(Closing, "MSSQL", "ExecuteSQLQuery", "Request"); // SKIP

EndProcedure

Procedure MSSQL_GetTLSSettings(FunctionParameters)

    Result = OPI_MSSQL.GetTLSSettings(True);

    // END

    Process(Result, "MSSQL", "GetTLSSettings");

EndProcedure

Procedure MSSQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);

    Base = "testbase1";

    OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.CreateDatabase(Base, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "CreateDatabase");

    Base = "testbase2";
    OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "MSSQL", "CreateDatabase", "Openning");

    Result = OPI_MSSQL.CreateDatabase(Base, Connection);

    Process(Result, "MSSQL", "CreateDatabase", "Creation");

    Result = OPI_MSSQL.CreateDatabase(Base, Connection);

    Process(Result, "MSSQL", "CreateDatabase", "Existing");

    OPI_MSSQL.CloseConnection(Connection);

EndProcedure

Procedure MSSQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

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
    Result = OPI_MSSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "CreateTable");

    Table = "ABC DEF";

    Result = OPI_MSSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Result = OPI_MSSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "CreateTable", "Type error");

EndProcedure

Procedure MSSQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table        = "testtable";
    RecordsArray = New Array;

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    XML = "<?xml version=""1.0""?><root>
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
    Result = OPI_MSSQL.AddRecords(Table, RecordsArray, True, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "AddRecords");

EndProcedure

Procedure MSSQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, "test_data", Login, Password);

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

    Result = OPI_MSSQL.GetRecords(Table, Fields, Filters, Sort, Count, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "GetRecords", "Filters");

EndProcedure

Procedure MSSQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

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
    Result = OPI_MSSQL.UpdateRecords(Table, FieldsStructure, FilterStructure, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "UpdateRecords");

    Check = OPI_MSSQL.GetRecords(Table, "['ip_address']", Filters, , , ConnectionString, TLSSettings);

    Process(Check, "MSSQL", "UpdateRecords", "Check", Count, FieldsStructure);

EndProcedure

Procedure MSSQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

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

    Filters.Add(FilterStructure);

    Obtaining = OPI_MSSQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.DeleteRecords(Table, Filters, ConnectionString, TLSSettings);

    // END

    Process(Obtaining, "MSSQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    Process(Result, "MSSQL", "DeleteRecords");

    Result = OPI_MSSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "DeleteRecords", "Check", Residue);

EndProcedure

Procedure MSSQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.DeleteTable(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);
    Result           = OPI_MSSQL.DeleteTable(Table, ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "DeleteTable", "Test");

EndProcedure

Procedure MSSQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "MSSQL", "DeleteDatabase", "Openning");

    Result = OPI_MSSQL.DeleteDatabase(Base, Connection);

    Process(Result, "MSSQL", "DeleteDatabase", "Deletion");

    Result = OPI_MSSQL.DeleteDatabase(Base, Connection);

    Process(Result, "MSSQL", "DeleteDatabase", "Error");

    Closing = OPI_MSSQL.CloseConnection(Connection);

    Process(Closing, "MSSQL", "DeleteDatabase", "Closing");

    Result = OPI_MSSQL.DeleteDatabase(Base, Connection);

    Process(Result, "MSSQL", "DeleteDatabase", "Connection error");

EndProcedure

Procedure MSSQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.ClearTable(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "ClearTable");

    Result = OPI_MSSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "ClearTable", "Check");

EndProcedure

Procedure MSSQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "GetTableInformation");

    Table = "heyho";

    Result = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

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

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.AddTableColumn(Table, Name, DataType, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "AddTableColumn");

    Result = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "AddTableColumn", "Check");

EndProcedure

Procedure MSSQL_DeleteTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base  = "testbase1";
    Table = "testtable";
    Name  = "new_field";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.DeleteTableColumn(Table, Name, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "DeleteTableColumn");

    Result = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "DeleteTableColumn", "Check");

EndProcedure

Procedure MSSQL_EnsureTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base  = "testbase1";
    Table = "testtable";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "smallint");
    ColoumnsStruct.Insert("double_field"   , "real");
    ColoumnsStruct.Insert("bigint_field"   , "bigint");
    ColoumnsStruct.Insert("custom_field"   , "nvarchar");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "EnsureTable");

    Check = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    Process(Check, "MSSQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Result = OPI_MSSQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    Process(Result, "MSSQL", "EnsureTable", "New");

    Check = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    Process(Check, "MSSQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

Procedure MSSQL_GetRecordsFilterStrucutre(FunctionParameters)

    Result = OPI_MSSQL.GetRecordsFilterStrucutre();

    // END

    Process(Result, "MSSQL", "GetRecordsFilterStrucutre");

    Result = OPI_MSSQL.GetRecordsFilterStrucutre(True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.GetWelcomeMessage(Connection);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Result = OPI_FTP.GetConnectionConfiguration(FTPSettings, ProxySettings, TLSSettings);

    // END

    Process(Result, "FTP", "GetConnectionConfiguration", Postfix, FunctionParameters);

    Check = OPI_FTP.GetWelcomeMessage(Result);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    Result = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

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

    Result = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    // END

    Process(Result, "FTP", "GetProxySettings", Postfix);

EndProcedure

Procedure FTP_GetTLSSettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Result = OPI_FTP.GetTLSSettings(True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Deletion = OPI_FTP.DeleteDirectory(Connection, "new_dir"); // SKIP
        Process(Deletion, "FTP", "CreateNewDirectory", "Deletion, " + Postfix); // SKIP

        Result = OPI_FTP.CreateNewDirectory(Connection, "new_dir");

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "CreateNewDirectory", Postfix, True);

    Result = OPI_FTP.CreateNewDirectory(Connection, "new_dir/another_one");

    Process(Result, "FTP", "CreateNewDirectory", "Nested, " + Postfix);

    Result = OPI_FTP.CreateNewDirectory(Connection, "second_dir/another_one");

    Process(Result, "FTP", "CreateNewDirectory", "Double, " + Postfix);

    OPI_Tools.Pause(5);

    Check = OPI_FTP.ListObjects(Connection, "new_dir", True);

    Process(Check, "FTP", "CreateNewDirectory", "Check 1, " + Postfix);

    Check = OPI_FTP.ListObjects(Connection, "", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.ListObjects(Connection, "", True);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "ListObjects", Postfix);

    Result = OPI_FTP.ListObjects(Connection, "Dir1/Dir3/Git-2.50.0-64-bit.exe", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password, , 1000, 1000);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Result  = OPI_FTP.UploadFile(Connection, Image, "new_dir/pic_from_disk.png");
        Result2 = OPI_FTP.UploadFile(Connection, ImageDD, "pic_from_binary.png");

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "UploadFile", Postfix             , ImageDD.Size());
    Process(Result2, "FTP", "UploadFile", "Binary, " + Postfix, ImageDD.Size());

    Result  = OPI_FTP.GetObjectSize(Connection, "new_dir/pic_from_disk.png");
    Result2 = OPI_FTP.GetObjectSize(Connection, "pic_from_binary.png");

    Process(Result , "FTP", "UploadFile", "Size 1, " + Postfix, ImageDD.Size());
    Process(Result2, "FTP", "UploadFile", "Size 2, " + Postfix, ImageDD.Size());

    For N = 1 To 5 Do

        Result  = OPI_FTP.UploadFile(Connection, Image, "new_dir/pic_from_disk.png");
        Result2 = OPI_FTP.UploadFile(Connection, ImageDD, "pic_from_binary.png");

        If Not Result["result"] Then
            Process(Result, "FTP", "UploadFile", "Multiple, " + Postfix, ImageDD.Size());
        EndIf;

        If Not Result2["result"] Then
            Process(Result2, "FTP", "UploadFile", "Multiple, binary, " + Postfix, ImageDD.Size());
        EndIf;

    EndDo;

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.DeleteFile(Connection, "pic_from_binary.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "DeleteFile", Postfix);

    Result = OPI_FTP.DeleteFile(Connection, "pic_from_binary.png");

    Process(Result , "FTP", "DeleteFile", "Nonexistent, " + Postfix);

    Result = OPI_FTP.ListObjects(Connection, "", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.DeleteDirectory(Connection, "new_dir/another_one");
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.ClearDirectory(Connection, ".");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "ClearDirectory", Postfix);

    Result = OPI_FTP.ListObjects(Connection, ".", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.GetObjectSize(Connection, "new_dir/pic_from_disk.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "GetObjectSize", Postfix);

    Result = OPI_FTP.GetObjectSize(Connection, "new_dir/another.bin");

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.UpdatePath(Connection, "new_dir/pic_from_disk.png", "new_dir/pic_copy.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "UpdatePath", Postfix);

    Result = OPI_FTP.GetObjectSize(Connection, "new_dir/pic_copy.png");

    Process(Result , "FTP", "UpdatePath", "Check, new, " + Postfix);

    Result = OPI_FTP.GetObjectSize(Connection, "new_dir/pic_from_binary.png");

    Process(Result , "FTP", "UpdatePath", "Check, old, " + Postfix);

    Result = OPI_FTP.UpdatePath(Connection, "new_dir", "brand_new_dir");

    Process(Result , "FTP", "UpdatePath", "Directory, " + Postfix);

    Result = OPI_FTP.ListObjects(Connection, ".", True);

    Process(Result , "FTP", "UpdatePath", "List, " + Postfix);

    Result = OPI_FTP.UpdatePath(Connection, "brand_new_dir", "new_dir");

    Process(Result , "FTP", "UpdatePath", "Directory, back, " + Postfix);

    Result = OPI_FTP.UpdatePath(Connection, "new_dir/pic_copy.png", "new_dir/pic_from_disk.png");

    Process(Result , "FTP", "UpdatePath", "Back, " + Postfix);

    Result = OPI_FTP.ListObjects(Connection, ".", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Path     = "new_dir/pic_from_disk.png";
        FileName = GetTempFileName("bin");

        Result = OPI_FTP.SaveFile(Connection, Path, FileName);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "SaveFile", Postfix);

    Size = OPI_FTP.GetObjectSize(Connection, Path);

    Process(Size, "FTP", "SaveFile", "Size, " + Postfix);

    FileObject = New File(FileName);

    FileSize   = FileObject.Size();
    ResultSize = Result["bytes"];
    CheckSize  = Size["bytes"];

    Process(FileSize, "FTP", "SaveFile", "File size, " + Postfix, ResultSize, CheckSize);

    Path = "new_dir/pic_from_disk.png";

    For N = 1 To 5 Do

        Result = OPI_FTP.SaveFile(Connection, Path, FileName);

        If Not Result["result"] Then
            Process(Result, "FTP", "SaveFile", "Multiple, " + Postfix);
        EndIf;

    EndDo;

    OPI_Tools.RemoveFileWithTry(FileName, "Failed to delete the temporary file after the test!!");

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Path   = "new_dir/pic_from_disk.png";
        Result = OPI_FTP.GetFileData(Connection, Path);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "GetFileData", Postfix);

    Size = OPI_FTP.GetObjectSize(Connection, Path);

    Process(Size, "FTP", "GetFileData", "Size, " + Postfix);

    FileSize  = Result.Size();
    CheckSize = Size["bytes"];

    Process(FileSize, "FTP", "GetFileData", "File size, " + Postfix, CheckSize);

    Path = "new_dir/pic_from_disk.png";

    For N = 1 To 5 Do

        Result = OPI_FTP.GetFileData(Connection, Path);

        If Not TypeOf(Result) = Type("BinaryData") Then
            Process(Result, "FTP", "GetFileData", "Multiple, " + Postfix);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.Ping(Connection);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        CommandText = "UMASK";
        Result      = OPI_FTP.ExecuteCustomCommand(Connection, CommandText);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        CommandText = "PWD";
        Result      = OPI_FTP.ExecuteArbitraryCommand(Connection, CommandText);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.GetCurrentDirectory(Connection);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    Result = OPI_FTP.GetCurrentDirectory(Connection);

    Process(Result, "FTP", "ChangeCurrentDirectory", "Check, " + Postfix, Path);

    Path   = FunctionParameters["FTP_RootPath"];
    Result = OPI_FTP.ChangeCurrentDirectory(Connection, Path);

    Process(Result, "FTP", "ChangeCurrentDirectory", "Back, " + Postfix);

    Result = OPI_FTP.GetCurrentDirectory(Connection);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.GetProtocolFeatureList(Connection);
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

    Result = OPI_ReportPortal.GetTemporaryToken(URL, Login, Password);

    // END

    Process(Result, "ReportPortal", "GetTemporaryToken", , FunctionParameters);

EndProcedure

Procedure ReportPortal_GetPermanentToken(FunctionParameters)

    URL     = FunctionParameters["RPortal_URL"];
    Token   = FunctionParameters["RPortal_TempToken"];
    UserID  = FunctionParameters["RPortal_UserID"];
    KeyName = "test_key";

    Result = OPI_ReportPortal.GetPermanentToken(URL, Token, UserID, KeyName);

    // END

    Process(Result, "ReportPortal", "GetPermanentToken", , FunctionParameters);

EndProcedure

Procedure ReportPortal_DeletePermanentToken(FunctionParameters)

    URL    = FunctionParameters["RPortal_URL"];
    Token  = FunctionParameters["RPortal_TestApiKey"];
    UserID = FunctionParameters["RPortal_UserID"];
    KeyID  = FunctionParameters["RPortal_TestKeyID"];

    Result = OPI_ReportPortal.DeletePermanentToken(URL, Token, UserID, KeyID);

    // END

    Process(Result, "ReportPortal", "DeletePermanentToken");

EndProcedure

#EndRegion

#Region SSH

Procedure SSH_CreateConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SSHSettings = OPI_SSH.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SSH.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Result = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);

    // END

    Process(Result, "SSH", "CreateConnection", Postfix);

EndProcedure

Procedure SSH_ExecuteCommand(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SSHSettings = OPI_SSH.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SSH.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);

    If OPI_SSH.IsConnector(Connection) Then
        Result = OPI_SSH.ExecuteCommand(Connection, "whoami");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SSH", "ExecuteCommand", Postfix);

EndProcedure

Procedure SSH_GetConnectionConfiguration(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SSHSettings = OPI_SSH.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SSH.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Result = OPI_SSH.GetConnectionConfiguration(SSHSettings, ProxySettings);

    // END

    Process(Result, "SSH", "GetConnectionConfiguration", Postfix);

    Result = OPI_SSH.ExecuteCommand(Result, "whoami");

    Process(Result, "SSH", "GetConnectionConfiguration", "Check, " + Postfix);

EndProcedure

Procedure SSH_CloseConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SSHSettings = OPI_SSH.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SSH.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);

    If OPI_SSH.IsConnector(Connection) Then
        Result = OPI_SSH.CloseConnection(Connection);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SSH", "CloseConnection", Postfix);

EndProcedure

Procedure SSH_IsConnector(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SSHSettings = OPI_SSH.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SSH.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);
    Result     = OPI_SSH.IsConnector(Connection);

    // END

    Process(Result, "SSH", "IsConnector", Postfix);

    Result = OPI_SSH.IsConnector("a");

    Process(Result, "SSH", "IsConnector", "Error, " + Postfix);

EndProcedure

Procedure SSH_GetSettingsLoginPassword(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["SSH_Host"];
    Port     = FunctionParameters["SSH_Port"];
    Login    = FunctionParameters["SSH_User"];
    Password = FunctionParameters["SSH_Password"];

    Result = OPI_SSH.GetSettingsLoginPassword(Host, Port, Login, Password);

    // END

    Process(Result, "SSH", "GetSettingsLoginPassword", Postfix);

EndProcedure

Procedure SSH_GetSettingsPrivateKey(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host       = FunctionParameters["SSH_Host"];
    Port       = FunctionParameters["SSH_Port"];
    Login      = FunctionParameters["SSH_User"];
    PrivateKey = "./ssh_key";
    PublicKey  = "./ssh_key.pub";

    PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
    PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

    Result = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    // END

    Process(Result, "SSH", "GetSettingsPrivateKey", Postfix);

EndProcedure

Procedure SSH_GetSettingsViaAgent(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host   = FunctionParameters["SSH_Host"];
    Port   = FunctionParameters["SSH_Port"];
    Login  = FunctionParameters["SSH_User"];
    Result = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    // END

    Process(Result, "SSH", "GetSettingsViaAgent", Postfix);

EndProcedure

Procedure SSH_GetProxySettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Proxy_IP"];
    ProxyPort     = FunctionParameters["Proxy_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    Result = OPI_SSH.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    // END

    Process(Result, "SSH", "GetProxySettings", Postfix);

EndProcedure

#EndRegion

#Region SFTP

Procedure SFTP_CreateConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Result = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    // END

    Process(Result, "SFTP", "CreateConnection", Postfix);

EndProcedure

Procedure SFTP_CreateNewDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.CreateNewDirectory(Connection, "new_dir");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SFTP", "CreateNewDirectory", Postfix);

EndProcedure

Procedure SFTP_DeleteDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.DeleteDirectory(Connection, "new_dir");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SFTP", "DeleteDirectory", Postfix);

EndProcedure

Procedure SFTP_GetCurrentDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.GetCurrentDirectory(Connection);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SFTP", "GetCurrentDirectory", Postfix);

EndProcedure

Procedure SFTP_ListObjects(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.ListObjects(Connection, "test_folder", True);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SFTP", "ListObjects", Postfix);

    Result = OPI_SFTP.ListObjects(Connection, "test_folder");

    Process(Result, "SFTP", "ListObjects", Postfix + ", No recursion");

EndProcedure

Procedure SFTP_UploadFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    ImagePath = "C:\pic.png";

    Image = FunctionParameters["Picture"]; // SKIP
    TFN   = GetTempFileName("png"); // SKIP
    CopyFile(Image, TFN); // SKIP
    Image = TFN; // SKIP

    ImageDD = New BinaryData(Image);

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Result  = OPI_SFTP.UploadFile(Connection, Image, "pic_from_disk.png");
        Result2 = OPI_SFTP.UploadFile(Connection, ImageDD, "files_folder/pic_from_binary.png");

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    UploadedFile = New File(Image);

    Process(Result , "SFTP", "UploadFile", Postfix             , UploadedFile.Size());
    Process(Result2, "SFTP", "UploadFile", "Binary, " + Postfix, ImageDD.Size());

    FileSizeLocal   = UploadedFile.Size();
    FileSizeLocalBD = ImageDD.Size();

    FileSizeRemote   = OPI_SFTP.GetFileInformation(Connection, "pic_from_disk.png")["data"]["size"];
    FileSizeRemoteBD = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_binary.png")["data"]["size"];

    Process(FileSizeLocal  , "SFTP", "SaveFile", "File size, " + Postfix    , FileSizeRemote);
    Process(FileSizeLocalBD, "SFTP", "SaveFile", "File size, BD, " + Postfix, FileSizeRemoteBD);

    For N = 1 To 7 Do

        Result  = OPI_SFTP.UploadFile(Connection, Image, "pic_from_disk.png");
        Result2 = OPI_SFTP.UploadFile(Connection, ImageDD, "files_folder/pic_from_binary.png");

        If Not Result["result"] Then
            Process(Result, "SFTP", "UploadFile", "Multiple, " + Postfix, ImageDD.Size());
        EndIf;

        If Not Result2["result"] Then
            Process(Result2, "SFTP", "UploadFile", "Multiple, binary, " + Postfix, ImageDD.Size());
        EndIf;

    EndDo;

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure SFTP_DeleteFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.DeleteFile(Connection, "files_folder/pic_from_binary.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "SFTP", "DeleteFile", Postfix);

    Result = OPI_SFTP.DeleteFile(Connection, "files_folder/pic_from_binary.png");

    Process(Result , "SFTP", "DeleteFile", "Nonexistent, " + Postfix);

    Result = OPI_SFTP.ListObjects(Connection, "files_folder", True);

    Process(Result , "SFTP", "DeleteFile", "Check, " + Postfix);

EndProcedure

Procedure SFTP_IsConnector(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);
    Result     = OPI_SFTP.IsConnector(Connection);

    // END

    Process(Result, "SFTP", "IsConnector", Postfix);

    Result = OPI_SFTP.IsConnector("a");

    Process(Result, "SFTP", "IsConnector", "Error, " + Postfix);

EndProcedure

Procedure SFTP_GetSettingsLoginPassword(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["SSH_Host"];
    Port     = FunctionParameters["SSH_Port"];
    Login    = FunctionParameters["SSH_User"];
    Password = FunctionParameters["SSH_Password"];

    Result = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    // END

    Process(Result, "SFTP", "GetSettingsLoginPassword", Postfix);

EndProcedure

Procedure SFTP_GetSettingsPrivateKey(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host       = FunctionParameters["SSH_Host"];
    Port       = FunctionParameters["SSH_Port"];
    Login      = FunctionParameters["SSH_User"];
    PrivateKey = "./ssh_key";
    PublicKey  = "./ssh_key.pub";

    PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
    PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

    Result = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    // END

    Process(Result, "SFTP", "GetSettingsPrivateKey", Postfix);

EndProcedure

Procedure SFTP_GetSettingsViaAgent(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host   = FunctionParameters["SSH_Host"];
    Port   = FunctionParameters["SSH_Port"];
    Login  = FunctionParameters["SSH_User"];
    Result = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    // END

    Process(Result, "SFTP", "GetSettingsViaAgent", Postfix);

EndProcedure

Procedure SFTP_GetProxySettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Proxy_IP"];
    ProxyPort     = FunctionParameters["Proxy_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    Result = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    // END

    Process(Result, "SFTP", "GetProxySettings", Postfix);

EndProcedure

Procedure SFTP_GetConnectionConfiguration(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Result = OPI_SFTP.GetConnectionConfiguration(SFTPSettings, ProxySettings);

    // END

    Process(Result, "SFTP", "GetConnectionConfiguration", Postfix);

    Result = OPI_SSH.ExecuteCommand(Result, "whoami");

    Process(Result, "SFTP", "GetConnectionConfiguration", "Check, " + Postfix);

EndProcedure

Procedure SFTP_CloseConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.CloseConnection(Connection);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SFTP", "CloseConnection", Postfix);

EndProcedure

Procedure SFTP_SaveFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Path     = "pic_from_disk.png";
        FileName = GetTempFileName("bin");

        Result = OPI_SFTP.SaveFile(Connection, Path, FileName);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SFTP", "SaveFile", Postfix);

    UploadedFile   = New File(FileName);
    FileSizeLocal  = UploadedFile.Size();
    FileSizeRemote = OPI_SFTP.GetFileInformation(Connection, Path)["data"]["size"];

    Process(FileSizeLocal, "SFTP", "SaveFile", "File size, " + Postfix, FileSizeRemote);

    Path = "files_folder/pic_from_binary.png";

    For N = 1 To 20 Do

        Result = OPI_SFTP.SaveFile(Connection, Path, FileName);

        If Not Result["result"] Then
            Process(Result, "SFTP", "SaveFile", "Multiple, " + Postfix);
        EndIf;

    EndDo;

    OPI_Tools.RemoveFileWithTry(FileName, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure SFTP_GetFileData(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Path   = "pic_from_disk.png";
        Result = OPI_SFTP.GetFileData(Connection, Path);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "SFTP", "GetFileData", Postfix);

    FileSizeLocal  = Result.Size();
    FileSizeRemote = OPI_SFTP.GetFileInformation(Connection, Path)["data"]["size"];

    Process(FileSizeLocal, "SFTP", "GetFileData", "File size, " + Postfix, FileSizeRemote);

    Path = "files_folder/pic_from_binary.png";

    For N = 1 To 20 Do

        Result = OPI_SFTP.GetFileData(Connection, Path);

        If Not TypeOf(Result) = Type("BinaryData") Then
            Process(Result, "SFTP", "GetFileData", "Multiple, " + Postfix);
        EndIf;

    EndDo;

EndProcedure

Procedure SFTP_UpdatePath(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.UpdatePath(Connection, "pic_from_disk.png", "files_folder/pic_from_disk.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "SFTP", "UpdatePath", Postfix);

    Result = OPI_SFTP.GetFileInformation(Connection, "pic_from_disk.png");

    Process(Result , "SFTP", "UpdatePath", "Check, Old, " + Postfix);

    Result = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_disk.png");

    Process(Result , "SFTP", "UpdatePath", "Check, New, " + Postfix);

    Result = OPI_SFTP.UpdatePath(Connection, "files_folder/pic_from_disk.png", "pic_from_disk.png");

    Process(Result , "SFTP", "UpdatePath", "Back, " + Postfix);

    Result = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_disk.png");

    Process(Result , "SFTP", "UpdatePath", "Check, Old, Back, " + Postfix);

    Result = OPI_SFTP.GetFileInformation(Connection, "pic_from_disk.png");

    Process(Result , "SFTP", "UpdatePath", "Check, New, Back, " + Postfix);

EndProcedure

Procedure SFTP_GetFileInformation(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_binary.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "SFTP", "GetFileInformation", Postfix);

EndProcedure

#EndRegion

#Region GreenMax

Procedure GreenMax_FormAccessParameters(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Result = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    // END

    Process(Result, "GreenMax", "FormAccessParameters");

EndProcedure

Procedure GreenMax_GetAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    PhoneNumber = 441234567890;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetAuthorizationCode(AccessParameters, PhoneNumber);

    // END

    Process(Result, "GreenMax", "GetAuthorizationCode");

EndProcedure

Procedure GreenMax_LogoutInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.LogoutInstance(AccessParameters);

    // END

    Process(Result, "GreenMax", "LogoutInstance");

EndProcedure

Procedure GreenMax_SendAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AuthCode = 123456;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SendAuthorizationCode(AccessParameters, AuthCode);

    // END

    Process(Result, "GreenMax", "SendAuthorizationCode");

EndProcedure

Procedure GreenMax_GetInstanceStatus(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetInstanceStatus(AccessParameters);

    // END

    Process(Result, "GreenMax", "GetInstanceStatus");

EndProcedure

Procedure GreenMax_RebootInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.RebootInstance(AccessParameters);

    // END

    Process(Result, "GreenMax", "RebootInstance");

EndProcedure

Procedure GreenMax_GetInstanceSettingsStructure(FunctionParameters)

    Result = OPI_GreenMax.GetInstanceSettingsStructure();

    // END

    Process(Result, "GreenMax", "GetInstanceSettingsStructure");

    Result = OPI_GreenMax.GetInstanceSettingsStructure(True);

    Process(Result, "GreenMAx", "GetInstanceSettingsStructure", "Clear");

EndProcedure

Procedure GreenMax_GetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetInstanceSettings(AccessParameters);

    // END

    Process(Result, "GreenMax", "GetInstanceSettings", , FunctionParameters);

EndProcedure

Procedure GreenMax_SetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    SettingsStructure = New Structure;
    SettingsStructure.Insert("markIncomingMessagesReaded" , "no");
    SettingsStructure.Insert("outgoingWebhook"            , "no");
    SettingsStructure.Insert("outgoingAPIMessageWebhook"  , "yes");

    Result = OPI_GreenMax.SetInstanceSettings(SettingsStructure, AccessParameters);

    // END

    Process(Result, "GreenMax", "SetInstanceSettings");

EndProcedure

Procedure GreenMax_SetProfilePicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SetProfilePicture(AccessParameters, Image);

    // END

    Process(Result, "GreenMax", "SetProfilePicture");

EndProcedure

Procedure GreenMax_GetAccountInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetAccountInformation(AccessParameters);

    // END

    Process(Result, "GreenMax", "GetAccountInformation");

EndProcedure

Procedure GreenMax_CheckAccount(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    PhoneNumber = 441234567890;
    PhoneNumber = FunctionParameters["GreenMax_Phone"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.CheckAccount(AccessParameters, PhoneNumber);

    // END

    Process(Result, "GreenMax", "CheckAccount", , FunctionParameters);

EndProcedure

Procedure GreenMax_GetContactList(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Count = 1;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetContactList(AccessParameters, Count);

    // END

    Process(Result, "GreenMax", "GetContactList", , FunctionParameters);

EndProcedure

Procedure GreenMax_GetContactInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ContactID = 87654321;
    ContactID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetContactInformation(AccessParameters, ContactID);

    // END

    Process(Result, "GreenMax", "GetContactInformation");

EndProcedure

Procedure GreenMax_GetChatList(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetChatList(AccessParameters);

    // END

    Process(Result, "GreenMax", "GetChatList");

EndProcedure

Procedure GreenMax_GetChatAvatar(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 87654321;
    ChatID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetChatAvatar(AccessParameters, ChatID);

    // END

    Process(Result, "GreenMax", "GetChatAvatar");

EndProcedure

Procedure GreenMax_CreateGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    UserID = 87654321;
    Name   = "New group";

    UserID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.CreateGroup(AccessParameters, Name, UserID);

    // END

    Process(Result, "GreenMax", "CreateGroup", , FunctionParameters);

EndProcedure

Procedure GreenMax_AddGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID   = 12345678;
    MemberID = 87654321;

    ChatID   = FunctionParameters["GreenMax_GroupID"]; // SKIP
    MemberID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.AddGroupMember(AccessParameters, ChatID, MemberID);

    // END

    Process(Result, "GreenMax", "AddGroupMember");

    GreenMax_RemoveGroupMember(FunctionParameters);

EndProcedure

Procedure GreenMax_RemoveGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID   = 12345678;
    MemberID = 87654321;

    ChatID   = FunctionParameters["GreenMax_GroupID"]; // SKIP
    MemberID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.RemoveGroupMember(AccessParameters, ChatID, MemberID);

    // END

    Process(Result, "GreenMax", "RemoveGroupMember");

EndProcedure

Procedure GreenMax_LeaveGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;
    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.LeaveGroup(AccessParameters, ChatID);

    // END

    Process(Result, "GreenMax", "LeaveGroup");

EndProcedure

Procedure GreenMax_UpdateGroupName(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Name   = "New group name";
    ChatID = 12345678;
    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.UpdateGroupName(AccessParameters, ChatID, Name);

    // END

    Process(Result, "GreenMax", "UpdateGroupName");

EndProcedure

Procedure GreenMax_GetGroupInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;
    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetGroupInformation(AccessParameters, ChatID);

    // END

    Process(Result, "GreenMax", "GetGroupInformation");

EndProcedure

Procedure GreenMax_ChangeGroupSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;
    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Settings = New Structure;
    Settings.Insert("allowParticipantsEditGroupSettings" , True);
    Settings.Insert("allowParticipantsPinMessages"       , False);
    Settings.Insert("allowParticipantsAddMembers"        , False);

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.ChangeGroupSettings(AccessParameters, ChatID, Settings);

    // END

    Process(Result, "GreenMax", "ChangeGroupSettings");

EndProcedure

Procedure GreenMax_GetGroupSettingsStructure(FunctionParameters)

    Result = OPI_GreenMax.GetGroupSettingsStructure();

    // END

    Process(Result, "GreenMax", "GetGroupSettingsStructure");

    Result = OPI_GreenMax.GetGroupSettingsStructure(True);

    Process(Result, "GreenMax", "GetGroupSettingsStructure", "Clear");

EndProcedure

Procedure GreenMax_SetAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID   = 12345678;
    MemberID = 87654321;

    ChatID   = FunctionParameters["GreenMax_MainGroupID"]; // SKIP
    MemberID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SetAdminRights(AccessParameters, ChatID, MemberID);

    // END

    Process(Result, "GreenMax", "SetAdminRights");

EndProcedure

Procedure GreenMax_RevokeAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID   = 12345678;
    MemberID = 87654321;

    ChatID   = FunctionParameters["GreenMax_MainGroupID"]; // SKIP
    MemberID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.RevokeAdminRights(AccessParameters, ChatID, MemberID);

    // END

    Process(Result, "GreenMax", "RevokeAdminRights");

EndProcedure

Procedure GreenMax_SetGroupPicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Image  = FunctionParameters["Picture3"]; // URL, Path or Binary Data
    ChatID = 12345678;

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SetGroupPicture(AccessParameters, ChatID, Image);

    // END

    Process(Result, "GreenMax", "SetGroupPicture");

EndProcedure

Procedure GreenMax_SendTextMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Text   = "Message text";
    ChatID = 12345678;
    Set    = 2000;

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SendTextMessage(AccessParameters, ChatID, Text, Set);

    // END

    Process(Result, "GreenMax", "SendTextMessage", , FunctionParameters);

EndProcedure

Procedure GreenMax_SendFile(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    File        = FunctionParameters["Picture"]; // URL, Path or Binary Data
    FileName    = "photo.jpg";
    ChatID      = 12345678;
    Description = "File description";

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SendFile(AccessParameters, ChatID, File, FileName, Description);

    // END

    Process(Result, "GreenMax", "SendFile", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Result    = OPI_GreenMax.SendFile(AccessParameters, ChatID, File, FileName, Description, 1000, "video");

    Process(Result, "GreenMax", "SendFile", "Video");

EndProcedure

Procedure GreenMax_SendFileByURL(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    File        = FunctionParameters["Picture"];
    FileName    = "photo.jpg";
    ChatID      = 12345678;
    Description = "File description";

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SendFileByURL(AccessParameters, ChatID, File, FileName);

    // END

    Process(Result, "GreenMax", "SendFileByURL");

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Result    = OPI_GreenMax.SendFileByURL(AccessParameters, ChatID, File, FileName, Description, 1000);

    Process(Result, "GreenMax", "SendFileByURL", "Typing");

EndProcedure

Procedure GreenMax_GetNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetNotification(AccessParameters);

    // END

    Process(Result, "GreenMax", "GetNotification", , FunctionParameters);

EndProcedure

Procedure GreenMax_DeleteNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    NotificationID = FunctionParameters["GreenMax_ReceiptID"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.DeleteNotification(AccessParameters, NotificationID);

    // END

    Process(Result, "GreenMax", "DeleteNotification", , FunctionParameters);

EndProcedure

Procedure GreenMax_MarkMessagesAsRead(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;

    ChatID = FunctionParameters["GreenMax_MainGroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.MarkMessagesAsRead(AccessParameters, ChatID);

    // END

    Process(Result, "GreenMax", "MarkMessagesAsRead");

EndProcedure

Procedure GreenMax_GetChatMessageHistory(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;
    Count  = 3;

    ChatID = FunctionParameters["GreenMax_MainGroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetChatMessageHistory(AccessParameters, ChatID, Count);

    // END

    Process(Result, "GreenMax", "GetChatMessageHistory", , FunctionParameters);

EndProcedure

Procedure GreenMax_GetChatMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID    = 12345678;
    MessageID = FunctionParameters["GreenMax_MainMessageID"];

    ChatID = FunctionParameters["GreenMax_MainGroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetChatMessage(AccessParameters, ChatID, MessageID);

    // END

    Process(Result, "GreenMax", "GetChatMessage", , MessageID);

EndProcedure

Procedure GreenMax_GetIncomingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Period = 30;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetIncomingMessageLog(AccessParameters, Period);

    // END

    Process(Result, "GreenMax", "GetIncomingMessageLog");

EndProcedure

Procedure GreenMax_GetOutgoingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Period = 30;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetOutgoingMessageLog(AccessParameters, Period);

    // END

    Process(Result, "GreenMax", "GetOutgoingMessageLog");

EndProcedure

Procedure GreenMax_GetOutgoingMessageCount(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetOutgoingMessageCount(AccessParameters);

    // END

    Process(Result, "GreenMax", "GetOutgoingMessageCount");

EndProcedure

Procedure GreenMax_GetOutgoingMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetOutgoingMessageQueue(AccessParameters);

    // END

    Process(Result, "GreenMax", "GetOutgoingMessageQueue");

EndProcedure

Procedure GreenMax_ClearOutgoingMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.ClearOutgoingMessageQueue(AccessParameters);

    // END

    Process(Result, "GreenMax", "ClearOutgoingMessageQueue");

EndProcedure

Procedure GreenMax_GetIncomingNotificationCount(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetIncomingNotificationCount(AccessParameters);

    // END

    Process(Result, "GreenMax", "GetIncomingNotificationCount");

EndProcedure

Procedure GreenMax_ClearIncomingNotificationQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.ClearIncomingNotificationQueue(AccessParameters);

    // END

    Process(Result, "GreenMax", "ClearIncomingNotificationQueue");

EndProcedure

#EndRegion

#Region MongoDB

Procedure MongoDB_GenerateConnectionString(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    ConnectionParams = New Structure("authSource", "admin");
    Result           = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);

    // END

    Process(Result, "MongoDB", "GenerateConnectionString", , FunctionParameters);

EndProcedure

Procedure MongoDB_CreateConnection(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);

    Result = OPI_MongoDB.CreateConnection(ConnectionString);

    // END

    Process(Result, "MongoDB", "CreateConnection");

    Result = OPI_MongoDB.CloseConnection(Result);

    Process(Result, "MongoDB", "CreateConnection", "Closing");

EndProcedure

Procedure MongoDB_CloseConnection(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);

    Connection = OPI_MongoDB.CreateConnection(ConnectionString);
    Result     = OPI_MongoDB.CloseConnection(Connection);

    // END

    Process(Result, "MongoDB", "CloseConnection");

EndProcedure

Procedure MongoDB_IsConnector(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);

    Connection = OPI_MongoDB.CreateConnection(ConnectionString);
    Result     = OPI_MongoDB.IsConnector(Connection);

    // END

    Process(Result, "MongoDB", "IsConnector");

EndProcedure

Procedure MongoDB_ExecuteCommand(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);

    Command = "listDatabases";
    Data    = New Structure("nameOnly", True);

    Connection = OPI_MongoDB.CreateConnection(ConnectionString);

    Process(Connection, "MongoDB", "ExecuteCommand", "Connection"); // SKIP

    Result = OPI_MongoDB.ExecuteCommand(Connection, Command, , , Data);

    // END

    Process(Result, "MongoDB", "ExecuteCommand");

EndProcedure

Procedure MongoDB_GetDatabase(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Base = "test_db";

    Result = OPI_MongoDB.GetDatabase(Connection, Base);

    // END

    Process(Result, "MongoDB", "GetDatabase");

EndProcedure

Procedure MongoDB_GetListOfBases(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Result = OPI_MongoDB.GetListOfBases(Connection);

    // END

    Process(Result, "MongoDB", "GetListOfBases");

EndProcedure

Procedure MongoDB_DeleteDatabase(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Result = OPI_MongoDB.DeleteDatabase(Connection, Base);

    // END

    Process(Result, "MongoDB", "DeleteDatabase");

EndProcedure

Procedure MongoDB_CreateCollection(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Name = "test_collection";
    Base = "test_database";

    Parameters = New Map;
    Expression = New Map;
    GroupAnd   = New Array;

    Condition1 = New Map; // Total >= 0
    Items1     = New Array;
    Items1.Add("$total");
    Items1.Add(0);
    Condition1.Insert("$gte", Items1);

    Condition2 = New Map; // Status <= 3
    Items2     = New Array;
    Items2.Add("$status");
    Items2.Add(3);
    Condition2.Insert("$lte", Items2);

    GroupAnd.Add(Condition1);
    GroupAnd.Add(Condition2);

    Expression.Insert("$expr", GroupAnd);
    Parameters.Insert("validator", Expression);

    Result = OPI_MongoDB.CreateCollection(Connection, Name, Base, Parameters);

    // END

    Process(Result, "MongoDB", "CreateCollection");

    Result = OPI_MongoDB.CreateCollection(Connection, Name, Base, Parameters);

    Process(Result, "MongoDB", "CreateCollection", "Existing");

EndProcedure

Procedure MongoDB_DeleteCollection(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "test_collection";
    Base       = "test_database";

    Result = OPI_MongoDB.DeleteCollection(Connection, Collection, Base);

    // END

    Process(Result, "MongoDB", "DeleteCollection");

EndProcedure

Procedure MongoDB_GetCollectionList(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Base = "test_database";

    Result = OPI_MongoDB.GetCollectionList(Connection, Base);

    // END

    Process(Result, "MongoDB", "GetCollectionList");

EndProcedure

Procedure MongoDB_InsertDocuments(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";
    DocsArray  = New Array;

    // With implicit type casting
    DocumentStructure = New Structure;

    TestArray = New Array;
    TestArray.Add("Value1");
    TestArray.Add("Value2");

    TestStructure = New Structure("text,number", "Text", 10);
    TestBinary    = GetBinaryDataFromString("Text");
    CurrentDate   = OPI_Tools.GetCurrentDate();

    DocumentStructure.Insert("stringField", "Text");
    DocumentStructure.Insert("intField"   , 200);
    DocumentStructure.Insert("doubleField", 123.456);
    DocumentStructure.Insert("boolField"  , True);
    DocumentStructure.Insert("arrayField" , TestArray);
    DocumentStructure.Insert("docField"   , TestStructure);
    DocumentStructure.Insert("dateField"  , CurrentDate);
    DocumentStructure.Insert("nullField");

    DocsArray.Add(DocumentStructure);

    // With explicit type casting
    DocumentStructure = New Structure;

    RegExp = New Structure("pattern,options", "[a-z]+@[a-z]+\.[a-z]+", "i");
    JSCode = "const result = [1, 2, 3].map(x => x * 2).filter(x => x > 3);";

    DocumentStructure.Insert("stringField", New Structure("__OPI_STRING__"   , "Text"));
    DocumentStructure.Insert("oidField"   , New Structure("__OPI_OBJECTID__" , "63ceed18f71dda7d8cf21e8e"));
    DocumentStructure.Insert("jsField"    , New Structure("__OPI_JS__"       , JSCode));
    DocumentStructure.Insert("symbolField", New Structure("__OPI_SYMBOL__"   , "Y"));
    DocumentStructure.Insert("int32Field" , New Structure("__OPI_INT32__"    , 10));
    DocumentStructure.Insert("int64Field" , New Structure("__OPI_INT64__"    , 1000));
    DocumentStructure.Insert("doubleField", New Structure("__OPI_DOUBLE__"   , 124.456));
    DocumentStructure.Insert("boolField"  , New Structure("__OPI_BOOLEAN__"  , True));
    DocumentStructure.Insert("dateField"  , New Structure("__OPI_DATETIME__" , "1763204141"));
    DocumentStructure.Insert("tsField"    , New Structure("__OPI_TIMESTAMP__", CurrentDate));
    DocumentStructure.Insert("regexpField", New Structure("__OPI_REGEXP__"   , RegExp));
    DocumentStructure.Insert("binaryField", New Structure("__OPI_BINARY__"   , TestBinary));
    DocumentStructure.Insert("nullField"  , New Structure("__OPI_NULL__"));
    DocumentStructure.Insert("minkeyField", New Structure("__OPI_MINKEY__"));
    DocumentStructure.Insert("maxkeyField", New Structure("__OPI_MAXKEY__"));

    TestArray = New Array;
    TestArray.Add(New Structure("__OPI_SYMBOL__", "A"));
    TestArray.Add(New Structure("__OPI_MINKEY__"));

    TestStructure = New Structure("code,number"
        , New Structure("__OPI_JS__", "const result = 1")
        , New Structure("__OPI_DOUBLE__", 10));

    // Documents and arrays are not wrapped in a structure
    DocumentStructure.Insert("docField" , TestStructure);
    DocumentStructure.Insert("arrayField" , TestArray);

    DocsArray.Add(DocumentStructure);

    OPI_MongoDB.DeleteCollection(Connection, Collection, Base); // SKIP

    Result = OPI_MongoDB.InsertDocuments(Connection, Collection, DocsArray, Base);

    // END

    Process(Result, "MongoDB", "InsertDocuments");

    DocsArray = New Array;

    CategoryMap = New Map;
    CategoryMap.Insert(1, "electronics");
    CategoryMap.Insert(2, "clothing");
    CategoryMap.Insert(3, "books");
    CategoryMap.Insert(4, "products");

    SupplierMap = New Map;
    SupplierMap.Insert(1, "Supplier A");
    SupplierMap.Insert(2, "Supplier B");
    SupplierMap.Insert(3, "Supplier C");

    For N = 1 To 15 Do

        DocumentStructure = New Structure;

        DocumentStructure.Insert("productName", "Product " + N);
        DocumentStructure.Insert("category"   , CategoryMap.Get(N % 4));
        DocumentStructure.Insert("price"      , 50 + (N * 30));
        DocumentStructure.Insert("quantity"   , 5 + (N % 10));
        DocumentStructure.Insert("rating"     , Max(1, N % 6));
        DocumentStructure.Insert("inStock"    , N % 3 > 0);
        DocumentStructure.Insert("tags"       , OPI_TestDataRetrieval.GetTagArray(N));
        DocumentStructure.Insert("createdDate", OPI_Tools.GetCurrentDate() - (N * 86400));

        Details = New Structure;
        Details.Insert("supplier"  , SupplierMap.Get(N % 3));
        Details.Insert("weightKg"  , N * 0.3);
        Details.Insert("dimensions", New Structure("length,width,height", N * 8, N * 4, N * 2));
        DocumentStructure.Insert("details", Details);

        DocsArray.Add(DocumentStructure);

    EndDo;

    DocumentWithZero = New Structure;
    DocumentWithZero.Insert("productName", "Item with zero price");
    DocumentWithZero.Insert("category"   , "books");
    DocumentWithZero.Insert("price"      , 0);
    DocumentWithZero.Insert("quantity"   , 1);
    DocumentWithZero.Insert("rating"     , 4);
    DocumentWithZero.Insert("inStock"    , True);
    DocumentWithZero.Insert("tags"       , New Array);
    DocsArray.Add(DocumentWithZero);

    DocumentWithoutCategory = New Structure;
    DocumentWithoutCategory.Insert("productName", "Item without category");
    DocumentWithoutCategory.Insert("price"      , 250);
    DocumentWithoutCategory.Insert("quantity"   , 3);
    DocumentWithoutCategory.Insert("rating"     , 3);
    DocumentWithoutCategory.Insert("inStock"    , False);
    DocsArray.Add(DocumentWithoutCategory);

    Result = OPI_MongoDB.InsertDocuments(Connection, Collection, DocsArray, Base);

    Process(Result, "MongoDB", "InsertDocuments");

EndProcedure

Procedure MongoDB_GetDocuments(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    // __4 = $
    Filter = New Structure("stringField,doubleField", "Text", New Structure("__4gte, __4lte", 100, 150));
    Sort = New Structure("doubleField", -1);
    Parameters = New Structure("limit", 2);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    // END

    Process(Result, "MongoDB", "GetDocuments");

    // 1: Category and price range
    Filter = New Structure("category,price", "electronics", New Structure("__4gte,__4lte", 100, 400));
    Sort = New Structure("price", 1);
    Parameters = New Structure("limit", 5);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    Process(Result, "MongoDB", "GetDocuments", 1);

    // 2: Stock and rating
    Filter = New Structure("inStock,rating", True, New Structure("__4gte", 4));
    Sort = New Structure("rating,price", -1, 1);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort);

    Process(Result, "MongoDB", "GetDocuments", 2);

    // 3: By tags array
    Filter = New Structure("tags", "sale");
    Sort = New Structure("createdDate", -1);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort);

    Process(Result, "MongoDB", "GetDocuments", 3);

    // 4: By nested fields
    Filter = New Map;
    Filter.Insert("details.supplier", "Supplier A");
    Filter.Insert("details.weightKg", New Structure("__4lt", 3));

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);

    Process(Result, "MongoDB", "GetDocuments", 4);

    // 5: Projection
    Filter = New Structure("category", "books");
    Sort = New Structure("price", -1);
    Parameters = New Structure("projection", New Structure("productName,price,rating", 1, 1, 1));

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    Process(Result, "MongoDB", "GetDocuments", 5);

EndProcedure

Procedure MongoDB_GetCursor(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    Filter     = New Structure("stringField", "Text");
    Sort       = New Structure("doubleField", -1);
    Parameters = New Structure("limit,batchSize", 2, 1);

    Result = OPI_MongoDB.GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    // END

    Process(Result, "MongoDB", "GetCursor");

    // Big batchSize with limit
    Filter = New Structure("inStock", True);
    Sort = New Structure("price", 1);
    Parameters = New Structure("limit,batchSize", 8, 3);

    Result = OPI_MongoDB.GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    Process(Result, "MongoDB", "GetCursor", 1);

    // Small batchSize without limit
    Filter = New Structure("category", "clothing");
    Sort = New Structure("rating", -1);
    Parameters = New Structure("batchSize", 2);

    Result = OPI_MongoDB.GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    Process(Result, "MongoDB", "GetCursor", 2);

EndProcedure

Procedure MongoDB_GetDocumentBatch(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    Filter     = New Structure("stringField", "Text");
    Sort       = New Structure("doubleField", -1);
    Parameters = New Structure("limit,batchSize", 2, 1);

    Cursor = OPI_MongoDB.GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    If Not Cursor["result"] Then
        Raise Cursor["error"];
    EndIf;

    Cursor          = Cursor["data"]["cursor"];
    DocsArray       = Cursor["firstBatch"];
    CursorID        = Cursor["id"];
    ContinueGetting = CursorID > 0;

    While ContinueGetting Do

        Result = OPI_MongoDB.GetDocumentBatch(Connection, Collection, CursorID, Base); // <---

        If Not Result["result"] Then
            Raise Result["error"];
        EndIf;

        ContinueGetting = Result["data"]["cursor"]["id"] > 0;

        For Each Record In Result["data"]["cursor"]["nextBatch"] Do
            DocsArray.Add(Record);
        EndDo;

    EndDo;

    // END

    Process(Result, "MongoDB", "GetDocumentBatch");

EndProcedure

Procedure MongoDB_UpdateDocuments(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    // __4 = $
    Filter = New Structure("stringField,doubleField", "Text", New Structure("__4gte, __4lte", 100, 150));
    Data = New Structure( "__4set", New Structure("doubleField", 999));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data); // Array or single
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);

    // END

    Process(Result, "MongoDB", "UpdateDocuments");

    Parameters = New Structure("limit,batchSize", 2, 1);
    Sort       = New Structure("doubleField", -1);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    Process(Result, "MongoDB", "UpdateDocuments", "Obtaining");

    Filter = New Structure("stringField,doubleField", "Text", 999);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    Process(Result, "MongoDB", "UpdateDocuments", "Getting new");

    // Multiply fields
    Filter = New Structure("category", "electronics");
    Data = New Structure("__4set", New Structure("price,inStock,rating", 777, False, 5));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, True);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    Process(Result, "MongoDB", "UpdateDocuments", 1);

    Filter      = New Structure("category", "electronics", "price", 777);
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 1");

    // Number inc
    Filter = New Structure("productName", "Product 1");
    Data = New Structure("__4inc", New Structure("quantity", 10));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    Process(Result, "MongoDB", "UpdateDocuments", 2);

    Filter      = New Structure("productName", "Product 1");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 2");

    // Array insertion
    Filter = New Structure("productName", "Product 2");
    Data = New Structure("__4push", New Structure("tags", "updated"));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    Process(Result, "MongoDB", "UpdateDocuments", 3);

    Filter      = New Structure("productName", "Product 2", "tags", "updated");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 3");

    // Nested field update
    SettingMapping = New Map;
    SettingMapping.Insert("details.weightKg", 2.5);
    SettingMapping.Insert("details.supplier", "Supplier A+");

    Filter = New Map;
    Filter.Insert("details.supplier", "Supplier A");

    Data = New Structure("__4set", SettingMapping);

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, True);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    Process(Result, "MongoDB", "UpdateDocuments", 4);

    Filter      = New Map;
    Filter.Insert("details.supplier", "Supplier A+");
    Filter.Insert("details.weightKg", 2.5);
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 4");

    // Upsert
    Filter = New Structure("productName", "New product");

    //@skip-check structure-consructor-too-many-keys
    Data = New Structure("__4set", New Structure("productName,category,price,quantity,inStock,createdDate"
        , "New product"
        , "electronics"
        , 1999
        , 1
        , True
        , OPI_Tools.GetCurrentDate()
    ));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, False, True);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    Process(Result, "MongoDB", "UpdateDocuments", 5);

    Filter      = New Structure("productName", "New product");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 5");

    // Field removing
    Filter = New Structure("productName", "Product 3");
    Data = New Structure("__4unset", New Structure("rating", ""));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    Process(Result, "MongoDB", "UpdateDocuments", 6);

    Filter      = New Structure("productName", "Product 3");
    Parameters  = New Structure("projection", New Structure("productName,rating", 1, 1));
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Undefined, Parameters);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 6");

    // Multiply operators
    Filter = New Structure("price", New Structure("__4lt", 200));
    Data = New Structure;
    Data.Insert("__4set", New Structure("inStock", False));
    Data.Insert("__4inc", New Structure("quantity", -5));
    Data.Insert("__4push", New Structure("tags", "discount"));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, True);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    Process(Result, "MongoDB", "UpdateDocuments", 7);

    Filter      = New Structure("price,tags", New Structure("__4lt", 200), "discount");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 7");

    // Updates array
    UpdateArray = New Array;

    Filter1 = New Structure("category", "electronics");
    Data1   = New Structure("__4set", New Structure("price,discounted", 888, True));
    Update1 = OPI_MongoDB.GetDocumentUpdateStructure(Filter1, Data1, True);
    UpdateArray.Add(Update1);

    Filter2 = New Structure("category", "clothing");
    Data2   = New Structure("__4inc", New Structure("quantity", 5));
    Update2 = OPI_MongoDB.GetDocumentUpdateStructure(Filter2, Data2, True);
    UpdateArray.Add(Update2);

    Filter3 = New Structure("category", "books");
    Data3   = New Structure("__4push", New Structure("tags", "mass_update"));
    Update3 = OPI_MongoDB.GetDocumentUpdateStructure(Filter3, Data3, True);
    UpdateArray.Add(Update3);

    Filter4 = New Structure("productName", "Special item from array");

    //@skip-check structure-consructor-too-many-keys
    Data4 = New Structure("__4set", New Structure("productName,category,price,quantity,inStock,createdDate"
        , "Special item from array"
        , "special"
        , 1111
        , 7
        , True
        , OPI_Tools.GetCurrentDate()
    ));

    Update4 = OPI_MongoDB.GetDocumentUpdateStructure(Filter4, Data4, False, True);
    UpdateArray.Add(Update4);

    Filter5 = New Structure("rating", New Structure("__4lte", 2));
    Data5   = New Structure;
    Data5.Insert("__4set", New Structure("needsImprovement", True));
    Data5.Insert("__4inc", New Structure("quantity"        , -2));
    Update5 = OPI_MongoDB.GetDocumentUpdateStructure(Filter5, Data5, True);
    UpdateArray.Add(Update5);

    Result = OPI_MongoDB.UpdateDocuments(Connection, Collection, UpdateArray, Base);

    Process(Result, "MongoDB", "UpdateDocuments", 9);

    Filter      = New Structure("category,price", "electronics", 888);
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 8_1");

    Filter      = New Structure("category,tags", "books", "mass_update");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 8_2");

    Filter      = New Structure("productName", "Special item from array");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 8_3");

    Filter      = New Structure("needsImprovement", True);
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 8_4");

EndProcedure

Procedure MongoDB_GetDocumentUpdateStructure(FunctionParameters)

    // __4 = $
    Filter = New Structure("stringField,doubleField", "Text", New Structure("__4gte, __4lte", 100, 150));
    Data = New Structure( "__4set", New Structure("doubleField", 999));

    Result = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, True, True);

    // END

    Process(Result, "MongoDB", "GetDocumentUpdateStructure");

EndProcedure

Procedure MongoDB_GetDocumentDeletionStructure(FunctionParameters)

    Filter = New Structure("stringField,doubleField", "Text", 999);
    Result = OPI_MongoDB.GetDocumentDeletionStructure(Filter, 1); // Array or single

    // END

    Process(Result, "MongoDB", "GetDocumentDeletionStructure");

EndProcedure

Procedure MongoDB_DeleteDocuments(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    Filter   = New Structure("stringField,doubleField", "Text", 999);
    Deletion = OPI_MongoDB.GetDocumentDeletionStructure(Filter, 1); // Array or single

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter); // SKIP
    Process(Result, "MongoDB", "DeleteDocuments", "Precheck"); // SKIP

    Result = OPI_MongoDB.DeleteDocuments(Connection, Collection, Deletion, Base);

    // END

    Process(Result, "MongoDB", "DeleteDocuments");

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);

    Process(Result, "MongoDB", "DeleteDocuments", "Check");

EndProcedure

Procedure MongoDB_CreateUser(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleArray = New Array;
    RoleArray.Add("read");
    RoleArray.Add("userAdmin");

    UserName     = "newuser";
    UserPassword = "1234";

    Result = OPI_MongoDB.CreateUser(Connection, UserName, RoleArray, Base, UserPassword);

    // END

    Process(Result, "MongoDB", "CreateUser");

    Result = OPI_MongoDB.CreateUser(Connection, UserName, RoleArray, Base, UserPassword);

    Process(Result, "MongoDB", "CreateUser", "Existing");

EndProcedure

Procedure MongoDB_UpdateUser(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleArray = New Array;
    RoleArray.Add("readWrite");

    UserName     = "newuser";
    UserPassword = "4321";

    Result = OPI_MongoDB.UpdateUser(Connection, UserName, RoleArray, Base, UserPassword);

    // END

    Process(Result, "MongoDB", "UpdateUser");

    UserName = "anotheruser";

    Result = OPI_MongoDB.UpdateUser(Connection, UserName, RoleArray, Base, UserPassword);

    Process(Result, "MongoDB", "UpdateUser", "Nonexistent");

EndProcedure

Procedure MongoDB_DeleteUser(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    UserName = "newuser";

    Result = OPI_MongoDB.DeleteUser(Connection, UserName, Base);

    // END

    Process(Result, "MongoDB", "DeleteUser");

    Result = OPI_MongoDB.DeleteUser(Connection, UserName, Base);

    Process(Result, "MongoDB", "DeleteUser", "Again");

EndProcedure

Procedure MongoDB_GetUsers(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    UserName = "newuser";

    Result = OPI_MongoDB.GetUsers(Connection, UserName, Base);

    Process(Result, "MongoDB", "GetUsers", "Simple"); // SKIP

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add(New Structure("user,db", "bayselonarrend", "admin"));
    ArrayOfUsers.Add(New Structure("user,db", "newuser"       , "main"));

    Result = OPI_MongoDB.GetUsers(Connection, ArrayOfUsers, Base, True, True);

    // END

    Process(Result, "MongoDB", "GetUsers");

EndProcedure

Procedure MongoDB_GetDatabaseUsers(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Result = OPI_MongoDB.GetDatabaseUsers(Connection, Base);

    // END

    Process(Result, "MongoDB", "GetDatabaseUsers");

EndProcedure

Procedure MongoDB_CreateRole(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleArray = New Array;
    RoleArray.Add("read");
    RoleArray.Add("userAdmin");

    Resource = New Structure("db,collection", Base, "new_collection");
    Actions  = New Array;

    Actions.Add("find");
    Actions.Add("insert");
    Actions.Add("update");

    Privilege = OPI_MongoDB.GetRolePrivilegeStructure(Resource, Actions);

    PrivilegesArray = New Array;
    PrivilegesArray.Add(Privilege);

    RoleName = "newrole";

    OPI_MongoDB.DeleteRole(Connection, RoleName, Base); // SKIP
    Result = OPI_MongoDB.CreateRole(Connection, RoleName, Base, PrivilegesArray, RoleArray);

    // END

    Process(Result, "MongoDB", "CreateRole");

    Result = OPI_MongoDB.CreateRole(Connection, RoleName, Base, PrivilegesArray, RoleArray);

    Process(Result, "MongoDB", "CreateRole", "Existing");

EndProcedure

Procedure MongoDB_UpdateRole(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleArray = New Array;
    RoleArray.Add("read");
    RoleArray.Add("userAdmin");

    Resource = New Structure("db,collection", Base, "new_collection2");
    Actions  = New Array;

    Actions.Add("find");
    Actions.Add("insert");

    Privilege = OPI_MongoDB.GetRolePrivilegeStructure(Resource, Actions);

    PrivilegesArray = New Array;
    PrivilegesArray.Add(Privilege);

    RoleName = "newrole";

    Result = OPI_MongoDB.UpdateRole(Connection, RoleName, Base, PrivilegesArray, RoleArray);

    // END

    Process(Result, "MongoDB", "UpdateRole");

EndProcedure

Procedure MongoDB_DeleteRole(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleName = "newrole";

    Result = OPI_MongoDB.DeleteRole(Connection, RoleName, Base);

    // END

    Process(Result, "MongoDB", "DeleteRole");

    Result = OPI_MongoDB.DeleteRole(Connection, RoleName, Base);

    Process(Result, "MongoDB", "DeleteRole", "Again");

EndProcedure

Procedure MongoDB_GetRolePrivilegeStructure(FunctionParameters)

    Base     = FunctionParameters["MongoDB_DB"];
    Resource = New Structure("db,collection", Base, "new_collection");
    Actions  = New Array;

    Actions.Add("find");
    Actions.Add("insert");
    Actions.Add("update");

    Result = OPI_MongoDB.GetRolePrivilegeStructure(Resource, Actions);

    // END

    Process(Result, "MongoDB", "GetRolePrivilegeStructure");

EndProcedure

Procedure MongoDB_GetRoles(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Role = New Structure("role,db", "newrole", Base);

    Result = OPI_MongoDB.GetRoles(Connection, Role, Base, True);

    // END

    Process(Result, "MongoDB", "GetRoles");

EndProcedure

Procedure MongoDB_GrantRoles(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    User = "bayselonarrend";
    Role = New Structure("role,db", "newrole", Base);

    Result = OPI_MongoDB.GrantRoles(Connection, User, Role, Base);

    // END

    Process(Result, "MongoDB", "GrantRoles");

EndProcedure

Procedure MongoDB_RevokeRoles(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    User = "bayselonarrend";
    Role = New Structure("role,db", "newrole", Base);

    Result = OPI_MongoDB.RevokeRoles(Connection, User, Role, Base);

    // END

    Process(Result, "MongoDB", "RevokeRoles");

EndProcedure

#EndRegion

#Region GRPC

Procedure GRPC_CreateConnection(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta       = New Structure("somekey", "somevalue");
    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme, Meta);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Result = OPI_GRPC.CreateConnection(Parameters, Tls);

    // END

    Process(Result, "GRPC", "CreateConnection");

    Result = OPI_GRPC.CloseConnection(Result);

    Process(Result, "GRPC", "CreateConnection", "Closing");

    Address    = FunctionParameters["GRPC_AddressNoTls"];
    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Result     = OPI_GRPC.CreateConnection(Parameters);

    Process(Result, "GRPC", "CreateConnection", "No TLS");

    Scheme = New Map;
    Scheme.Insert("main.proto", Proto1);

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Result     = OPI_GRPC.CreateConnection(Parameters);

    Process(Result, "GRPC", "CreateConnection", "Error");

EndProcedure

Procedure GRPC_CloseConnection(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta       = New Structure("somekey", "somevalue");
    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme, Meta);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Result     = OPI_GRPC.CloseConnection(Connection);

    // END

    Process(Result, "GRPC", "CloseConnection");

EndProcedure

Procedure GRPC_IsConnector(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta       = New Structure("somekey", "somevalue");
    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme, Meta);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Result     = OPI_GRPC.IsConnector(Connection);

    // END

    Process(Result, "GRPC", "IsConnector");

EndProcedure

Procedure GRPC_GetConnectionParameters(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta   = New Structure("somekey", "somevalue");
    Result = OPI_GRPC.GetConnectionParameters(Address, Scheme, Meta);

    // END

    Process(Result, "GRPC", "GetConnectionParameters");

EndProcedure

Procedure GRPC_GetTlsSettings(FunctionParameters)

    Result = OPI_GRPC.GetTlsSettings(True);

    // END

    Process(Result, "GRPC", "GetTlsSettings");

EndProcedure

Procedure GRPC_SetMetadata(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    Meta   = New Structure("somekey", "somevalue");
    Result = OPI_GRPC.SetMetadata(Connection, Meta);

    // END

    Process(Result, "GRPC", "SetMetadata");

    If Not OPI_TestDataRetrieval.IsCLITest() Then

        Service = "grpcbin.GRPCBin";
        Method  = "HeadersUnary";

        Result = OPI_GRPC.ExecuteMethod(Connection, Service, Method, Undefined, , Tls);

        Process(Result, "GRPC", "SetMetadata", "Check");

     EndIf;

EndProcedure

Procedure GRPC_ExecuteMethod(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta       = New Structure("somekey", "somevalue");
    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme, Meta);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyUnary";

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    NumberArray = New Array;
    NumberArray.Add(1);
    NumberArray.Add(10);
    NumberArray.Add(100);

    StructuresArray = New Array;
    StructuresArray.Add(New Structure("f_string", "Nested value 1"));
    StructuresArray.Add(New Structure("f_string", "Nested value 2"));

    BoolArray = New Array;
    BoolArray.Add(True);
    BoolArray.Add(False);

    File = FunctionParameters["Document"];
    OPI_TypeConversion.GetBinaryData(File);

    TFN = GetTempFileName();
    File.Write(TFN);

    BinaryDataArray = New Array;
    BinaryDataArray.Add(File); // How Data
    BinaryDataArray.Add(TFN); // How path to file

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_int64"  , 123);
    Data.Insert("f_float"  , 123.22000122070312);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_enum"   , "ENUM_1");
    Data.Insert("f_bytes"  , File);
    Data.Insert("f_sub"    , New Structure("f_string" , "Nested value"));
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_int32s" , NumberArray);
    Data.Insert("f_int64s" , NumberArray);
    Data.Insert("f_floats" , NumberArray);
    Data.Insert("f_bytess" , BinaryDataArray);
    Data.Insert("f_subs"   , StructuresArray);
    Data.Insert("f_bools"  , BoolArray);
    Data.Insert("f_enums"  , StrSplit("ENUM_1,ENUM_2" , ","));

    Result = OPI_GRPC.ExecuteMethod(Parameters, Service, Method, Data, , Tls);

    // END

    Process(Result, "GRPC", "ExecuteMethod");

    Result = OPI_GRPC.ExecuteMethod(Parameters, Service, Method, Undefined, , Tls);

    Process(Result, "GRPC", "ExecuteMethod", "Empty");

    Method = "HeadersUnary";
    Result = OPI_GRPC.ExecuteMethod(Parameters, Service, Method, Undefined, , Tls);

    Process(Result, "GRPC", "ExecuteMethod", "Meta");

EndProcedure

Procedure GRPC_GetServiceList(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];
    Scheme  = FunctionParameters["GRPC_Proto"]; // String, path to file or URL

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Result     = OPI_GRPC.GetServiceList(Connection);

    // END

    Process(Result, "GRPC", "GetServiceList");

EndProcedure

Procedure GRPC_GetMethodList(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];
    Scheme  = FunctionParameters["GRPC_Proto"]; // String, path to file or URL

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Service    = "grpcbin.GRPCBin";

    Result = OPI_GRPC.GetMethodList(Connection, Service);

    // END

    Process(Result, "GRPC", "GetMethodList");

EndProcedure

Procedure GRPC_GetMethod(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];
    Scheme  = FunctionParameters["GRPC_Proto"]; // String, path to file or URL

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Service    = "grpcbin.GRPCBin";
    Method     = "Index";

    Result = OPI_GRPC.GetMethod(Connection, Service, Method);

    // END

    Process(Result, "GRPC", "GetMethod");

EndProcedure

Procedure GRPC_InitializeServerStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyServerStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeServerStream(Connection, Service, Method, Data); // <---

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    MessagesArray = New Array;

    While True Do

        CurrentMessage = OPI_GRPC.GetMessage(Connection, StreamID);

        If Not CurrentMessage["result"] Then

            Error = CurrentMessage["error"];

            If Error    = "Timeout" Then
                Continue;
            ElsIf Error = "Closed" Then
                Break;
            Else
                Raise Error;
            EndIf;

        Else

            MessageData = CurrentMessage["message"];

            If ValueIsFilled(MessageData) Then
                MessagesArray.Add(MessageData);
            EndIf;

        EndIf;

    EndDo;

    // END

    Process(Result       , "GRPC", "InitializeServerStream");
    Process(MessagesArray, "GRPC", "InitializeServerStream", "Array");

EndProcedure

Procedure GRPC_InitializeClientStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyClientStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeClientStream(Connection, Service, Method); // <---

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    FinalMessage = Undefined;

    Counter = 0;
    While True Do

        CurrentSend = OPI_GRPC.SendMessage(Connection, StreamID, Data);
        Counter     = Counter + 1;

        If Not CurrentSend["result"] Then

            Error = CurrentSend["error"];

            If Error         = "Timeout" Then
                Continue;
            ElsIf Error      = "Closed" Then
                FinalMessage = OPI_GRPC.GetMessage(Connection, StreamID);
                Break;
            Else
                Raise StrTemplate("%1 (sent messages %2)", Error, Counter);
            EndIf;

        Else

            If Counter       = 10 Then
                Completion   = OPI_GRPC.CompleteSend(Connection, StreamID);
                FinalMessage = OPI_GRPC.GetMessage(Connection, StreamID);
                Break;
            EndIf;

        EndIf;

    EndDo;

    // END

    Process(FinalMessage, "GRPC", "InitializeClientStream", , Counter);

EndProcedure

Procedure GRPC_InitializeBidirectionalStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyBidirectionalStreamStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeBidirectionalStream(Connection, Service, Method); // <---

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    ResultArray = New Array;
    Counter     = 0;

    While Counter < 10 Do

        Data.Insert("f_int32", Counter + 1);

        CurrentSend = OPI_GRPC.SendMessage(Connection, StreamID, Data);

        If Not CurrentSend["result"] Then

            Error = CurrentSend["error"];

            If Error = "Timeout" Then
                Continue;
            Else
                 Raise StrTemplate("Send error: %1 (processed messages %2)", Error, Counter);
            EndIf;

        EndIf;

        CurrentReceive = OPI_GRPC.GetMessage(Connection, StreamID);

        If Not CurrentReceive["result"] Then
            Raise StrTemplate("Receive error: %1 (processed messages %2)", Error, Counter);
        EndIf;

        ResultArray.Add(CurrentReceive["message"]);
        Counter = Counter + 1;

    EndDo;

    OPI_GRPC.CloseStream(Connection, StreamID);

    // END

    Process(Result, "GRPC", "InitializeBidirectionalStream", , ResultArray);

EndProcedure

Procedure GRPC_SendMessage(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyClientStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeClientStream(Connection, Service, Method);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result  = OPI_GRPC.SendMessage(Connection, StreamID, Data); // <---
    Closing = OPI_GRPC.CloseStream(Connection, StreamID);

    // END

    Process(Result, "GRPC", "SendMessage", , Closing);

EndProcedure

Procedure GRPC_GetMessage(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyServerStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    NumberArray = New Array;
    NumberArray.Add(1);
    NumberArray.Add(10);
    NumberArray.Add(100);

    File = FunctionParameters["Document"];
    OPI_TypeConversion.GetBinaryData(File);

    TFN = GetTempFileName();
    File.Write(TFN);

    BinaryDataArray = New Array;
    BinaryDataArray.Add(File); // How Data
    BinaryDataArray.Add(TFN); // How path to file

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_int64"  , 123);
    Data.Insert("f_float"  , 123.22000122070312);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_enum"   , "ENUM_1");
    Data.Insert("f_bytes"  , File);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_int32s" , NumberArray);
    Data.Insert("f_bytess" , BinaryDataArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeServerStream(Connection, Service, Method, Data);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result  = OPI_GRPC.GetMessage(Connection, StreamID); // <---
    Closing = OPI_GRPC.CloseStream(Connection, StreamID);

    // END

    Data.Insert("f_int64s", New Array);
    Data.Insert("f_enums" , New Array);
    Data.Insert("f_floats", New Array);
    Data.Insert("f_bools" , New Array);
    Data.Insert("f_subs"  , New Array);

    Process(Result, "GRPC", "GetMessage", , Closing, Data);

EndProcedure

Procedure GRPC_CloseStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyServerStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeServerStream(Connection, Service, Method, Data);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result = OPI_GRPC.CloseStream(Connection, StreamID); // <---

    // END

    Process(Result, "GRPC", "CloseStream");

    Result = OPI_GRPC.GetMessage(Connection, StreamID);

    Process(Result, "GRPC", "CloseStream", "Sending");

EndProcedure

Procedure GRPC_ProcessServerStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyServerStream";

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.ProcessServerStream(Parameters, Service, Method, Data, , Tls, 3);

    // END

    Process(Result, "GRPC", "ProcessServerStream");

EndProcedure

Procedure GRPC_ProcessClientStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyClientStream";

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    ArrayOfRequests = New Array;

    For N = 1 To 10 Do
        ArrayOfRequests.Add(Data);
    EndDo;

    Result = OPI_GRPC.ProcessClientStream(Parameters, Service, Method, ArrayOfRequests, , Tls);

    // END

    Process(Result, "GRPC", "ProcessClientStream");

    ArrayOfRequests.Delete(ArrayOfRequests.UBound());

    Result = OPI_GRPC.ProcessClientStream(Parameters, Service, Method, ArrayOfRequests, , Tls);

    Process(Result, "GRPC", "ProcessClientStream", "Error");

EndProcedure

Procedure GRPC_ProcessBidirectionalStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Service = "grpcbin.GRPCBin";
    Method  = "DummyBidirectionalStreamStream";

    ExchangeOrder = New Array;

    For N = 1 To 10 Do

        ExchangeOrder.Add(Data); // Single send
        ExchangeOrder.Add(Undefined); // Single get

    EndDo;

    Result = OPI_GRPC.ProcessBidirectionalStream(Parameters, Service, Method, ExchangeOrder, , Tls);

    // END

    Process(Result, "GRPC", "ProcessBidirectionalStream");

EndProcedure

Procedure GRPC_CompleteSend(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Parameters = OPI_GRPC.GetConnectionParameters(Address, Scheme);
    Tls        = OPI_GRPC.GetTlsSettings(True);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyClientStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    Result = OPI_GRPC.InitializeClientStream(Connection, Service, Method);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result = OPI_GRPC.CompleteSend(Connection, StreamID);

    // END

    Process(Result, "GRPC", "CompleteSend");

EndProcedure

#EndRegion

#EndRegion

#EndRegion
