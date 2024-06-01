// OneScript: ./OInt/core/Modules/OPI_GoogleDrive.os
// Lib: Google Drive
// CLI: gdrive

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
#Use "../../tools"

#Region Public

#Region FileAndDirectoryManagement

// Get object information
// Gets information about a folder or file by ID
// 
// Parameters:
// Token - String - Token - token
// Identifier - String - Identifier of the file or folder - object
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function GetObjectInformation(Val Token, Val Identifier) Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Identifier);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://www.googleapis.com/drive/v3/files/" + Identifier; 
    
    Parameters = New Structure;
    Parameters.Insert("fields", "*");
    
    Response = OPI_Tools.Get(URL, Parameters, Headers);
    
    Return Response;

EndFunction

// Get list of directories
// Gets the list of drive directories
// 
// Parameters:
// Token - String - Token - token
// NameContains - String - Filter by name - querry
// Detailed - Boolean - Adds a list of files to the directory fields - depth
// 
// Returns:
// Key-Value Pair - Array of directory mappings
Function GetDirectoriesList(Val Token, Val NameContains = "", Val Detailed = False) Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(NameContains);
    OPI_TypeConversion.GetBoolean(Detailed);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    ArrayOfObjects = New Array;
    Filter = New Array;
    
    Filter.Add("mimeType = 'application/vnd.google-apps.folder'");
    
    If ValueIsFilled(NameContains) Then
        Filter.Add("name contains '" + NameContains + "'");
    EndIf;
    
    GetObjectsListRecursively(Headers, ArrayOfObjects, Detailed, Filter);
    
    If Detailed Then
        BreakDownObjectsInDetail(Token, ArrayOfObjects);    
    EndIf;
    
    Return ArrayOfObjects;
    
EndFunction

// Get list of files
// Gets the list of files
// 
// Parameters:
// Token - String - Token - token
// NameContains - String - Filter by name - querry
// Directory - String - Filter by parent directory ID - catalog
// 
// Returns:
// Key-Value Pair - Array of file mappings
Function GetFilesList(Val Token, Val NameContains = "", Val Directory = "") Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(NameContains);
    OPI_TypeConversion.GetLine(Directory);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    ArrayOfObjects = New Array;
    Filter = New Array;
    
    Filter.Add("mimeType != 'application/vnd.google-apps.folder'");
    
    If ValueIsFilled(NameContains) Then
        Filter.Add("name contains '" + NameContains + "'");
    EndIf;
    
    If ValueIsFilled(Directory) Then
        Filter.Add("'" + Directory + "' in parents");
    EndIf;
    
    GetObjectsListRecursively(Headers, ArrayOfObjects, , Filter);
    
    Return ArrayOfObjects;

EndFunction

// Upload file
// Uploads a file to the drive
// 
// Parameters:
// Token - String - Token - token
// File - BinaryData,String - File to be uploaded - file
// Description - Key-Value Pair - See GetFileDescription - props - JSON description or path to .json
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function UploadFile(Val Token, Val File, Val Description) Export
    Return FileManagement(Token, File, Description);   
EndFunction

// Create folder
// Creates an empty directory on the drive
// 
// Parameters:
// Token - String - Token - token
// Name - String - Folder name - title
// Parent - String - Parent - catalog
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function CreateFolder(Val Token, Val Name, Val Parent = "") Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Parent);
    
    Description = New Map;
    Description.Insert("MIME" , "application/vnd.google-apps.folder");
    Description.Insert("Name" , Name);
    Description.Insert("Description", "");
    Description.Insert("Parent", ?(ValueIsFilled(Parent), Parent, "root"));
    
    Return FileManagement(Token, , Description);
    
EndFunction

// Download file
// Gets file by ID
// 
// Parameters:
// Token - String - Token - token
// Identifier - String - File identifier - object
// SavePath - String - File save path - out 
// 
// Returns:
// BinaryData,String - Binary data or file path when SavePath parameter is specified
Function DownloadFile(Val Token, Val Identifier, Val SavePath = "") Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Identifier);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://www.googleapis.com/drive/v3/files/" + Identifier;  
    
    Parameters = New Map;
    Parameters.Insert("alt", "media");
    
    Response = OPI_Tools.Get(URL, Parameters , Headers, SavePath);
    
    Return Response;

EndFunction

