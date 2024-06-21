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

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

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
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_URL" , TestParameters);

	Telegram_SetWebhook(TestParameters);
	Telegram_DeleteWebhook(TestParameters);
    
EndProcedure

Procedure TelegramAPI_SendTextMessage() Export

    TestParameters = New Structure;
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("String" , TestParameters);
 	
	Telegram_SendTextMessage(TestParameters);
        
EndProcedure

Procedure TelegramAPI_SendImage() Export

    TestParameters = New Structure;
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("String" , TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
 	
	Telegram_SendPicture(TestParameters);
	Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure TelegramAPI_SendVideo() Export

    TestParameters = New Structure;
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("String" , TestParameters);
 	OPI_TestDataRetrieval.ParameterToCollection("Video" , TestParameters);
 	
	Telegram_SendVideo(TestParameters);
	Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure TelegramAPI_SendAudio() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Audio" , TestParameters);
    
    Telegram_SendAudio(TestParameters);
    Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure TelegramAPI_SendDocument() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document" , TestParameters);
    
    Telegram_SendDocument(TestParameters);

EndProcedure

Procedure TelegramAPI_SendGIF() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GIF" , TestParameters);
    
    Telegram_SendGif(TestParameters);

EndProcedure

Procedure TelegramAPI_SendMediaGroup() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video" , TestParameters);
    
    Telegram_SendMediaGroup(TestParameters);

EndProcedure

Procedure TelegramAPI_SendLocation() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Long" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Lat" , TestParameters);
    
    Telegram_SendLocation(TestParameters);

EndProcedure

Procedure TelegramAPI_SendContact() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Name" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Surname" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Phone" , TestParameters);

    Telegram_SendContact(TestParameters);

EndProcedure

Procedure TelegramAPI_SendPoll() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    
	Telegram_SendPoll(TestParameters);

EndProcedure

Procedure TelegramAPI_ForwardMessage() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelMessageID", TestParameters);

	Telegram_ForwardMessage(TestParameters);
        
EndProcedure

Procedure TelegramAPI_BanUnban() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID" , TestParameters);
    
    Telegram_Ban(TestParameters);
    Telegram_Unban(TestParameters);
    
EndProcedure

Procedure TelegramAPI_CreateInvitationLink() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    
	Telegram_CreateInviteLink(TestParameters);

EndProcedure

Procedure TelegramAPI_PinUnpinMessage() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelMessageID", TestParameters);
        
	Telegram_PinMessage(TestParameters);
	Telegram_UnpinMessage(TestParameters);
	Telegram_DeleteMessage(TestParameters);

EndProcedure

Procedure TelegramAPI_GetMemberCount() Export
 
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
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
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ForumID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String" , TestParameters);
    
	Telegram_CreateForumTopic(TestParameters);
	Telegram_EditForumTopic(TestParameters);
	Telegram_CloseForumTopic(TestParameters);
	Telegram_OpenForumTopic(TestParameters);
	Telegram_ClearPinnedMessagesList(TestParameters);
	Telegram_DeleteForumTopic(TestParameters);

EndProcedure

Procedure TelegramAPI_HideShowMainTopic() Export
 
 	TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ForumID", TestParameters);

	Telegram_HideMainForumTopic(TestParameters);
	Telegram_ShowMainForumTopic(TestParameters);

EndProcedure

Procedure TelegramAPI_ChangeMainTopicName() Export
 
 	TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token" , TestParameters);
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
    OPI_TestDataRetrieval.ParameterToCollection("Video" , TestParameters);
    
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
    Parameters = GetVKParameters();
    
    VK_CreateDiscussion(TestParameters);
    VK_CloseDiscussion(TestParameters);
    VK_OpenDiscussion(TestParameters);
    VK_PostToDiscussion(TestParameters);     
       
    OPI_VK.CloseDiscussion(TestParameters["VK_ConvID"], True, Parameters);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure VKAPI_LikeRepostComment() Export
 
    Parameters = GetVKParameters();
    Text = "Post from autotest";
    Message = "Message from autotest";
    TypeMap = Type("Map");
    TypeNumber = Type("Number");
    Response_ = "response";
    
    Result = OPI_VK.CreatePost(Text, New Array, , , Parameters);
    
    PostID = Result[Response_]["post_id"];    
    Result = OPI_VK.LikePost(PostID, , Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "LikePost");
    
    OPI_Tools.Pause(5);
      
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["likes"]).ИмеетТип(TypeNumber).Заполнено();
        
    ExternalPost = 2571;
    ExternalWall = -218704372;
        
    Result = OPI_VK.MakeRepost(ExternalPost, ExternalWall, , , Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "MakeRepost");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["success"]).ИмеетТип(TypeNumber).Равно(1);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["wall_repost_count"]).ИмеетТип(TypeNumber).Равно(1); 
        
    Result = OPI_VK.WriteComment(PostID, Parameters["owner_id"], Message, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "WriteComment");
        
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["comment_id"]).ИмеетТип(TypeNumber).Заполнено();
   
    OPI_VK.DeletePost(PostID, Parameters);
    OPI_VK.DeletePost(Result[Response_]["post_id"], Parameters);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_GetStatistics() Export
 
    CurrentDate = OPI_Tools.GetCurrentDate();
    Parameters = GetVKParameters();
    Date0 = BegOfDay(CurrentDate);
    Date1 = EndOfDay(Date0);
    TypeMap = Type("Map");
     
    Result = OPI_VK.GetStatistics(Date0, Date1, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetStatistics");
        
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"][0]["visitors"]).ИмеетТип(TypeMap).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["response"][0]["reach"]).ИмеетТип(TypeMap).Заполнено();
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_GetPostStatistics() Export
 
    Parameters = GetVKParameters();
    
    ArrayOfPosts = New Array;
    ArrayOfPosts.Add(214);
    ArrayOfPosts.Add(215);
    
    Result = OPI_VK.GetPostStatistics(ArrayOfPosts, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "GetPostStatistics");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Array").ИмеетДлину(2);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_CreateAdCampaign() Export
 
    Parameters = GetVKParameters();
    CabinetID = OPI_TestDataRetrieval.GetParameter("VK_AdsCabinetID");
    Name = "Test ads";
    TypeMap = Type("Map");
    TypeNumber = Type("Number");
    Response_ = "response";
    UID_ = "id";
        
    Result = OPI_VK.CreateAdvertisingCampaign(CabinetID, Name, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateAdvertisingCampaign");
    
    Result = Result[Response_][0];
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap); 
    OPI_TestDataRetrieval.ExpectsThat(Result["error_code"]).ИмеетТип(TypeNumber).Равно(602);
    OPI_TestDataRetrieval.ExpectsThat(Result[UID_]).ИмеетТип(TypeNumber).Заполнено();
        
    CampaignID = Result[UID_];
    CategoryID = 126;
    Limit = 150;
    
    Result = OPI_VK.CreatePost(Name, New Array, , , Parameters); 
    PostID = Result[Response_]["post_id"]; 
        
    Result = OPI_VK.CreateAd(CampaignID
        , Limit
        , CategoryID
        , PostID
        , CabinetID
        , Parameters);
        
    OPI_TestDataRetrieval.WriteLog(Result, "CreateAd");
            
    Result = Result[Response_][0];
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap); 
    OPI_TestDataRetrieval.ExpectsThat(Result["error_code"]).ИмеетТип(TypeNumber).Равно(602);
    OPI_TestDataRetrieval.ExpectsThat(Result[UID_]).ИмеетТип(TypeNumber).Заполнено();
        
    AnnouncementID = Result[UID_];
    Result = OPI_VK.PauseAdvertisingAd(CabinetID, AnnouncementID, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "PauseAdvertisingAd");
    
    Result = Result[Response_][0];
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap); 
    OPI_TestDataRetrieval.ExpectsThat(Result[UID_]).ИмеетТип(TypeNumber).Заполнено();
 
    OPI_VK.DeletePost(PostID, Parameters);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VKAPI_SendMessage() Export
 
    Parameters = GetVKParameters();
    User = OPI_TestDataRetrieval.GetParameter("VK_UserID");
    Token = OPI_TestDataRetrieval.GetParameter("VK_CommunityToken");
    Text = "Message from autotest";
    
    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2"); 
    
    Keyboard = OPI_VK.FormKeyboard(ButtonArray);
    Result = OPI_VK.WriteMessage(Text, User, Token, Keyboard, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "WriteMessage");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map"); 
    OPI_TestDataRetrieval.ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();
    
    OPI_Tools.Pause(5);
  
EndProcedure

