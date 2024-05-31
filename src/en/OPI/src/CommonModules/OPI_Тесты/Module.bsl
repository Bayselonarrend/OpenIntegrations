// Location OS: ./OInt/tests/Modules/internal/OPI_Tests.os

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

// @skip-check undefined-variable
// @skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
// #Use oint
// #Use asserts

#Region ServiceProgramInterface

// For YAxUnit

Procedure ExecutableScripts() Export

    OPI_GetTestData.FormYAXTests();

EndProcedure

// For Asserts

Function GetTestList(UnitTesting) Export

   Return OPI_GetTestData.FormAssertsTests();

EndFunction

#Region RunnableTests

#Region Telegram

Procedure Telegram_GetBotInfo() Export
 
 	TestParameters = New Structure;
 	OPI_GetTestData.ParameterToCollection("Telegram_Token", TestParameters);
 	
	Telegram_GetBotInformation(TestParameters);
    
EndProcedure

Procedure Telegram_GetUpdates() Export

 	TestParameters = New Structure;
 	OPI_GetTestData.ParameterToCollection("Telegram_Token", TestParameters);
 	
 	Telegram_DeleteWebhook(TestParameters);
	Telegram_GetUpdates(TestParameters);
	
EndProcedure

Procedure Telegram_SetWebhook() Export

 	TestParameters = New Structure;
 	OPI_GetTestData.ParameterToCollection("Telegram_Token", TestParameters);
 	OPI_GetTestData.ParameterToCollection("Telegram_URL"  , TestParameters);

	Telegram_SetWebhook(TestParameters);
	Telegram_DeleteWebhook(TestParameters);
    
EndProcedure

Procedure Telegram_SendTextMessage() Export

    TestParameters = New Structure;
 	OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
 	OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
 	OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
 	OPI_GetTestData.ParameterToCollection("String"            , TestParameters);
 	
	Telegram_SendTextMessage(TestParameters);
        
EndProcedure

Procedure Telegram_SendImage() Export

    TestParameters = New Structure;
 	OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
 	OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
 	OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
 	OPI_GetTestData.ParameterToCollection("String"            , TestParameters);
 	OPI_GetTestData.ParameterToCollection("Picture"           , TestParameters);
 	
	Telegram_SendPicture(TestParameters);
	Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure Telegram_SendVideo() Export

    TestParameters = New Structure;
 	OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
 	OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
 	OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
 	OPI_GetTestData.ParameterToCollection("String"            , TestParameters);
 	OPI_GetTestData.ParameterToCollection("Video"             , TestParameters);
 	
	Telegram_SendVideo(TestParameters);
	Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure Telegram_SendAudio() Export

    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_GetTestData.ParameterToCollection("String"            , TestParameters);
    OPI_GetTestData.ParameterToCollection("Audio"             , TestParameters);
    
    Telegram_SendAudio(TestParameters);
    Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure Telegram_SendDocument() Export

    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_GetTestData.ParameterToCollection("String"            , TestParameters);
    OPI_GetTestData.ParameterToCollection("Document"          , TestParameters);
    
    Telegram_SendDocument(TestParameters);

EndProcedure

Procedure Telegram_SendGIF() Export

    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_GetTestData.ParameterToCollection("String"            , TestParameters);
    OPI_GetTestData.ParameterToCollection("GIF"               , TestParameters);
    
    Telegram_SendGif(TestParameters);

EndProcedure

Procedure Telegram_SendMediaGroup() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_GetTestData.ParameterToCollection("String"            , TestParameters);
    OPI_GetTestData.ParameterToCollection("Picture"           , TestParameters);
    OPI_GetTestData.ParameterToCollection("Video"             , TestParameters);
    
    Telegram_SendMediaGroup(TestParameters);

EndProcedure

Procedure Telegram_SendLocation() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_GetTestData.ParameterToCollection("Long"              , TestParameters);
    OPI_GetTestData.ParameterToCollection("Lat"               , TestParameters);
    
    Telegram_SendLocation(TestParameters);

EndProcedure

Procedure Telegram_SendContact() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_GetTestData.ParameterToCollection("Name"              , TestParameters);
    OPI_GetTestData.ParameterToCollection("Surname"           , TestParameters);
    OPI_GetTestData.ParameterToCollection("Phone"             , TestParameters);

    Telegram_SendContact(TestParameters);

EndProcedure

Procedure Telegram_SendPoll() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    
	Telegram_SendPoll(TestParameters);

EndProcedure

Procedure Telegram_ForwardMessage() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"           , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"          , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID"       , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelMessageID", TestParameters);

	Telegram_ForwardMessage(TestParameters);
        
EndProcedure

Procedure Telegram_BanUnban() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"           , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChatID"          , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID"       , TestParameters);
    
    Telegram_Ban(TestParameters);
    Telegram_Unban(TestParameters);
    
EndProcedure

Procedure Telegram_CreateInvitationLink() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    
	Telegram_CreateInviteLink(TestParameters);

EndProcedure

Procedure Telegram_PinUnpinMessage() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"           , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID"       , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelMessageID", TestParameters);
        
	Telegram_PinMessage(TestParameters);
	Telegram_UnpinMessage(TestParameters);

EndProcedure

Procedure Telegram_GetMemberCount() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ChannelID", TestParameters);
    
    Telegram_GetParticipantCount(TestParameters);

EndProcedure

Procedure Telegram_GetForumAvatarsList() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token", TestParameters);
    
	Telegram_GetForumAvatarList(TestParameters);
    
EndProcedure

Procedure Telegram_CreateDeleteForumTopic() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ForumID", TestParameters);
    OPI_GetTestData.ParameterToCollection("Picture"         , TestParameters);
    OPI_GetTestData.ParameterToCollection("String"          , TestParameters);
    
	Telegram_CreateForumTopic(TestParameters);
	Telegram_EditForumTopic(TestParameters);
	Telegram_CloseForumTopic(TestParameters);
	Telegram_OpenForumTopic(TestParameters);
	Telegram_ClearPinnedMessagesList(TestParameters);
	Telegram_DeleteForumTopic(TestParameters);

EndProcedure

Procedure Telegram_HideShowMainTopic() Export
 
 	TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ForumID", TestParameters);

	Telegram_HideMainForumTopic(TestParameters);
	Telegram_ShowMainForumTopic(TestParameters);

EndProcedure

Procedure Telegram_ChangeMainTopicName() Export
 
 	TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_GetTestData.ParameterToCollection("Telegram_ForumID", TestParameters);

	Telegram_ChangeMainTopicName(TestParameters);
	
EndProcedure

#EndRegion

#Region VK

Procedure VK_CreateTokenLink() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("VK_AppID", TestParameters);

    VK_CreateTokenRetrievalLink(TestParameters);  
    
EndProcedure

Procedure VK_CreateDeletePost() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Picture" , TestParameters);
    OPI_GetTestData.ParameterToCollection("Picture2", TestParameters);
    
    VK_CreatePost(TestParameters);
    VK_DeletePost(TestParameters);

EndProcedure

Procedure VK_CreateCompositePost() Export
    
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Picture" , TestParameters);
    OPI_GetTestData.ParameterToCollection("Video"   , TestParameters);
    
    VK_CreateCompositePost(TestParameters);
    
EndProcedure

Procedure VK_CreatePoll() Export
 
    VK_CreatePoll();
       
EndProcedure

Procedure VK_SaveDeleteImage() Export
 
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Picture" , TestParameters);
    
    VK_CreateAlbum(TestParameters);
    VK_SavePictureToAlbum(TestParameters);
    VK_DeleteImage(TestParameters);
    VK_DeleteAlbum(TestParameters);
           
EndProcedure

Procedure VK_CreateStory() Export
 
    TestParameters = New Match;
    OPI_GetTestData.ParameterToCollection("Picture" , TestParameters);
    
    VK_CreateStory(TestParameters);
    
EndProcedure

Procedure VK_DiscussionMethods() Export
 
    TestParameters = New Structure;
    Parameters      = GetVKParameters();
    
    VK_CreateDiscussion(TestParameters);
    VK_CloseDiscussion(TestParameters);
    VK_OpenDiscussion(TestParameters);
    VK_PostToDiscussion(TestParameters);     
       
    OPI_VK.CloseDiscussion(TestParameters["VK_ConvID"], True, Parameters);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure VK_LikeRepostComment() Export
 
    Parameters       = GetVKParameters();
    Text           = "Post from autotest";
    Message       = "Message from autotest";
    TypeMatch = Type("Match");
    TypeNumber        = Type("Number");
    Response        = "response";
    
    Result = OPI_VK.CreatePost(Text, New Array, , , Parameters);
    
    PostID   = Result[Response]["post_id"];    
    Result = OPI_VK.LikePost(PostID, , Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "LikePost");
    
    OPI_Tools.Pause(5);
      
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch).Filled();
    OPI_GetTestData.ExpectsThat(Result[Response]["likes"]).HasType(TypeNumber).Filled();
        
    ExternalPost  = 2571;
    ExternalWall = -218704372;
        
    Result = OPI_VK.MakeRepost(ExternalPost, ExternalWall, , , Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "MakeRepost");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch).Filled();
    OPI_GetTestData.ExpectsThat(Result[Response]["success"]).HasType(TypeNumber).Equal(1);
    OPI_GetTestData.ExpectsThat(Result[Response]["wall_repost_count"]).HasType(TypeNumber).Equal(1); 
        
    Result  = OPI_VK.WriteComment(PostID, Parameters["owner_id"], Message, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "WriteComment");
        
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch).Filled();
    OPI_GetTestData.ExpectsThat(Result[Response]["comment_id"]).HasType(TypeNumber).Filled();
   
    OPI_VK.DeletePost(PostID, Parameters);
    OPI_VK.DeletePost(Result[Response]["post_id"], Parameters);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetStatistics() Export
 
    CurrentDate     = OPI_Tools.GetCurrentDate();
    Parameters       = GetVKParameters();
    Date0           = StartOfDay(CurrentDate);
    Date1           = EndOfDay(Date0);
    TypeMatch = Type("Match");
     
    Result = OPI_VK.GetStatistics(Date0, Date1, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetStatistics");
        
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch).Filled();
    OPI_GetTestData.ExpectsThat(Result["response"][0]["visitors"]).HasType(TypeMatch).Filled();
    OPI_GetTestData.ExpectsThat(Result["response"][0]["reach"]).HasType(TypeMatch).Filled();
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetPostStatistics() Export
 
    Parameters    = GetVKParameters();
    
    ArrayOfPosts = New Array;
    ArrayOfPosts.Add(214);
    ArrayOfPosts.Add(215);
    
    Result = OPI_VK.GetPostStatistics(ArrayOfPosts, Parameters);

    // !OInt OPI_GetTestData.WriteLog(Result, "GetPostStatistics");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Array").HasLength(2);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateAdCampaign() Export
 
    Parameters       = GetVKParameters();
    CabinetID      = OPI_GetTestData.GetParameter("VK_AdsCabinetID");
    Name    = "TestCampaign";
    TypeMatch = Type("Match");
    TypeNumber        = Type("Number");
    Response        = "response";
    UID             = "id";
        
    Result    = OPI_VK.CreateAdvertisingCampaign(CabinetID, Name, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateAdvertisingCampaign");
    
    Result    = Result[Response][0];
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch); 
    OPI_GetTestData.ExpectsThat(Result["error_code"]).HasType(TypeNumber).Equal(602);
    OPI_GetTestData.ExpectsThat(Result[UID]).HasType(TypeNumber).Filled();
        
    CampaignID  = Result[UID];
    CategoryID = 126;
    Limit       = 150;
    
    Result = OPI_VK.CreatePost(Name, New Array, , , Parameters); 
    PostID   = Result[Response]["post_id"]; 
        
    Result   = OPI_VK.CreateAd(CampaignID
        , Limit
        , CategoryID
        , PostID
        , CabinetID
        , Parameters);
        
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateAd");
            
    Result   = Result[Response][0];
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch); 
    OPI_GetTestData.ExpectsThat(Result["error_code"]).HasType(TypeNumber).Equal(602);
    OPI_GetTestData.ExpectsThat(Result[UID]).HasType(TypeNumber).Filled();
        
    AnnouncementID = Result[UID];
    Result    = OPI_VK.PauseAdvertisingAd(CabinetID, AnnouncementID, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "PauseAdvertisingAd");
    
    Result    = Result[Response][0];
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch); 
    OPI_GetTestData.ExpectsThat(Result[UID]).HasType(TypeNumber).Filled();
 
    OPI_VK.DeletePost(PostID, Parameters);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_SendMessage() Export
 
    Parameters    = GetVKParameters();
    User = OPI_GetTestData.GetParameter("VK_UserID");
    Token        = OPI_GetTestData.GetParameter("VK_CommunityToken");
    Text        = "Message from autotest";
    
    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2"); 
    
    Keyboard = OPI_VK.FormKeyboard(ButtonArray);
    Result  = OPI_VK.WriteMessage(Text, User, Token, Keyboard, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "WriteMessage");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match"); 
    OPI_GetTestData.ExpectsThat(Result["response"]).HasType("Number").Filled();
    
    OPI_Tools.Pause(5);
  
EndProcedure

