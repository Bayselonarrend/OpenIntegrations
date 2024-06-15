// OneScript: ./OInt/core/Modules/OPI_Bitrix24.os
// Lib: Bitrix24
// CLI: bitrix24

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UnreachableCode-off
// BSLLS:CommentedCode-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Uncomment if OneScript is executed
// #Use "../../tools"

#Region Public

#Region SettingsAndAdministartion

// Get app authentication link
// Forms a link for authorization via the browser
// 
// Parameters:
// Domain - String - Current Bitrix URL (like 'portal.bitrix24.com') - domain
// ClientID - String - Client ID from app settings - clientid
// 
// Returns:
// String - URL for browser transition
Function GetAppAuthLink(Val Domain, Val ClientID) Export
    
    OPI_TypeConversion.GetLine(Domain);
    OPI_TypeConversion.GetLine(ClientID);
    
    If Not StrStartsWith(Domain, "http") Then
        URL = "https://" + Domain;
    EndIf;
    
    If Not StrEndsWith(URL, "/") Then
        URL = URL + "/";
    EndIf;
    
    URL = URL + "oauth/authorize/?client_id=" + ClientID;
    
    Return URL;
        
EndFunction

// Get token
// Get token by auth code
// 
// Parameters:
// ClientID - String - Client ID from app settings - clientid
// ClientSecret - String - Client secret from app settings - clientsecret
// Code - String - Code from browser auth page - code
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetToken(Val ClientID, Val ClientSecret, Val Code) Export
    
    URL = "https://oauth.bitrix.info/oauth/token/";
    
    Parameters = New Structure;
    OPI_Tools.AddField("grant_type" , "authorization_code", "String", Parameters);
    OPI_Tools.AddField("client_id" , ClientID , "String", Parameters);
    OPI_Tools.AddField("client_secret", ClientSecret , "String", Parameters);
    OPI_Tools.AddField("code" , Code , "String", Parameters);  
    
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;
    
EndFunction

// Refresh token
// Update token by refresh token
// 
// Parameters:
// ClientID - String - Client ID from app settings - clientid
// ClientSecret - String - Client secret from app settings - clientsecret
// Refresh - String - Refresh token - refresh
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RefreshToken(Val ClientID, Val ClientSecret, Val Refresh) Export
    
    URL = "https://oauth.bitrix.info/oauth/token/";
    
    Parameters = New Structure;
    OPI_Tools.AddField("grant_type" , "refresh_token" , "String", Parameters);
    OPI_Tools.AddField("client_id" , ClientID , "String", Parameters);
    OPI_Tools.AddField("client_secret", ClientSecret , "String", Parameters);
    OPI_Tools.AddField("refresh_token", Refresh , "String", Parameters);  
    
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;

EndFunction

// Server time
// Get current server time
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ServerTime(Val URL, Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "server.time");
	Response = OPI_Tools.Get(URL, Parameters);
	
	Return Response;
		
EndFunction

#EndRegion

#Region NewsFeed