// Copy object
// Copies file or directory
// 
// Parameters:
// Token - String - Token - token
// Identifier - String - Object identifier - object
// NewName - String - New object name - title
// NewParent - String - New parent directory - catalog
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function CopyObject(Val Token, Val Identifier, Val NewName = "", Val NewParent = "") Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(NewName);
    OPI_TypeConversion.GetLine(Identifier);
    OPI_TypeConversion.GetLine(NewParent);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://www.googleapis.com/drive/v3/files/" + Identifier + "/copy";    
    
    Parameters = New Structure;
    
    If ValueIsFilled(NewName) Then
        Parameters.Insert("name", NewName);
    EndIf;
    
    If ValueIsFilled(NewParent) Then
        
        ArrayOfParents = New Array;
        ArrayOfParents.Add(NewParent);
        Parameters.Insert("parents", ArrayOfParents);
        
    EndIf;
    
    Response = OPI_Tools.Post(URL, Parameters , Headers, True);
    
    Return Response;

EndFunction

// Update file
// Updates file binary data
// 
// Parameters:
// Token - String - Token - token
// Identifier - String - Identifier of the object to update - object
// File - BinaryData,String - File source for update - file
// NewName - String - New file name (if necessary) - title
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function UpdateFile(Val Token, Val Identifier, Val File, Val NewName = "") Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Identifier);
    OPI_TypeConversion.GetLine(NewName);
    OPI_TypeConversion.GetBinaryData(File);
    
    If ValueIsFilled(NewName) Then
        Description = New Map;
        Description.Insert("Name", NewName);
    Else
        Description = "";
    EndIf;
    
    Return FileManagement(Token, File, Description, Identifier);
        
EndFunction

// Delete object
// Deletes file or directory by ID
// 
// Parameters:
// Token - String - Token - token
// Identifier - String - Identifier of the object to delete - object
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function DeleteObject(Val Token, Val Identifier) Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Identifier);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://www.googleapis.com/drive/v3/files/" + Identifier;    
    Response = OPI_Tools.Delete(URL, , Headers);
    
    Return Response;

EndFunction

// Get file description !NOCLI
// 
// Returns:
// Key-Value Pair - File description
Function GetFileDescription() Export
    
    Description = New Map;
    Description.Insert("MIME" , "image/jpeg"); // MIME-type uploading file
    Description.Insert("Name" , "New file.jpg"); // File name with extension
    Description.Insert("Description" , "This is a new file"); // File description
    Description.Insert("Parent" , "root"); // ID directory upload or "root" for upload in root
    
    Return Description;
    
EndFunction

#EndRegion

#Region CommentManagement

// Create comment
// Creates a comment for a file or directory
// 
// Parameters:
// Token - String - Token - token
// Identifier - String - Identifier of the object that needs a comment - object  
// Comment - String - Comment text - text
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function CreateComment(Val Token, Val Identifier, Val Comment) Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Identifier);
    OPI_TypeConversion.GetLine(Comment);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://www.googleapis.com/drive/v3/files/" + Identifier + "/comments?fields=*"; 
    
    Parameters = New Structure;
    Parameters.Insert("content", Comment);
    
    Response = OPI_Tools.POST(URL, Parameters, Headers);
    
    Return Response;

EndFunction

// Get comment
// Gets comment by ID
// 
// Parameters:
// Token - String - Token - token
// ObjectID - String - Identifier of the file or directory where the comment is located - object
// CommentID - String - Comment identifier - comment
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function GetComment(Val Token, Val ObjectID, Val CommentID) Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ObjectID);
    OPI_TypeConversion.GetLine(CommentID);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://www.googleapis.com/drive/v3/files/" + ObjectID + "/comments/" + CommentID; 
    
    Parameters = New Structure;
    Parameters.Insert("fields", "*");
    
    Response = OPI_Tools.Get(URL, Parameters, Headers);
    
    Return Response;

EndFunction

// Get list of comments
// Gets the list of all comments of the object
// 
// Parameters:
// Token - String - Token - token
// ObjectID - String - Object identifier - object
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function GetCommentList(Val Token, Val ObjectID) Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ObjectID);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://www.googleapis.com/drive/v3/files/" + ObjectID + "/comments"; 
    
    Parameters = New Structure;
    Parameters.Insert("fields", "*");
    
    Response = OPI_Tools.Get(URL, Parameters, Headers);
    
    Return Response;

EndFunction