Procedure VKAPI_GetProductCategories() Export
 
    Parameters = GetVKParameters();
    Result = OPI_VK.GetProductCategoryList(Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCategoryList");
    
    OPI_TestDataRetrieval.ExpectsThat(Result) 
        .ИмеетТип("Map")
        .Заполнено();
        
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VKAPI_CreateProductSelection() Export
 
    Parameters = GetVKParameters();
    TypeMap = Type("Map");
    TypeNumber = Type("Number");
    Response_ = "response";
    Image = OPI_TestDataRetrieval.GetBinary("Picture");
    TFN = GetTempFileName("png");   
    Image.Write(TFN);
        
    Result = OPI_VK.CreateProductCollection("Test album"
        , Image
        , True
        , False
        , Parameters);  
        
    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductCollection");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["albums_count"]).ИмеетТип(TypeNumber).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["market_album_id"]).ИмеетТип(TypeNumber).Заполнено();
             
    SelectionID = Result[Response_]["market_album_id"];
    
    Result = OPI_VK.EditProductCollection("EditedCollection", SelectionID, , , , Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "EditProductCollection");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]).ИмеетТип(TypeNumber).Равно(1);
 
    ImageArray = New Array;
    ImageArray.Add(OPI_TestDataRetrieval.GetBinary("Picture"));
    ImageArray.Add(OPI_TestDataRetrieval.GetBinary("Picture2"));
    
    Product = New Map();
    Product.Insert("Name" , "TestProduct");    
    Product.Insert("Description" , "Product description");
    Product.Insert("Category" , "20173");           
    Product.Insert("Price" , 1);                
    Product.Insert("OldPrice" , 15);     
    Product.Insert("MainPhoto" , Image);                   
    Product.Insert("URL" , "https://github.com/Bayselonarrend/OpenIntegrations");     
    Product.Insert("AdditionalPhotos" , ImageArray);     
    Product.Insert("MainInGroup" , True);                 
    Product.Insert("Width" , 20);     
    Product.Insert("Height" , 30);     
    Product.Insert("Depth" , 40);     
    Product.Insert("Weight" , 100);
    Product.Insert("SKU" , "12345");
    Product.Insert("AvailableBalance" , "10");
    
    Result = OPI_VK.AddProduct(Product, SelectionID, Parameters); // Adding product
    
    OPI_TestDataRetrieval.WriteLog(Result, "AddProduct");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["market_item_id"]).ИмеетТип(TypeNumber).Заполнено();
        
    ProductID = Result[Response_]["market_item_id"];
    
    Product = New Map;
    Product.Insert("Name", "EditedTestProduct");
    
    Result = OPI_VK.EditProduct(ProductID, Product, , Parameters); // Change product
    
    OPI_TestDataRetrieval.WriteLog(Result, "EditProduct");
    
    Check_VKTrue(Result);
    
    Result = OPI_VK.AddProductToSelection(ProductID, SelectionID, Parameters); // Adding in selection
    
    OPI_TestDataRetrieval.WriteLog(Result, "AddProductToSelection");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]).ИмеетТип(TypeNumber).Заполнено();
        
    Result = OPI_VK.RemoveProductFromSelection(ProductID, SelectionID, Parameters); // Deletes from selections
    
    OPI_TestDataRetrieval.WriteLog(Result, "RemoveProductFromSelection");
    
    OPI_Tools.Pause(5);
    Check_VKTrue(Result);
        
    Result = OPI_VK.DeleteProduct(ProductID, Parameters); // Deletion product
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProduct");
    
    OPI_Tools.Pause(5);
    Check_VKTrue(Result);
        
    Result = OPI_VK.DeleteSelection(SelectionID, Parameters); // Removal selections
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSelection");
    
    OPI_Tools.Pause(5);
    Check_VKTrue(Result);

    DeleteFiles(TFN);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VKAPI_CreateProductWithProperties() Export
 
    Parameters = GetVKParameters();
    TypeMap = Type("Map");
    TypeNumber = Type("Number");
    MII_ = "market_item_id";
    Response_ = "response";
    Yellow_ = "Yellow";
    Red_ = "Red";
    Image = OPI_TestDataRetrieval.GetBinary("Picture");
    TFN = GetTempFileName("png");   
    Image.Write(TFN);
    
    OptionArray = New Array;
    OptionArray.Add(Yellow_);
    OptionArray.Add("Blue");
    OptionArray.Add(Red_);
    
    Result = OPI_VK.CreateProductProperty("Color", Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductProperty");
    
    OPI_Tools.Pause(5);
    
    Property = Result[Response_]["property_id"];
    Property = OPI_Tools.NumberToString(Property);
     
    PropertyMap = New Map;
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["property_id"]).ИмеетТип(TypeNumber).Заполнено();
        
    Result = OPI_VK.EditProductProperty("Color (change.)", Property, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "EditProductProperty");
    
    OPI_Tools.Pause(5);
    
    Check_VKTrue(Result);
   
    For Each Option In OptionArray Do
        
        Result = OPI_VK.AddProductPropertyVariant(Option, Property, Parameters);
        
        OPI_TestDataRetrieval.WriteLog(Result, "AddProductPropertyVariant");
        
        OPI_Tools.Pause(5);
        
        OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
        OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["variant_id"]).ИмеетТип(TypeNumber).Заполнено();
            
        VariantID = Result[Response_]["variant_id"];
        PropertyMap.Insert(Option, VariantID);
        
        Result = OPI_VK.EditProductPropertyVariant(Option + String(New UUID())
            , Property
            , VariantID
            , Parameters);
            
        OPI_TestDataRetrieval.WriteLog(Result, "EditProductPropertyVariant");
        
    Check_VKTrue(Result);
              
    EndDo;
  
    ImageArray = New Array;
    ImageArray.Add(TFN);
    ImageArray.Add(Image);
    
    Product = New Map();
    Product.Insert("Name" , "TestProduct (" + Yellow_ + ")");    
    Product.Insert("Description" , "Product description");
    Product.Insert("Category" , "20173");           
    Product.Insert("Price" , 1);                
    Product.Insert("OldPrice" , 15);     
    Product.Insert("MainPhoto" , Image);                   
    Product.Insert("URL" , "https://github.com/Bayselonarrend/OpenIntegrations");     
    Product.Insert("AdditionalPhotos" , ImageArray);     
    Product.Insert("MainInGroup" , True);             
    Product.Insert("GroupNumber" , Undefined);      
    Product.Insert("Width" , 20);     
    Product.Insert("Height" , 30);     
    Product.Insert("Depth" , 40);     
    Product.Insert("Weight" , 100);
    Product.Insert("SKU" , 12345);
    Product.Insert("AvailableBalance" , "10");
    Product.Insert("PropertyValues" , PropertyMap[Yellow_]);
    
    Result = OPI_VK.AddProduct(Product, , Parameters); // Adding product  
    
    OPI_TestDataRetrieval.WriteLog(Result, "AddProduct");
    
    OPI_Tools.Pause(5);
    
    YellowID = Result[Response_]["market_item_id"];               
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_][MII_]).ИмеетТип(TypeNumber).Заполнено();
        
    Product.Insert("Name" , "TestProduct (" + Red_ + ")");
    Product.Insert("PropertyValues", PropertyMap[Red_]);

    Result = OPI_VK.AddProduct(Product, , Parameters); // Adding product
    
    OPI_TestDataRetrieval.WriteLog(Result, "AddProduct");
      
    OPI_Tools.Pause(5);
    
    RedID = Result[Response_][MII_];               
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_][MII_]).ИмеетТип(TypeNumber).Заполнено();
        
    ProductsArray = New Array;
    ProductsArray.Add(YellowID);
    ProductsArray.Add(RedID);
    
    Result = OPI_VK.GetProductsByID(ProductsArray, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsByID");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["items"]).ИмеетТип("Array").ИмеетДлину(2);
        
    Result = OPI_VK.GroupProducts(ProductsArray, , Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GroupProducts");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(TypeMap);
    OPI_TestDataRetrieval.ExpectsThat(Result[Response_]["item_group_id"]).ИмеетТип(TypeNumber).Заполнено();
       
    OPI_VK.DeleteProduct(YellowID , Parameters);
    OPI_VK.DeleteProduct(RedID, Parameters);
    
    For Each Option In PropertyMap Do
        
        Deletion = OPI_VK.DeleteProductPropertyVariant(Option.Value, Parameters);
        
        OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductPropertyVariant");
        
        OPI_Tools.Pause(5);
        Check_VKTrue(Deletion);
        
    EndDo;
        
    Deletion = OPI_VK.DeleteProductProperty(Property, Parameters);
   
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductProperty");
        
    OPI_Tools.Pause(5);
    
    Check_VKTrue(Deletion);

    DeleteFiles(TFN);
    
EndProcedure

Procedure VKAPI_GetProductList() Export
 
    Parameters = GetVKParameters();
    Image = OPI_TestDataRetrieval.GetBinary("Picture"); 
    
    ImageArray = New Array;
    ImageArray.Add(Image);
    
    Product = New Map();
    Product.Insert("Name" , "TestProduct2");    
    Product.Insert("Description" , "Product description");
    Product.Insert("Category" , "20173");           
    Product.Insert("Price" , 1);                
    Product.Insert("OldPrice" , 15);     
    Product.Insert("MainPhoto" , Image);                   
    Product.Insert("URL" , "https://github.com/Bayselonarrend/OpenIntegrations");     
    Product.Insert("AdditionalPhotos" , ImageArray);     
    Product.Insert("MainInGroup" , True);             
    Product.Insert("GroupNumber" , Undefined);      
    Product.Insert("Width" , 20);     
    Product.Insert("Height" , 30);     
    Product.Insert("Depth" , 40);     
    Product.Insert("Weight" , 100);
    Product.Insert("SKU" , 12345);
    Product.Insert("AvailableBalance" , "10");
    
    Result = OPI_VK.AddProduct(Product, , Parameters);
    ProductID = Result["response"]["market_item_id"];
    OPI_Tools.Pause(5);
    
    Result = OPI_VK.GetProductList(, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetProductList");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result) 
        .ИмеетТип("Array").Заполнено();
              
    OPI_VK.DeleteProduct(ProductID, Parameters);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VKAPI_GetSelectionList() Export
 
    Parameters = GetVKParameters();
    Image = OPI_TestDataRetrieval.GetBinary("Picture");    
    Result = OPI_VK.CreateProductCollection("TestCollection"
        , Image
        , True
        , False
        , Parameters); 
     
    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductCollection");
       
    SelectionID = Result["response"]["market_album_id"];      
    Result = OPI_VK.GetSelectionList(Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetSelectionList");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result) 
        .ИмеетТип("Array").Заполнено();
        
    OPI_VK.DeleteSelection(SelectionID, Parameters); 
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VKAPI_GetPropertyList() Export
 
    Parameters = GetVKParameters();
    Result = OPI_VK.GetPropertyList(Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetPropertyList");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result) 
        .ИмеетТип("Array").Заполнено();
        
    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_GetOrderList() Export
 
    Parameters = GetVKParameters();
    Result = OPI_VK.GetOrderList(Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetOrderList");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result) 
        .ИмеетТип("Array").Заполнено();
        
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VKAPI_UploadVideo() Export
    
    Parameters = GetVKParameters();
    Video = OPI_TestDataRetrieval.GetParameter("Video");
    Name = "NewVideo";
    Description = "Video description";
    
    Result = OPI_VK.UploadVideoToServer(Video, Name, Description, , Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "UploadVideoToServer");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["video_id"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["video_hash"]).Заполнено();
    
    OPI_Tools.Pause(5);
    
EndProcedure

#EndRegion

#Region YandexDisk

Procedure YDisk_GetDiskInfo() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    Map = "Map";
    
    Result = OPI_YandexDisk.GetDiskInformation(Token);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetDiskInformation");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(Map).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["system_folders"]).ИмеетТип(Map);
    OPI_TestDataRetrieval.ExpectsThat(Result["user"]).ИмеетТип(Map);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure YDisk_CreateFolder() Export
 
   Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
   Path = "/" + String(New UUID);
   
   Result = OPI_YandexDisk.CreateFolder(Token, Path);
   
    OPI_TestDataRetrieval.WriteLog(Result, "CreateFolder");
   
   OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
   OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Равно("dir");
   OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Равно("disk:" + Path);
        
   OPI_YandexDisk.DeleteObject(Token, Path, False);
  
   OPI_Tools.Pause(5);
  
EndProcedure

Procedure YDisk_UploadByUrlAndGetObject() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    Path = "/" + String(New UUID) + ".png";
    URL = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";

    OPI_YandexDisk.UploadFileByURL(Token, Path, URL);
    OPI_Tools.Pause(5);
        
    Result = OPI_YandexDisk.GetObject(Token, Path);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetObject");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Равно("file");
    OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Равно("disk:" + Path);

     OPI_YandexDisk.DeleteObject(Token, Path, False);
     
     OPI_Tools.Pause(5);
     
EndProcedure

Procedure YDisk_UploadDeleteFile() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    Path = "/" + String(New UUID) + ".png";
    Image = OPI_TestDataRetrieval.GetBinary("Picture");
    TFN = GetTempFileName("png");
    Image.Write(TFN);

    Result = OPI_YandexDisk.UploadFile(Token, Path, Image, True);
    
    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile");
    
    Check_Empty(Result);
    OPI_Tools.Pause(5);
    
    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject");
    
    Check_Empty(Result);
    
    Result = OPI_YandexDisk.UploadFile(Token, Path, TFN, True);
    
    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile");
    
    Check_Empty(Result);
    OPI_Tools.Pause(5);
    
    Result = OPI_YandexDisk.DeleteObject(Token, Path, False); 
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject");
    
    Check_Empty(Result);   

    DeleteFiles(TFN);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure YDisk_CreateObjectCopy() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    OriginalPath = "/" + String(New UUID) + ".png";
    CopyPath = "/" + String(New UUID) + ".png";
    URL = "https://raw.githubusercontent.com/Bayselonarrend/"
        + "OpenIntegrations/main/Media/logo.png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(5);
      
    Result = OPI_YandexDisk.CreateObjectCopy(Token, OriginalPath, CopyPath, True);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateObjectCopy");
    
    OPI_Tools.Pause(5);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Равно("file");
    OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Равно("disk:" + CopyPath);

     OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
     OPI_YandexDisk.DeleteObject(Token, CopyPath, False);
     
     OPI_Tools.Pause(5);
     
EndProcedure

Procedure YDisk_GetDownloadLink() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    Path = "/" + String(New UUID) + ".png";
    URL = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";

    OPI_YandexDisk.UploadFileByURL(Token, Path, URL);
    OPI_Tools.Pause(5);
       
    Result = OPI_YandexDisk.GetDownloadLink(Token, Path);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetDownloadLink");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["method"]).Равно("GET");
    OPI_TestDataRetrieval.ExpectsThat(Result["href"]).ИмеетТип("String").Заполнено();
    
    URL = Result["href"];
    
    Result = OPI_YandexDisk.DownloadFile(Token, Path);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("BinaryData").Заполнено();

    OPI_YandexDisk.DeleteObject(Token, Path, False);

EndProcedure

Procedure YDisk_GetFileList() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    Count = 2;
    Indent = 1;
    
    Result = OPI_YandexDisk.GetFilesList(Token, Count, Indent, "image");
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["limit"]).Равно(Count);
    OPI_TestDataRetrieval.ExpectsThat(Result["offset"]).Равно(Indent);
    OPI_TestDataRetrieval.ExpectsThat(Result["items"]).ИмеетТип("Array");
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure YDisk_MoveObject() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    OriginalPath = "/" + String(New UUID) + ".png";
    CopyPath = "/" + String(New UUID) + ".png";
    URL = "https://raw.githubusercontent.com/Bayselonarrend/"
        + "OpenIntegrations/main/Media/logo.png";

    Result = OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    
    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileByURL");
    
    OPI_Tools.Pause(15);
      
    Result = OPI_YandexDisk.MoveObject(Token, OriginalPath, CopyPath, True);
    
    OPI_TestDataRetrieval.WriteLog(Result, "MoveObject");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Равно("file");
    OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Равно("disk:" + CopyPath);

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
    OPI_YandexDisk.DeleteObject(Token, CopyPath, False);
    
    OPI_Tools.Pause(5);
     
EndProcedure

Procedure YDisk_PublicObjectActions() Export
 
    PUrl = "public_url";
    Map = "Map";
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    Path = "/" + String(New UUID) + ".png";
    URL = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";
    
    OPI_YandexDisk.UploadFileByURL(Token, Path, URL);
    OPI_Tools.Pause(5);
    
    ResultArray = New Array;
    
    ResultArray.Add(OPI_YandexDisk.PublishObject(Token, Path)); 
    PublicURL = ResultArray[0][PUrl];
    
    Result = OPI_YandexDisk.GetDownloadLinkForPublicObject(Token, PublicURL);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetDownloadLinkForPublicObject");
              
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(Map).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["method"]).Равно("GET");
    OPI_TestDataRetrieval.ExpectsThat(Result["href"]).ИмеетТип("String").Заполнено();
    
    Result = OPI_YandexDisk.GetPublicObject(Token, PublicURL);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetPublicObject");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(Map).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Равно("file");
    OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Равно("/");
    
    ResultArray.Add(OPI_YandexDisk.SavePublicObjectToDisk(Token, PublicURL));
                
    ResultArray.Add(OPI_YandexDisk.CancelObjectPublication(Token, Path));
    
    Counter = 0;
    For Each Result In ResultArray Do
        
        OPI_TestDataRetrieval.WriteLog(Result, "PublicationChange");
            
        OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип(Map).Заполнено();
        OPI_TestDataRetrieval.ExpectsThat(Result["type"]).Равно("file");
        OPI_TestDataRetrieval.ExpectsThat(Result["path"]).Заполнено();
            
        If Counter = 0 Then   
            OPI_TestDataRetrieval.ExpectsThat(Result[PUrl]).ИмеетТип("String").Заполнено();
        Else
            OPI_TestDataRetrieval.ExpectsThat(Result[PUrl]).ИмеетТип("Undefined");
        EndIf;
        
        Counter = Counter + 1;
        
    EndDo;
     
    OPI_YandexDisk.DeleteObject(Token, Path, False);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure YDisk_GetPublishedList() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("YandexDisk_Token");
    Count = 2;
    Indent = 1;
    
    Result = OPI_YandexDisk.GetPublishedObjectsList(Token, Count, Indent);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetPublishedObjectsList");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["limit"]).Равно(Count);
    OPI_TestDataRetrieval.ExpectsThat(Result["offset"]).Равно(Indent);
    OPI_TestDataRetrieval.ExpectsThat(Result["items"]).ИмеетТип("Array");
    
    OPI_Tools.Pause(5);
    
EndProcedure

#EndRegion

#Region Viber

Procedure Viber_GetChannelInfo() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken");    
    Result = OPI_Viber.GetChannelInformation(Token);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelInformation");
        
    Check_ViberOk(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_GetUserData() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken"); 
    User = OPI_TestDataRetrieval.GetParameter("Viber_ChannelAdminID");
    Result = OPI_Viber.GetUserData(Token, User);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetUserData");
        
    OPI_TestDataRetrieval.ExpectsThat(Result["chat_hostname"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["status_message"]).Заполнено();
    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_GetOnlineUsers() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken"); 
    User = OPI_TestDataRetrieval.GetParameter("Viber_UserID");
    Result = OPI_Viber.GetOnlineUsers(Token, User);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetOnlineUsers");
        
    OPI_TestDataRetrieval.ExpectsThat(Result["users"]).ИмеетТип("Array");
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_SendTextMessage() Export
 
    Text = "TestMessage";
    ChannelToken = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken");
    BotToken = OPI_TestDataRetrieval.GetParameter("Viber_Token");   
    User = OPI_TestDataRetrieval.GetParameter("Viber_UserID");
    Administrator = OPI_TestDataRetrieval.GetParameter("Viber_ChannelAdminID");
    
    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");
    
    Keyboard = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);
 
    Result = OPI_Viber.SendTextMessage(BotToken, Text, User, False, Keyboard);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    Result = OPI_Viber.SendTextMessage(ChannelToken, Text, Administrator, True, Keyboard);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendImage() Export

    Text = "TestMessage";
    Image = OPI_TestDataRetrieval.GetParameter("Picture");
    ChannelToken = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken");
    BotToken = OPI_TestDataRetrieval.GetParameter("Viber_Token");   
    User = OPI_TestDataRetrieval.GetParameter("Viber_UserID");
    Administrator = OPI_TestDataRetrieval.GetParameter("Viber_ChannelAdminID");
     
    Result = OPI_Viber.SendImage(BotToken, Image, User, False, Text);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendImage");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    Result = OPI_Viber.SendImage(ChannelToken, Image, Administrator, True, Text);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendImage");
        
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendFile() Export
  
    Document = OPI_TestDataRetrieval.GetParameter("Document");
    ChannelToken = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken");
    BotToken = OPI_TestDataRetrieval.GetParameter("Viber_Token");   
    User = OPI_TestDataRetrieval.GetParameter("Viber_UserID");
    Administrator = OPI_TestDataRetrieval.GetParameter("Viber_ChannelAdminID");
       
    Result = OPI_Viber.SendFile(BotToken, Document, User, False, "docx");
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendFile");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    Result = OPI_Viber.SendFile(ChannelToken, Document, Administrator, True, "docx");
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendFile");
        
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendContact() Export
 
    Name = "Petr Petrov";
    Phone = "+123456789";
    ChannelToken = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken");
    BotToken = OPI_TestDataRetrieval.GetParameter("Viber_Token");   
    User = OPI_TestDataRetrieval.GetParameter("Viber_UserID");
    Administrator = OPI_TestDataRetrieval.GetParameter("Viber_ChannelAdminID");
         
    Result = OPI_Viber.SendContact(BotToken, Name, Phone, User, False);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendContact");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    Result = OPI_Viber.SendContact(ChannelToken, Name, Phone, Administrator, True);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendContact");
        
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendLocation() Export

    Latitude = "48.87373649724122";
    Longitude = "2.2954639195323967";
    ChannelToken = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken");
    BotToken = OPI_TestDataRetrieval.GetParameter("Viber_Token");   
    User = OPI_TestDataRetrieval.GetParameter("Viber_UserID");
    Administrator = OPI_TestDataRetrieval.GetParameter("Viber_ChannelAdminID");
         
    Result = OPI_Viber.SendLocation(BotToken, Latitude, Longitude, User, False);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendLocation");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    Result = OPI_Viber.SendLocation(ChannelToken, Latitude, Longitude, Administrator, True);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendLocation");
        
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Viber_SendLink() Export

    URL = "https://github.com/Bayselonarrend/OpenIntegrations";
    ChannelToken = OPI_TestDataRetrieval.GetParameter("Viber_ChannelToken");
    BotToken = OPI_TestDataRetrieval.GetParameter("Viber_Token");   
    User = OPI_TestDataRetrieval.GetParameter("Viber_UserID");
    Administrator = OPI_TestDataRetrieval.GetParameter("Viber_ChannelAdminID");
         
    Result = OPI_Viber.SendLink(BotToken, URL, User, False);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendLink");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    Result = OPI_Viber.SendLink(ChannelToken, URL, Administrator, True);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendLink");
        
    OPI_TestDataRetrieval.ExpectsThat(Result["message_token"]).Заполнено();
    Check_ViberOk(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure GV_GetAuthorizationLink() Export
 
    ClientID = OPI_TestDataRetrieval.GetParameter("Google_ClientID");    
    Result = OPI_GoogleWorkspace.FormCodeRetrievalLink(ClientID);
            
    OPI_TestDataRetrieval.ExpectsThat(Result)
        .ИмеетТип("String") 
        .Заполнено();
        
    OPI_TestDataRetrieval.WriteParameter("Google_Link", Result);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure GV_GetToken() Export
 
    ClientID = OPI_TestDataRetrieval.GetParameter("Google_ClientID");
    ClientSecret = OPI_TestDataRetrieval.GetParameter("Google_ClientSecret");
    Code = OPI_TestDataRetrieval.GetParameter("Google_Code");
    
    Result = OPI_GoogleWorkspace.GetTokenByCode(ClientID, ClientSecret, Code);
           
    If ValueIsFilled(Result["access_token"])
        And ValueIsFilled(Result["refresh_token"]) Then
        
        OPI_TestDataRetrieval.WriteParameter("Google_Token" , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Google_Refresh", Result["refresh_token"]);
    
    EndIf;
    
    OPI_Tools.Pause(5);
      
EndProcedure

Procedure GV_UpdateToken() Export
 
    ClientID = OPI_TestDataRetrieval.GetParameter("Google_ClientID");
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
 
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");    
    Result = OPI_GoogleCalendar.GetCalendarList(Token);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetCalendarList");
    
    OPI_TestDataRetrieval.ExpectsThat(Result)
        .ИмеетТип("Array");

    OPI_Tools.Pause(5);
            
EndProcedure

Procedure GC_CreateDeleteCalendar() Export
 
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token"); 
    Name = "TestCalendar";
    Description = "TestDescription";
    EditedName = Name + " (change.)";
    TypeMap = Type("Map");
    TypeString = Type("String");
    Summary = "summary";
    Black = "#000000";
    Yellow = "#ffd800";
    
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
 
    CurrentDate = OPI_Tools.GetCurrentDate();
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token"); 
    Calendar = OPI_TestDataRetrieval.GetParameter("Google_CalendarID");
    Name = "New event";
    Description = "TestEventDescription";
    EditedDescription = "Test event description (change.)";
    UID = "id";
    Hour = 3600;

    Attachments = New Map;
    
    Attachments.Insert("Image1"
        , "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png");
    Attachments.Insert("Image2"
        , "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1");
    
    EventMap = New Map;
    EventMap.Insert("Description" , Description);
    EventMap.Insert("Title" , Name);
    EventMap.Insert("Venue" , "InOffice");
    EventMap.Insert("StartDate" , CurrentDate);
    EventMap.Insert("EndDate" , EventMap["StartDate"] + Hour);
    EventMap.Insert("ArrayOfAttachmentURLs" , Attachments);
    EventMap.Insert("SendNotifications" , True);
    
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
 
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");    
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
    Name_ = "name";
    Name = "TestFolder";
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Result = OPI_GoogleDrive.GetDirectoriesList(Token, Name, True);
    
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
    
    Kind_ = "kind";
    Content_ = "content";
    MIME_ = "MIME";
    MimeType_ = "mimeType";
    Name_ = "name";
    Id_ = "id";
    
    ArrayOfDeletions = New Array;
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Image = OPI_TestDataRetrieval.GetBinary("Picture");
    ReplacementImage = OPI_TestDataRetrieval.GetBinary("Picture2");
    Directory = OPI_TestDataRetrieval.GetParameter("GD_Catalog");
    
    Description = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);
   
    Result = OPI_GoogleDrive.UploadFile(Token, Image, Description);
    
    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile");
    
    OPI_TestDataRetrieval.ExpectsThat(Result[MimeType_]).Равно(Description[MIME_]);
    OPI_TestDataRetrieval.ExpectsThat(Result[Name_]).Равно(Description["Name"]);

    Identifier = Result[Id_];
    ArrayOfDeletions.Add(Identifier);
    
    NewName = "CopiedFile.jpeg";
    Result = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, "root");
    
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
    Result = OPI_GoogleDrive.UpdateFile(Token, Identifier, ReplacementImage, NewName);
    
    OPI_TestDataRetrieval.WriteLog(Result, "UpdateFile");
    
    OPI_TestDataRetrieval.ExpectsThat(Result[MimeType_]).Равно(Description[MIME_]);
    OPI_TestDataRetrieval.ExpectsThat(Result[Name_]).Равно(NewName);

    OPI_Tools.Pause(5);
    
    Comment = "Yo";
    Result = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);
    
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
    
    Kind_ = "kind";
    Content_ = "content";
    Id_ = "id";
    Comments_ = "comments";
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Directory = OPI_TestDataRetrieval.GetParameter("GD_Catalog");
    Image = OPI_TestDataRetrieval.GetBinary("Picture");
    
    Description = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);
    
    Result = OPI_GoogleDrive.UploadFile(Token, Image, Description);
    Identifier = Result[Id_];
    
    Comment = "NewComment";
    ResultArray = New Array;
    Result = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateComment");
    
    CommentID = Result[Id_];
    
    ResultArray.Add(Result);
    
    Result = OPI_GoogleDrive.GetComment(Token, Identifier, CommentID);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetComment");
    
    ResultArray.Add(Result);
    
    Result = OPI_GoogleDrive.GetCommentList(Token, Identifier);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetCommentList");
    
    Comments = Result[Comments_];
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
    
    Name_ = "name";
    Name = "TestFolder";
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");
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
    Name = "TestTable";
    
    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");
    
    Result = OPI_GoogleSheets.CreateSpreadsheet(Token, Name, SheetArray);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateSpreadsheet");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["properties"]["title"]).Равно(Name);

    For N = 0 To SheetArray.UBound() Do
        
        SheetName = Result["sheets"][N]["properties"]["title"];
        OPI_TestDataRetrieval.ExpectsThat(SheetName).Равно(SheetArray[N]);
        Sheet = Result["sheets"][N]["properties"]["sheetId"];
        Sheet = OPI_Tools.NumberToString(Sheet);
        
    EndDo;
    
    Spreadsheet = Result["spreadsheetId"];
    
    OPI_TestDataRetrieval.WriteParameter("GS_Spreadsheet", Spreadsheet);
    OPI_TestDataRetrieval.WriteParameter("GS_Sheet" , Sheet);
    
    Name = "Test table (new.)";
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
    
    Name = "Test table (change.)";
    
    Result = OPI_GoogleSheets.EditSpreadsheetTitle(Token, Spreadsheet, Name);
    
    OPI_TestDataRetrieval.WriteLog(Result, "EditSpreadsheetTitle");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);
    