Procedure VK_GetProductCategories() Export
 
    Parameters = GetVKParameters();
    Result = OPI_VK.GetProductCategoryList(Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetProductCategoryList");
    
    OPI_GetTestData.ExpectsThat(Result) 
        .HasType("Match")
        .Filled();
        
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_CreateProductSelection() Export
 
    Parameters       = GetVKParameters();
    TypeMatch = Type("Match");
    TypeNumber        = Type("Number");
    Response        = "response";
    Image        = OPI_GetTestData.GetBinary("Picture");
    AndVF             = GetTempFileName("png");   
    Image.Write(AndVF);
        
    Result = OPI_VK.CreateProductCollection("TestCollection"
        , Image
        , True
        , False
        , Parameters);  
        
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateProductCollection");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response]["albums_count"]).HasType(TypeNumber).Filled();
    OPI_GetTestData.ExpectsThat(Result[Response]["market_album_id"]).HasType(TypeNumber).Filled();
             
    SelectionID = Result[Response]["market_album_id"];
    
    Result  = OPI_VK.EditProductCollection("EditedCollection", SelectionID, , , , Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditProductCollection");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response]).HasType(TypeNumber).Equal(1);
 
    ImageArray = New Array;
    ImageArray.Add(OPI_GetTestData.GetBinary("Picture"));
    ImageArray.Add(OPI_GetTestData.GetBinary("Picture2"));
    
    Product = New Match();
    Product.Insert("Name"                , "TestProduct");    
    Product.Insert("Description"           , "Product description");
    Product.Insert("Category"          , "20173");           
    Product.Insert("Price"               , 1);                
    Product.Insert("OldPrice"         , 15);     
    Product.Insert("MainPhoto"       , Image);                   
    Product.Insert("URL"                , "https://github.com/Bayselonarrend/OpenIntegrations");     
    Product.Insert("AdditionalPhotos" , ImageArray);     
    Product.Insert("MainInGroup"     , True);                 
    Product.Insert("Width"             , 20);     
    Product.Insert("Height"             , 30);     
    Product.Insert("Depth"            , 40);     
    Product.Insert("Weight"                , 100);
    Product.Insert("SKU"                , "12345");
    Product.Insert("AvailableBalance"   , "10");
    
    Result = OPI_VK.AddProduct(Product, SelectionID, Parameters);                // Adding product
    
    // !OInt OPI_GetTestData.WriteLog(Result, "AddProduct");
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response]["market_item_id"]).HasType(TypeNumber).Filled();
        
    ProductID  = Result[Response]["market_item_id"];
    
    Product = New Match;
    Product.Insert("Name", "EditedTestProduct");
    
    Result = OPI_VK.EditProduct(ProductID, Product, , Parameters);                // Change product
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditProduct");
    
    Check_VKTrue(Result);
    
    Result = OPI_VK.AddProductToSelection(ProductID, SelectionID, Parameters);    // Adding in selection
    
    // !OInt OPI_GetTestData.WriteLog(Result, "AddProductToSelection");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response]).HasType(TypeNumber).Filled();
        
    Result = OPI_VK.RemoveProductFromSelection(ProductID, SelectionID, Parameters);    // Deletes from selections
    
    // !OInt OPI_GetTestData.WriteLog(Result, "RemoveProductFromSelection");
    
    OPI_Tools.Pause(5);
    Check_VKTrue(Result);
        
    Result = OPI_VK.DeleteProduct(ProductID, Parameters);                          // Deletion product
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteProduct");
    
    OPI_Tools.Pause(5);
    Check_VKTrue(Result);
        
    Result = OPI_VK.DeleteSelection(SelectionID, Parameters);                     // Removal selections
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteSelection");
    
    OPI_Tools.Pause(5);
    Check_VKTrue(Result);

    DeleteFiles(AndVF);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_CreateProductWithProperties() Export
 
    Parameters       = GetVKParameters();
    TypeMatch = Type("Match");
    TypeNumber        = Type("Number");
    MII             = "market_item_id";
    Response        = "response";
    Yellow          = "Yellow";
    Red         = "Red";
    Image        = OPI_GetTestData.GetBinary("Picture");
    AndVF             = GetTempFileName("png");   
    Image.Write(AndVF);
    
    OptionArray = New Array;
    OptionArray.Add(Yellow);
    OptionArray.Add("Blue");
    OptionArray.Add(Red);
    
    Result = OPI_VK.CreateProductProperty("Color", Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateProductProperty");
    
    OPI_Tools.Pause(5);
    
    Property  = Result[Response]["property_id"];
    Property  = OPI_Tools.NumberToString(Property);
     
    PropertyMatch = New Match;
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response]["property_id"]).HasType(TypeNumber).Filled();
        
    Result = OPI_VK.EditProductProperty("Color (fromм.)", Property, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditProductProperty");
    
    OPI_Tools.Pause(5);
    
    Check_VKTrue(Result);
   
    For Each Option Of OptionArray Loop
        
        Result = OPI_VK.AddProductPropertyVariant(Option, Property, Parameters);
        
        // !OInt OPI_GetTestData.WriteLog(Result, "AddProductPropertyVariant");
        
        OPI_Tools.Pause(5);
        
        OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
        OPI_GetTestData.ExpectsThat(Result[Response]["variant_id"]).HasType(TypeNumber).Filled();
            
        VariantID = Result[Response]["variant_id"];
        PropertyMatch.Insert(Option, VariantID);
        
        Result = OPI_VK.EditProductPropertyVariant(Option + String(New UniqueIdentifier())
            , Property
            , VariantID
            , Parameters);
            
        // !OInt OPI_GetTestData.WriteLog(Result, "EditProductPropertyVariant");
        
    Check_VKTrue(Result);
              
    EndOfLoop;
  
    ImageArray = New Array;
    ImageArray.Add(AndVF);
    ImageArray.Add(Image);
    
    Product = New Match();
    Product.Insert("Name"                , "TestProduct (" + Yellow + ")");    
    Product.Insert("Description"           , "Product description");
    Product.Insert("Category"          , "20173");           
    Product.Insert("Price"               , 1);                
    Product.Insert("OldPrice"         , 15);     
    Product.Insert("MainPhoto"       , Image);                   
    Product.Insert("URL"                , "https://github.com/Bayselonarrend/OpenIntegrations");     
    Product.Insert("AdditionalPhotos" , ImageArray);     
    Product.Insert("MainInGroup"     , True);             
    Product.Insert("GroupNumber"        , Undefined);      
    Product.Insert("Width"             , 20);     
    Product.Insert("Height"             , 30);     
    Product.Insert("Depth"            , 40);     
    Product.Insert("Weight"                , 100);
    Product.Insert("SKU"                , 12345);
    Product.Insert("AvailableBalance"   , "10");
    Product.Insert("PropertyValues"    , PropertyMatch[Yellow]);
    
    Result = OPI_VK.AddProduct(Product, , Parameters);                // Adding product  
    
    // !OInt OPI_GetTestData.WriteLog(Result, "AddProduct");
    
    OPI_Tools.Pause(5);
    
    YellowID = Result[Response]["market_item_id"];               
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response][MII]).HasType(TypeNumber).Filled();
        
    Product.Insert("Name"            , "TestProduct (" + Red + ")");
    Product.Insert("PropertyValues", PropertyMatch[Red]);

    Result  = OPI_VK.AddProduct(Product, , Parameters);                // Adding product
    
    // !OInt OPI_GetTestData.WriteLog(Result, "AddProduct");
      
    OPI_Tools.Pause(5);
    
    RedID = Result[Response][MII];               
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response][MII]).HasType(TypeNumber).Filled();
        
    Array of products = New Array;
    Array of products.Add(YellowID);
    Array of products.Add(RedID);
    
    Result = OPI_VK.GetProductsByID(Array of products, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetProductsByID");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response]["items"]).HasType("Array").HasLength(2);
        
    Result = OPI_VK.GroupProducts(Array of products, , Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GroupProducts");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch);
    OPI_GetTestData.ExpectsThat(Result[Response]["item_group_id"]).HasType(TypeNumber).Filled();
       
    OPI_VK.DeleteProduct(YellowID , Parameters);
    OPI_VK.DeleteProduct(RedID, Parameters);
    
    For Each Option Of PropertyMatch Loop
        
        Deletion = OPI_VK.DeleteProductPropertyVariant(Option.Value, Parameters);
        
        // !OInt OPI_GetTestData.WriteLog(Result, "DeleteProductPropertyVariant");
        
        OPI_Tools.Pause(5);
        Check_VKTrue(Deletion);
        
    EndOfLoop;
        
    Deletion = OPI_VK.DeleteProductProperty(Property, Parameters);
   
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteProductProperty");
        
    OPI_Tools.Pause(5);
    
    Check_VKTrue(Deletion);

    DeleteFiles(AndVF);
    
EndProcedure

Procedure VK_GetProductList() Export
 
    Parameters = GetVKParameters();
    Image  = OPI_GetTestData.GetBinary("Picture"); 
    
    ImageArray = New Array;
    ImageArray.Add(Image);
    
    Product = New Match();
    Product.Insert("Name"                , "TestProduct2");    
    Product.Insert("Description"           , "Product description");
    Product.Insert("Category"          , "20173");           
    Product.Insert("Price"               , 1);                
    Product.Insert("OldPrice"         , 15);     
    Product.Insert("MainPhoto"       , Image);                   
    Product.Insert("URL"                , "https://github.com/Bayselonarrend/OpenIntegrations");     
    Product.Insert("AdditionalPhotos" , ImageArray);     
    Product.Insert("MainInGroup"     , True);             
    Product.Insert("GroupNumber"        , Undefined);      
    Product.Insert("Width"             , 20);     
    Product.Insert("Height"             , 30);     
    Product.Insert("Depth"            , 40);     
    Product.Insert("Weight"                , 100);
    Product.Insert("SKU"                , 12345);
    Product.Insert("AvailableBalance"   , "10");
    
    Result = OPI_VK.AddProduct(Product, , Parameters);
    ProductID  = Result["response"]["market_item_id"];
    OPI_Tools.Pause(5);
    
    Result = OPI_VK.GetProductList(, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetProductList");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result) 
        .HasType("Array").Filled();
              
    OPI_VK.DeleteProduct(ProductID, Parameters);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_GetSelectionList() Export
 
    Parameters = GetVKParameters();
    Image  = OPI_GetTestData.GetBinary("Picture");    
    Result = OPI_VK.CreateProductCollection("TestCollection"
        , Image
        , True
        , False
        , Parameters); 
     
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateProductCollection");
       
    SelectionID = Result["response"]["market_album_id"];      
    Result  = OPI_VK.GetSelectionList(Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetSelectionList");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result) 
        .HasType("Array").Filled();
        
    OPI_VK.DeleteSelection(SelectionID, Parameters); 
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_GetPropertyList() Export
 
    Parameters  = GetVKParameters();
    Result  = OPI_VK.GetPropertyList(Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetPropertyList");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result) 
        .HasType("Array").Filled();
        
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetOrderList() Export
 
    Parameters  = GetVKParameters();
    Result  = OPI_VK.GetOrderList(Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetOrderList");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result) 
        .HasType("Array").Filled();
        
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_UploadVideo() Export
    
    Parameters    = GetVKParameters();
    Video        = OPI_GetTestData.GetParameter("Video");
    Name = "NewVideo";
    Description     = "Video description";
    
    Result = OPI_VK.UploadVideoToServer(Video, Name, Description, , Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetOrderList");
    
    OPI_GetTestData.ExpectsThat(Result["video_id"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["video_hash"]).Filled();
    
    OPI_Tools.Pause(5);
    
EndProcedure

#EndRegion

#Region YandexDisk

Procedure YDisk_GetDiskInfo() Export
 
    Token        = OPI_GetTestData.GetParameter("YandexDisk_Token");
    Match = "Match";
    
    Result = OPI_YandexDisk.GetDiskInformation(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetDiskInformation");
    
    OPI_GetTestData.ExpectsThat(Result).HasType(Match).Filled();
    OPI_GetTestData.ExpectsThat(Result["system_folders"]).HasType(Match);
    OPI_GetTestData.ExpectsThat(Result["user"]).HasType(Match);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure YDisk_CreateFolder() Export
 
   Token = OPI_GetTestData.GetParameter("YandexDisk_Token");
   Path  = "/" + String(New UniqueIdentifier);
   
   Result = OPI_YandexDisk.CreateFolder(Token, Path);
   
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateFolder");
   
   OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
   OPI_GetTestData.ExpectsThat(Result["type"]).Equal("dir");
   OPI_GetTestData.ExpectsThat(Result["path"]).Equal("disk:" + Path);
        
   OPI_YandexDisk.DeleteObject(Token, Path, False);
  
   OPI_Tools.Pause(5);
  
EndProcedure

Procedure YDisk_UploadByUrlAndGetObject() Export
 
    Token = OPI_GetTestData.GetParameter("YandexDisk_Token");
    Path  = "/" + String(New UniqueIdentifier) + ".png";
    URL   = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";

    OPI_YandexDisk.UploadFileByURL(Token, Path, URL);
    OPI_Tools.Pause(5);
        
    Result = OPI_YandexDisk.GetObject(Token, Path);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetObject");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["type"]).Equal("file");
    OPI_GetTestData.ExpectsThat(Result["path"]).Equal("disk:" + Path);

     OPI_YandexDisk.DeleteObject(Token, Path, False);
     
     OPI_Tools.Pause(5);
     
EndProcedure

Procedure YDisk_UploadDeleteFile() Export
 
    Token    = OPI_GetTestData.GetParameter("YandexDisk_Token");
    Path     = "/" + String(New UniqueIdentifier) + ".png";
    Image = OPI_GetTestData.GetBinary("Picture");
    AndVF      = GetTempFileName("png");
    Image.Write(AndVF);

    Result = OPI_YandexDisk.UploadFile(Token, Path, Image, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "UploadFile");
    
    Check_Empty(Result);
    OPI_Tools.Pause(5);
    
    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteObject");
    
    Check_Empty(Result);
    
    Result = OPI_YandexDisk.UploadFile(Token, Path, AndVF, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "UploadFile");
    
    Check_Empty(Result);
    OPI_Tools.Pause(5);
    
    Result = OPI_YandexDisk.DeleteObject(Token, Path, False); 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteObject");
    
    Check_Empty(Result);   

    DeleteFiles(AndVF);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure YDisk_CreateObjectCopy() Export
 
    Token           = OPI_GetTestData.GetParameter("YandexDisk_Token");
    OriginalPath   = "/" + String(New UniqueIdentifier) + ".png";
    CopyPath       = "/" + String(New UniqueIdentifier) + ".png";
    URL             = "https://raw.githubusercontent.com/Bayselonarrend/"
        + "OpenIntegrations/main/Media/logo.png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(5);
      
    Result = OPI_YandexDisk.CreateObjectCopy(Token, OriginalPath, CopyPath, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateObjectCopy");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["type"]).Equal("file");
    OPI_GetTestData.ExpectsThat(Result["path"]).Equal("disk:" + CopyPath);

     OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
     OPI_YandexDisk.DeleteObject(Token, CopyPath, False);
     
     OPI_Tools.Pause(5);
     
EndProcedure

Procedure YDisk_GetDownloadLink() Export
 
    Token = OPI_GetTestData.GetParameter("YandexDisk_Token");
    Path  = "/" + String(New UniqueIdentifier) + ".png";
    URL   = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";

    OPI_YandexDisk.UploadFileByURL(Token, Path, URL);
    OPI_Tools.Pause(5);
       
    Result = OPI_YandexDisk.GetDownloadLink(Token, Path);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetDownloadLink");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["method"]).Equal("GET");
    OPI_GetTestData.ExpectsThat(Result["href"]).HasType("String").Filled();
    
    URL = Result["href"];
    
    Result = OPI_YandexDisk.DownloadFile(Token, Path);
    
    OPI_GetTestData.ExpectsThat(Result).HasType("BinaryData").Filled();

    OPI_YandexDisk.DeleteObject(Token, Path, False);

EndProcedure

Procedure YDisk_GetFileList() Export
 
    Token = OPI_GetTestData.GetParameter("YandexDisk_Token");
    Quantity = 2;
    Indent     = 1;
    
    Result = OPI_YandexDisk.GetFilesList(Token, Quantity, Indent, "image");
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetFilesList");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["limit"]).Equal(Quantity);
    OPI_GetTestData.ExpectsThat(Result["offset"]).Equal(Indent);
    OPI_GetTestData.ExpectsThat(Result["items"]).HasType("Array");
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure YDisk_MoveObject() Export
 
    Token           = OPI_GetTestData.GetParameter("YandexDisk_Token");
    OriginalPath   = "/" + String(New UniqueIdentifier) + ".png";
    CopyPath       = "/" + String(New UniqueIdentifier) + ".png";
    URL             = "https://raw.githubusercontent.com/Bayselonarrend/"
        + "OpenIntegrations/main/Media/logo.png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(15);
      
    Result = OPI_YandexDisk.MoveObject(Token, OriginalPath, CopyPath, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "MoveObject");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["type"]).Equal("file");
    OPI_GetTestData.ExpectsThat(Result["path"]).Equal("disk:" + CopyPath);

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
    OPI_YandexDisk.DeleteObject(Token, CopyPath, False);
    
    OPI_Tools.Pause(5);
     
EndProcedure

Procedure YDisk_PublicObjectActions() Export
 
    PUrl         = "public_url";
    Match = "Match";
    Token        = OPI_GetTestData.GetParameter("YandexDisk_Token");
    Path         = "/" + String(New UniqueIdentifier) + ".png";
    URL          = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";
    
    OPI_YandexDisk.UploadFileByURL(Token, Path, URL);
    OPI_Tools.Pause(5);
    
    ResultArray = New Array;
    
    ResultArray.Add(OPI_YandexDisk.PublishObject(Token, Path)); 
    PublicURL      = ResultArray[0][PUrl];
    
    Result  = OPI_YandexDisk.GetDownloadLinkForPublicObject(Token, PublicURL);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetDownloadLinkForPublicObject");
              
    OPI_GetTestData.ExpectsThat(Result).HasType(Match).Filled();
    OPI_GetTestData.ExpectsThat(Result["method"]).Equal("GET");
    OPI_GetTestData.ExpectsThat(Result["href"]).HasType("String").Filled();
    
    Result   = OPI_YandexDisk.GetPublicObject(Token, PublicURL);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetPublicObject");
    
    OPI_GetTestData.ExpectsThat(Result).HasType(Match).Filled();
    OPI_GetTestData.ExpectsThat(Result["type"]).Equal("file");
    OPI_GetTestData.ExpectsThat(Result["path"]).Equal("/");
    
    ResultArray.Add(OPI_YandexDisk.SavePublicObjectToDisk(Token, PublicURL));
                
    ResultArray.Add(OPI_YandexDisk.CancelObjectPublication(Token, Path));
    
    Counter = 0;
    For Each Result Of ResultArray Loop
        
        // !OInt OPI_GetTestData.WriteLog(Result, "PublicationChange");
            
        OPI_GetTestData.ExpectsThat(Result).HasType(Match).Filled();
        OPI_GetTestData.ExpectsThat(Result["type"]).Equal("file");
        OPI_GetTestData.ExpectsThat(Result["path"]).Filled();
            
        If Counter = 0 Then   
            OPI_GetTestData.ExpectsThat(Result[PUrl]).HasType("String").Filled();
        Otherwise
            OPI_GetTestData.ExpectsThat(Result[PUrl]).HasType("Undefined");
        EndIf;
        
        Counter = Counter + 1;
        
    EndOfLoop;
     
    OPI_YandexDisk.DeleteObject(Token, Path, False);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure YDisk_GetPublishedList() Export
 
    Token = OPI_GetTestData.GetParameter("YandexDisk_Token");
    Quantity = 2;
    Indent     = 1;
    
    Result = OPI_YandexDisk.GetPublishedObjectsList(Token, Quantity, Indent);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetPublishedObjectsList");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["limit"]).Equal(Quantity);
    OPI_GetTestData.ExpectsThat(Result["offset"]).Equal(Indent);
    OPI_GetTestData.ExpectsThat(Result["items"]).HasType("Array");
    
    OPI_Tools.Pause(5);
    
EndProcedure

#EndRegion

#Region Viber

Procedure Viber_GetChannelInfo() Export
 
    Token     = OPI_GetTestData.GetParameter("Viber_ChannelToken");    
    Result = OPI_Viber.GetChannelInformation(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetChannelInformation");
        
    Check_ViberOk(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_GetUserData() Export
 
    Token        = OPI_GetTestData.GetParameter("Viber_ChannelToken"); 
    User = OPI_GetTestData.GetParameter("Viber_ChannelAdminID");
    Result    = OPI_Viber.GetUserData(Token, User);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetUserData");
        
    OPI_GetTestData.ExpectsThat(Result["chat_hostname"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["status_message"]).Filled();
    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_GetOnlineUsers() Export
 
    Token        = OPI_GetTestData.GetParameter("Viber_ChannelToken"); 
    User = OPI_GetTestData.GetParameter("Viber_UserID");
    Result    = OPI_Viber.GetOnlineUsers(Token, User);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetOnlineUsers");
        
    OPI_GetTestData.ExpectsThat(Result["users"]).HasType("Array");
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_SendTextMessage() Export
 
    Text         = "TestMessage";
    ChannelToken    = OPI_GetTestData.GetParameter("Viber_ChannelToken");
    BotToken     = OPI_GetTestData.GetParameter("Viber_Token");   
    User  = OPI_GetTestData.GetParameter("Viber_UserID");
    Administrator = OPI_GetTestData.GetParameter("Viber_ChannelAdminID");
    
    ButtonArray  = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");
    
    Keyboard = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);
 
    Result  = OPI_Viber.SendTextMessage(BotToken, Text, User, False, Keyboard);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendTextMessage");
    
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    Result  = OPI_Viber.SendTextMessage(ChannelToken, Text, Administrator, True, Keyboard);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendTextMessage");
    
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendImage() Export

    Text         = "TestMessage";
    Image      = OPI_GetTestData.GetParameter("Picture");
    ChannelToken    = OPI_GetTestData.GetParameter("Viber_ChannelToken");
    BotToken     = OPI_GetTestData.GetParameter("Viber_Token");   
    User  = OPI_GetTestData.GetParameter("Viber_UserID");
    Administrator = OPI_GetTestData.GetParameter("Viber_ChannelAdminID");
     
    Result  = OPI_Viber.SendImage(BotToken, Image, User, False, Text);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendImage");
    
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    Result  = OPI_Viber.SendImage(ChannelToken, Image, Administrator, True, Text);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendImage");
        
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendFile() Export
  
    Document      = OPI_GetTestData.GetParameter("Document");
    ChannelToken    = OPI_GetTestData.GetParameter("Viber_ChannelToken");
    BotToken     = OPI_GetTestData.GetParameter("Viber_Token");   
    User  = OPI_GetTestData.GetParameter("Viber_UserID");
    Administrator = OPI_GetTestData.GetParameter("Viber_ChannelAdminID");
       
    Result  = OPI_Viber.SendFile(BotToken, Document, User, False, "docx");
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendFile");
    
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    Result  = OPI_Viber.SendFile(ChannelToken, Document, Administrator, True, "docx");
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendFile");
        
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendContact() Export
 
    Name           = "Petr Petrov";
    Phone       = "+123456789";
    ChannelToken    = OPI_GetTestData.GetParameter("Viber_ChannelToken");
    BotToken     = OPI_GetTestData.GetParameter("Viber_Token");   
    User  = OPI_GetTestData.GetParameter("Viber_UserID");
    Administrator = OPI_GetTestData.GetParameter("Viber_ChannelAdminID");
         
    Result  = OPI_Viber.SendContact(BotToken, Name, Phone, User, False);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendContact");
    
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    Result  = OPI_Viber.SendContact(ChannelToken, Name, Phone, Administrator, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendContact");
        
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendLocation() Export

    Latitude        = "48.87373649724122";
    Longitude       = "2.2954639195323967";
    ChannelToken    = OPI_GetTestData.GetParameter("Viber_ChannelToken");
    BotToken     = OPI_GetTestData.GetParameter("Viber_Token");   
    User  = OPI_GetTestData.GetParameter("Viber_UserID");
    Administrator = OPI_GetTestData.GetParameter("Viber_ChannelAdminID");
         
    Result  = OPI_Viber.SendLocation(BotToken, Latitude, Longitude, User, False);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendLocation");
    
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    Result  = OPI_Viber.SendLocation(ChannelToken, Latitude, Longitude, Administrator, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendLocation");
        
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendLink() Export

    URL           = "https://github.com/Bayselonarrend/OpenIntegrations";
    ChannelToken    = OPI_GetTestData.GetParameter("Viber_ChannelToken");
    BotToken     = OPI_GetTestData.GetParameter("Viber_Token");   
    User  = OPI_GetTestData.GetParameter("Viber_UserID");
    Administrator = OPI_GetTestData.GetParameter("Viber_ChannelAdminID");
         
    Result  = OPI_Viber.SendLink(BotToken, URL, User, False);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendLink");
    
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    Result  = OPI_Viber.SendLink(ChannelToken, URL, Administrator, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendLink");
        
    OPI_GetTestData.ExpectsThat(Result["message_token"]).Filled();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure GV_GetAuthorizationLink() Export
 
    ClientID  = OPI_GetTestData.GetParameter("Google_ClientID");    
    Result = OPI_GoogleWorkspace.FormCodeRetrievalLink(ClientID);
            
    OPI_GetTestData.ExpectsThat(Result)
        .HasType("String") 
        .Filled();
        
    OPI_GetTestData.WriteParameter("Google_Link", Result);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure GV_GetToken() Export
 
    ClientID      = OPI_GetTestData.GetParameter("Google_ClientID");
    ClientSecret  = OPI_GetTestData.GetParameter("Google_ClientSecret");
    Code          = OPI_GetTestData.GetParameter("Google_Code");
    
    Result = OPI_GoogleWorkspace.GetTokenByCode(ClientID, ClientSecret, Code);
           
    If ValueFilled(Result["access_token"])
        And ValueFilled(Result["refresh_token"]) Then
        
        OPI_GetTestData.WriteParameter("Google_Token"  , Result["access_token"]);
        OPI_GetTestData.WriteParameter("Google_Refresh", Result["refresh_token"]);
    
    EndIf;
    
    OPI_Tools.Pause(5);
      
EndProcedure

Procedure GV_UpdateToken() Export
 
    ClientID      = OPI_GetTestData.GetParameter("Google_ClientID");
    ClientSecret  = OPI_GetTestData.GetParameter("Google_ClientSecret");
    RefreshToken  = OPI_GetTestData.GetParameter("Google_Refresh");
    
    Result = OPI_GoogleWorkspace.RefreshToken(ClientID, ClientSecret, RefreshToken);
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match");                
    OPI_GetTestData.ExpectsThat(Result["access_token"]).Filled();
    
    OPI_GetTestData.WriteParameter("Google_Token", Result["access_token"]);
    
    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleCalendar

Procedure GC_GetCalendarList() Export
 
    Token     = OPI_GetTestData.GetParameter("Google_Token");    
    Result = OPI_GoogleCalendar.GetCalendarList(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetCalendarList");
    
    OPI_GetTestData.ExpectsThat(Result)
        .HasType("Array");

    OPI_Tools.Pause(5);
            
EndProcedure

Procedure GC_CreateDeleteCalendar() Export
 
    Token                   = OPI_GetTestData.GetParameter("Google_Token"); 
    Name            = "TestCalendar";
    Description                = "TestDescription";
    EditedName  = Name + " (fromм.)";
    TypeMatch         = Type("Match");
    TypeString               = Type("String");
    Summary                 = "summary";
    Black                  = "#000000";
    Yellow                  = "#ffd800";
    
    Result = OPI_GoogleCalendar.CreateCalendar(Token, Name); 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateCalendar");
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch); 
    OPI_GetTestData.ExpectsThat(Result[Summary]).Equal(Name);
    OPI_GetTestData.ExpectsThat(Result["id"]).HasType(TypeString).Filled();
        
    Calendar = Result["id"];
    
    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token
        , Calendar
        , EditedName
        , Description);
        
    // !OInt OPI_GetTestData.WriteLog(Result, "EditCalendarMetadata");
    
    Check_GKObject(Result, EditedName, Description);
        
    Result = OPI_GoogleCalendar.GetCalendarMetadata(Token, Calendar);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetCalendarMetadata");  
    
    Check_GKObject(Result, EditedName, Description);

    Result = OPI_GoogleCalendar.AddCalendarToList(Token, Calendar);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "AddCalendarToList");
    
    Check_GKObject(Result, EditedName, Description);
    
    Result = OPI_GoogleCalendar.EditListCalendar(Token, Calendar, Black, Yellow, False);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditListCalendar");
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch); 
    OPI_GetTestData.ExpectsThat(Result[Summary]).Equal(EditedName);
    OPI_GetTestData.ExpectsThat(Result["foregroundColor"]).Equal(Black);
    OPI_GetTestData.ExpectsThat(Result["backgroundColor"]).Equal(Yellow);
        
    Result = OPI_GoogleCalendar.GetListCalendar(Token, Calendar);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetListCalendar");
    
    OPI_GetTestData.ExpectsThat(Result).HasType(TypeMatch); 
    OPI_GetTestData.ExpectsThat(Result[Summary]).Equal(EditedName);
    OPI_GetTestData.ExpectsThat(Result["foregroundColor"]).Equal(Black);
    OPI_GetTestData.ExpectsThat(Result["backgroundColor"]).Equal(Yellow);

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ClearMainCalendar");
    
    Check_Empty(Result);
    
    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteCalendarFromList");
    
    Check_Empty(Result);
    
    Result = OPI_GoogleCalendar.DeleteCalendar(Token, Calendar);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteCalendar");
    
    Check_Empty(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure GC_CreateDeleteEvent() Export
 
    CurrentDate     = OPI_Tools.GetCurrentDate();
    Token           = OPI_GetTestData.GetParameter("Google_Token"); 
    Calendar       = OPI_GetTestData.GetParameter("Google_CalendarID");
    Name    = "New event";
    Description        = "TestEventDescription";
    EditedDescription     = "TestEventDescription (fromм.)";
    UID             = "id";
    Hour             = 3600;

    Attachments        = New Match;
    
    Attachments.Insert("Image1"
        , "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png");
    Attachments.Insert("Image2"
        , "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1");
    
    EventMatch = New Match;
    EventMatch.Insert("Description"                 , Description);
    EventMatch.Insert("Title"                , Name);
    EventMatch.Insert("Venue"          , "InOffice");
    EventMatch.Insert("StartDate"               , CurrentDate);
    EventMatch.Insert("EndDate"            , EventMatch["StartDate"] + Hour);
    EventMatch.Insert("ArrayOfAttachmentURLs"  , Attachments);
    EventMatch.Insert("SendNotifications"    , True);
    
    Result = OPI_GoogleCalendar.CreateEvent(Token, Calendar, EventMatch);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateEvent");
    
    Event   = Result[UID];
    
    Check_GKObject(Result, Name, Description);
      
    EventMatch = New Match;  
    EventMatch.Insert("Description", EditedDescription);
    
    Result = OPI_GoogleCalendar.EditEvent(Token, Calendar, EventMatch, Event);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditEvent");
    
    Check_GKObject(Result, Name, EditedDescription);
        
    Result = OPI_GoogleCalendar.GetEvent(Token, Calendar, Event);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetEvent");
    
    Check_GKObject(Result, Name, EditedDescription);

    Result = OPI_GoogleCalendar.MoveEvent(Token, Calendar, Calendar, Event);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "MoveEvent");
    
    Check_GKObject(Result, Name, EditedDescription);
  
    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event); 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteEvent");
       
    Check_Empty(Result);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure GC_GetEventList() Export
 
    Token     = OPI_GetTestData.GetParameter("Google_Token");    
    Calendar = OPI_GetTestData.GetParameter("Google_CalendarID");

    Result = OPI_GoogleCalendar.GetEventList(Token, Calendar);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetEventList");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Array");
    
    OPI_Tools.Pause(5);
        
EndProcedure

#EndRegion

#Region GoogleDrive

Procedure GD_GetCatalogList() Export
 
    MimeType  = "mimeType";
    Name      = "name";
    Name       = "TestFolder";
    Token     = OPI_GetTestData.GetParameter("Google_Token");
    Result = OPI_GoogleDrive.GetDirectoriesList(Token, Name, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetDirectoriesList");
    
    Result = Result[0];
    
    OPI_GetTestData.ExpectsThat(Result["files"]).HasType("Array");
    OPI_GetTestData.ExpectsThat(Result[MimeType]).Equal("application/vnd.google-apps.folder");
    OPI_GetTestData.ExpectsThat(Result[Name]).Filled();
    
    OPI_Tools.Pause(5);
    Identifier = Result["id"];
    
    OPI_GetTestData.WriteParameter("GD_Catalog", Identifier);
    
    Result   = OPI_GoogleDrive.GetObjectInformation(Token, Identifier);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetObjectInformation");
    
    OPI_GetTestData.ExpectsThat(Result[MimeType]).Equal("application/vnd.google-apps.folder");
    OPI_GetTestData.ExpectsThat(Result[Name]).Filled();
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure GD_UploadDeleteFile() Export
 
    ExtraBytes = 2;
    
    Kind      = "kind";
    Content   = "content";
    MIME      = "MIME";
    MimeType  = "mimeType";
    Name      = "name";
    Id_       = "id";
    
    ArrayOfDeletions = New Array;
    Token           = OPI_GetTestData.GetParameter("Google_Token");
    Image        = OPI_GetTestData.GetBinary("Picture");
    ReplacementImage  = OPI_GetTestData.GetBinary("Picture2");
    Directory         = OPI_GetTestData.GetParameter("GD_Catalog");
    
    Description = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);
   
    Result = OPI_GoogleDrive.UploadFile(Token, Image, Description);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "UploadFile");
    
    OPI_GetTestData.ExpectsThat(Result[MimeType]).Equal(Description[MIME]);
    OPI_GetTestData.ExpectsThat(Result[Name]).Equal(Description["Name"]);

    Identifier = Result[Id_];
    ArrayOfDeletions.Add(Identifier);
    
    NewName  = "CopiedFile.jpeg";
    Result = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, "root");
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CopyObject");
    
    OPI_Tools.Pause(5);
    
    OPI_GetTestData.ExpectsThat(Result[MimeType]).Equal(Description[MIME]);
    OPI_GetTestData.ExpectsThat(Result[Name]).Equal(NewName);
       
    ArrayOfDeletions.Add(Result[Id_]);
    
    Result = OPI_GoogleDrive.DownloadFile(Token, Identifier);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DownloadFile");
    
    OPI_GetTestData.ExpectsThat(Result.Size()).Equal(Image.Size() + ExtraBytes);
    OPI_Tools.Pause(5);
    
    NewName  = "UpdatedFile.jpg";
    Result = OPI_GoogleDrive.UpdateFile(Token, Identifier, ReplacementImage, NewName);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "UpdateFile");
    
    OPI_GetTestData.ExpectsThat(Result[MimeType]).Equal(Description[MIME]);
    OPI_GetTestData.ExpectsThat(Result[Name]).Equal(NewName);

    OPI_Tools.Pause(5);
    
    Comment = "Yo";
    Result   = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateComment");
  
    OPI_GetTestData.ExpectsThat(Result[Content]).Equal(Comment);
    OPI_GetTestData.ExpectsThat(Result[Kind]).Equal("drive#comment");
    
    OPI_Tools.Pause(5);
     
    For Each Deletable Of ArrayOfDeletions Loop
        Result = OPI_GoogleDrive.DeleteObject(Token, Deletable);    
        
        // !OInt OPI_GetTestData.WriteLog(Result, "DeleteObject");
      
        OPI_GetTestData.ExpectsThat(ValueFilled(Result)).Equal(False);
        OPI_Tools.Pause(2);
    EndOfLoop;
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure GD_CreateDeleteComment() Export
    
    Kind      = "kind";
    Content   = "content";
    Id_       = "id";
    Comments  = "comments";
    Token     = OPI_GetTestData.GetParameter("Google_Token");
    Directory   = OPI_GetTestData.GetParameter("GD_Catalog");
    Image  = OPI_GetTestData.GetBinary("Picture");
    
    Description  = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);
    
    Result     = OPI_GoogleDrive.UploadFile(Token, Image, Description);
    Identifier = Result[Id_];
    
    Comment         = "NewComment";
    ResultArray   = New Array;
    Result           = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateComment");
    
    CommentID       = Result[Id_];
    
    ResultArray.Add(Result);
    
    Result = OPI_GoogleDrive.GetComment(Token, Identifier, CommentID);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetComment");
    
    ResultArray.Add(Result);
    
    Result         = OPI_GoogleDrive.GetCommentList(Token, Identifier);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetCommentList");
    
    Comments       = Result[Comments];
    CommentObject = Comments[Comments.WithinBoundary()];
    
    ResultArray.Add(CommentObject);
    
    For Each Result Of ResultArray Loop     
        OPI_GetTestData.ExpectsThat(Result[Content]).Equal(Comment);
        OPI_GetTestData.ExpectsThat(Result[Kind]).Equal("drive#comment");
    EndOfLoop;
    
    Result = OPI_GoogleDrive.DeleteComment(Token, Identifier, CommentID);    
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteComment");
    
    OPI_GetTestData.ExpectsThat(ValueFilled(Result)).Equal(False);

    OPI_GoogleDrive.DeleteObject(Token, Identifier);
        
EndProcedure

Procedure GD_CreateCatalog() Export
    
    Name       = "name";
    Name        = "TestFolder";
    Token      = OPI_GetTestData.GetParameter("Google_Token");
    Directory    = OPI_GetTestData.GetParameter("GD_Catalog");
    
    ResultArray = New Array;
    
    ResultArray.Add(OPI_GoogleDrive.CreateFolder(Token, Name));
    ResultArray.Add(OPI_GoogleDrive.CreateFolder(Token, Name, Directory));
    
    For Each Result Of ResultArray Loop
        
        // !OInt OPI_GetTestData.WriteLog(Result, "CreateFolder");
        
        CatalogID = Result["id"];
                
        OPI_GetTestData.ExpectsThat(Result[Name]).Equal(Name);
        
        OPI_GoogleDrive.DeleteObject(Token, CatalogID);
        
    EndOfLoop;

EndProcedure

#EndRegion

#Region GoogleSheets

Procedure GT_CreateTable() Export
    
    Token        = OPI_GetTestData.GetParameter("Google_Token");
    Name = "TestTable";
    
    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");
    
    Result = OPI_GoogleSheets.CreateBook(Token, Name, SheetArray);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateBook");
    
    OPI_GetTestData.ExpectsThat(Result["properties"]["title"]).Equal(Name);

    For N = 0 by SheetArray.WithinBoundary() Loop
        
        SheetName = Result["sheets"][N]["properties"]["title"];
        OPI_GetTestData.ExpectsThat(SheetName).Equal(SheetArray[N]);
        Sheet = Result["sheets"][N]["properties"]["sheetId"];
        Sheet = OPI_Tools.NumberToString(Sheet);
        
    EndOfLoop;
    
    Book   = Result["spreadsheetId"];
    
    OPI_GetTestData.WriteParameter("GS_Spreadsheet", Book);
    OPI_GetTestData.WriteParameter("GS_Sheet"      , Sheet);
    
    Result = OPI_GoogleSheets.CreateBook(Token, Name, SheetArray);
    Book2  = Result["spreadsheetId"];
    
    Result = OPI_GoogleSheets.CopySheet(Token, Book, Book2, Sheet);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CopySheet");

    OPI_GetTestData.ExpectsThat(Result["title"]).Equal(SheetName + " (toопия)");
    
    Name = "TestSheet";
        
    Result = OPI_GoogleSheets.AddSheet(Token, Book, Name);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "AddSheet");

    NewSheet = Result["replies"][0]["addSheet"]["properties"]["sheetId"];
    NewSheet = OPI_Tools.NumberToString(NewSheet);
    
    OPI_GetTestData.ExpectsThat(Result["spreadsheetId"]).Equal(Book); 

    Result = OPI_GoogleSheets.DeleteSheet(Token, Book, NewSheet);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteSheet");
    
    OPI_GetTestData.ExpectsThat(Result["spreadsheetId"]).Equal(Book);
    
    Name = "TestTable (fromм.)";
    
    Result    = OPI_GoogleSheets.EditBookTitle(Token, Book, Name);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditBookTitle");
    
    OPI_GetTestData.ExpectsThat(Result["spreadsheetId"]).Equal(Book);
    
EndProcedure

Procedure GT_GetTable() Export
    
    Token        = OPI_GetTestData.GetParameter("Google_Token");
    Book        = OPI_GetTestData.GetParameter("GS_Spreadsheet");
    Name = "TestTable (fromм.)";

    Result = OPI_GoogleSheets.GetBook(Token, Book);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetTable");
    
    OPI_GetTestData.ExpectsThat(Result["properties"]["title"]).Equal(Name);

EndProcedure

Procedure GT_FillClearCells() Export
    
    Token        = OPI_GetTestData.GetParameter("Google_Token");
    Book        = OPI_GetTestData.GetParameter("GS_Spreadsheet");
    Sheet         = "Sheet2";

    CellStructure = New Match;
    CellStructure.Insert("A1", "ThisIsA1");
    CellStructure.Insert("A2", "ThisIsA2");
    CellStructure.Insert("B2", "ThisIsB2");
    CellStructure.Insert("B3", "ThisIsB3");
    CellStructure.Insert("A3", "ThisIsA3");
    CellStructure.Insert("A4", "ThisIsA4");
    CellStructure.Insert("B1", "ThisIsB1");
    CellStructure.Insert("B4", "ThisIsB4");
    
    Cell array = New Array;
    Cell array.Add("B2");
    Cell array.Add("A3");
    Cell array.Add("B4");

    Result = OPI_GoogleSheets.SetCellValues(Token, Book, CellStructure, Sheet);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SetCellValues");
    
    OPI_GetTestData.ExpectsThat(Result["spreadsheetId"]).Equal(Book);
    OPI_GetTestData.ExpectsThat(Result["totalUpdatedCells"]).Equal(CellStructure.Quantity());
    
    Result = OPI_GoogleSheets.GetCellValues(Token, Book, Cell array, Sheet);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetCellValues");
    
    OPI_GetTestData.ExpectsThat(Result["spreadsheetId"]).Equal(Book);
    OPI_GetTestData.ExpectsThat(Result["valueRanges"].Quantity()).Equal(Cell array.Quantity());
    
    Result = OPI_GoogleSheets.GetCellValues(Token, Book, , Sheet);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetCellValues");
    
    OPI_GetTestData.ExpectsThat(Result["spreadsheetId"]).Equal(Book);
    
    Cell array = New Array;
    Cell array.Add("B2");
    Cell array.Add("A3");
    Cell array.Add("B4");

    Result = OPI_GoogleSheets.ClearCells(Token, Book, Cell array, Sheet);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ClearCells");
    
    OPI_GetTestData.ExpectsThat(Result["spreadsheetId"]).Equal(Book);
    OPI_GetTestData.ExpectsThat(Result["clearedRanges"].Quantity()).Equal(Cell array.Quantity());

EndProcedure

#EndRegion

#Region Twitter

Procedure Twitter_GetAuthorizationLink() Export
 
    Parameters = GetTwitterParameters();
    Result = OPI_Twitter.GetAuthorizationLink(Parameters);
    
    OPI_GetTestData.ExpectsThat(Result).HasType("String").Filled();
    
    OPI_GetTestData.WriteParameter("Twitter_URL", Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Twitter_UpdateToken() Export
 
    Parameters = GetTwitterParameters();
    Result = OPI_Twitter.RefreshToken(Parameters);
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["access_token"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["refresh_token"]).Filled();
        
    Refresh = Result["refresh_token"];
    Token  = Result["access_token"];
    
    If ValueFilled(Refresh) And Not Refresh = "null" Then   
        OPI_GetTestData.WriteParameter("Twitter_Refresh", Refresh);
    EndIf;
    
    If ValueFilled(Token) And Not Token = "null" Then
        OPI_GetTestData.WriteParameter("Twitter_Token"  , Token);
    EndIf;
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Twitter_CreateTextTweet() Export
 
    Parameters = GetTwitterParameters();
    Text     = "TestTweet" + String(New UniqueIdentifier);
    
    Result = OPI_Twitter.CreateTextTweet(Text, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateTextTweet");
    
    Check_TwitterText(Result, Text);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Twitter_CreateTweetWithImage() Export
 
    Parameters = GetTwitterParameters();
    Text     = "TestTweet" + String(New UniqueIdentifier);
    Image  = OPI_GetTestData.GetBinary("Picture");
    AndVF       = GetTempFileName("png");
    Image.Write(AndVF);
   
    Result = OPI_Twitter.Create image tweet(Text, Image, Parameters); 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "Create image tweet");
    
    Check_TwitterText(Result, Text);    
    
    Result = OPI_Twitter.Create image tweet(Text, AndVF, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "Create image tweet");
    
    Check_TwitterText(Result, Text);
    
    DeleteFiles(AndVF);
    
    OPI_Tools.Pause(20);
    
EndProcedure

Procedure Twitter_CreateTweetWithVideo() Export
 
    Parameters = GetTwitterParameters();
    Text     = "TestTweet" + String(New UniqueIdentifier);
    Video     = OPI_GetTestData.GetBinary("Video");
    AndVF       = GetTempFileName("mp4");
    Video.Write(AndVF);
   
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);    
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateVideoTweet");
    
    Check_TwitterText(Result, Text);    
    
    Result = OPI_Twitter.CreateVideoTweet(Text, AndVF, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateVideoTweet");
    
    Check_TwitterText(Result, Text);
    
    DeleteFiles(AndVF);
    
    OPI_Tools.Pause(20);
    
EndProcedure

Procedure Twitter_CreateTweetWithGif() Export
 
    Parameters = GetTwitterParameters();
    Text     = "TestTweet" + String(New UniqueIdentifier);
    GIF     = OPI_GetTestData.GetBinary("GIF");
    AndVF       = GetTempFileName("gif");
    GIF.Write(AndVF);
   
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);   
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateGifTweet");
     
    Check_TwitterText(Result, Text);    
    
    Result = OPI_Twitter.CreateGifTweet(Text, AndVF, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateGifTweet");
    
    Check_TwitterText(Result, Text);
    
    DeleteFiles(AndVF);
    
    OPI_Tools.Pause(20);
    
EndProcedure

Procedure Twitter_CreateTweetWithPoll() Export
 
    Parameters       = GetTwitterParameters();
    Text           = "TestTweet" + String(New UniqueIdentifier);
    AnswersArray   = New Array;
    AnswersArray.Add("Option 1");
    AnswersArray.Add("Option 2");
   
    Result = OPI_Twitter.CreatePollTweet(Text, AnswersArray, 60, Parameters);
 
    // !OInt OPI_GetTestData.WriteLog(Result, "CreatePollTweet");
    
    Check_TwitterText(Result, Text);
    
    OPI_Tools.Pause(20);
    
EndProcedure

#EndRegion

#Region Notion

Procedure Notion_CreatePage() Export
	
	Token     = OPI_GetTestData.GetParameter("Notion_Token");
	Parent  = OPI_GetTestData.GetParameter("Notion_Parent");
	Title = "TestTitle";
	 
	Result = OPI_Notion.CreatePage(Token, Parent, Title);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "CreatePage");
    
    Check_NotionObject(Result);

EndProcedure

Procedure Notion_CreateEditDatabase() Export
	
	Token     = OPI_GetTestData.GetParameter("Notion_Token");
	Parent  = OPI_GetTestData.GetParameter("Notion_Parent");
	Title = "TestTitle";
	
	Properties = New Match;
	Properties.Insert("Name"            , "title");
	Properties.Insert("Description"       , "rich_text");
	Properties.Insert("Number"          , "number");
	Properties.Insert("Status"         , "status");
	Properties.Insert("CreationDate"  , "date");
	Properties.Insert("Image"       , "files");
	Properties.Insert("Active"        , "checkbox");
	Properties.Insert("Website"           , "url");
	Properties.Insert("Email"          , "email");
	Properties.Insert("Phone"        , "phone_number");
	Properties.Insert("User"   , "people");
	
	ValueSelection = New Match;
	ValueSelection.Insert("New", "green");
	ValueSelection.Insert("InProgress", "yellow");
	ValueSelection.Insert("Remote", "red");
	Properties.Insert("Status", ValueSelection);
	
	Result = OPI_Notion.CreateDatabase(Token, Parent, Title, Properties); 
	
	// !OInt OPI_GetTestData.WriteLog(Result, "CreateDatabase");
    
    Check_NotionObject(Result, "database");
    
    Base      = Result["id"];
    Title = "TestTitle";
	Description  = "TestDescription";
	
	Properties = New Match;
	Properties.Insert("Email", "rich_text"); // Type fields "Email" will changed with email to text
	Properties.Insert("Website");               // Field "Website" will deleted
	
	Result = OPI_Notion.EditDatabaseProperties(Token, Base, Properties, Title, Description);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "EditDatabaseProperties");
    
    Check_NotionObject(Result, "database");

EndProcedure

Procedure Notion_GetPageInfo() Export
	
	Token     = OPI_GetTestData.GetParameter("Notion_Token");
	Page  = OPI_GetTestData.GetParameter("Notion_Page");
	
	Result = OPI_Notion.GetPage(Token, Page);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "GetPage");
    
    Check_NotionObject(Result);	
    
EndProcedure

Procedure Notion_GetDatabaseInfo() Export

	Token     = OPI_GetTestData.GetParameter("Notion_Token");
	Base      = OPI_GetTestData.GetParameter("Notion_Base");
		
	Result = OPI_Notion.GetDatabase(Token, Base);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "GetDatabase");
    
    Check_NotionObject(Result, "database");
    
EndProcedure

Procedure Notion_CreatePageInDatabase() Export
	
	Token = OPI_GetTestData.GetParameter("Notion_Token");
	Base  = OPI_GetTestData.GetParameter("Notion_Base");
	
	Image = New Match;
	Image.Insert("Logo", OPI_GetTestData.GetParameter("Picture"));
	
	Properties = New Match;
	Properties.Insert("Name"            , "LLC Vector");
	Properties.Insert("Description"       , "OurFirstClient");
	Properties.Insert("Number"          , 1);
	Properties.Insert("Status"         , "Regular");
	Properties.Insert("CreationDate"  , OPI_Tools.GetCurrentDate());
	Properties.Insert("Image"       , Image);
	Properties.Insert("Active"        , True);
	Properties.Insert("Website"           , "https://vector.ru");
	Properties.Insert("Email"          , "mail@vector.ru");
	Properties.Insert("Phone"        , "88005553535");
	Properties.Insert("Status"	       , "New");
	
	Result = OPI_Notion.CreatePageInDatabase(Token, Base, Properties);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "CreatePageInDatabase");
    
    Check_NotionObject(Result);
    
    Parent = StringReplace(Result["parent"]["database_id"], "-", "");
    OPI_GetTestData.ExpectsThat(Parent).Equal(Base);
       	 