// Delete comment
// Deletes comment by ID
// 
// Parameters:
// Token - String - Token - token
// ObjectID - String - Identifier of the file or directory where the comment is located - object
// CommentID - String - Comment identifier - comment
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function DeleteComment(Val Token, Val ObjectID, Val CommentID) Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ObjectID);
    OPI_TypeConversion.GetLine(CommentID);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://www.googleapis.com/drive/v3/files/" + ObjectID + "/comments/" + CommentID; 
    
    Response = OPI_Tools.Delete(URL, , Headers);
    
    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Procedure GetObjectsListRecursively(Val Headers, ArrayOfObjects, Detailed = False, Filter = "", Page = "") 
    
    URL = "https://www.googleapis.com/drive/v3/files";
    Files = "files";
    NPT = "nextPageToken";
    Parameters = New Structure;
    Parameters.Insert("fields", "*");
    
    If ValueIsFilled(Page) Then
        Parameters.Insert("pageToken", Page);
    EndIf;
    
    If ValueIsFilled(Filter) And TypeOf(Filter) = Type("Array") Then     
        FilterString = StrConcat(Filter, " and ");
        Parameters.Insert("q", FilterString);       
    EndIf;
    
    Result = OPI_Tools.Get(URL, Parameters, Headers);
        
    Objects = Result[Files];
    Page = Result[NPT];
        
    For Each CurrentObject In Objects Do
         ArrayOfObjects.Add(CurrentObject);
    EndDo;    
    
    If Objects.Count() > 0 And ValueIsFilled(Page) Then
        GetObjectsListRecursively(Headers, ArrayOfObjects, Detailed, Filter, Page); 
    EndIf;
          
EndProcedure

Procedure BreakDownObjectsInDetail(Val Token, ArrayOfObjects) 
       
    For Each CurrentObject In ArrayOfObjects Do
        
        ArrayOfFiles = New Array;
        CurrentID = CurrentObject["id"];
        
        Result = GetFilesList(Token, , CurrentID);
        
        For Each File In Result Do
            ArrayOfFiles.Add(File);    
        EndDo;
        
        CurrentObject.Insert("files", ArrayOfFiles);
         
    EndDo;
       
EndProcedure

Procedure FormFileUploadParameters(Description)
    
    FormedDescription = New Map;
    OPI_Tools.RemoveEmptyCollectionFields(Description);

    FieldMapping = New Map;
    FieldMapping.Insert("MIME" , "mimeType");
    FieldMapping.Insert("Name" , "name");
    FieldMapping.Insert("Description" , "description");
    FieldMapping.Insert("Parent" , "parents");
    FieldMapping.Insert("Extension", "fileExtension");
    
    For Each Element In Description Do
        
        If Element.Key = "Parent" Then
            
            CurrentValue = New Array;
            CurrentValue.Add(Element.Value);
            
        Else
            
            CurrentValue = Element.Value;
            
        EndIf;
        
        FieldName = FieldMapping.Get(Element.Key);
        FormedDescription.Insert(FieldName, CurrentValue);
        
    EndDo;
    
    Description = FormedDescription;
    
EndProcedure

Function FileManagement(Val Token, Val File = "", Val Description = "", Val Identifier = "") 
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Identifier);
    
    If ValueIsFilled(Description) Then
        OPI_TypeConversion.GetCollection(Description);
    EndIf;
    
    MimeType = "mimeType";
    
    If ValueIsFilled(Identifier) Then
        MIME = GetObjectInformation(Token, Identifier)[MimeType];
    Else
        MIME = Description["MIME"];
    EndIf;    
    
    If Not ValueIsFilled(Description) Then
        Description = New Map;
    EndIf;
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    FormFileUploadParameters(Description);
    JSONDescription = OPI_Tools.JSONString(Description);
    
    FileMapping = New Map;
    
    If ValueIsFilled(File) Then
        
        ChunkSize = 268435457;      
        Size = OPI_Tools.ConvertDataWithSizeRetrieval(File, ChunkSize);
   
        FileMapping.Insert(File, MIME);
        
        If Size < ChunkSize And TypeOf(File) = Type("BinaryData") Then
            Response = UploadSmallFile(JSONDescription, FileMapping, Headers, Identifier);
        Else
            Response = UploadLargeFile(Description, FileMapping, Headers, Identifier);
        EndIf;
        
    Else
       Response = UploadSmallFile(JSONDescription, FileMapping, Headers, Identifier); 
    EndIf;
         
    Return Response;
    
EndFunction

Function UploadSmallFile(Val Description, Val FileMapping, Val Headers, Val Identifier = "")
    
    URL = "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart";
    
    If ValueIsFilled(Identifier) Then
        URL = StrReplace(URL, "/files", "/files/" + Identifier);
        Response = OPI_Tools.PatchMultipartRelated(URL, Description, FileMapping, Headers);
    Else
        Response = OPI_Tools.PostMultipartRelated(URL, Description, FileMapping, Headers);
    EndIf;

    Return Response;
    
EndFunction