EndProcedure

Procedure GT_GetTable() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Spreadsheet = OPI_TestDataRetrieval.GetParameter("GS_Spreadsheet");
    Name = "Test table (change.)";

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Spreadsheet);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetTable");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["properties"]["title"]).Равно(Name);

EndProcedure

Procedure GT_FillClearCells() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Google_Token");
    Spreadsheet = OPI_TestDataRetrieval.GetParameter("GS_Spreadsheet");
    Sheet = "Sheet2";

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
    Result = OPI_Twitter.GetAuthorizationLink(Parameters);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("String").Заполнено();
    
    OPI_TestDataRetrieval.WriteParameter("Twitter_URL", Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Twitter_UpdateToken() Export
 
    Parameters = GetTwitterParameters();
    Result = OPI_Twitter.RefreshToken(Parameters);
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["access_token"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["refresh_token"]).Заполнено();
        
    Refresh = Result["refresh_token"];
    Token = Result["access_token"];
    
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
    Text = "TestTweet" + String(New UUID);
    
    Result = OPI_Twitter.CreateTextTweet(Text, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateTextTweet");
    
    Check_TwitterText(Result, Text);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Twitter_CreateTweetWithImage() Export
 
    Parameters = GetTwitterParameters();
    Text = "TestTweet" + String(New UUID);
    Image = OPI_TestDataRetrieval.GetBinary("Picture");
    TFN = GetTempFileName("png");
    Image.Write(TFN);
   
    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters); 
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateImageTweet");
    
    Check_TwitterText(Result, Text);    
    
    Text = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, TFN, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateImageTweet");
    
    Check_TwitterText(Result, Text);
    
    DeleteFiles(TFN);
    
    OPI_Tools.Pause(20);
    
EndProcedure

Procedure Twitter_CreateTweetWithVideo() Export
 
    Parameters = GetTwitterParameters();
    Text = "TestTweet" + String(New UUID);
    Video = OPI_TestDataRetrieval.GetBinary("Video");
    TFN = GetTempFileName("mp4");
    Video.Write(TFN);
   
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);    
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateVideoTweet");
    
    Check_TwitterText(Result, Text);    
    
    Text = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, TFN, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateVideoTweet");
    
    Check_TwitterText(Result, Text);
    
    DeleteFiles(TFN);
    
    OPI_Tools.Pause(20);
    