EndProcedure

Procedure Notion_EditPageProperties() Export
	
	Token        = OPI_GetTestData.GetParameter("Notion_Token");
	Page     = OPI_GetTestData.GetParameter("Notion_Page");
	Icon       = OPI_GetTestData.GetParameter("Picture");
	Cover      = OPI_GetTestData.GetParameter("Picture2");
	Archive = False;
	
	Properties = New Match;
	Properties.Insert("Active"     , False);
	Properties.Insert("Email"       , "vector@mail.ru");
	
	Result = OPI_Notion.EditPageProperties(Token
		, Page
		, Properties
		, Icon
		, Cover
		, Archive);
          
	// !OInt OPI_GetTestData.WriteLog(Result, "EditPageProperties");
    
    Check_NotionObject(Result);
    
EndProcedure

Procedure Notion_CreateDeleteBlock() Export
	
	Token     = OPI_GetTestData.GetParameter("Notion_Token");
	Parent  = OPI_GetTestData.GetParameter("Notion_Parent");
	Block      = OPI_GetTestData.GetParameter("Notion_Block");
	
	Result = OPI_Notion.ReturnBlock(Token, Block);	
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ReturnBlock");
    
    Check_NotionObject(Result, "block");
    
	Result = OPI_Notion.CreateBlock(Token, Parent, Result);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "CreateBlock");
    
    Check_NotionObject(Result, "list");
    
    Block      = Result["results"][0]["id"];
	Result = OPI_Notion.ReturnChildBlocks(Token, Block);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "ReturnChildBlocks");
    
    Check_NotionObject(Result, "list");
    
	Result = OPI_Notion.DeleteBlock(Token, Block);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "DeleteBlock");
    
    Check_NotionObject(Result, "block");
    