Function UploadLargeFile(Val Description, Val FileMapping, Val Headers, Val Identifier = "")
    
    For Each File In FileMapping Do
        Binary = File.Key;
        Break;
    EndDo;
    
    URL = "https://www.googleapis.com/upload/drive/v3/files?uploadType=resumable";
    
    If ValueIsFilled(Identifier) Then
        URL = StrReplace(URL, "/files", "/files/" + Identifier);
        Response = OPI_Tools.Patch(URL, Description, Headers, True, True);
    Else
        Response = OPI_Tools.Post(URL, Description, Headers, True, True);
    EndIf;
         
    UploadURL = Response.Headers["Location"];
    
    If Not ValueIsFilled(UploadURL) Then
        OPI_Tools.ProcessResponse(Response);
        Return Response;
    EndIf;
       
	UploadResponse = UploadFileInParts(Binary, UploadURL);
	Response = ?(ValueIsFilled(UploadResponse), UploadResponse, Response);
    
    OPI_Tools.ProcessResponse(Response);
    Return Response;
   
EndFunction

Function UploadFileInParts(Val Binary, Val UploadURL)
	
	Response = "";
	ChunkSize = 268435456;
	BytesRead = 0;
    CurrentPosition = 0;
    TotalSize = Binary.Size();
    StrTotalSize = OPI_Tools.NumberToString(TotalSize);
    DataReader = New DataReader(Binary);
    SourceStream = DataReader.SourceStream();
    
    WHile BytesRead < TotalSize Do
            
        BytesRead = SourceStream.CurrentPosition();
        Result = DataReader.Read(ChunkSize);
        CurrentData = Result.GetBinaryData();
        CurrentSize = CurrentData.Size();
        NextPosition = CurrentPosition + CurrentSize - 1; 
        
        If Not ValueIsFilled(CurrentData) Then
            Break;
        EndIf;
        
        StreamHeader = "bytes "
            + OPI_Tools.NumberToString(CurrentPosition)
            + "-" 
            + OPI_Tools.NumberToString(NextPosition) 
            + "/" 
            + StrTotalSize;
            
        AdditionalHeaders = New Map;
        AdditionalHeaders.Insert("Content-Length", OPI_Tools.NumberToString(CurrentSize));
        AdditionalHeaders.Insert("Content-Range" , StreamHeader); 
        AdditionalHeaders.Insert("Content-Type" , "application/octet-stream");
        
        Response = OPI_Tools.Put(UploadURL, CurrentData, AdditionalHeaders, False, True);
        
		CheckResult = CheckPartUpload(Response, StrTotalSize, AdditionalHeaders, UploadURL, CurrentPosition);
		
		If ValueIsFilled(CheckResult) Then
			Return CheckResult;
		EndIf;
        
        KBytes = 1024;
        MByte = KBytes * KBytes;
		Message(OPI_Tools.ProgressInformation(CurrentPosition, TotalSize, "MB", MByte));
        
        RunGarbageCollection();
        FreeObject(CurrentData);
        
    EndDo;
    
    Return Response;
    
EndFunction

Function CheckPartUpload(Response, StrTotalSize, AdditionalHeaders, UploadURL, CurrentPosition)
	
    StartOfErrorCodes = 400;
    EndOfFailureCodes = 600;
    StartOfSuccessCodes = 200;
    EndOfSuccessCodes = 300;
    Redirection = 308;
    
    If Response.StatusCode >= StartOfErrorCodes And Response.StatusCode < EndOfFailureCodes Then
         
        StreamHeader = "bytes */" + StrTotalSize;
        AdditionalHeaders.Insert("Content-Range" , StreamHeader);
        
        CheckResponse = OPI_Tools.Put(UploadURL, "", AdditionalHeaders, False, True);
        
        If CheckResponse.StatusCode >= StartOfSuccessCodes And CheckResponse.StatusCode < EndOfSuccessCodes Then
        	
            OPI_Tools.ProcessResponse(CheckResponse);
            Return CheckResponse;
            
        ElsIf CheckResponse.StatusCode = Redirection Then
        	
            UploadedData = Response.Headers["Range"];
            
        Else
        	
            OPI_Tools.ProcessResponse(Response);
        	Return Response;
        	
        EndIf;
        
    Else
        UploadedData = Response.Headers["Range"];
    EndIf;
        
    If Not ValueIsFilled(UploadedData) Then
        OPI_Tools.ProcessResponse(Response);
        Return Response;
    EndIf;
    
    UploadedData = StrReplace(UploadedData, "bytes=", "");
    ArrayOfInformation = StrSplit(UploadedData, "-", False);
    PartsRequired = 2;
    
    If Not ArrayOfInformation.Count() = PartsRequired Then
    	OPI_Tools.ProcessResponse(Response);
        Return Response;
    EndIf;
    
    CurrentPosition = Number(ArrayOfInformation[1]) + 1;
    
    Return "";
        
EndFunction

#EndRegion