EndProcedure

Procedure Twitter_CreateTweetWithGif() Export
 
    Parameters = GetTwitterParameters();
    Text = "TestTweet" + String(New UUID);
    GIF = OPI_TestDataRetrieval.GetBinary("GIF");
    TFN = GetTempFileName("gif");
    GIF.Write(TFN);
   
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);   
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateGifTweet");
     
    Check_TwitterText(Result, Text);    
    
    Text = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, TFN, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateGifTweet");
    
    Check_TwitterText(Result, Text);
    
    DeleteFiles(TFN);
    
    OPI_Tools.Pause(20);
    
EndProcedure

Procedure Twitter_CreateTweetWithPoll() Export
 
    Parameters = GetTwitterParameters();
    Text = "TestTweet" + String(New UUID);
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
	
	Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
	Parent = OPI_TestDataRetrieval.GetParameter("Notion_Parent");
	Title = "TestTitle";
	 
	Result = OPI_Notion.CreatePage(Token, Parent, Title);
	
	OPI_TestDataRetrieval.WriteLog(Result, "CreatePage");
    
    Check_NotionObject(Result);

EndProcedure

Procedure Notion_CreateEditDatabase() Export
	
	Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
	Parent = OPI_TestDataRetrieval.GetParameter("Notion_Parent");
	Title = "TestTitle";
	
	Properties = New Map;
	Properties.Insert("Name" , "title");
	Properties.Insert("Description" , "rich_text");
	Properties.Insert("Number" , "number");
	Properties.Insert("Status" , "status");
	Properties.Insert("CreationDate" , "date");
	Properties.Insert("Image" , "files");
	Properties.Insert("Active" , "checkbox");
	Properties.Insert("Website" , "url");
	Properties.Insert("Email" , "email");
	Properties.Insert("Phone" , "phone_number");
	Properties.Insert("User" , "people");
	
	ValueSelection = New Map;
	ValueSelection.Insert("New", "green");
	ValueSelection.Insert("InProgress", "yellow");
	ValueSelection.Insert("Remote", "red");
	Properties.Insert("Status", ValueSelection);
	
	Result = OPI_Notion.CreateDatabase(Token, Parent, Title, Properties); 
	
	OPI_TestDataRetrieval.WriteLog(Result, "CreateDatabase");
    
    Check_NotionObject(Result, "database");
    
    Base = Result["id"];
    Title = "TestTitle";
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
	Page = OPI_TestDataRetrieval.GetParameter("Notion_Page");
	
	Result = OPI_Notion.GetPage(Token, Page);
	
	OPI_TestDataRetrieval.WriteLog(Result, "GetPage");
    
    Check_NotionObject(Result);	
    
EndProcedure

Procedure Notion_GetDatabaseInfo() Export

	Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
	Base = OPI_TestDataRetrieval.GetParameter("Notion_Base");
		
	Result = OPI_Notion.GetDatabase(Token, Base);
	
	OPI_TestDataRetrieval.WriteLog(Result, "GetDatabase");
    
    Check_NotionObject(Result, "database");
    
EndProcedure

Procedure Notion_CreatePageInDatabase() Export
	
	Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
	Base = OPI_TestDataRetrieval.GetParameter("Notion_Base");
	
	Image = New Map;
	Image.Insert("Logo", OPI_TestDataRetrieval.GetParameter("Picture"));
	
	Properties = New Map;
	Properties.Insert("Name" , "LLC Vector");
	Properties.Insert("Description" , "OurFirstClient");
	Properties.Insert("Number" , 1);
	Properties.Insert("Status" , "Regular");
	Properties.Insert("CreationDate" , OPI_Tools.GetCurrentDate());
	Properties.Insert("Image" , Image);
	Properties.Insert("Active" , True);
	Properties.Insert("Website" , "https://vector.ru");
	Properties.Insert("Email" , "mail@vector.ru");
	Properties.Insert("Phone" , "88005553535");
	Properties.Insert("Status"	 , "New");
	
	Result = OPI_Notion.CreatePageInDatabase(Token, Base, Properties);
	
	OPI_TestDataRetrieval.WriteLog(Result, "CreatePageInDatabase");
    
    Check_NotionObject(Result);
    
    Parent = StrReplace(Result["parent"]["database_id"], "-", "");
    OPI_TestDataRetrieval.ExpectsThat(Parent).Равно(Base);
       	 
EndProcedure

Procedure Notion_EditPageProperties() Export
	
	Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
	Page = OPI_TestDataRetrieval.GetParameter("Notion_Page");
	Icon = OPI_TestDataRetrieval.GetParameter("Picture");
	Cover = OPI_TestDataRetrieval.GetParameter("Picture2");
	Archive = False;
	
	Properties = New Map;
	Properties.Insert("Active" , False);
	Properties.Insert("Email" , "vector@mail.ru");
	
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
	
	Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
	Parent = OPI_TestDataRetrieval.GetParameter("Notion_Parent");
	Block = OPI_TestDataRetrieval.GetParameter("Notion_Block");
	
	Result = OPI_Notion.ReturnBlock(Token, Block);	
    
    OPI_TestDataRetrieval.WriteLog(Result, "ReturnBlock");
    
    Check_NotionObject(Result, "block");
    
	Result = OPI_Notion.CreateBlock(Token, Parent, Result);
	
	OPI_TestDataRetrieval.WriteLog(Result, "CreateBlock");
    
    Check_NotionObject(Result, "list");
    
    Block = Result["results"][0]["id"];
	Result = OPI_Notion.ReturnChildBlocks(Token, Block);
	
	OPI_TestDataRetrieval.WriteLog(Result, "ReturnChildBlocks");
    
    Check_NotionObject(Result, "list");
    
	Result = OPI_Notion.DeleteBlock(Token, Block);
	
	OPI_TestDataRetrieval.WriteLog(Result, "DeleteBlock");
    
    Check_NotionObject(Result, "block");
    