// Create post
// Create a new post at news feed
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Text - String - Text of post - text
// Visibility - String - Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group - vision
// Files - String - Data inложенandй, где toлюч > andмя file, value > path to file andдand дinоandчные Data - files
// Title - String - Post title - title
// Important - Boolean - Mark post as important - important 
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreatePost(Val URL
	, Val Text
	, Val Visibility = "UA"
	, Val Files = ""
	, Val Title = ""
	, Val Important = False
	, Val Token = "") Export
    
    MakeBoolean(Important);
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.add");
    OPI_Tools.AddField("POST_MESSAGE", Text , "String", Parameters);
    OPI_Tools.AddField("POST_TITLE" , Title , "String", Parameters);
    OPI_Tools.AddField("DEST" , Visibility , "Array", Parameters);
    OPI_Tools.AddField("IMPORTANT" , Important , "String", Parameters);
    
    If ValueIsFilled(Files) Then
        
        OPI_TypeConversion.GetCollection(Files);
        
        ArrayOfFiles = NormalizeFiles(Files);
        
        If Not ArrayOfFiles.Count() = 0 Then
            Parameters.Insert("FILES", ArrayOfFiles);
        EndIf;
        
    EndIf;
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Update post
// Change post data
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Post ID - postid
// Text - String - Text of post - text
// Visibility - String - Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group - vision
// Files - String - Data inложенandй, где toлюч > andмя file, value > path to file andдand дinоandчные Data - files
// Title - String - Post title - title
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdatePost(Val URL
    , Val PostID 
    , Val Text
    , Val Visibility = "UA"
    , Val Files = ""
    , Val Title = ""
    , Val Token = "") Export
        
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.update");
    OPI_Tools.AddField("POST_MESSAGE", Text , "String", Parameters);
    OPI_Tools.AddField("POST_TITLE" , Title , "String", Parameters);
    OPI_Tools.AddField("DEST" , Visibility , "Array", Parameters);
    OPI_Tools.AddField("POST_ID" , PostID , "String", Parameters);
    
    If ValueIsFilled(Files) Then
        
        OPI_TypeConversion.GetCollection(Files);
        
        ArrayOfFiles = NormalizeFiles(Files);
        
        If Not ArrayOfFiles.Count() = 0 Then
            Parameters.Insert("FILES", ArrayOfFiles);
        EndIf;
        
    EndIf;
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Delete post
// Remove post from a news feed
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url 
// PostID - String, Number - Id of post to remove - postid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeletePost(Val URL, Val PostID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.delete");
    OPI_Tools.AddField("POST_ID", PostID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Get list of important post viewers
// Return list of important post viewers ids
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url 
// PostID - String, Number - Id of important post - postid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetImportantPostViewers(Val URL, Val PostID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.getusers.important");
    OPI_Tools.AddField("POST_ID", PostID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Get posts
// Gen post or array of post with ID or rights selection
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url 
// PostID - String, Number - Id of important post - postid
// Filter - String - Post selection by rights: UA all, SGn work group, Un user, DRn depart, Gn group - sel 
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetPosts(Val URL, Val PostID = "", Val Filter = "UA", Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.get");
    
    OPI_Tools.AddField("POST_ID" , PostID, "String", Parameters);
    OPI_Tools.AddField("LOG_RIGHTS", Filter , "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Create comment
// Adds a comment to the post
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url 
// PostID - String, Number - Post ID - postid
// Text - String - Comment text - text
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CrateComment(Val URL, Val PostID, Val Text, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogcomment.add");
    
    OPI_Tools.AddField("POST_ID" , PostID, "String", Parameters);
    OPI_Tools.AddField("TEXT" , Text , "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Add new recipients to a post
// Adds new groups or users to the recipients
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Post ID - postid
// Visibility - String - Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group - vision
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddPostRecipients(Val URL, Val PostID, Val Visibility, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.share");
    
    OPI_Tools.AddField("POST_ID" , PostID, "String", Parameters);
    OPI_Tools.AddField("DEST" , Visibility, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

#EndRegion

#EndRegion

#Region Internal

Function NormalizeAuth(URL, Val Token, Val Method = "")
    
    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(Token);
    
    Parameters = New Structure;
    IsTokenAuth = ValueIsFilled(Token);
    
	UncorrectItems = New Array;
	UncorrectItems.Add("https://");
	UncorrectItems.Add("http://");
	UncorrectItems.Add("www.");
	
	For Each DeletedElement In UncorrectItems Do
		URL = StrReplace(URL, DeletedElement, "");
	EndDo;
	
	URL = TrimAll(URL);
	
	If Not StrEndsWith(URL, "/") Then
		URL = URL + "/";
    EndIf;
    
    If IsTokenAuth Then
        
        If Not StrEndsWith(URL, "rest/") Then
    		URL = URL + "rest/";
        EndIf;
        
        Parameters.Insert("auth", Token);
        
    EndIf;
	
	If ValueIsFilled(Method) Then
		URL = URL + TrimAll(Method);
    EndIf;
    
    Return Parameters;

EndFunction

Function NormalizeFiles(Val Files)
    
    NormalizedFiles = New Array;

    If TypeOf(Files) = Type("Map") Then
        
        For Each File In Files Do 
            
            CurrentArray = New Array;
            CurrentFile = File.Value;
            CurrentName = File.Key;
            
            OPI_TypeConversion.GetBinaryData(CurrentFile);
            OPI_TypeConversion.GetLine(CurrentName);
            
            CurrentArray.Add(CurrentName);
            CurrentArray.Add(Base64String(CurrentFile));
            
            NormalizedFiles.Add(CurrentArray);
            
        EndDo;
    
    EndIf;
    
    Return NormalizedFiles;
    
EndFunction

Procedure MakeBoolean(Value)

    OPI_TypeConversion.GetBoolean(Value);
    Value = ?(Value, "Y", "N");
    
EndProcedure

#EndRegion