EndProcedure

Procedure Notion_GetUsers() Export
	
	Token     = OPI_GetTestData.GetParameter("Notion_Token");
	Result = OPI_Notion.UserList(Token);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "UserList");
    
    Check_NotionObject(Result, "list");
    
EndProcedure

Procedure Notion_GetUserData() Export
	
	Token        = OPI_GetTestData.GetParameter("Notion_Token");
	User = OPI_GetTestData.GetParameter("Notion_User"); 
	Result    = OPI_Notion.GetUserData(Token, User);
	
	// !OInt OPI_GetTestData.WriteLog(Result, "GetUserData");
    
    Check_NotionObject(Result, "user");
    
EndProcedure

#EndRegion

#Region Slack

Procedure Slack_GetBotInfo() Export
    
    Token     = OPI_GetTestData.GetParameter("Slack_Token");
    Result = OPI_Slack.GetBotInformation(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetBotInformation");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["bot_id"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["user_id"]).Filled();
    
EndProcedure

Procedure Slack_GetUserList() Export
    
    Token     = OPI_GetTestData.GetParameter("Slack_Token");
    Result = OPI_Slack.GetUserList(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetUserList");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["members"]).HasType("Array");
    
EndProcedure

Procedure Slack_GetRegionList() Export
    
    Token     = OPI_GetTestData.GetParameter("Slack_Token");
    Result = OPI_Slack.GetWorkspaceList(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetWorkspaceList");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["teams"]).HasType("Array");
    
EndProcedure

Procedure Slack_SendDeleteMessage() Export

    Token    = OPI_GetTestData.GetParameter("Slack_Token"); 
    Channel    = OPI_GetTestData.GetParameter("Slack_Channel");
    Text    = "TestMessage1";
    Text2   = "TestMessage2";
    Tags  = New Array;
    Image = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1";
    
    Result = OPI_Slack.SendMessage(Token, Channel, Text);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendMessage");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["channel"]).Equal(Channel);
    OPI_GetTestData.ExpectsThat(Result["ts"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["message"]["text"]).Equal(Text);
    
    Timestamp = Result["ts"];
    
    Result = OPI_Slack.EditMessage(Token, Channel, Timestamp, Text2);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditMessage");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["channel"]).Equal(Channel);
    OPI_GetTestData.ExpectsThat(Result["ts"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["message"]["text"]).Equal(Text2);
        
    Result = OPI_Slack.GetMessageReplyList(Token, Channel, Timestamp);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetMessageReplyList");
        
    OPI_GetTestData.ExpectsThat(Result["messages"]).HasType("Array");
    
    Result = OPI_Slack.GetMessageLink(Token, Channel, Timestamp);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetMessageLink");
        
    OPI_GetTestData.ExpectsThat(Result["channel"]).Equal(Channel);
    OPI_GetTestData.ExpectsThat(Result["permalink"]).Filled();
        
    Check_SlackOk(Result);
      
    Tags.Add(Timestamp);
    
    BlockArray = New Array;
    Block         = OPI_Slack.GenerateImageBlock(Image, "Yo");
    BlockArray.Add(Block);
    
    Result = OPI_Slack.SendMessage(Token, Channel, Text, , BlockArray);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendMessage (toартинtoа)");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["channel"]).Equal(Channel);
    OPI_GetTestData.ExpectsThat(Result["ts"]).Filled();
    
    Tags.Add(Result["ts"]);
    
    Block = OPI_Slack.GenerateImageBlock(Image, "Yo");
    JSONBlock = OPI_Tools.JSONString(Block);
    
    AndVF = GetTempFileName("json");
    
    TextDocument = New TextDocument();
    TextDocument.SetText(JSONBlock);
    TextDocument.Write(AndVF);
        
    Result = OPI_Slack.SendMessage(Token, Channel, Text, , AndVF);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendMessage (json)");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["channel"]).Equal(Channel);
    OPI_GetTestData.ExpectsThat(Result["ts"]).Filled();
    
    Tags.Add(Result["ts"]);
    
    Blocks = "['" + AndVF + "','" + AndVF + "']";
    Result = OPI_Slack.SendMessage(Token, Channel, Text, , Blocks);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendMessage (json маwithwithиin)");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["channel"]).Equal(Channel);
    OPI_GetTestData.ExpectsThat(Result["ts"]).Filled();
    
    Tags.Add(Result["ts"]);

    DeleteFiles(AndVF);
 
    For Each Timestamp Of Tags Loop
        
        Result = OPI_Slack.DeleteMessage(Token, Channel, Timestamp);
        
        // !OInt OPI_GetTestData.WriteLog(Result, "DeleteMessage");

        Check_SlackOk(Result);
        OPI_GetTestData.ExpectsThat(Result["channel"]).Equal(Channel);
        OPI_GetTestData.ExpectsThat(Result["ts"]).Filled();
    
    EndOfLoop;
    
    Hour       = 3600;
    Day     = 24;
    Sending  = OPI_Tools.GetCurrentDate() + (Day * Hour);
    Result = OPI_Slack.SendMessage(Token, Channel, Text, Sending);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendMessage (отложенное)");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["channel"]).Equal(Channel);
    OPI_GetTestData.ExpectsThat(Result["scheduled_message_id"]).Filled();
    
    Timestamp   = Result["scheduled_message_id"];
    Result = OPI_Slack.DeleteMessage(Token, Channel, Timestamp, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteMessage");

    Check_SlackOk(Result);

EndProcedure

Procedure Slack_SendDeleteEphemeral() Export
   
    Token        = OPI_GetTestData.GetParameter("Slack_Token"); 
    Channel        = OPI_GetTestData.GetParameter("Slack_Channel");
    User = OPI_GetTestData.GetParameter("Slack_User");
    Image     = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1";
    Text        = "TestMessage1";
    
    Block      = OPI_Slack.GenerateImageBlock(Image, "Yo");
    Result = OPI_Slack.SendEphemeralMessage(Token, Channel, Text, User, Block);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendMessage");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["message_ts"]).Filled();
     
EndProcedure

Procedure Slack_GetScheduledMessages() Export
    
    Token    = OPI_GetTestData.GetParameter("Slack_Token"); 
    Channel    = OPI_GetTestData.GetParameter("Slack_Channel");
    
    Result = OPI_Slack.GetDelayedMessageList(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetDelayedMessageList");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["scheduled_messages"]).HasType("Array");
   
EndProcedure

Procedure Slack_CreateArchiveChannel() Export
    
    Token        = OPI_GetTestData.GetParameter("Slack_Token");
    User = OPI_GetTestData.GetParameter("Slack_User");
    Name          = "testconv" + String(New UniqueIdentifier);
    Topic         = "TestTopic";
    Purpose         = "TestGoal";
    
    #Region CreateChannel
    Result = OPI_Slack.CreateChannel(Token, Name);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateChannel");
    
    Data = Result["channel"];
    Channel  = Data["id"];

    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Data["name"]).Equal(Name);
    #EndRegion

    #Region SetChannelTopic
    Result = OPI_Slack.SetChannelTopic(Token, Channel, Topic);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SetChannelTopic");
    
    Data = Result["channel"];
    Channel  = Data["id"];

    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Data["name"]).Equal(Name);
    OPI_GetTestData.ExpectsThat(Data["topic"]["value"]).Equal(Topic);
    #EndRegion
    
    #Region SetChannelGoal
    Result = OPI_Slack.SetChannelGoal(Token, Channel, Purpose);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SetChannelGoal");
    
    Check_SlackOk(Result);
    #EndRegion
    
    #Region GetChannel
    Result = OPI_Slack.GetChannel(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetChannel");
    
    Data = Result["channel"];
    Channel  = Data["id"];

    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Data["name"]).Equal(Name);
    #EndRegion
    
    #Region InviteUsersToChannel
    Result = OPI_Slack.InviteUsersToChannel(Token, Channel, User);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "InviteUsersToChannel");
    
    Data = Result["channel"];
    Channel  = Data["id"];

    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Data["name"]).Equal(Name);
    #EndRegion
    
    #Region KickUserFromChannel
    Result = OPI_Slack.KickUserFromChannel(Token, Channel, User);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "KickUserFromChannel");
    
    Check_SlackOk(Result);
    #EndRegion
    
    #Region GetChannelHistory
    Result = OPI_Slack.GetChannelHistory(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetChannelHistory");
        
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["messages"]).HasType("Array");
    #EndRegion
    
    #Region GetChannelUserList
    Result = OPI_Slack.GetChannelUserList(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetChannelUserList");
        
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["members"]).HasType("Array");
    #EndRegion

    #Region LeaveChannel
    Result = OPI_Slack.LeaveChannel(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "LeaveChannel");
    
    Check_SlackOk(Result);
    #EndRegion
    
    #Region JoinChannel
    Result = OPI_Slack.JoinChannel(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "JoinChannel");
    
    Data = Result["channel"];
    Channel  = Data["id"];

    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Data["name"]).Equal(Name);
    #EndRegion
    
    #Region RenameChannel
    NewName  = "testconv" + String(New UniqueIdentifier);
    Result = OPI_Slack.RenameChannel(Token, Channel, NewName);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "RenameChannel");
    
    Data = Result["channel"];
    Channel  = Data["id"];

    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Data["name"]).Equal(NewName);
    #EndRegion
    
    #Region ArchiveChannel
    Result = OPI_Slack.ArchiveChannel(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ArchiveChannel");
    
    Check_SlackOk(Result);
    #EndRegion
    
EndProcedure

Procedure Slack_GetChannelList() Export
    
    Token = OPI_GetTestData.GetParameter("Slack_Token");
    
    Result = OPI_Slack.GetChannelList(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetChannelList");

    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["channels"]).HasType("Array");
    
EndProcedure

Procedure Slack_OpenCloseDialog() Export
    
    Token        = OPI_GetTestData.GetParameter("Slack_Token");
    User = OPI_GetTestData.GetParameter("Slack_User");
    Text        = "Yo, dude";
    
    Result = OPI_Slack.OpenDialog(Token, User);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "OpenDialog");

    Dialog = Result["channel"]["id"];
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["channel"]).HasType("Match");
    OPI_GetTestData.ExpectsThat(Dialog).Filled();
    
    Result = OPI_Slack.SendMessage(Token, Dialog, Text);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendMessage");
    
    Check_SlackOk(Result);

    Result = OPI_Slack.CloseDialog(Token, Dialog);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CloseDialog");

    Check_SlackOk(Result);