EndProcedure

Procedure Notion_GetUsers() Export
	
	Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
	Result = OPI_Notion.UserList(Token);
	
	OPI_TestDataRetrieval.WriteLog(Result, "UserList");
    
    Check_NotionObject(Result, "list");
    
EndProcedure

Procedure Notion_GetUserData() Export
	
	Token = OPI_TestDataRetrieval.GetParameter("Notion_Token");
	User = OPI_TestDataRetrieval.GetParameter("Notion_User"); 
	Result = OPI_Notion.GetUserData(Token, User);
	
	OPI_TestDataRetrieval.WriteLog(Result, "GetUserData");
    
    Check_NotionObject(Result, "user");
    
EndProcedure

#EndRegion

#Region Slack

Procedure Slack_GetBotInfo() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Result = OPI_Slack.GetBotInformation(Token);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetBotInformation");
    
    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["bot_id"]).Заполнено();
    OPI_TestDataRetrieval.ExpectsThat(Result["user_id"]).Заполнено();
    
EndProcedure

Procedure Slack_GetUserList() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Result = OPI_Slack.GetUserList(Token);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetUserList");
    
    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["members"]).ИмеетТип("Array");
    
EndProcedure

Procedure Slack_GetRegionList() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Result = OPI_Slack.GetWorkspaceList(Token);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetWorkspaceList");
    
    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["teams"]).ИмеетТип("Array");
    
EndProcedure

Procedure Slack_SendDeleteMessage() Export

    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token"); 
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    Text = "TestMessage1";
    Text2 = "TestMessage2";
    Tags = New Array;
    Image = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1";
    
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
    Block = OPI_Slack.GenerateImageBlock(Image, "Yo");
    BlockArray.Add(Block);
    
    Result = OPI_Slack.SendMessage(Token, Channel, Text, , BlockArray);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (picture)");
    
    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["ts"]).Заполнено();
    
    Tags.Add(Result["ts"]);
    
    Block = OPI_Slack.GenerateImageBlock(Image, "Yo");
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
    
    Hour = 3600;
    Day = 24;
    Sending = OPI_Tools.GetCurrentDate() + (Day * Hour);
    Result = OPI_Slack.SendMessage(Token, Channel, Text, Sending);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (scheduled)");
    
    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["channel"]).Равно(Channel);
    OPI_TestDataRetrieval.ExpectsThat(Result["scheduled_message_id"]).Заполнено();
    
    Timestamp = Result["scheduled_message_id"];
    Result = OPI_Slack.DeleteMessage(Token, Channel, Timestamp, True);
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage");

    Check_SlackOk(Result);

EndProcedure

Procedure Slack_SendDeleteEphemeral() Export
   
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token"); 
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    User = OPI_TestDataRetrieval.GetParameter("Slack_User");
    Image = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1";
    Text = "TestMessage1";
    
    Block = OPI_Slack.GenerateImageBlock(Image, "Yo");
    Result = OPI_Slack.SendEphemeralMessage(Token, Channel, Text, User, Block);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage");
    
    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["message_ts"]).Заполнено();
     
EndProcedure

Procedure Slack_GetScheduledMessages() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token"); 
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    
    Result = OPI_Slack.GetDelayedMessageList(Token, Channel);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetDelayedMessageList");
    
    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["scheduled_messages"]).ИмеетТип("Array");
   
EndProcedure

Procedure Slack_CreateArchiveChannel() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    User = OPI_TestDataRetrieval.GetParameter("Slack_User");
    Name = "testconv" + String(New UUID);
    Topic = "TestTopic";
    Purpose = "TestGoal";
    
    #Region CreateChannel
    Result = OPI_Slack.CreateChannel(Token, Name);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateChannel");
    
    Data = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(Name);
    #EndRegion

    #Region SetChannelTopic
    Result = OPI_Slack.SetChannelTopic(Token, Channel, Topic);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SetChannelTopic");
    
    Data = Result["channel"];
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
    
    Data = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(Name);
    #EndRegion
    
    #Region InviteUsersToChannel
    Result = OPI_Slack.InviteUsersToChannel(Token, Channel, User);
    
    OPI_TestDataRetrieval.WriteLog(Result, "InviteUsersToChannel");
    
    Data = Result["channel"];
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
    
    Data = Result["channel"];
    Channel = Data["id"];

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Data["name"]).Равно(Name);
    #EndRegion
    
    #Region RenameChannel
    NewName = "testconv" + String(New UUID);
    Result = OPI_Slack.RenameChannel(Token, Channel, NewName);
    
    OPI_TestDataRetrieval.WriteLog(Result, "RenameChannel");
    
    Data = Result["channel"];
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
    User = OPI_TestDataRetrieval.GetParameter("Slack_User");
    Text = "Yo, dude";
    
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
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    
    Result = OPI_Slack.GetFilesList(Token, Channel);
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList");

    Check_SlackOk(Result);
    OPI_TestDataRetrieval.ExpectsThat(Result["files"]).ИмеетТип("Array");

EndProcedure

Procedure Slack_UploadDeleteFile() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    File = OPI_TestDataRetrieval.GetBinary("Document");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    ArrayOfFiles = New Array;
    FileName = "megadoc.docx";
    Title = "NewFile";
    
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
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
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
    
    Token = OPI_TestDataRetrieval.GetParameter("Slack_Token");
    File = OPI_TestDataRetrieval.GetParameter("Document");
    Channel = OPI_TestDataRetrieval.GetParameter("Slack_Channel");
    Title = "NewFile";
    
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
    
    Token = OPI_TestDataRetrieval.GetParameter("Airtable_Token");
    Region = OPI_TestDataRetrieval.GetParameter("Airtable_Workspace");
    Name = "TestDatabase";
    
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
    Base = OPI_TestDataRetrieval.GetParameter("Airtable_Base");
    
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
    
    TableName = "TestTable2";
    Description = "NewTable";
    
    Result = OPI_Airtable.CreateTable(Token, Base, TableName, FieldArray, Description);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateTable");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["name"]).Равно(TableName);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно(Description);
    
    Table = Result["id"];
    TableName = "Test table 2 (change.)";
    Description = "New table (change.)";
   
    OPI_TestDataRetrieval.WriteParameter("Airtable_Table", Table);
    
    Result = OPI_Airtable.ModifyTable(Token, Base, Table, TableName, Description);
    
    OPI_TestDataRetrieval.WriteLog(Result, "ModifyTable");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["name"]).Равно(TableName);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно(Description);

EndProcedure

Procedure AT_CreateField() Export
    
    Token = OPI_TestDataRetrieval.GetParameter("Airtable_Token");
    Base = OPI_TestDataRetrieval.GetParameter("Airtable_Base");
    Table = OPI_TestDataRetrieval.GetParameter("Airtable_Table");
    Name = String(New UUID);
    
    Field = OPI_Airtable.GetNumberField(Name);
    
    Result = OPI_Airtable.CreateField(Token, Base, Table, Field);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateField");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["name"]).Равно(Name);
    
    Field = Result["id"]; 
    Name = Name + "(change.)";
    Description = "New description";
    
    Result = OPI_Airtable.ModifyField(Token, Base, Table, Field, Name, Description);
    
    OPI_TestDataRetrieval.WriteLog(Result, "ModifyField");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["name"]).Равно(Name);
    OPI_TestDataRetrieval.ExpectsThat(Result["description"]).Равно(Description);
    
EndProcedure

Procedure AT_CreateDeleteRecords() Export

    Token = OPI_TestDataRetrieval.GetParameter("Airtable_Token");
    Base = OPI_TestDataRetrieval.GetParameter("Airtable_Base");
    Table = OPI_TestDataRetrieval.GetParameter("Airtable_Table");
    
    Numeric = 10;
    StringType = "Hello";
    
    RowDescription1 = New Structure("Number,String", Numeric, StringType);
    RowDescription2 = New Structure("Number,String", Numeric, StringType);
    
    ArrayOfDeletions = New Array;
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
    
    Text = "TestComment";
    Result = OPI_Airtable.CreateComment(Token, Base, Table, SingleRecord, Text);
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateComment");
    
    OPI_TestDataRetrieval.ExpectsThat(Result["text"]).Равно(Text);
    
    Comment = Result["id"];
    Text = "Test comment (change.)";
    Result = OPI_Airtable.EditComment(Token, Base, Table, SingleRecord, Comment, Text);
    
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
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Appkey" , TestParameters);
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
    OPI_TestDataRetrieval.ParameterToCollection("Picture", TestParameters);
    
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
    OPI_TestDataRetrieval.ParameterToCollection("Document", TestParameters);
    
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
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_OtherUser", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_FileID" , TestParameters);
    
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
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_ClientSecret", TestParameters);
    
    Bitrix24_GetAppAuthLink(TestParameters);
    
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Code", TestParameters);
    
    Bitrix24_GetToken(TestParameters);
    
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Refresh", TestParameters);
    
    Bitrix24_RefreshToken(TestParameters);
    
EndProcedure

Procedure B24_ServerTime() Export
	
	TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
   
    Bitrix24_ServerTime(TestParameters); 

EndProcedure

Procedure B24_PostsManagment() Export
    
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2" , TestParameters);

    Bitrix24_CreatePost(TestParameters);
    Bitrix24_UpdatePost(TestParameters);
    Bitrix24_GetImportantPostViewers(TestParameters);
    Bitrix24_GetPosts(TestParameters);
    Bitrix24_CreateComment(TestParameters);
    Bitrix_AddPostRecipients(TestParameters);
    Bitrix24_DeletePost(TestParameters);
    
EndProcedure

Procedure B24_TaskManagment() Export
    
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_UserID" , TestParameters);
    
    Bitrix24_GetTaskFieldsStructure(TestParameters);
    Bitrix24_CreateTask(TestParameters);
    Bitrix24_UpdateTask(TestParameters);
    Bitrix24_GetTask(TestParameters);
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
    Bitrix24_DeleteTask(TestParameters);
    
EndProcedure

Procedure B24_WorkingWithDrive() Export
    
    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2" , TestParameters);

    Bitrix24_GetStoragesList(TestParameters);
    Bitrix24_GetAppStorage(TestParameters);
    Bitrix24_RenameStorage(TestParameters);
    Bitrix24_GetStorage(TestParameters);
    Bitrix24_UploadFileToStorage(TestParameters);
    Bitrix24_GetStorageObjects(TestParameters);
    Bitrix24_DeleteFile(TestParameters);
    Bitrix24_CreateStorageFolder(TestParameters);
    Bitrix24_DeleteFolder(TestParameters);
    
EndProcedure

#EndRegion

#EndRegion

#EndRegion

#Region Private

Function GetVKParameters() 
    
    Parameters = New Structure;
    GroupNumber = OPI_TestDataRetrieval.GetParameter("VK_GroupID");
    
    Parameters.Insert("access_token" , OPI_TestDataRetrieval.GetParameter("VK_Token"));
    Parameters.Insert("owner_id" , "-" + GroupNumber);
    Parameters.Insert("app_id" , OPI_TestDataRetrieval.GetParameter("VK_AppID"));
    Parameters.Insert("group_id" , GroupNumber);
    
    Return Parameters;
    
