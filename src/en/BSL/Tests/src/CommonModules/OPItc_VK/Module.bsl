// OneScript: ./OInt/tests/Modules/OPItc_VK.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("VK");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("VK");

EndFunction

#Region Internal

#Region RunnableTests

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

Procedure VKAPI_LikeRepostComment() Export

    TestParameters = New Structure;
    Parameters     = GetVKParameters();
    Text           = "Post from autotest";

    Result = OPI_VK.CreatePost(Text, New Array, , , Parameters);
    PostID = Result["response"]["post_id"];

    OPI_TestDataRetrieval.WriteParameter("VK_PostID", PostID);
    OPI_TestDataRetrieval.ParameterToCollection("VK_PostID", TestParameters);

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

#EndRegion // VK

#EndRegion // RunnableTests

#EndRegion // Internal

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

#Region AtomicTests

#Region VK

Procedure VK_CreateTokenRetrievalLink(FunctionParameters)

    Application = FunctionParameters["VK_AppID"];
    Options = New Structure;
    Options.Insert("app", Application);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateTokenRetrievalLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateTokenRetrievalLink");

EndProcedure

Procedure VK_GetAuthParameters(FunctionParameters)

    GroupID = FunctionParameters["VK_GroupID"];
    AppID   = FunctionParameters["VK_AppID"];
    Token   = FunctionParameters["VK_Token"];

    Options = New Structure;
    Options.Insert("group", GroupID);
    Options.Insert("app", AppID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetAuthParameters", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetAuthParameters");

EndProcedure

Procedure VK_CreatePost(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "Post from autotest";
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image  = FunctionParameters["Picture"]; // URL, Path or Binary data
    Image2 = FunctionParameters["Picture2"]; // URL, Path or Binary data

    TFN = GetTempFileName("png");
    FileCopy(Image2, TFN);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreatePost", , Parameters); // SKIP

    PostID = Result["response"]["post_id"]; // SKIP
    OPI_VK.DeletePost(PostID, Parameters); // SKIP

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("pictures", Image);
    Options.Insert("ad", Ложь);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePost", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreatePost", "Image", Parameters);

    PostID = Result["response"]["post_id"];
    OPI_VK.DeletePost(PostID, Parameters);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("pictures", TFN);
    Options.Insert("ad", Истина);
    Options.Insert("url", URL);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePost", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreatePost", "Path", FunctionParameters);

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VK_DeletePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Options = New Structure;
    Options.Insert("post", PostID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeletePost", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "DeletePost");

EndProcedure

Procedure VK_CreateCompositePost(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "Post from autotest";
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data
    Video = FunctionParameters["Video"]; // URL, Path or Binary data

    TFN = GetTempFileName("png");
    FileCopy(Image, TFN);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateCompositePost");
    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VK_CreatePoll(FunctionParameters)

    Parameters = GetVKParameters();
    Question   = "What's your favorite color??";

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreatePoll", "Text"); // SKIP

    // With picture

    Image = FunctionParameters["Picture"]; // URL, File path or Binary data

    Options = New Structure;
    Options.Insert("question", Question);
    Options.Insert("options", OptionArray);
    Options.Insert("picture", Image);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePoll", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreatePoll");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateAlbum", , FunctionParameters, Description);

EndProcedure

Procedure VK_SaveImageToAlbum(FunctionParameters)

    Parameters       = GetVKParameters();
    ImageDescription = "AutoTestImage";
    AlbumID          = FunctionParameters["VK_AlbumID"];

    Image = FunctionParameters["Picture"]; // URL, File path or Binary data

    Options = New Structure;
    Options.Insert("album", AlbumID);
    Options.Insert("picture", Image);
    Options.Insert("description", ImageDescription);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "SaveImageToAlbum", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "SaveImageToAlbum", , FunctionParameters, ImageDescription, AlbumID);

EndProcedure

Procedure VK_DeleteImage(FunctionParameters)

    Parameters = GetVKParameters();
    ImageID    = FunctionParameters["VK_PictureID"];

    Options = New Structure;
    Options.Insert("pictureid", ImageID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteImage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "DeleteImage");

EndProcedure

Procedure VK_DeleteAlbum(FunctionParameters)

    Parameters = GetVKParameters();
    AlbumID    = FunctionParameters["VK_AlbumID"];

    Options = New Structure;
    Options.Insert("album", AlbumID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteAlbum", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "DeleteAlbum");

EndProcedure

Procedure VK_CreateStory(FunctionParameters)

    Parameters = GetVKParameters();
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, File path or Binary data
    TFN   = GetTempFileName("png");
    FileCopy(Image, TFN);
    Image = New BinaryData(TFN);

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("url", URL);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateStory", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateStory"); // SKIP

    // END

    Options = New Structure;
    Options.Insert("picture", TFN);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateStory", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateStory", "Path");

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "MakeRepost", , FunctionParameters);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "WriteComment");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetStatistics");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetPostStatistics");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateAdvertisingCampaign", , FunctionParameters);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateAd", , FunctionParameters);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "PauseAdvertising");

EndProcedure

Procedure VK_FormKeyboard(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "FormKeyboard", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "FormKeyboard");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "WriteMessage");

EndProcedure

Procedure VK_GetProductCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductCategoryList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetProductCategoryList");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateProductCollection", , FunctionParameters);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "EditProductCollection");

EndProcedure