EndProcedure

Procedure Slack_GetFileList() Export
    
    Token = OPI_GetTestData.GetParameter("Slack_Token");
    Channel = OPI_GetTestData.GetParameter("Slack_Channel");
    
    Result = OPI_Slack.GetFilesList(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetFilesList");

    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["files"]).HasType("Array");

EndProcedure

Procedure Slack_UploadDeleteFile() Export
    
    Token        = OPI_GetTestData.GetParameter("Slack_Token");
    File         = OPI_GetTestData.GetBinary("Document");
    Channel        = OPI_GetTestData.GetParameter("Slack_Channel");
    ArrayOfFiles = New Array;
    FileName     = "megadoc.docx";
    Title    = "NewFile";
    
    Result = OPI_Slack.UploadFile(Token, File, FileName, Title);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "UploadFile");

    UploadedFile = Result["files"][0];
    ArrayOfFiles.Add(UploadedFile["id"]);
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(UploadedFile["name"]).Equal(FileName);
    
    Result = OPI_Slack.UploadFile(Token, File, FileName, Title, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "UploadFile (in toаtoл)");

    UploadedFile = Result["files"][0];
    ArrayOfFiles.Add(UploadedFile["id"]);
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(UploadedFile["name"]).Equal(FileName);
    
    Result = OPI_Slack.GetFileData(Token, UploadedFile["id"]);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetFile");
    
    UploadedFile = Result["file"];
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(UploadedFile["name"]).Equal(FileName);
        
    For Each UploadedFile Of ArrayOfFiles Loop
        
        Result = OPI_Slack.DeleteFile(Token, UploadedFile);
        
        // !OInt OPI_GetTestData.WriteLog(Result, "DeleteFile");
        
        Check_SlackOk(Result);
        
    EndOfLoop;

EndProcedure

Procedure Slack_GetExternalFileList() Export
    
    Token = OPI_GetTestData.GetParameter("Slack_Token");
    Channel = OPI_GetTestData.GetParameter("Slack_Channel");
    
    Result = OPI_Slack.GetExternalFileList(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetExternalFileList");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["files"]).HasType("Array");
    
    Result = OPI_Slack.GetExternalFileList(Token, Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetExternalFileList");
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(Result["files"]).HasType("Array");
    
EndProcedure

Procedure Slack_UploadDeleteExternalFile() Export
    
    Token        = OPI_GetTestData.GetParameter("Slack_Token");
    File         = OPI_GetTestData.GetParameter("Document");
    Channel        = OPI_GetTestData.GetParameter("Slack_Channel");
    Title    = "NewFile";
    
    Result = OPI_Slack.AddExternalFile(Token, File, Title);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "AddExternalFile");
    
    UploadedFile = Result["file"];
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(UploadedFile["title"]).Equal(Title);
    
    Result = OPI_Slack.GetExternalFile(Token, UploadedFile["id"]);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetExternalFile");
    
    UploadedFile = Result["file"];
    
    Check_SlackOk(Result);
    OPI_GetTestData.ExpectsThat(UploadedFile["title"]).Equal(Title);
    
    Result = OPI_Slack.SendExternalFile(Token, UploadedFile["id"], Channel);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendExternalFile");
    
    Check_SlackOk(Result);
    
    Result = OPI_Slack.DeleteExternalFile(Token, UploadedFile["id"]);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendExternalFile");
    
    Check_SlackOk(Result);
    
EndProcedure

#EndRegion

#Region Airtable

Procedure AT_CreateDatabase() Export
    
    Token        = OPI_GetTestData.GetParameter("Airtable_Token");
    Region      = OPI_GetTestData.GetParameter("Airtable_Workspace");
    Name = "TestDatabase";
    
    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    FieldArray.Add(OPI_Airtable.GetStringField("String"));
    
    TableName = "TestTable";
    
    TableMapping = New Match;
    TableMapping.Insert(TableName, FieldArray);
    
    Result = OPI_Airtable.CreateDatabase(Token, Region, Name, TableMapping);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateDatabase");
    
    OPI_GetTestData.ExpectsThat(Result["id"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["tables"][0]["name"]).Equal(TableName);
    
    Base = Result["id"];
    OPI_GetTestData.WriteParameter("Airtable_Base", Base);
    
    Result = OPI_Airtable.GetDatabaseTables(Token, Base);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetDatabaseTables");
    
    OPI_GetTestData.ExpectsThat(Result["tables"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["tables"]).HasType("Array");

    Result = OPI_Airtable.GetListOfBases(Token);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetListOfBases");
    
    OPI_GetTestData.ExpectsThat(Result["bases"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["bases"]).HasType("Array");
 
EndProcedure

Procedure AT_CreateTable() Export
    
    Token = OPI_GetTestData.GetParameter("Airtable_Token");
    Base  = OPI_GetTestData.GetParameter("Airtable_Base");
    
    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));    
    // !OInt OPI_GetTestData.WriteLog(FieldArray[0], "GetNumberField");
    
    FieldArray.Add(OPI_Airtable.GetStringField("String"));
    // !OInt OPI_GetTestData.WriteLog(FieldArray[1], "GetStringField");
    
    FieldArray.Add(OPI_Airtable.GetAttachmentField("Attachment"));
    // !OInt OPI_GetTestData.WriteLog(FieldArray[2], "GetAttachmentField");
    
    FieldArray.Add(OPI_Airtable.GetCheckboxField("Checkbox"));
    // !OInt OPI_GetTestData.WriteLog(FieldArray[3], "GetCheckboxField");
    
    FieldArray.Add(OPI_Airtable.GetDateField("Date"));
    // !OInt OPI_GetTestData.WriteLog(FieldArray[4], "GetDateField");
    
    FieldArray.Add(OPI_Airtable.GetPhoneField("Phone"));
    // !OInt OPI_GetTestData.WriteLog(FieldArray[5], "GetPhoneField");
        
    FieldArray.Add(OPI_Airtable.GetEmailField("Email"));
    // !OInt OPI_GetTestData.WriteLog(FieldArray[6], "GetEmailField");    
    
    FieldArray.Add(OPI_Airtable.GetLinkField("Link"));
    // !OInt OPI_GetTestData.WriteLog(FieldArray[7], "GetLinkField");    
    
    TableName = "TestTable2";
    Description   = "NewTable";
    
    Result = OPI_Airtable.CreateTable(Token, Base, TableName, FieldArray, Description);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateTable");
    
    OPI_GetTestData.ExpectsThat(Result["name"]).Equal(TableName);
    OPI_GetTestData.ExpectsThat(Result["description"]).Equal(Description);
    
    Table    = Result["id"];
    TableName = "TestTable2 (fromм.)";
    Description   = "NewTable (fromм.)";
   
    OPI_GetTestData.WriteParameter("Airtable_Table", Table);
    
    Result = OPI_Airtable.ModifyTable(Token, Base, Table, TableName, Description);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ModifyTable");
    
    OPI_GetTestData.ExpectsThat(Result["name"]).Equal(TableName);
    OPI_GetTestData.ExpectsThat(Result["description"]).Equal(Description);

EndProcedure

Procedure AT_CreateField() Export
    
    Token   = OPI_GetTestData.GetParameter("Airtable_Token");
    Base    = OPI_GetTestData.GetParameter("Airtable_Base");
    Table = OPI_GetTestData.GetParameter("Airtable_Table");
    Name     = String(New UniqueIdentifier);
    
    Field = OPI_Airtable.GetNumberField(Name);
    
    Result = OPI_Airtable.CreateField(Token, Base, Table, Field);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateField");
    
    OPI_GetTestData.ExpectsThat(Result["name"]).Equal(Name);
    
    Field      = Result["id"]; 
    Name       = Name + "(fromм.)";
    Description  = "New description";
    
    Result = OPI_Airtable.ModifyField(Token, Base, Table, Field, Name, Description);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ModifyField");
    
    OPI_GetTestData.ExpectsThat(Result["name"]).Equal(Name);
    OPI_GetTestData.ExpectsThat(Result["description"]).Equal(Description);
    
EndProcedure

Procedure AT_CreateDeleteRecords() Export

    Token   = OPI_GetTestData.GetParameter("Airtable_Token");
    Base    = OPI_GetTestData.GetParameter("Airtable_Base");
    Table = OPI_GetTestData.GetParameter("Airtable_Table");
    
    Numeric = 10;
    StringType = "Hello";
    
    RowDescription1 = New Structure("Number,String", Numeric, StringType);
    RowDescription2 = New Structure("Number,String", Numeric, StringType);
    
    ArrayOfDeletions = New Array;
    ArrayOfDescriptions  = New Array;
    ArrayOfDescriptions.Add(RowDescription1);
    ArrayOfDescriptions.Add(RowDescription2);
    
    Result = OPI_Airtable.CreatePosts(Token, Base, Table, ArrayOfDescriptions);

    // !OInt OPI_GetTestData.WriteLog(Result, "CreatePosts");
    
    OPI_GetTestData.ExpectsThat(Result["records"]).HasType("Array");
    OPI_GetTestData.ExpectsThat(Result["records"].Quantity()).Equal(2);
    
    For Each Record Of Result["records"] Loop
        ArrayOfDeletions.Add(Record["id"]);
    EndOfLoop;
        
    Result = OPI_Airtable.CreatePosts(Token, Base, Table, RowDescription1);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreatePosts (оdto)");
    
    SingleRecord = Result["id"];
    OPI_GetTestData.ExpectsThat(SingleRecord).Filled();
    OPI_GetTestData.ExpectsThat(Result["createdTime"]).Filled();
    OPI_GetTestData.ExpectsThat(Result["fields"]["Number"]).Equal(Numeric);
    OPI_GetTestData.ExpectsThat(ShortLP(Result["fields"]["String"])).Equal(StringType);
  
    Result = OPI_Airtable.GetRecord(Token, Base, Table, SingleRecord);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetRecord");
    
    OPI_GetTestData.ExpectsThat(Result["id"]).Equal(SingleRecord);
    
    Text     = "TestComment";
    Result = OPI_Airtable.CreateComment(Token, Base, Table, SingleRecord, Text);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateComment");
    
    OPI_GetTestData.ExpectsThat(Result["text"]).Equal(Text);
    
    Comment   = Result["id"];
    Text     = "TestComment (fromм.)";
    Result = OPI_Airtable.EditComment(Token, Base, Table, SingleRecord, Comment, Text);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditComment");
    
    OPI_GetTestData.ExpectsThat(Result["text"]).Equal(Text);
    
    Result = OPI_Airtable.GetComments(Token, Base, Table, SingleRecord);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetComments");
    
    OPI_GetTestData.ExpectsThat(Result["comments"]).HasType("Array");
    
    Result = OPI_Airtable.DeleteComment(Token, Base, Table, SingleRecord, Comment);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteComment");
    
    OPI_GetTestData.ExpectsThat(Result["deleted"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["id"]).Equal(Comment);
     
    Result = OPI_Airtable.GetListOfRecords(Token, Base, Table);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetListOfRecords");
    
    OPI_GetTestData.ExpectsThat(Result["records"]).HasType("Array");
    OPI_GetTestData.ExpectsThat(Result["records"]).Filled();
    
    Result = OPI_Airtable.DeletePosts(Token, Base, Table, ArrayOfDeletions);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeletePosts");
    
    OPI_GetTestData.ExpectsThat(Result["records"]).HasType("Array");
    OPI_GetTestData.ExpectsThat(Result["records"]).Filled();
      
    Result = OPI_Airtable.DeletePosts(Token, Base, Table, SingleRecord);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeletePosts (оdto)");
    
    OPI_GetTestData.ExpectsThat(Result["records"]).HasType("Array");
    OPI_GetTestData.ExpectsThat(Result["records"]).Filled();
        
EndProcedure

#EndRegion

#Region Dropbox

Procedure Dropbox_GetUpdateToken() Export
    
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Dropbox_Appkey"   , TestParameters);
    OPI_GetTestData.ParameterToCollection("Dropbox_Appsecret", TestParameters);
   
    Dropbox_GetAuthorizationLink(TestParameters); 
    
    OPI_GetTestData.ParameterToCollection("Dropbox_Code", TestParameters);

    Dropbox_GetToken(TestParameters);
    
    OPI_GetTestData.ParameterToCollection("Dropbox_Refresh", TestParameters);
    
    Dropbox_UpdateToken(TestParameters);
       
EndProcedure

Procedure Dropbox_UploadFile() Export
    
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_GetTestData.ParameterToCollection("Picture", TestParameters);
    
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

Procedure Dropbox_CreateFolder() Export
    
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Dropbox_Token", TestParameters);
    
    Dropbox_CreateFolder(TestParameters);
    Dropbox_DownloadFolder(TestParameters);
    
EndProcedure

Procedure Dropbox_GetFolderFileList() Export
    
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Dropbox_Token", TestParameters);
    
    Dropbox_GetFolderFileList(TestParameters);
    
EndProcedure

Procedure Dropbox_UploadFileByURL() Export
    
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_GetTestData.ParameterToCollection("Document", TestParameters);
    
    Dropbox_UploadFileByURL(TestParameters);
    Dropbox_GetUploadStatusByURL(TestParameters);
    
EndProcedure

Procedure Dropbox_CreateDeleteTag() Export
    
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Dropbox_Token", TestParameters);
    
    Dropbox_AddTag(TestParameters);
    Dropbox_GetTagList(TestParameters);
    Dropbox_DeleteTag(TestParameters);
    
EndProcedure

Procedure Dropbox_GetAccount() Export
  
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Dropbox_Token", TestParameters);
    
    Dropbox_GetAccountInformation(TestParameters);
    Dropbox_GetSpaceUsageData(TestParameters);
      
EndProcedure

Procedure Dropbox_AccessManagement() Export
    
    TestParameters = New Structure;
    OPI_GetTestData.ParameterToCollection("Dropbox_Token"    , TestParameters);
    OPI_GetTestData.ParameterToCollection("Dropbox_OtherUser", TestParameters);
    OPI_GetTestData.ParameterToCollection("Dropbox_FileID"   , TestParameters);
    
    Dropbox_AddUsersToFile(TestParameters);
    Dropbox_PublishFolder(TestParameters);
    Dropbox_AddUsersToFolder(TestParameters);
    Dropbox_CancelFolderPublication(TestParameters);
    Dropbox_CancelFilePublication(TestParameters);
    
EndProcedure

#EndRegion

#EndRegion

#EndRegion

#Region ServiceProceduresAndFunctions

Function GetVKParameters() 
    
    Parameters   = New Structure;
    GroupNumber = OPI_GetTestData.GetParameter("VK_GroupID");
    
    Parameters.Insert("access_token"  , OPI_GetTestData.GetParameter("VK_Token"));
    Parameters.Insert("owner_id"      , "-" + GroupNumber);
    Parameters.Insert("app_id"        , OPI_GetTestData.GetParameter("VK_AppID"));
    Parameters.Insert("group_id"      , GroupNumber);
    
    Return Parameters;
    
EndFunction

Function GetTwitterParameters() 
    
    Parameters = New Match;
              
    Parameters.Insert("redirect_uri"          , OPI_GetTestData.GetParameter("Twitter_Redirect"));
    Parameters.Insert("client_id"             , OPI_GetTestData.GetParameter("Twitter_ClinetID"));
    Parameters.Insert("client_secret"         , OPI_GetTestData.GetParameter("Twitter_ClientSecret"));
    Parameters.Insert("access_token"          , OPI_GetTestData.GetParameter("Twitter_Token"));
    Parameters.Insert("refresh_token"         , OPI_GetTestData.GetParameter("Twitter_Refresh"));
    Parameters.Insert("oauth_token"           , OPI_GetTestData.GetParameter("Twitter_OAuthToken"));
    Parameters.Insert("oauth_token_secret"    , OPI_GetTestData.GetParameter("Twitter_OAuthSecret"));
    
    Parameters.Insert("oauth_consumer_key"    
        , OPI_GetTestData.GetParameter("Twitter_OAuthConsumerKey"));
    Parameters.Insert("oauth_consumer_secret" 
        , OPI_GetTestData.GetParameter("Twitter_OAuthConsumerSecret"));

    Return Parameters;
    
EndFunction

#Region Checks

Procedure Check_Empty(Val Result)   
    OPI_GetTestData.ExpectsThat(ValueFilled(Result)).Equal(False);
EndProcedure

Procedure Check_BinaryData(Val Result, Val Size = Undefined)
    
    MinimumSize = 500000;
    
    OPI_GetTestData.ExpectsThat(Result).HasType("BinaryData"); 
    
    If Not Size = Undefined Then
        OPI_GetTestData.ExpectsThat(Result.Size()).Equal(Size); 
    Otherwise
        OPI_GetTestData.ExpectsThat(Result.Size() > MinimumSize).Equal(True);
    EndIf;
    
EndProcedure

Procedure Check_TelegramTrue(Val Result)
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]).Equal(True);
        
EndProcedure

Procedure Check_TelegramBotInformation(Val Result)
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["username"]).Filled();
    