EndFunction

Function GetTwitterParameters() 
    
    Parameters = New Map;
              
    Parameters.Insert("redirect_uri" , OPI_TestDataRetrieval.GetParameter("Twitter_Redirect"));
    Parameters.Insert("client_id" , OPI_TestDataRetrieval.GetParameter("Twitter_ClinetID"));
    Parameters.Insert("client_secret" , OPI_TestDataRetrieval.GetParameter("Twitter_ClientSecret"));
    Parameters.Insert("access_token" , OPI_TestDataRetrieval.GetParameter("Twitter_Token"));
    Parameters.Insert("refresh_token" , OPI_TestDataRetrieval.GetParameter("Twitter_Refresh"));
    Parameters.Insert("oauth_token" , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthToken"));
    Parameters.Insert("oauth_token_secret" , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthSecret"));
    
    Parameters.Insert("oauth_consumer_key"    
        , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthConsumerKey"));
    Parameters.Insert("oauth_consumer_secret" 
        , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthConsumerSecret"));

    Return Parameters;
    
EndFunction

#Region Checks

Procedure Check_Empty(Val Result)   
    OPI_TestDataRetrieval.ExpectsThat(ValueIsFilled(Result)).Равно(False);
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
	   Time = XMLValue(Type("Date"), Time);
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

Procedure Check_BitrixArray(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Array");
EndProcedure

Procedure Check_BitrixList(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["list"]).ИмеетТип("Array");
EndProcedure

Procedure Check_BitrixPostsArray(Val Result)
    
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

Procedure Check_BitrixFile(Val Result)
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]).ИмеетТип("Map");
    OPI_TestDataRetrieval.ExpectsThat(Result["result"]["ID"]).Заполнено();
EndProcedure

#EndRegion

#Region AtomicTests

#Region Telegram

Procedure Telegram_GetBotInformation(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetBotInformation(Token);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetBotInformation", "Telegram");
        
    Check_TelegramBotInformation(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_GetUpdates(FunctionParameters)
	
	Token = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetUpdates(Token);

	// END
	
    OPI_TestDataRetrieval.WriteLog(Result, "GetUpdates", "Telegram");
    
    Check_TelegramArray(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_SetWebhook(FunctionParameters)
    
    Token = FunctionParameters["Telegram_Token"];
    URL = FunctionParameters["Telegram_URL"];
    
    Result = OPI_Telegram.SetWebhook(Token, URL);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "SetWebhook", "Telegram");
      
    Check_TelegramWebhookSetup(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_DeleteWebhook(FunctionParameters)
	
	Token = FunctionParameters["Telegram_Token"];
	Result = OPI_Telegram.DeleteWebhook(Token);
	
	// END
	
	OPI_TestDataRetrieval.WriteLog(Result, "DeleteWebhook", "Telegram");
      
    Check_TelegramWebhookDeletion(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_SendTextMessage(FunctionParameters)
	
	Token = FunctionParameters["Telegram_Token"];
	ChatID = FunctionParameters["Telegram_ChatID"];
	ChannelID = FunctionParameters["Telegram_ChannelID"];    
	Text = FunctionParameters["String"];
	
    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage", "Telegram"); 
    
    Check_TelegramMessage(Result, Text); // SKIP
    
    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (channel)"); 
    
    Check_TelegramMessage(Result, Text);
    
    MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
    OPI_TestDataRetrieval.WriteParameter("Telegram_ChannelMessageID", MessageID);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_SendPicture(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text = FunctionParameters["String"];
    Image = FunctionParameters["Picture"]; 
    
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

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text = FunctionParameters["String"];
    Video = FunctionParameters["Video"];
    
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

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text = FunctionParameters["String"];
    Audio = FunctionParameters["Audio"];
    
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

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text = FunctionParameters["String"];
    Document = FunctionParameters["Document"];
    
    DocumentPath = GetTempFileName("docx");
    CopyFile(Document, DocumentPath);
    
    DocumentDD = New BinaryData(DocumentPath);
    
    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument", "Telegram");
    
    Check_TelegramDocument(Result, Text); // SKIP
  
    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentPath);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument (Path)");
    
    Check_TelegramDocument(Result, Text); // SKIP
      
    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentDD);
    
    // END 
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument (DD)");
    
    Check_TelegramDocument(Result, Text);
    
    DeleteFiles(DocumentPath);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure Telegram_SendGif(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text = FunctionParameters["String"];
    GIF = FunctionParameters["GIF"];
    
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

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    Text = FunctionParameters["String"];
    Image = FunctionParameters["Picture"];
    Video = FunctionParameters["Video"];
 
    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);
           
    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);
    
    VideoDD = New BinaryData(VideoPath);
    
    MediaGroup = New Map;
    MediaGroup.Insert(ImagePath, "photo");
    MediaGroup.Insert(VideoDD , "video");
    
    Result = OPI_Telegram.SendMediaGroup(Token, ChatID, Text, MediaGroup);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendMediaGroup", "Telegram");
    
    Check_TelegramMediaGroup(Result); 
   
    DeleteFiles(VideoPath);
    DeleteFiles(ImagePath);
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure Telegram_SendLocation(FunctionParameters)
    
    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];    
    Width = FunctionParameters["Lat"];
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

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];    
    Name = FunctionParameters["Name"];
    LastName = FunctionParameters["Surname"];
    Phone = FunctionParameters["Phone"];
    
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

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"]; 
    Question = "What's your favorite color?";
    
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
	Token = FunctionParameters["Telegram_Token"];

    Result = OPI_Telegram.DownloadFile(Token, FileID);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile", "Telegram");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("BinaryData");
    	
EndProcedure

Procedure Telegram_ForwardMessage(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    
    Result = OPI_Telegram.ForwardMessage(Token, MessageID, ChannelID, ChatID);
    
    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ForwardMessage", "Telegram");
        
	Check_TelegramForward(Result, MessageID);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_Ban(FunctionParameters)
	
	Token = FunctionParameters["Telegram_Token"];
    UserID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    
	Result = OPI_Telegram.Ban(Token, ChannelID, UserID);

	// END
	
    OPI_TestDataRetrieval.WriteLog(Result, "Ban", "Telegram");
    
	Check_TelegramBan(Result);
	OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_Unban(FunctionParameters)
	
    Token = FunctionParameters["Telegram_Token"];
    UserID = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    
	Result = OPI_Telegram.Unban(Token, ChannelID, UserID);

	// END
	
    OPI_TestDataRetrieval.WriteLog(Result, "Unban", "Telegram");
    
	Check_TelegramBan(Result);
	OPI_Tools.Pause(5);
	
EndProcedure

Procedure Telegram_CreateInviteLink(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];    
    Day = 86400;   
    CurrentDate = OPI_Tools.GetCurrentDate();

    Title = "Link " + String(CurrentDate); 
    Expiration = CurrentDate + Day;
    UnixExpiration = OPI_Tools.UNIXTime(Expiration);
    
    Result = OPI_Telegram.CreateInvitationLink(Token, ChannelID, Title, Expiration, 200);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateInvitationLink", "Telegram");

	Check_TelegramInvitation(Result, Title, UnixExpiration);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_PinMessage(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    
    Result = OPI_Telegram.PinMessage(Token, ChannelID, MessageID);

	// END
	
    OPI_TestDataRetrieval.WriteLog(Result, "PinMessage", "Telegram");
	
	Check_TelegramTrue(Result);
        
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_UnpinMessage(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    
    Result = OPI_Telegram.UnpinMessage(Token, ChannelID, MessageID);

	// END
	
    OPI_TestDataRetrieval.WriteLog(Result, "UnpinMessage", "Telegram");
	
	Check_TelegramTrue(Result);
        
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_GetParticipantCount(FunctionParameters)
	
    Token = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    
    Result = OPI_Telegram.GetParticipantCount(Token, ChannelID);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetParticipantCount", "Telegram");
    
    Check_TelegramNumber(Result);
        
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_GetForumAvatarList(FunctionParameters)
	
	Token = FunctionParameters["Telegram_Token"];
	Result = OPI_Telegram.GetAvatarIconList(Token);
	
	// END
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetAvatarIconList", "Telegram");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure Telegram_CreateForumTopic(FunctionParameters)
	
	Token = FunctionParameters["Telegram_Token"];
    Chat = FunctionParameters["Telegram_ForumID"];
    Icon = "5357419403325481346";
    Name = "TestTopic " + String(New UUID);
    
	Result = OPI_Telegram.CreateForumThread(Token, Chat, Name, Icon);
	
	// END
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateForumThread", "Telegram");
    
    Topic = Result["result"]["message_thread_id"];
    
    FunctionParameters.Insert("Telegram_TopicID", Topic);
    OPI_Tools.AddField("Telegram_TopicID", Topic, "String", FunctionParameters);
    OPI_TestDataRetrieval.WriteParameter("Telegram_TopicID", FunctionParameters["Telegram_TopicID"]);
   
	Check_TelegramCreateTopic(Result, Name, Icon);
	
	ChatTopic = Chat + "*" + Topic;
	Text = FunctionParameters["String"];
    Result = OPI_Telegram.SendTextMessage(Token, ChatTopic, Text);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (forum)");
    
    Check_TelegramMessage(Result, Text);
	
EndProcedure

Procedure Telegram_EditForumTopic(FunctionParameters)

	Token = FunctionParameters["Telegram_Token"];
    Chat = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];
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
    Chat = FunctionParameters["Telegram_ForumID"];
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
    Chat = FunctionParameters["Telegram_ForumID"];
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
    Chat = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];
    
    Result = OPI_Telegram.DeleteForumTopic(Token, Chat, Topic); 
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteForumTopic", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(25);
    	
EndProcedure

Procedure Telegram_ClearPinnedMessagesList(FunctionParameters)

	Token = FunctionParameters["Telegram_Token"];
    Chat = FunctionParameters["Telegram_ForumID"];
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
    Chat = FunctionParameters["Telegram_ForumID"];
    
    Result = OPI_Telegram.HideMainForumTopic(Token, Chat);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "HideMainForumTopic", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_ShowMainForumTopic(FunctionParameters)

	Token = FunctionParameters["Telegram_Token"];
    Chat = FunctionParameters["Telegram_ForumID"];
    
    Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "ShowMainForumTopic", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_ChangeMainTopicName(FunctionParameters)

	Title = "New main thread name " + String(New UUID);
	Token = FunctionParameters["Telegram_Token"];
    Chat = FunctionParameters["Telegram_ForumID"];    
	
    Result = OPI_Telegram.EditMainForumTopicName(Token, Chat, Title);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "EditMainForumTopicName", "Telegram");
    
    Check_TelegramTrue(Result);
    
    OPI_Tools.Pause(5);
    	
EndProcedure

Procedure Telegram_DeleteMessage(FunctionParameters)
	
	Token = FunctionParameters["Telegram_Token"];	
	ChatID = FunctionParameters["Telegram_ChannelID"]; 
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
    Result = OPI_VK.CreateTokenRetrievalLink(Application);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "CreateTokenRetrievalLink", "VK");
    
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("String").Заполнено();
    
    OPI_Tools.Pause(5);
        
EndProcedure

Procedure VK_CreatePost(FunctionParameters)
    
    Parameters = GetVKParameters();
    Text = "Post from autotest";
    URL = "https://github.com/Bayselonarrend/OpenIntegrations";
    
    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data
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
    PostID = FunctionParameters["VK_PostID"];
    
    Result = OPI_VK.DeletePost(PostID, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost", "VK");
            
    Check_VKTrue(Result);
    
EndProcedure

Procedure VK_CreateCompositePost(FunctionParameters)

    Parameters = GetVKParameters();
    Text = "Post from autotest";
    URL = "https://github.com/Bayselonarrend/OpenIntegrations";
    
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
    Question = "What's your favorite color?";
    
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
    
    Parameters = GetVKParameters();
    Name = "AlbumFromAutoTest";
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
    
    Parameters = GetVKParameters();
    ImageDescription = "AutoTestImage";
    AlbumID = FunctionParameters["VK_AlbumID"];
    
    Image = FunctionParameters["Picture"]; // URL, Path to file or Binary Data
    TFN = GetTempFileName("png");
    CopyFile(Image, TFN);
    
    Image = New BinaryData(TFN);
    
    Result = OPI_VK.SaveImageToAlbum(AlbumID, Image, ImageDescription, Parameters);
    
    OPI_TestDataRetrieval.WriteLog(Result, "SaveImageToAlbum", "VK");
    
    Check_VKAlbumPicture(Result, ImageDescription, AlbumID); // SKIP
    
    ImageID = Result["response"][0]["id"]; // SKIP
    Result = OPI_VK.DeleteImage(ImageID, Parameters); // SKIP
            
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
    ImageID = FunctionParameters["VK_PictureID"];
    
    Result = OPI_VK.DeleteImage(ImageID, Parameters);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteImage", "VK");
    
    Check_VKTrue(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_DeleteAlbum(FunctionParameters)
    
    Parameters = GetVKParameters();
    AlbumID = FunctionParameters["VK_AlbumID"];
    
    Result = OPI_VK.DeleteAlbum(AlbumID, Parameters);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteAlbum", "VK");
        
    Check_VKTrue(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_CreateStory(FunctionParameters)

    Parameters = GetVKParameters();
    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, Path to file or Binary Data
    TFN = GetTempFileName("png");
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
    Name = "Discussing: Which color is better?";
    Message = "Red, yellow, blue, or some other?";
    
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
    
    Parameters = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result = OPI_VK.CloseDiscussion(DiscussionID, False, Parameters);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "CloseDiscussion", "VK");
        
    Check_VKTrue(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_OpenDiscussion(FunctionParameters)
    
    Parameters = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result = OPI_VK.OpenDiscussion(DiscussionID, Parameters);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "OpenDiscussion", "VK");
        
    Check_VKTrue(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure

Procedure VK_PostToDiscussion(FunctionParameters)
    
    Parameters = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Message = "I like yellow more";
    
    Result = OPI_VK.WriteInDiscussion(DiscussionID, Message, Parameters);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "WriteInDiscussion", "VK");
    
    Check_VKDiscussion(Result);
    
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
    
    AppKey = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    Code = FunctionParameters["Dropbox_Code"];

    Result = OPI_Dropbox.GetToken(AppKey, AppSecret, Code);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetToken");
    
    Token = Result["access_token"];
    Refresh = Result["refresh_token"];
   
    If ValueIsFilled(Token) Then
        OPI_TestDataRetrieval.WriteParameter("Dropbox_Token", Token);
    EndIf;
   
    If ValueIsFilled(Refresh) Then
        OPI_TestDataRetrieval.WriteParameter("Dropbox_Refresh", Refresh);
    EndIf;
    
EndProcedure

Procedure Dropbox_UpdateToken(FunctionParameters)

    AppKey = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    RefreshToken = FunctionParameters["Dropbox_Refresh"];
    
    Result = OPI_Dropbox.RefreshToken(AppKey, AppSecret, RefreshToken);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "RefreshToken");
    
    Token = Result["access_token"];
    
    OPI_TestDataRetrieval.ExpectsThat(Token).Заполнено();

    OPI_TestDataRetrieval.WriteParameter("Dropbox_Token", Token);
        
EndProcedure

Procedure Dropbox_GetObjectInformation(FunctionParameters)
   
    Path = "/New/pic.png";  
    Token = FunctionParameters["Dropbox_Token"];
     
    Result = OPI_Dropbox.GetObjectInformation(Token, Path, True);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetObjectInformation", "Dropbox");

    Check_DropboxFile(Result, Path);
    
    OPI_Tools.Pause(5); 
    
EndProcedure

Procedure Dropbox_GetPreview(FunctionParameters)
   
    Token = FunctionParameters["Dropbox_Token"];
    Path = "/New/mydoc.docx"; 
    
    Result = OPI_Dropbox.GetPreview(Token, Path);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetPreview", "Dropbox");
        
    Check_BinaryData(Result, 120000);
        
    OPI_Tools.Pause(5); 
     
EndProcedure

Procedure Dropbox_UploadFile(FunctionParameters)

    Path = "/New/pic.png";  
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
   
    Path = "/New/url_doc.docx";  
    Token = FunctionParameters["Dropbox_Token"];
    URL = FunctionParameters["Document"];
    
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

    Token = FunctionParameters["Dropbox_Token"];
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
    
    Path = "/New/url_doc.docx";
    Result = OPI_Dropbox.DeleteObject(Token, Path);
    
    Check_DropboxMetadata(Result, Path);
    OPI_Tools.Pause(5); 
        
EndProcedure

Procedure Dropbox_DeleteObject(FunctionParameters)
 
    Path = "/New/pic.png";  
    Token = FunctionParameters["Dropbox_Token"];  
    
    Result = OPI_Dropbox.DeleteObject(Token, Path);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject", "Dropbox");

    Check_DropboxMetadata(Result, Path);
    
    OPI_Tools.Pause(5); 
     
EndProcedure

Procedure Dropbox_CopyObject(FunctionParameters)
    
    Original = "/New/pic.png";
    Copy = "/New/pic_copy.png";  
    Token = FunctionParameters["Dropbox_Token"];
    
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
    TargetPath = "/pic.png";  
    Token = FunctionParameters["Dropbox_Token"];
    
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
    Path = "/New catalog";
    
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
    Path = "/New/pic.png"; 
    
    Result = OPI_Dropbox.DownloadFile(Token, Path);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile", "Dropbox");
        
    Check_BinaryData(Result, 2000000);
        
    OPI_Tools.Pause(5); 
        
EndProcedure

Procedure Dropbox_DownloadFolder(FunctionParameters)
    
    Token = FunctionParameters["Dropbox_Token"];
    Path = "/New";
    
    Result = OPI_Dropbox.DownloadFolder(Token, Path);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFolder", "Dropbox");
        
    Check_BinaryData(Result);
        
    OPI_Tools.Pause(5); 
    
EndProcedure

Procedure Dropbox_GetFolderFileList(FunctionParameters)
 
    Path = "/New";  
    Token = FunctionParameters["Dropbox_Token"];
     
    Result = OPI_Dropbox.GetListOfFolderFiles(Token, Path, True);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "GetListOfFolderFiles", "Dropbox");

    Check_DropboxArray(Result);
    
    OPI_Tools.Pause(5);
    
EndProcedure 

Procedure Dropbox_GetObjectVersionList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path = "/New/pic.png"; 
    
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
    Token = FunctionParameters["Dropbox_Token"];
    Path = "/New/pic.png";  
    
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
            HasTag = True;    
        EndIf;
    EndDo;
    
    OPI_TestDataRetrieval.ExpectsThat(HasTag).Равно(True);
    
    OPI_Tools.Pause(5);  
        
EndProcedure

Procedure Dropbox_AddTag(FunctionParameters)
    
    Tag = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path = "/New/mydoc.docx";  
    
    Result = OPI_Dropbox.AddTag(Token, Path, Tag);
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "AddTag", "Dropbox");
    
    Check_Empty(Result);
    
    OPI_Tools.Pause(5);  
    
EndProcedure

Procedure Dropbox_DeleteTag(FunctionParameters)
    
    Tag = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path = "/New/mydoc.docx";  
    
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
    File = FunctionParameters["Dropbox_FileID"];
    
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
    Path = "/New"; 
   
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
    
    Token = FunctionParameters["Dropbox_Token"];
    Folder = FunctionParameters["Dropbox_SharedFolder"];
 
    Result = OPI_Dropbox.CancelFolderPublication(Token, Folder);
    CurrentStatus = "in_progress";
    JobID = Result["async_job_id"];
    
    WHile CurrentStatus = "in_progress" Do
        Result = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
        CurrentStatus = Result[".tag"];
        OPI_Tools.Pause(3);
    EndDo;
    
    // END
    
    OPI_TestDataRetrieval.WriteLog(Result, "CancelFolderPublication", "Dropbox");
    
   Check_DropboxStatus(Result);
   
   OPI_Tools.Pause(5); 
   
EndProcedure

Procedure Dropbox_AddUsersToFolder(FunctionParameters)
    
    Token = FunctionParameters["Dropbox_Token"];
    Email = FunctionParameters["Dropbox_OtherUser"];
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
    File = FunctionParameters["Dropbox_FileID"];
    
    Result = OPI_Dropbox.CancelFilePublication(Token, File);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "CancelFilePublication", "Dropbox");
    
    Check_Empty(Result);
    