Procedure VK_GetSelectionsByID(FunctionParameters)

    Parameters = GetVKParameters();
    Selection  = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("sels", Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetSelectionsByID", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetSelectionsByID");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "AddProduct", , FunctionParameters);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "EditProduct");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "AddProductToCollection");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "RemoveProductFromSelection");

EndProcedure

Procedure VK_DeleteProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    Options = New Structure;
    Options.Insert("item", Product);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProduct", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "DeleteProduct");

EndProcedure

Procedure VK_DeleteSelection(FunctionParameters)

    Parameters = GetVKParameters();

    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("sel", Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteSelection", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "DeleteSelection");

EndProcedure

Procedure VK_CreateProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name = "Color";

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateProductProperty", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateProductProperty", , FunctionParameters);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "EditProductProperty");

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

        OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "AddProductPropertyVariant", , FunctionParameters, Counter); // SKIP

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "EditProductPropertyVariant");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateProductWithProp", "First", FunctionParameters, 2);

    Product.Insert("Name"          , "Test product (another)");
    Product.Insert("PropertyValues", PropVariant2);

    Options = New Structure;
    Options.Insert("product", Product);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProduct", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "CreateProductWithProp", "Second", FunctionParameters, 3);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetProductsByID");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GroupProducts");

EndProcedure

Procedure VK_DeleteProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Option = FunctionParameters["VK_PropVarID1"];

    Options = New Structure;
    Options.Insert("option", Option);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProductPropertyVariant", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "DeleteProductPropertyVariant");

EndProcedure

Procedure VK_DeleteProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];

    Options = New Structure;
    Options.Insert("prop", Property);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProductProperty", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "DeleteProductProperty");

EndProcedure

Procedure VK_GetProductList(FunctionParameters)

    Parameters = GetVKParameters();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetProductList");

EndProcedure

Procedure VK_GetSelectionList(FunctionParameters)

    Parameters = GetVKParameters();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetSelectionList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetSelectionList");

EndProcedure

Procedure VK_GetPropertyList(FunctionParameters)

    Parameters = GetVKParameters();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetPropertyList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetPropertyList");

EndProcedure

Procedure VK_GetOrderList(FunctionParameters)

    Parameters = GetVKParameters();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetOrderList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetOrderList");

EndProcedure

Procedure VK_UploadVideoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Video       = FunctionParameters["Video"]; // URL, Binary data or File path
    Name        = "NewVideo";
    Description = "Video description";

    Options = New Structure;
    Options.Insert("file", Video);
    Options.Insert("title", Name);
    Options.Insert("description", Description);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "UploadVideoToServer", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "UploadVideoToServer");

EndProcedure

Procedure VK_UploadPhotoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Image = FunctionParameters["Picture"]; // URL, Binary data or File path
    View  = "Post";

    Options = New Structure;
    Options.Insert("file", Image);
    Options.Insert("auth", Parameters);
    Options.Insert("type", View);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "UploadPhotoToServer", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "UploadPhotoToServer");

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetAdvertisingCategoryList");

EndProcedure

Procedure VK_GetProductDescription(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductDescription", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VK", "GetProductDescription");

EndProcedure

#EndRegion // VK

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure ВК_СоздатьСсылкуТокена() Export
    VKAPI_CreateTokenLink();
EndProcedure

Procedure ВК_СоздатьУдалитьПост() Export
    VKAPI_CreateDeletePost();
EndProcedure

Procedure ВК_СоздатьСоставнойПост() Export
    VKAPI_CreateCompositePost();
EndProcedure

Procedure ВК_СоздатьОпрос() Export
    VKAPI_CreatePoll();
EndProcedure

Procedure ВК_СохранитьУдалитьКартинку() Export
    VKAPI_SaveDeleteImage();
EndProcedure

Procedure ВК_СоздатьИсторию() Export
    VKAPI_CreateStory();
EndProcedure

Procedure ВК_ЛайкРепостКоммент() Export
    VKAPI_LikeRepostComment();
EndProcedure

Procedure ВК_ПолучитьСтатистику() Export
    VKAPI_GetStatistics();
EndProcedure

Procedure ВК_ПолучитьСтатистикуПостов() Export
    VKAPI_GetPostStatistics();
EndProcedure

Procedure ВК_СоздатьРекламнуюКампанию() Export
    VKAPI_CreateAdCampaign();
EndProcedure

Procedure ВК_ОтправитьСообщение() Export
    VKAPI_SendMessage();
EndProcedure

Procedure ВК_ПолучитьКатегорииТоваров() Export
    VKAPI_GetProductCategories();
EndProcedure

Procedure ВК_СоздатьТоварПодборку() Export
    VKAPI_CreateProductSelection();
EndProcedure

Procedure ВК_СоздатьТоварСоСвойствами() Export
    VKAPI_CreateProductWithProperties();
EndProcedure

Procedure ВК_ПолучитьСписокТоваров() Export
    VKAPI_GetProductList();
EndProcedure

Procedure ВК_ПолучитьСписокПодборок() Export
    VKAPI_GetSelectionList();
EndProcedure

Procedure ВК_ПолучитьСписокСвойств() Export
    VKAPI_GetPropertyList();
EndProcedure

Procedure ВК_ПолучитьСписокЗаказов() Export
    VKAPI_GetOrderList();
EndProcedure

Procedure ВК_ЗагрузитьВидео() Export
    VKAPI_UploadVideo();
EndProcedure

#EndRegion