EndProcedure

Procedure Check_TelegramArray(Result)
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match") .Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]).HasType("Array");
    
EndProcedure

Procedure Check_TelegramWebhookSetup(Val Result)
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["description"]).Equal("Webhook was set");
    
EndProcedure

Procedure Check_TelegramWebhookDeletion(Val Result)
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["description"]).Filled();
    
EndProcedure

Procedure Check_TelegramMessage(Val Result, Val Text)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["text"]).Equal(Text);
    	
EndProcedure

Procedure Check_TelegramImage(Val Result, Val Text)
	
    OPI_GetTestData.ExpectsThat(Result).HasType("Match") .Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["caption"]).Equal(Text);
    OPI_GetTestData.ExpectsThat(Result["result"]["photo"]).HasType("Array");
        
EndProcedure

Procedure Check_TelegramVideo(Val Result, Val Text)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["caption"]).Equal(Text);
    OPI_GetTestData.ExpectsThat(Result["result"]["video"]["mime_type"]).Equal("video/mp4");
    	
EndProcedure

Procedure Check_TelegramAudio(Val Result, Val Text)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["caption"]).Equal(Text);
    OPI_GetTestData.ExpectsThat(Result["result"]["audio"]["mime_type"]).Equal("audio/mpeg");
            
EndProcedure

Procedure Check_TelegramDocument(Val Result, Val Text)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["caption"]).Equal(Text);
    OPI_GetTestData.ExpectsThat(Result["result"]["document"]).HasType("Match").Filled();  
      
EndProcedure

Procedure Check_TelegramGif(Val Result, Val Text)

    Result = "result";
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result[Result]["caption"]).Equal(Text);
    OPI_GetTestData.ExpectsThat(Result[Result]["document"]).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result[Result]["animation"]["mime_type"]).Equal("video/mp4");
            
EndProcedure

Procedure Check_TelegramMediaGroup(Val Result)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]).HasType("Array");
            
EndProcedure

Procedure Check_TelegramLocation(Val Result)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["location"]).HasType("Match").Filled();   
     
EndProcedure

Procedure Check_TelegramContact(Val Result, Val Name)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["contact"]).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["result"]["contact"]["first_name"]).Equal(Name);
            
EndProcedure

Procedure Check_TelegramPoll(Val Result, Val Question)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["poll"]).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["result"]["poll"]["question"]).Equal(Question);
        	
EndProcedure

Procedure Check_TelegramForward(Val Result, Val MessageID)
	
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["forward_origin"]["message_id"]).Equal(Number(MessageID));
    
EndProcedure

Procedure Check_TelegramBan(Val Result)
	
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["description"]).Equal("Bad Request: can't remove chat owner");
    	
EndProcedure

Procedure Check_TelegramInvitation(Val Result, Val Title, Val UnixExpiration)

    Result        = "result";
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result[Result]["member_limit"]).Equal(200);
    OPI_GetTestData.ExpectsThat(Result[Result]["name"]).Equal(Title);
    OPI_GetTestData.ExpectsThat(Result[Result]["expire_date"]).Equal(Number(UnixExpiration));
    	
EndProcedure

Procedure Check_TelegramNumber(Val Result)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]).HasType("Number");
    	
EndProcedure

Procedure Check_TelegramCreateTopic(Val Result, Val Name, Icon)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);
    OPI_GetTestData.ExpectsThat(Result["result"]["name"]).Equal(Name);
    OPI_GetTestData.ExpectsThat(Result["result"]["icon_custom_emoji_id"]).Equal(Icon);
    	
EndProcedure

Procedure Check_VKPost(Val Result)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["response"]["post_id"]).HasType("Number").Filled();
        
EndProcedure

Procedure Check_VKTrue(Val Result)
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["response"]).HasType("Number").Equal(1);
    
EndProcedure

Procedure Check_VKAlbum(Val Result, Val Description)

    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["response"]["description"]).Equal(Description);
        
EndProcedure

Procedure Check_VKAlbumPicture(Val Result, Val ImageDescription, Val AlbumID)

    Response    = "response";
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result[Response][0]["text"]).Equal(ImageDescription);
    OPI_GetTestData.ExpectsThat(Result[Response][0]["album_id"]).Equal(AlbumID);
            
EndProcedure

Procedure Check_VKStory(Val Result)
  
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["response"]["count"]).HasType("Number").Equal(1);
    OPI_GetTestData.ExpectsThat(Result["response"]["items"]).HasType("Array").Filled();
      
EndProcedure

Procedure Check_VKDiscussion(Val Result)
 
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["response"]).HasType("Number").Filled();   
    
EndProcedure

Procedure Check_GKObject(Val Result, Val Name, Val Description)
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match");
    OPI_GetTestData.ExpectsThat(Result["summary"]).Equal(Name);
    OPI_GetTestData.ExpectsThat(Result["description"]).Equal(Description);
    OPI_GetTestData.ExpectsThat(Result["id"]).HasType("String").Filled();
    
EndProcedure

Procedure Check_TwitterText(Val Result, Val Text)
    
    ReplyText = Result["data"]["text"];
    ReplyText = Left(ReplyText, StrLength(Text));
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(ReplyText).Equal(Text);

EndProcedure

Procedure Check_ViberOk(Val Result)
    
    OPI_GetTestData.ExpectsThat(Result["status_message"]).Equal("ok");
    OPI_GetTestData.ExpectsThat(Result["status"]).Equal(0);

EndProcedure

Procedure Check_NotionObject(Val Result, Val View = "page")
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["object"]).Equal(View);
    
EndProcedure

Procedure Check_SlackOk(Val Result)
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    OPI_GetTestData.ExpectsThat(Result["ok"]).Equal(True);

EndProcedure

Procedure Check_DropboxFile(Val Result, Val Path)
    
    OPI_GetTestData.ExpectsThat(Result["path_display"]).Equal(Path);
    
EndProcedure

Procedure Check_DropboxMetadata(Val Result, Val Path)
    
    OPI_GetTestData.ExpectsThat(Result["metadata"]["path_display"]).Equal(Path);
    
EndProcedure

Procedure Check_DropboxArray(Val Result, Val Quantity = Undefined)
    
    OPI_GetTestData.ExpectsThat(Result["entries"]).HasType("Array");
    
    If Not Quantity = Undefined Then
        OPI_GetTestData.ExpectsThat(Result["entries"].Quantity()).Equal(Quantity);
    EndIf;
    
EndProcedure

Procedure Check_DropboxWork(Val Result)
    OPI_GetTestData.ExpectsThat(Result["async_job_id"]).Filled();
EndProcedure

Procedure Check_DropboxStatus(Val Result)
    OPI_GetTestData.ExpectsThat(Result[".tag"]).Equal("complete");
EndProcedure

Procedure Check_DropboxTags(Val Result, Val Quantity)
    
    OPI_GetTestData.ExpectsThat(Result["paths_to_tags"]).HasType("Array");
    OPI_GetTestData.ExpectsThat(Result["paths_to_tags"].Quantity()).Equal(Quantity);
    
EndProcedure

Procedure Check_DropboxAccount(Val Result)
    OPI_GetTestData.ExpectsThat(Result["account_id"]).Filled();
EndProcedure

Procedure Check_DropboxSpace(Val Result)
    OPI_GetTestData.ExpectsThat(Result["used"]).Filled();
EndProcedure

Procedure Check_DropboxMember(Val Result, Val Email, Val ViewOnly)
    OPI_GetTestData.ExpectsThat(Result[0]["result"][".tag"]).Equal("success");
    OPI_GetTestData.ExpectsThat(Result[0]["member"]["email"]).Equal(Email);
    OPI_GetTestData.ExpectsThat(
        Result[0]["result"]["success"][".tag"]).Equal(?(ViewOnly, "viewer", "editor"));
EndProcedure

Procedure Check_DropboxPublicFolder(Val Result)
    OPI_GetTestData.ExpectsThat(Result["shared_folder_id"]).Filled();
EndProcedure

#EndRegion

#Region AtomicTests

#Region Telegram