EndProcedure

#EndRegion

#Region Bitrix24

Procedure Bitrix24_GetAppAuthLink(FunctionParameters)
    
    Domain = FunctionParameters["Bitrix24_Domain"];
    ClientID = FunctionParameters["Bitrix24_ClientID"];
	
	Result = OPI_Bitrix24.GetAppAuthLink(Domain, ClientID);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetAppAuthLink", "Bitrix24");
    
    Check_String(Result);
    
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_AuthURL", Result);

EndProcedure

Procedure Bitrix24_GetToken(FunctionParameters)
    
    
    ClientID = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Code = FunctionParameters["Bitrix24_Code"];
    
	Result = OPI_Bitrix24.GetToken(ClientID, ClientSecret, Code);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetToken", "Bitrix24");
    
    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Token" , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);
    EndIf;
    
EndProcedure

Procedure Bitrix24_RefreshToken(FunctionParameters)
    
    
    ClientID = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Refresh = FunctionParameters["Bitrix24_Refresh"];
    
	Result = OPI_Bitrix24.RefreshToken(ClientID, ClientSecret, Refresh);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "RefreshToken", "Bitrix24");
    
    Check_BitrixAuth(Result);
    
    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Token" , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);
    EndIf;
    
EndProcedure

Procedure Bitrix24_ServerTime(FunctionParameters)
	
	URL = FunctionParameters["Bitrix24_URL"];
	
	Result = OPI_Bitrix24.ServerTime(URL);
        
    OPI_TestDataRetrieval.WriteLog(Result, "ServerTime (wh)", "Bitrix24");
    
    Check_BitrixTime(Result); // SKIP
    
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.ServerTime(URL, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "ServerTime", "Bitrix24");
    
    Check_BitrixTime(Result); 
  
EndProcedure

Procedure Bitrix24_CreatePost(FunctionParameters)
    
    Text = "Text of post";
    Title = "Post title";
    Image1 = FunctionParameters["Picture"];
    Image2 = FunctionParameters["Picture2"];
    
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

    URL = FunctionParameters["Bitrix24_Domain"];
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
    
    Text = "New post text";
    Title = "New post title";
    Image1 = FunctionParameters["Picture"];
    PostID = FunctionParameters["Bitrix24_PostID"];
    
    Files = New Map;
    Files.Insert("1.png", Image1);
    
    URL = FunctionParameters["Bitrix24_URL"];
    
    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title);
        
    OPI_TestDataRetrieval.WriteLog(Result, "UpdatePost (wh)", "Bitrix24");
    
    Check_BitrixNumber(Result); // SKIP
    
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    PostID = FunctionParameters["Bitrix24_HookPostID"];
    
    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "UpdatePost", "Bitrix24");
    
    Check_BitrixNumber(Result); 
    