Procedure Telegram_GetBotInformation(FunctionParameters)

    Token       = FunctionParameters["Telegram_Token"];
    Result   = OPI_Telegram.GetBotInformation(Token);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetBotInformation", "Telegram");
        
    Check_TelegramBotInformation(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_GetUpdates(FunctionParameters)
	
	Token       = FunctionParameters["Telegram_Token"];
    Result   = OPI_Telegram.GetUpdates(Token);

	// END
	
    // !OInt OPI_GetTestData.WriteLog(Result, "GetUpdates", "Telegram");
    
    Check_TelegramArray(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_SetWebhook(FunctionParameters)
    
    Token       = FunctionParameters["Telegram_Token"];
    URL         = FunctionParameters["Telegram_URL"];
    
    Result   = OPI_Telegram.SetWebhook(Token, URL);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SetWebhook", "Telegram");
      
    Check_TelegramWebhookSetup(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_DeleteWebhook(FunctionParameters)
	
	Token     = FunctionParameters["Telegram_Token"];
	Result = OPI_Telegram.DeleteWebhook(Token);
	
	// END
	
	// !OInt OPI_GetTestData.WriteLog(Result, "DeleteWebhook", "Telegram");
      
    Check_TelegramWebhookDeletion(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_SendTextMessage(FunctionParameters)
	
	Token    = FunctionParameters["Telegram_Token"];
	ChatID   = FunctionParameters["Telegram_ChatID"];
	ChannelID = FunctionParameters["Telegram_ChannelID"];    
	Text    = FunctionParameters["String"];
	
    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendTextMessage", "Telegram"); 
    
    Check_TelegramMessage(Result, Text); // SKIP
    
    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendTextMessage (toаtoл)"); 
    
    Check_TelegramMessage(Result, Text);
    
    MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
    OPI_GetTestData.WriteParameter("Telegram_ChannelMessageID", MessageID);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_SendPicture(FunctionParameters)

    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text    = FunctionParameters["String"];
    Image = FunctionParameters["Picture"]; 
    
    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);
    
    ImageDD   = New BinaryData(ImagePath);
    
    Result = OPI_Telegram.SendImage(Token, ChatID, Text, Image);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendImage", "Telegram");
    
    Check_TelegramImage(Result, Text); // SKIP
  
    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImagePath);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendImage (Path)");
    
    Check_TelegramImage(Result, Text); // SKIP
      
    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImageDD);
    
    // END 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendImage (BD)");
    
    Check_TelegramImage(Result, Text);
    
    DeleteFiles(ImagePath);
    
    FileID = Result["result"]["photo"][0]["file_id"];
    OPI_GetTestData.WriteParameter("Telegram_FileID", FileID);
    
    FunctionParameters.Insert("Telegram_FileID", FileID);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_SendVideo(FunctionParameters)

    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text    = FunctionParameters["String"];
    Video    = FunctionParameters["Video"];
    
    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);
    
    VideoDD   = New BinaryData(VideoPath);
    
    Result = OPI_Telegram.SendVideo(Token, ChatID, Text, Video);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendVideo", "Telegram");
    
    Check_TelegramVideo(Result, Text); // SKIP
  
    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoPath);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendVideo (Path)");
    
    Check_TelegramVideo(Result, Text); // SKIP
      
    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoDD);
    
    // END 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendVideo (BD)");
    
    Check_TelegramVideo(Result, Text);
    
    DeleteFiles(VideoPath);
    
    FileID = Result["result"]["video"]["file_id"];
    OPI_GetTestData.WriteParameter("Telegram_FileID", FileID);
    
    FunctionParameters.Insert("Telegram_FileID", FileID);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_SendAudio(FunctionParameters)

    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text    = FunctionParameters["String"];
    Audio    = FunctionParameters["Audio"];
    
    AudioPath = GetTempFileName("mp3");
    CopyFile(Audio, AudioPath);
    
    AudioDD   = New BinaryData(AudioPath);
    
    Result = OPI_Telegram.SendAudio(Token, ChatID, Text, Audio);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendAudio", "Telegram");
    
    Check_TelegramAudio(Result, Text); // SKIP
  
    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioPath);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendAudio (Path)");
    
    Check_TelegramAudio(Result, Text); // SKIP
      
    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioDD);
    
    // END 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendAudio (BD)");
    
    Check_TelegramAudio(Result, Text);
    
    DeleteFiles(AudioPath);
    
    FileID = Result["result"]["audio"]["file_id"];
    OPI_GetTestData.WriteParameter("Telegram_FileID", FileID);
    
    FunctionParameters.Insert("Telegram_FileID", FileID);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure Telegram_SendDocument(FunctionParameters)

    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text    = FunctionParameters["String"];
    Document = FunctionParameters["Document"];
    
    DocumentPath = GetTempFileName("docx");
    CopyFile(Document, DocumentPath);
    
    DocumentDD   = New BinaryData(DocumentPath);
    
    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendDocument", "Telegram");
    
    Check_TelegramDocument(Result, Text); // SKIP
  
    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentPath);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendDocument (Path)");
    
    Check_TelegramDocument(Result, Text); // SKIP
      
    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentDD);
    
    // END 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendDocument (BD)");
    
    Check_TelegramDocument(Result, Text);
    
    DeleteFiles(DocumentPath);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure Telegram_SendGif(FunctionParameters)

    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text    = FunctionParameters["String"];
    GIF    = FunctionParameters["GIF"];
    
    GifPath = GetTempFileName("gif");
    CopyFile(GIF, GifPath);
    
    GifDD   = New BinaryData(GifPath);
    
    Result = OPI_Telegram.SendGif(Token, ChatID, Text, GIF);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendGif", "Telegram");
    
    Check_TelegramGif(Result, Text); // SKIP
  
    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifPath);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendGif (Path)");
    
    Check_TelegramGif(Result, Text); // SKIP
      
    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifDD);
    
    // END 
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendGif (BD)");
    
    Check_TelegramGif(Result, Text);
    
    DeleteFiles(GifPath);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure Telegram_SendMediaGroup(FunctionParameters)

    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    Text    = FunctionParameters["String"];
    Image = FunctionParameters["Picture"];
    Video    = FunctionParameters["Video"];
 
    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);
           
    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);
    
    VideoDD   = New BinaryData(VideoPath);
    
    MediaGroup    = New Match;
    MediaGroup.Insert(ImagePath, "photo");
    MediaGroup.Insert(VideoDD     , "video");
    
    Result = OPI_Telegram.SendMediaGroup(Token, ChatID, Text, MediaGroup);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendMediaGroup", "Telegram");
    
    Check_TelegramMediaGroup(Result); 
   
    DeleteFiles(VideoPath);
    DeleteFiles(ImagePath);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure Telegram_SendLocation(FunctionParameters)
    
    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];    
    Width   = FunctionParameters["Lat"];
    Longitude  = FunctionParameters["Long"];
    
    Result = OPI_Telegram.SendLocation(Token, ChatID, Width, Longitude);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendLocation", "Telegram"); 
    
    Check_TelegramLocation(Result); // SKIP
    
    Result = OPI_Telegram.SendLocation(Token, ChannelID, Width, Longitude);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendLocation (toаtoл)"); 
    
    Check_TelegramLocation(Result);

    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_SendContact(FunctionParameters)

    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];    
    Name      = FunctionParameters["Name"];
    Last name  = FunctionParameters["Surname"];
    Phone  = FunctionParameters["Phone"];
    
    Result = OPI_Telegram.SendContact(Token, ChatID  , Name, Last name, Phone);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendContact", "Telegram"); 
    
    Check_TelegramContact(Result, Name); // SKIP
    OPI_Tools.Pause(20);                // SKIP
    
    Result = OPI_Telegram.SendContact(Token, ChannelID, Name, Last name, Phone);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendContact (toаtoл)"); 
    
    Check_TelegramContact(Result, Name);

    OPI_Tools.Pause(5);
        
EndProcedure

Procedure Telegram_SendPoll(FunctionParameters)

    Token    = FunctionParameters["Telegram_Token"];
    ChatID   = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"]; 
    Question   = "What's your favorite color?";
    
    AnswersArray     = New Array;
    AnswersArray.Add("Red");
    AnswersArray.Add("Yellow");
    AnswersArray.Add("Green");
    AnswersArray.Add("Blue");
    
    Result = OPI_Telegram.SendPoll(Token, ChatID  , Question, AnswersArray, False);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendPoll", "Telegram");
                
    Check_TelegramPoll(Result, Question); // SKIP
    
    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, AnswersArray, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendPoll (toаtoл)");
                
    Check_TelegramPoll(Result, Question); // SKIP
    
    // END
    
    StringArray    = "['Red', 'Yellow','Green' ,'Blue']";
    
    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, StringArray, True);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendPoll (withтрочный маwithwithиin)");
                
    Check_TelegramPoll(Result, Question);

    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_DownloadFile(FunctionParameters)
	
	FileID = FunctionParameters["Telegram_FileID"];
	Token   = FunctionParameters["Telegram_Token"];

    Result = OPI_Telegram.DownloadFile(Token, FileID);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DownloadFile", "Telegram");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("BinaryData");
    	
EndProcedure

Procedure Telegram_ForwardMessage(FunctionParameters)

    Token       = FunctionParameters["Telegram_Token"];
    ChatID      = FunctionParameters["Telegram_ChatID"];
    ChannelID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    
    Result = OPI_Telegram.ForwardMessage(Token, MessageID, ChannelID, ChatID);
    
    // END

    // !OInt OPI_GetTestData.WriteLog(Result, "ForwardMessage", "Telegram");
        
	Check_TelegramForward(Result, MessageID);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_Ban(FunctionParameters)
	
	Token          = FunctionParameters["Telegram_Token"];
    UserID = FunctionParameters["Telegram_ChatID"];
    ChannelID       = FunctionParameters["Telegram_ChannelID"];
    
	Result = OPI_Telegram.Ban(Token, ChannelID, UserID);

	// END
	
    // !OInt OPI_GetTestData.WriteLog(Result, "Ban", "Telegram");
    
	Check_TelegramBan(Result);
	OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_Unban(FunctionParameters)
	
    Token          = FunctionParameters["Telegram_Token"];
    UserID = FunctionParameters["Telegram_ChatID"];
    ChannelID       = FunctionParameters["Telegram_ChannelID"];
    
	Result = OPI_Telegram.Unban(Token, ChannelID, UserID);

	// END
	
    // !OInt OPI_GetTestData.WriteLog(Result, "Unban", "Telegram");
    
	Check_TelegramBan(Result);
	OPI_Tools.Pause(5);
	
EndProcedure

Procedure Telegram_CreateInviteLink(FunctionParameters)

    Token         = FunctionParameters["Telegram_Token"];
    ChannelID      = FunctionParameters["Telegram_ChannelID"];    
    Day         = 86400;   
    CurrentDate   = OPI_Tools.GetCurrentDate();

    Title     = "Link " + String(CurrentDate); 
    Expiration     = CurrentDate + Day;
    UnixExpiration = OPI_Tools.UNIXTime(Expiration);
    
    Result = OPI_Telegram.CreateInvitationLink(Token, ChannelID, Title, Expiration, 200);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateInvitationLink", "Telegram");

	Check_TelegramInvitation(Result, Title, UnixExpiration);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_PinMessage(FunctionParameters)

    Token       = FunctionParameters["Telegram_Token"];
    ChannelID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    
    Result = OPI_Telegram.PinMessage(Token, ChannelID, MessageID);

	// END
	
    // !OInt OPI_GetTestData.WriteLog(Result, "PinMessage", "Telegram");
	
	Check_TelegramTrue(Result);
        
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_UnpinMessage(FunctionParameters)

    Token       = FunctionParameters["Telegram_Token"];
    ChannelID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    
    Result = OPI_Telegram.UnpinMessage(Token, ChannelID, MessageID);

	// END
	
    // !OInt OPI_GetTestData.WriteLog(Result, "UnpinMessage", "Telegram");
	
	Check_TelegramTrue(Result);
        
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_GetParticipantCount(FunctionParameters)
	
    Token       = FunctionParameters["Telegram_Token"];
    ChannelID    = FunctionParameters["Telegram_ChannelID"];
    
    Result  = OPI_Telegram.GetParticipantCount(Token, ChannelID);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetParticipantCount", "Telegram");
    
    Check_TelegramNumber(Result);
        
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_GetForumAvatarList(FunctionParameters)
	
	Token       = FunctionParameters["Telegram_Token"];
	Result   = OPI_Telegram.GetAvatarIconList(Token);
	
	// END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetAvatarIconList", "Telegram");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("Match").Filled();
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_CreateForumTopic(FunctionParameters)
	
	Token  = FunctionParameters["Telegram_Token"];
    Chat    = FunctionParameters["Telegram_ForumID"];
    Icon = "5357419403325481346";
    Name    = "TestTopic " + String(New UniqueIdentifier);
    
	Result = OPI_Telegram.CreateForumThread(Token, Chat, Name, Icon);
	
	// END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateForumThread", "Telegram");
    
    Topic = Result["result"]["message_thread_id"];
    
    FunctionParameters.Insert("Telegram_TopicID", Topic);
    OPI_Tools.AddField("Telegram_TopicID", Topic, "String", FunctionParameters);
    OPI_GetTestData.WriteParameter("Telegram_TopicID", FunctionParameters["Telegram_TopicID"]);
   
	Check_TelegramCreateTopic(Result, Name, Icon);
	
	ChatTopic   = Chat + "*" + Topic;
	Text     = FunctionParameters["String"];
    Result = OPI_Telegram.SendTextMessage(Token, ChatTopic, Text);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SendTextMessage (форум)");
    
    Check_TelegramMessage(Result, Text);
	
EndProcedure

Procedure Telegram_EditForumTopic(FunctionParameters)

	Token       = FunctionParameters["Telegram_Token"];
    Chat         = FunctionParameters["Telegram_ForumID"];
    Topic        = FunctionParameters["Telegram_TopicID"];
    NewName    = "NewTestTitle";
    NewIcon  = "5310132165583840589";

    Result = OPI_Telegram.EditForumTopic(Token, Chat, Topic, NewName, NewIcon);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditForumTopic", "Telegram");
        
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_CloseForumTopic(FunctionParameters)

	Token       = FunctionParameters["Telegram_Token"];
    Chat         = FunctionParameters["Telegram_ForumID"];
    Topic        = FunctionParameters["Telegram_TopicID"];

    OPI_Telegram.OpenForumThread(Token, Chat); // SKIP
    
	Result = OPI_Telegram.CloseForumThread(Token, Chat);       // Closes main topic
	
	// !OInt OPI_GetTestData.WriteLog(Result, "CloseForumThread (глаintoя)");
    
    Check_TelegramTrue(Result); // SKIP
    
    Result = OPI_Telegram.CloseForumThread(Token, Chat, Topic);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CloseForumThread", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(25);
    	
EndProcedure

Procedure Telegram_OpenForumTopic(FunctionParameters)

	Token       = FunctionParameters["Telegram_Token"];
    Chat         = FunctionParameters["Telegram_ForumID"];
    Topic        = FunctionParameters["Telegram_TopicID"];

	Result = OPI_Telegram.OpenForumThread(Token, Chat);       // Opens main topic
	
	// !OInt OPI_GetTestData.WriteLog(Result, "OpenForumThread (глаintoя)");
    
    Check_TelegramTrue(Result); // SKIP
    
    Result = OPI_Telegram.OpenForumThread(Token, Chat, Topic);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "OpenForumThread", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(25);
    	
EndProcedure

Procedure Telegram_DeleteForumTopic(FunctionParameters)

	Token       = FunctionParameters["Telegram_Token"];
    Chat         = FunctionParameters["Telegram_ForumID"];
    Topic        = FunctionParameters["Telegram_TopicID"];
    
    Result = OPI_Telegram.DeleteForumTopic(Token, Chat, Topic); 
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteForumTopic", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(25);
    	
EndProcedure

Procedure Telegram_ClearPinnedMessagesList(FunctionParameters)

	Token       = FunctionParameters["Telegram_Token"];
    Chat         = FunctionParameters["Telegram_ForumID"];
    Topic        = FunctionParameters["Telegram_TopicID"];
    
    Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ClearThreadPinnedMessagesList (глаintoя)");
    
    Check_TelegramTrue(Result); // SKIP
    
    Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat, Topic);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ClearThreadPinnedMessagesList", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_HideMainForumTopic(FunctionParameters)

	Token       = FunctionParameters["Telegram_Token"];
    Chat         = FunctionParameters["Telegram_ForumID"];
    
    Result = OPI_Telegram.HideMainForumTopic(Token, Chat);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "HideMainForumTopic", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_ShowMainForumTopic(FunctionParameters)

	Token       = FunctionParameters["Telegram_Token"];
    Chat         = FunctionParameters["Telegram_ForumID"];
    
    Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "ShowMainForumTopic", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_ChangeMainTopicName(FunctionParameters)

	Title   = "New main thread name " + String(New UniqueIdentifier);
	Token       = FunctionParameters["Telegram_Token"];
    Chat         = FunctionParameters["Telegram_ForumID"];    
	
    Result = OPI_Telegram.EditMainForumTopicName(Token, Chat, Title);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "EditMainForumTopicName", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

#EndRegion

#Region VK

Procedure VK_CreateTokenRetrievalLink(FunctionParameters)

    Application = FunctionParameters["VK_AppID"];
    Result  = OPI_VK.CreateTokenRetrievalLink(Application);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateTokenRetrievalLink", "VK");
    
    OPI_GetTestData.ExpectsThat(Result).HasType("String").Filled();
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure VK_CreatePost(FunctionParameters)
    
    Parameters = GetVKParameters();
    Text     = "Post from autotest";
    URL       = "https://github.com/Bayselonarrend/OpenIntegrations";
    
    Image  = FunctionParameters["Picture"];  // URL, Path or Binary Data
    Image2 = FunctionParameters["Picture2"]; // URL, Path or Binary Data
    
    AndVF = GetTempFileName("png");   
    CopyFile(Image2, AndVF);
    
    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(AndVF);
  
    Result = OPI_VK.CreatePost(Text, ImageArray, True, URL, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreatePost", "VK");

    Check_VKPost(Result);                         // SKIP
    PostID   = Result["response"]["post_id"];       // SKIP
    Result = OPI_VK.DeletePost(PostID, Parameters); // SKIP
    
    Result = OPI_VK.CreatePost(Text, Image, False  ,    , Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreatePost (оdto toартинtoа)");

    Check_VKPost(Result); 
    
    PostID   = Result["response"]["post_id"];       
    Result = OPI_VK.DeletePost(PostID, Parameters); 
    
    OPI_Tools.Pause(5);   
    
    Result = OPI_VK.CreatePost(Text, AndVF     , True, URL, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreatePost (оdин path)");

    Check_VKPost(Result);                   
    
    PostID = Result["response"]["post_id"];
    OPI_Tools.AddField("VK_PostID", PostID, "String", FunctionParameters);
    OPI_GetTestData.WriteParameter("VK_PostID", FunctionParameters["VK_PostID"]);
    
    DeleteFiles(AndVF);
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_DeletePost(FunctionParameters)
    
    Parameters = GetVKParameters();
    PostID   = FunctionParameters["VK_PostID"];
    
    Result = OPI_VK.DeletePost(PostID, Parameters);

    // END

    // !OInt OPI_GetTestData.WriteLog(Result, "DeletePost", "VK");
            
    Check_VKTrue(Result);
    
EndProcedure

Procedure VK_CreateCompositePost(FunctionParameters)

    Parameters = GetVKParameters();
    Text     = "Post from autotest";
    URL       = "https://github.com/Bayselonarrend/OpenIntegrations";
    
    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Video    = FunctionParameters["Video"];   // URL, Path or Binary Data
    
    AndVF = GetTempFileName("png");   
    CopyFile(Image, AndVF);
    
    ImageUpload = OPI_VK.UploadPhotoToServer(AndVF, Parameters)["response"][0];
    VideoUpload    = OPI_VK.UploadVideoToServer(Video, "NewVideo", , , Parameters);
    
    ImageOwner = OPI_Tools.NumberToString(ImageUpload["owner_id"]);
    VideoOwner    = OPI_Tools.NumberToString(VideoUpload["owner_id"]);
    
    ImageID       = OPI_Tools.NumberToString(ImageUpload["id"]);
    VideoID          = OPI_Tools.NumberToString(VideoUpload["video_id"]);
    
    AttachmentsArray = New Array;
    AttachmentsArray.Add("photo" + ImageOwner + "_" + ImageID);
    AttachmentsArray.Add("video" + VideoOwner + "_" + VideoID);
    
    Result = OPI_VK.CreateCompositePost(Text, AttachmentsArray, False, URL, Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateCompositePost", "VK");
    
    Check_VKPost(Result);
    DeleteFiles(AndVF);    
        
    OPI_Tools.Pause(5);
     
EndProcedure

Procedure VK_CreatePoll()

    Parameters = GetVKParameters();
    Question    = "What's your favorite color?";
    
    OptionArray = New Array;
    OptionArray.Add("Red");
    OptionArray.Add("Yellow");
    OptionArray.Add("Green");
    
    Result = OPI_VK.CreatePoll(Question, OptionArray, , Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreatePoll", "VK");
    
    Check_VKPost(Result);
        
    PostID  = Result["response"]["post_id"];
    OPI_VK.DeletePost(PostID, Parameters);
    
    OPI_Tools.Pause(10);
        
EndProcedure

Procedure VK_CreateAlbum(FunctionParameters)
    
    Parameters        = GetVKParameters();
    Name              = "AlbumFromAutoTest";
    Description         = "NewAlbumFromAutoTest";
      
    Result = OPI_VK.CreateAlbum(Name, Description, Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateAlbum", "VK");
    
    Check_VKAlbum(Result, Description);
        
    AlbumID  = Result["response"]["id"];
    FunctionParameters.Insert("VK_AlbumID", AlbumID);
    OPI_GetTestData.WriteParameter("VK_AlbumID", AlbumID);
    
EndProcedure

Procedure VK_SavePictureToAlbum(FunctionParameters)
    
    Parameters        = GetVKParameters();
    ImageDescription = "AutoTestImage";
    AlbumID        = FunctionParameters["VK_AlbumID"];
    
    Image  = FunctionParameters["Picture"];       // URL, Path to file or Binary Data
    AndVF       = GetTempFileName("png");
    CopyFile(Image, AndVF);
    
    Image  = New BinaryData(AndVF);
    
    Result = OPI_VK.SaveImageToAlbum(AlbumID, Image, ImageDescription, Parameters);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "SaveImageToAlbum", "VK");
    
    Check_VKAlbumPicture(Result, ImageDescription, AlbumID); // SKIP
    
    ImageID  = Result["response"][0]["id"];                       // SKIP
    Result    = OPI_VK.DeleteImage(ImageID, Parameters);       // SKIP
            
    Result = OPI_VK.SaveImageToAlbum(AlbumID, AndVF, ImageDescription, Parameters);
    
    // END
   
    // !OInt OPI_GetTestData.WriteLog(Result, "SaveImageToAlbum (path)");
    
    Check_VKAlbumPicture(Result, ImageDescription, AlbumID); // SKIP
    
    ImageID  = Result["response"][0]["id"];
    FunctionParameters.Insert("VK_PictureID", ImageID);
    OPI_GetTestData.WriteParameter("VK_PictureID", ImageID);
    
    DeleteFiles(AndVF);
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_DeleteImage(FunctionParameters)
    
    Parameters  = GetVKParameters();
    ImageID = FunctionParameters["VK_PictureID"];
    
    Result  = OPI_VK.DeleteImage(ImageID, Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteImage", "VK");
    
    Check_VKTrue(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_DeleteAlbum(FunctionParameters)
    
    Parameters = GetVKParameters();
    AlbumID = FunctionParameters["VK_AlbumID"];
    
    Result = OPI_VK.DeleteAlbum(AlbumID, Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteAlbum", "VK");
        
    Check_VKTrue(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_CreateStory(FunctionParameters)

    Parameters = GetVKParameters();
    URL       = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image  = FunctionParameters["Picture"];       // URL, Path to file or Binary Data
    AndVF       = GetTempFileName("png");
    CopyFile(Image, AndVF);
    Image  = New BinaryData(AndVF);
       
    Result = OPI_VK.CreateStory(Image , URL, Parameters);

    // !OInt OPI_GetTestData.WriteLog(Result, "CreateStory", "VK");
    
    Check_VKStory(Result); // SKIP
        
    Result = OPI_VK.CreateStory(AndVF, , Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateStory (path)");
    
    Check_VKStory(Result);
    
    DeleteFiles(AndVF);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure VK_CreateDiscussion(FunctionParameters)

    Parameters       = GetVKParameters();
    Name        = "Discussing: Which color is better?";
    Message       = "Red, yellow, blue, or some other?";
    
    Result = OPI_VK.CreateDiscussion(Name, Message, Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateDiscussion", "VK");
    
    Check_VKDiscussion(Result);
    
    DiscussionID = Result["response"];
    FunctionParameters.Insert("VK_ConvID", DiscussionID);
    OPI_GetTestData.WriteParameter("VK_ConvID", DiscussionID);    
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure VK_CloseDiscussion(FunctionParameters)
    
    Parameters    = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result    = OPI_VK.CloseDiscussion(DiscussionID, False, Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CloseDiscussion", "VK");
        
    Check_VKTrue(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_OpenDiscussion(FunctionParameters)
    
    Parameters    = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result    = OPI_VK.OpenDiscussion(DiscussionID, Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "OpenDiscussion", "VK");
        
    Check_VKTrue(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_PostToDiscussion(FunctionParameters)
    
    Parameters    = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Message    = "I like yellow more";
    
    Result = OPI_VK.WriteInDiscussion(DiscussionID, Message, Parameters);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "WriteInDiscussion", "VK");
    
    Check_VKDiscussion(Result);
    
EndProcedure

#EndRegion

#Region Dropbox

Procedure Dropbox_GetAuthorizationLink(FunctionParameters)

    AppKey = FunctionParameters["Dropbox_Appkey"];
    Result      = OPI_Dropbox.GetAuthorizationLink(AppKey);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetAuthorizationLink", "Dropbox");
        
    OPI_GetTestData.ExpectsThat(Result).HasType("String");
    
EndProcedure

Procedure Dropbox_GetToken(FunctionParameters)
    
    AppKey   = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    Code              = FunctionParameters["Dropbox_Code"];

    Result = OPI_Dropbox.GetToken(AppKey, AppSecret, Code);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetToken");
    
    Token  = Result["access_token"];
    Refresh = Result["refresh_token"];
   
    If ValueFilled(Token) Then
        OPI_GetTestData.WriteParameter("Dropbox_Token", Token);
    EndIf;
   
    If ValueFilled(Refresh) Then
        OPI_GetTestData.WriteParameter("Dropbox_Refresh", Refresh);
    EndIf;
    
EndProcedure

Procedure Dropbox_UpdateToken(FunctionParameters)

    AppKey   = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    RefreshToken      = FunctionParameters["Dropbox_Refresh"];
    
    Result = OPI_Dropbox.RefreshToken(AppKey, AppSecret, RefreshToken);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "RefreshToken");
    
    Token = Result["access_token"];
    
    OPI_GetTestData.ExpectsThat(Token).Filled();

    OPI_GetTestData.WriteParameter("Dropbox_Token", Token);
        
EndProcedure

Procedure Dropbox_GetObjectInformation(FunctionParameters)
   
    Path      = "/New/pic.png";  
    Token     = FunctionParameters["Dropbox_Token"];
     
    Result = OPI_Dropbox.GetObjectInformation(Token, Path, True);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetObjectInformation", "Dropbox");

    Check_DropboxFile(Result, Path);
    
    OPI_Tools.Pause(5); 
    
EndProcedure

Procedure Dropbox_GetPreview(FunctionParameters)
   
    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New/mydoc.docx"; 
    
    Result = OPI_Dropbox.GetPreview(Token, Path);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetPreview", "Dropbox");
        
    Check_BinaryData(Result, 190834);
        
    OPI_Tools.Pause(5); 
     
EndProcedure

Procedure Dropbox_UploadFile(FunctionParameters)

    Path      = "/New/pic.png";  
    Token     = FunctionParameters["Dropbox_Token"];
    Image  = FunctionParameters["Picture"];
    
    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);
    
    Result = OPI_Dropbox.UploadFile(Token, ImagePath, Path, True);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "UploadFile", "Dropbox");
        
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
    
    // !OInt OPI_GetTestData.WriteLog(Result, "UploadFileByURL", "Dropbox");
        
    Check_DropboxWork(Result);
   
    Work = Result["async_job_id"];
   
    FunctionParameters.Insert("Dropbox_Job", Work);
    OPI_GetTestData.WriteParameter("Dropbox_Job", Work);
    
    OPI_Tools.Pause(5); 
     
EndProcedure

Procedure Dropbox_GetUploadStatusByURL(FunctionParameters)

    Token    = FunctionParameters["Dropbox_Token"];
    WorkID = FunctionParameters["Dropbox_Job"];
    Status   = "in_progress";    
    
    While Status = "in_progress" Loop 
        
        Result = OPI_Dropbox.GetUploadStatusByURL(Token, WorkID);
        Status    = Result[".tag"];
        
        OPI_Tools.Pause(5);
        
        // !OInt OPI_GetTestData.WriteLog(Result, "GetUploadStatusByURL", "Dropbox");
        
    EndOfLoop;
    
    // END
    
    Check_DropboxStatus(Result);
    
    Path      = "/New/url_doc.docx";
    Result = OPI_Dropbox.DeleteObject(Token, Path);
    
    Check_DropboxMetadata(Result, Path);
    OPI_Tools.Pause(5); 
        
EndProcedure

Procedure Dropbox_DeleteObject(FunctionParameters)
 
    Path      = "/New/pic.png";  
    Token     = FunctionParameters["Dropbox_Token"];  
    
    Result = OPI_Dropbox.DeleteObject(Token, Path);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteObject", "Dropbox");

    Check_DropboxMetadata(Result, Path);
    
    OPI_Tools.Pause(5); 
     
EndProcedure

Procedure Dropbox_CopyObject(FunctionParameters)
    
    Original  = "/New/pic.png";
    Copy     = "/New/pic_copy.png";  
    Token     = FunctionParameters["Dropbox_Token"];
    
    Result = OPI_Dropbox.CopyObject(Token, Original, Copy);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CopyObject", "Dropbox");
        
    Check_DropboxMetadata(Result, Copy);
    
    Result = OPI_Dropbox.DeleteObject(Token, Copy);
    Check_DropboxMetadata(Result, Copy);
        
    OPI_Tools.Pause(5); 
    
EndProcedure

Procedure Dropbox_MoveObject(FunctionParameters)
    
    OriginalPath  = "/New/pic.png";
    TargetPath      = "/pic.png";  
    Token            = FunctionParameters["Dropbox_Token"];
    
    Result = OPI_Dropbox.MoveObject(Token, OriginalPath, TargetPath);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "Dropbox_MoveObject", "Dropbox");
        
    Check_DropboxMetadata(Result, TargetPath);
    
    Result = OPI_Dropbox.MoveObject(Token, TargetPath, OriginalPath);
    Check_DropboxMetadata(Result, OriginalPath);
        
    OPI_Tools.Pause(5); 
    
EndProcedure

Procedure Dropbox_CreateFolder(FunctionParameters)
    
    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New toаталог";
    
    Result = OPI_Dropbox.CreateFolder(Token, Path);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CreateFolder", "Dropbox");
        
    Check_DropboxMetadata(Result, Path);
    
    Result = OPI_Dropbox.DeleteObject(Token, Path);
    Check_DropboxMetadata(Result, Path);
        
    OPI_Tools.Pause(5); 
    
EndProcedure

Procedure Dropbox_DownloadFile(FunctionParameters)

    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New/pic.png"; 
    
    Result = OPI_Dropbox.DownloadFile(Token, Path);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DownloadFile", "Dropbox");
        
    Check_BinaryData(Result, 2114023);
        
    OPI_Tools.Pause(5); 
        
EndProcedure

Procedure Dropbox_DownloadFolder(FunctionParameters)
    
    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New";
    
    Result = OPI_Dropbox.DownloadFolder(Token, Path);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DownloadFolder", "Dropbox");
        
    Check_BinaryData(Result);
        
    OPI_Tools.Pause(5); 
    
EndProcedure

Procedure Dropbox_GetFolderFileList(FunctionParameters)
 
    Path      = "/New";  
    Token     = FunctionParameters["Dropbox_Token"];
     
    Result = OPI_Dropbox.GetListOfFolderFiles(Token, Path, True);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetListOfFolderFiles", "Dropbox");

    Check_DropboxArray(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure 

Procedure Dropbox_GetObjectVersionList(FunctionParameters)

    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New/pic.png"; 
    
    Result = OPI_Dropbox.GetObjectVersionList(Token, Path, 1);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetObjectVersionList", "Dropbox");
        
   Check_DropboxArray(Result, 1);
   
   Revision = Result["entries"][0]["rev"];
   
   FunctionParameters.Insert("Dropbox_FileRevision", Revision);
   OPI_GetTestData.WriteParameter("Dropbox_FileRevision", Revision);
        
   OPI_Tools.Pause(5); 
        
EndProcedure

Procedure Dropbox_RestoreObjectToVersion(FunctionParameters)
   
    Version    = FunctionParameters["Dropbox_FileRevision"];
    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New/pic.png";  
    
    Result = OPI_Dropbox.RestoreObjectToVersion(Token, Path, Version);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "RestoreObjectToVersion", "Dropbox");
    
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
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetTagList", "Dropbox");
    
    Check_DropboxTags(Result, PathsArray.Quantity());
    
    Result = OPI_Dropbox.GetTagList(Token, "/New/mydoc.docx");
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetTagList (оdиночный)");
    
    Check_DropboxTags(Result, 1);
    
    HasTag = False;
    
    For Each Tag Of Result["paths_to_tags"][0]["tags"] Loop
        If Tag["tag_text"] = "important" Then
            HasTag = True;    
        EndIf;
    EndOfLoop;
    
    OPI_GetTestData.ExpectsThat(HasTag).Equal(True);
    
    OPI_Tools.Pause(5);  
        
EndProcedure

Procedure Dropbox_AddTag(FunctionParameters)
    
    Tag       = "Important";
    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New/mydoc.docx";  
    
    Result = OPI_Dropbox.AddTag(Token, Path, Tag);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "AddTag", "Dropbox");
    
    Check_Empty(Result);
    
    OPI_Tools.Pause(5);  
    
EndProcedure

Procedure Dropbox_DeleteTag(FunctionParameters)
    
    Tag       = "Important";
    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New/mydoc.docx";  
    
    Result = OPI_Dropbox.DeleteTag(Token, Path, Tag);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "DeleteTag", "Dropbox");
    
    Check_Empty(Result);
    
    OPI_Tools.Pause(5);  
    
EndProcedure

Procedure Dropbox_GetAccountInformation(FunctionParameters)
    
    Token = FunctionParameters["Dropbox_Token"];
    
    Result = OPI_Dropbox.GetAccountInformation(Token);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetAccountInformation", "Dropbox");
    
    Check_DropboxAccount(Result);
    
    Result = OPI_Dropbox.GetAccountInformation(Token, Result["account_id"]);
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetAccountInformation (withторонний)");
    
    Check_DropboxAccount(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Dropbox_GetSpaceUsageData(FunctionParameters)
  
    Token = FunctionParameters["Dropbox_Token"];
    
    Result = OPI_Dropbox.GetSpaceUsageData(Token);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "GetSpaceUsageData", "Dropbox");
    
    Check_DropboxSpace(Result);
      
EndProcedure

Procedure Dropbox_AddUsersToFile(FunctionParameters)
    
    Token = FunctionParameters["Dropbox_Token"];
    Email = FunctionParameters["Dropbox_OtherUser"];
    File  = FunctionParameters["Dropbox_FileID"];
    
    Result = OPI_Dropbox.AddUsersToFile(Token, File, Email, False);
    
    // END
        
    // !OInt OPI_GetTestData.WriteLog(Result, "AddUserToFile", "Dropbox");
    
    Check_DropboxMember(Result, Email, False);
    
    Mails = New Array;
    Mails.Add(Email);
    
    Result = OPI_Dropbox.AddUsersToFile(Token, File, Mails, True);
    
    Check_DropboxMember(Result, Email, True);
    
EndProcedure

Procedure Dropbox_PublishFolder(FunctionParameters)
    
    Token     = FunctionParameters["Dropbox_Token"];
    Path      = "/New"; 
   
    Result = OPI_Dropbox.PublishFolder(Token, Path);
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "PublishFolder", "Dropbox");
        
    Check_DropboxPublicFolder(Result);
   
    FolderID = Result["shared_folder_id"];
   
    FunctionParameters.Insert("Dropbox_SharedFolder", FolderID);
    OPI_GetTestData.WriteParameter("Dropbox_SharedFolder", FolderID);
        
    OPI_Tools.Pause(5); 

EndProcedure

Procedure Dropbox_CancelFolderPublication(FunctionParameters)
    
    Token  = FunctionParameters["Dropbox_Token"];
    Folder  = FunctionParameters["Dropbox_SharedFolder"];
 
    Result     = OPI_Dropbox.CancelFolderPublication(Token, Folder);
    CurrentStatus = "in_progress";
    JobID      = Result["async_job_id"];
    
    While CurrentStatus = "in_progress" Loop
        Result     = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
        CurrentStatus = Result[".tag"];
        OPI_Tools.Pause(3);
    EndOfLoop;
    
    // END
    
    // !OInt OPI_GetTestData.WriteLog(Result, "CancelFolderPublication", "Dropbox");
    
   Check_DropboxStatus(Result);
   
   OPI_Tools.Pause(5); 
   
EndProcedure

Procedure Dropbox_AddUsersToFolder(FunctionParameters)
    
    Token  = FunctionParameters["Dropbox_Token"];
    Email  = FunctionParameters["Dropbox_OtherUser"];
    Folder  = FunctionParameters["Dropbox_SharedFolder"]; // shared_folder_id
    
    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Email, False);
    
    // END
        
    // !OInt OPI_GetTestData.WriteLog(Result, "AddUserToFile", "Dropbox");
    
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
        
    // !OInt OPI_GetTestData.WriteLog(Result, "CancelFilePublication", "Dropbox");
    
    Check_Empty(Result);
    
EndProcedure

#EndRegion

#EndRegion

#EndRegion