EndProcedure

Procedure Bitrix24_DeletePost(FunctionParameters)
    
    PostID = FunctionParameters["Bitrix24_HookPostID"]; 
    URL = FunctionParameters["Bitrix24_URL"];
	
	Result = OPI_Bitrix24.DeletePost(URL, PostID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost (wh)", "Bitrix24");
    
    Check_BitrixTrue(Result); // SKIP
    
    PostID = FunctionParameters["Bitrix24_PostID"];
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.DeletePost(URL, PostID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost", "Bitrix24");
    
    Check_BitrixTrue(Result); 
    
EndProcedure

Procedure Bitrix24_GetImportantPostViewers(FunctionParameters)
    
    PostID = FunctionParameters["Bitrix24_HookPostID"]; 
    URL = FunctionParameters["Bitrix24_URL"];
    
    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetImportantPostViewers (wh)", "Bitrix24");
    
    Check_BitrixArray(Result); // SKIP
    
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetImportantPostViewers", "Bitrix24");
    
    Check_BitrixArray(Result); 
    
EndProcedure

Procedure Bitrix24_GetPosts(FunctionParameters)
    
    PostID = FunctionParameters["Bitrix24_PostID"]; 
    URL = FunctionParameters["Bitrix24_URL"];
    
    Result = OPI_Bitrix24.GetPosts(URL, PostID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetPosts (wh)", "Bitrix24");
    
    Check_BitrixPostsArray(Result); // SKIP
    
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.GetPosts(URL, PostID, , Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetPosts", "Bitrix24");
    
    Check_BitrixPostsArray(Result); 
    
EndProcedure

Procedure Bitrix24_CreateComment(FunctionParameters)
    
    Text = "Comment for post";
    PostID = FunctionParameters["Bitrix24_PostID"]; 
    URL = FunctionParameters["Bitrix24_URL"];
    
    Result = OPI_Bitrix24.CrateComment(URL, PostID, Text);
        
    OPI_TestDataRetrieval.WriteLog(Result, "CreateComment (wh)", "Bitrix24");
    
    Check_BitrixNumber(Result); // SKIP
    
    Text = "Another comment";
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.CrateComment(URL, PostID, Text, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "CrateComment", "Bitrix24");
    
    Check_BitrixNumber(Result); 
    
EndProcedure

Procedure Bitrix_AddPostRecipients(FunctionParameters)
    
    Visibility = "UA";
    PostID = FunctionParameters["Bitrix24_PostID"]; 
    URL = FunctionParameters["Bitrix24_URL"];
    
    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility);
        
    OPI_TestDataRetrieval.WriteLog(Result, "AddPostRecipients (wh)", "Bitrix24");
    
    Check_BitrixTrue(Result); // SKIP
    
    URL = FunctionParameters["Bitrix24_Domain"];
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
    
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskFieldsStructure", "Bitrix24");
    
    Check_BitrixFields(Result); 
    
EndProcedure

Procedure Bitrix24_CreateTask(FunctionParameters)
    
    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()
    
    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour = 3600;
    Day = 24;
    Responsible = 1;
    
    TaskData = New Structure;
    TaskData.Insert("TITLE" , "New task");
    TaskData.Insert("DESCRIPTION" , "New task description");
    TaskData.Insert("PRIORITY" , "2");
    TaskData.Insert("DEADLINE" , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);
    
    URL = FunctionParameters["Bitrix24_URL"];
        
    Result = OPI_Bitrix24.CreateTask(URL, TaskData);
        
    OPI_TestDataRetrieval.WriteLog(Result, "CreateTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
    
    TaskID = Result["result"]["task"]["id"]; // SKIP
    
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookTaskID", TaskID); // SKIP   
    FunctionParameters.Insert("Bitrix24_HookTaskID", TaskID); // SKIP
    
    URL = FunctionParameters["Bitrix24_Domain"];
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
    TaskData.Insert("TITLE", "Another task title");
    TaskData.Insert("DESCRIPTION", "Another task description");
    TaskData.Insert("PRIORITY", "1");
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    
    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData);
        
    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
    
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTask", "Bitrix24");
    
    Check_BitrixTask(Result); 
    
EndProcedure

Procedure Bitrix24_GetTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.GetTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.GetTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_ApproveTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.ApproveTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "ApproveTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.ApproveTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "ApproveTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_DisapproveTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "DisapproveTask (wh)", "Bitrix24");
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "DisapproveTask", "Bitrix24");
    
EndProcedure

Procedure Bitrix24_CompleteTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.CompleteTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.CompleteTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_RenewTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.RenewTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "RenewTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.RenewTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "RenewTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_DeferTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.DeferTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeferTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.DeferTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeferTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_StartTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.StartTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "StartTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.StartTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "StartTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_StartWatchingTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "StartWatchingTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "StartWatchingTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_StopWatchingTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_PauseTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.PauseTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "PauseTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.PauseTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "PauseTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_DeleteTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.DeleteTask(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.DeleteTask(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_DelegateTask(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    UserID = FunctionParameters["Bitrix24_UserID"];
        
    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "DelegateTask (wh)", "Bitrix24");
    
    Check_BitrixTask(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "DelegateTask", "Bitrix24");
    
    Check_BitrixTask(Result);
    
EndProcedure

Procedure Bitrix24_AddTaskToFavorites(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask (wh)", "Bitrix24");
    
    Check_BitrixTrue(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskToFavorites", "Bitrix24");
    
    Check_BitrixTrue(Result);
    
EndProcedure

Procedure Bitrix24_RemoveTaskFromFavorites(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "RemoveTaskFromFavorites (wh)", "Bitrix24");
    
    Check_BitrixTrue(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "RemoveTaskFromFavorites", "Bitrix24");
    
    Check_BitrixTrue(Result);
    
EndProcedure

Procedure Bitrix24_GetTaskHistory(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
        
    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskHistory (wh)", "Bitrix24");
    
    Check_BitrixList(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];
    
    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskHistory", "Bitrix24");
    
    Check_BitrixList(Result);
    
EndProcedure

Procedure Bitrix24_GetTasksList(FunctionParameters)
    
    // Full filter structer you can find at GetTasksFilterStructure method
    Filter = New Structure;
    Filter.Insert("CREATED_BY" , 1);
    Filter.Insert("RESPONSIBLE_ID", 10);
    
    Indent = 1;
    URL = FunctionParameters["Bitrix24_URL"];
        
    Result = OPI_Bitrix24.GetTasksList(URL, Filter);
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksList (wh)", "Bitrix24");
    
    Check_BitrixTasksList(Result); // SKIP
        
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.GetTasksList(URL, , Indent, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksList", "Bitrix24");
    
    Check_BitrixTasksList(Result);
    
EndProcedure

Procedure Bitrix24_GetStoragesList(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];     
    Result = OPI_Bitrix24.GetStoragesList(URL);
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetStoragesList (wh)", "Bitrix24");
    
    Check_BitrixStorage(Result); // SKIP
            
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
       
    Result = OPI_Bitrix24.GetStoragesList(URL, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetStoragesList", "Bitrix24");
    
    Check_BitrixStorage(Result);
    
EndProcedure

Procedure Bitrix24_GetAppStorage(FunctionParameters)
                
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
       
    Result = OPI_Bitrix24.GetAppSotrage(URL, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetAppStoragesList", "Bitrix24");
    
    Check_BitrixFile(Result);
    
    StorageID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_StorageID", StorageID); // SKIP   
    FunctionParameters.Insert("Bitrix24_StorageID", StorageID); // SKIP
    
EndProcedure

Procedure Bitrix24_UploadFileToStorage(FunctionParameters)
    
    Filename2 = "Picture2.jpg"; 
    Name = "Picture1.jpg";
    
    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary Data
    Image = FunctionParameters["Picture2"]; // Local path, URL or Binary Data
    
    DestinationID = 3;
    
    URL = FunctionParameters["Bitrix24_URL"];
    
    Result = OPI_Bitrix24.UploadFileToStorage(URL, Filename2, Image2, DestinationID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileToStorage (wh)", "Bitrix24");
    
    Check_BitrixFile(Result); // SKIP
    
    FileID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookFileID", FileID); // SKIP   
    FunctionParameters.Insert("Bitrix24_HookFileID", FileID); // SKIP

    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID, , Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileToStorage", "Bitrix24");
    
    Check_BitrixFile(Result); 
    
    FileID = Result["result"]["ID"];                                    
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_FileID", FileID);    
    FunctionParameters.Insert("Bitrix24_FileID", FileID);                
    
EndProcedure

Procedure Bitrix24_DeleteFile(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_HookFileID"];
    
    Result = OPI_Bitrix24.DeleteFile(URL, FileID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFile (wh)", "Bitrix24");
    
    Check_BitrixTrue(Result); // SKIP
            
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    FileID = FunctionParameters["Bitrix24_FileID"];
       
    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFile", "Bitrix24");
    
    Check_BitrixTrue(Result);
    
EndProcedure

Procedure Bitrix24_CreateStorageFolder(FunctionParameters)
    
    StorageID = 3;
    Name = "New catalog";
    Filename2 = "New folder 2";
    
    URL = FunctionParameters["Bitrix24_URL"];
    
    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Filename2);
        
    OPI_TestDataRetrieval.WriteLog(Result, "CreateStorageFolder (wh)", "Bitrix24");
    
    Check_BitrixFile(Result); // SKIP
    
    FolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookFolderID", FolderID); // SKIP   
    FunctionParameters.Insert("Bitrix24_HookFolderID", FolderID); // SKIP

    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    
    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Name, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "CreateStorageFolder", "Bitrix24");
    
    Check_BitrixFile(Result); 
    
    FolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_FolderID", FolderID); // SKIP   
    FunctionParameters.Insert("Bitrix24_FolderID", FolderID); // SKIP               
    
EndProcedure

Procedure Bitrix24_DeleteFolder(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_HookFolderID"];
    
    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFolder (wh)", "Bitrix24");
    
    Check_BitrixTrue(Result); // SKIP
            
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];
       
    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFolder", "Bitrix24");
    
    Check_BitrixTrue(Result);
    
EndProcedure

Procedure Bitrix24_GetStorage(FunctionParameters)
	
	URL = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;
    
    Result = OPI_Bitrix24.GetStorage(URL, StorageID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetStorage (wh)", "Bitrix24");
    
    Check_BitrixFile(Result); // SKIP
            
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
       
    Result = OPI_Bitrix24.GetStorage(URL, StorageID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetStorage", "Bitrix24");
    
    Check_BitrixFile(Result);
    
EndProcedure

Procedure Bitrix24_GetStorageObjects(FunctionParameters)
    
    URL = FunctionParameters["Bitrix24_URL"]; 
    StorageID = 3;    
    
    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID);
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetStorageObjects (wh)", "Bitrix24");
    
    Check_BitrixArray(Result); // SKIP
            
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
       
    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "GetStorageObjects", "Bitrix24");
    
    Check_BitrixArray(Result);
    
EndProcedure

Procedure Bitrix24_RenameStorage(FunctionParameters)
	  
    Name = "New storage name";             
    URL = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    StorageID = FunctionParameters["Bitrix24_StorageID"];
       
    Result = OPI_Bitrix24.RenameStorage(URL, StorageID, Name, Token);
    
    // END
        
    OPI_TestDataRetrieval.WriteLog(Result, "RenameStorage", "Bitrix24");
    
    Check_BitrixFile(Result);
    
EndProcedure

#EndRegion

#EndRegion

#EndRegion
