// OneScript: ./OInt/core/Modules/OPI_Neocities.os
// Lib: Neocities
// CLI: neocities
// Keywords: neocities

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Region Public

#Region DataRetrieving

// Get site data
// Gets information about a site by its name or token
//
// Note:
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// Website - String - Site name (login) for information. Current, if not filled in - sitename
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Neocities
Function GetSiteData(Val Token, Val Website = "") Export

    URL = "https://neocities.org/api/info";

    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("sitename", Website, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get token
// Receives authorization token by login and password
//
// Note:
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Login - String - Users login - login
// Password - String - Users password - password
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Neocities
Function GetToken(Val Login, Val Password) Export

    OPI_TypeConversion.GetLine(Login);
    OPI_TypeConversion.GetLine(Password);

    URL     = "neocities.org";
    Timeout = 120;

    Try

        SecureConnection = New OpenSSLSecureConnection();
        SafeConnection   = New HTTPConnection(URL, 443, Login, Password, , Timeout, SecureConnection);

    Except

        URL            = "https://" + URL;
        SafeConnection = New HTTPConnection(URL, 443, Login, Password, , Timeout);

    EndTry;

    Response = SafeConnection.Get(New HTTPRequest("/api/key"));

    JSONReader = New JSONReader();
    JSONReader.SetString(Response.GetBodyAsString());

    Response = ReadJSON(JSONReader);

    Return Response;

EndFunction

#EndRegion

#Region FileManagement

// Upload file
// Upload single file to Neocities
//
// Note:
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// Path - String - File path on Neocities - path
// Data - String, BinaryData - URL, path or file data - file
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Neocities
Function UploadFile(Val Token, Val Path, Val Data) Export

    OPI_TypeConversion.GetLine(Path);
    OPI_TypeConversion.GetBinaryData(Data);

    URL     = "https://neocities.org/api/upload";
    Headers = CreateRequestHeaders(Token);

    FileMapping = New Map;
    FileMapping.Insert(Path + "|" + Path, Data);

    Response = OPI_HTTPRequests.PostMultipart(URL, , FileMapping, "multipart/form-data", Headers);

    Return Response;

EndFunction

// Upload files
// Uploads multiple files to Neocities
//
// Note:
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// FileMapping - Map Of KeyAndValue - Files: Key > destination path on NC, Value > file - files
// Singly - Boolean - True > sends files in separate requests - singly
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Neocities
Function UploadFiles(Val Token, Val FileMapping, Val Singly = False) Export

    OPI_TypeConversion.GetBoolean(Singly);
    OPI_TypeConversion.GetCollection(FileMapping);

    FinalResponse = New Array;
    ProcessedMap  = New Map;

    For Each SendingFile In FileMapping Do

        If Singly Then

            Response = UploadFile(Token, SendingFile.Key, SendingFile.Value);
            FinalResponse.Add(Response);

        Else

            CurrentPath = SendingFile.Key;
            CurrentData = SendingFile.Value;

            OPI_TypeConversion.GetLine(CurrentPath);
            OPI_TypeConversion.GetBinaryData(CurrentData);

            ProcessedMap.Insert(CurrentPath + "|" + CurrentPath, CurrentData);

        EndIf;

    EndDo;

    If Not Singly Then

        URL     = "https://neocities.org/api/upload";
        Headers = CreateRequestHeaders(Token);

        FinalResponse = OPI_HTTPRequests.PostMultipart(URL
            ,
            , ProcessedMap
            , "multipart/form-data"
            , Headers);

    EndIf;

    Return FinalResponse;

EndFunction

// Delete selected files
// Deletes a file or multiple files from Neocities
//
// Note:
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// Paths - String, Array of String - Path or multiple paths of the files to be deleted - paths
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Neocities
Function DeleteSelectedFiles(Val Token, Val Paths) Export

    OPI_TypeConversion.GetArray(Paths);

    URL     = "https://neocities.org/api/delete";
    Headers = CreateRequestHeaders(Token);

    For N = 0 To Paths.UBound() Do

        CurrentValue = Paths[N];

        OPI_TypeConversion.GetLine(CurrentValue);

        Paths.Set(N, "filenames[]=" + CurrentValue);

    EndDo;

    PathsString = StrConcat(Paths, "&");
    Response    = OPI_HTTPRequests.PostWithBody(URL, PathsString, Headers, False);

    Return Response;

EndFunction

// Get list of files
// Gets a list of files with or without directory selection
//
// Note:
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// Path - String - Selection of files by catalog. All if not filled in - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Neocities
Function GetFilesList(Val Token, Val Path = "") Export

    URL     = "https://neocities.org/api/list";
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("path", Path, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Synchronize folders
// Creates a copy of the local directory at the selected path on the Neocities server
//
// Note:
// Neocities API docs: [neocities.org/api](@neocities.org/api)
// The method deletes files on the server if they do not exist in the local directory
//
// Parameters:
// Token - String - Auth token - token
// LocalFolder - String - Local source catalog - local
// RemoteFolder - String - Remote receiver catalog. Root by default - remote
//
// Returns:
// Structure Of KeyAndValue - synchronization error information
Function SynchronizeFolders(Val Token, Val LocalFolder, Val RemoteFolder = "") Export

    OPI_TypeConversion.GetLine(LocalFolder);
    OPI_TypeConversion.GetLine(RemoteFolder);

    // !OInt Message("Start synchronization...");

    If ValueIsFilled(RemoteFolder) Then
        RemoteFolder = ?(StrEndsWith(RemoteFolder, "/"), RemoteFolder, RemoteFolder + "/");
    EndIf;

    RemoteFiles = GetFilesList(Token, RemoteFolder);

    If Not RemoteFiles["result"] = "success" Then
        //@skip-check constructor-function-return-section
        Return RemoteFiles;
    EndIf;

    LocalPaths      = New Map;
    LocalSubfolders = New Map;

    GetLocalPathsSets(LocalFolder, RemoteFolder, LocalPaths, LocalSubfolders);

    ArrayOfDeletions = GetDeletedFiles(RemoteFiles, LocalPaths, LocalSubfolders);
    Result           = MakeSynchronization(Token, ArrayOfDeletions, LocalPaths);

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function CreateRequestHeaders(Val Token)

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Authorization", "Bearer " + Token);
    Return Headers;

EndFunction

Function GetDeletedFiles(RemoteFiles, LocalPaths, LocalSubfolders)

    ArrayOfDeletions = New Array;

    For Each RemoteFile In RemoteFiles["files"] Do

        PathOfRemotePrimary   = RemoteFile["path"];
        PathOfRemoteSecondary = "/" + RemoteFile["path"];

        If RemoteFile["is_directory"] Then

            ExistingRemote = LocalSubfolders[PathOfRemotePrimary];
            ExistingRemote = ?(ValueIsFilled(ExistingRemote)
                , ExistingRemote
                , LocalSubfolders[PathOfRemoteSecondary]);

        Else
            ExistingRemote = LocalPaths[PathOfRemotePrimary];
            ExistingRemote = ?(ValueIsFilled(ExistingRemote)
                , ExistingRemote
                , LocalPaths[PathOfRemoteSecondary]);

        EndIf;

        If ExistingRemote = Undefined Then
            ArrayOfDeletions.Add(PathOfRemotePrimary);
        EndIf;

    EndDo;

    Return ArrayOfDeletions;

EndFunction

Function MakeSynchronization(Token, ArrayOfDeletions, LocalPaths)

    ErrorsArray = New Array;

    If Not ArrayOfDeletions.Count() = 0 Then

        Response = DeleteSelectedFiles(Token, ArrayOfDeletions);

        If Not Response["result"] = "success" Then
            ErrorsArray.Add(Response);

        Else

            // BSLLS:UnusedLocalVariable-off

            //@skip-check module-unused-local-variable
            DeletingMessage = StrTemplate("Removed %1 unnecessary files", String(ArrayOfDeletions.Count()));
            // !OInt Message(DeletingMessage);

            // BSLLS:UnusedLocalVariable-on

        EndIf;

    EndIf;

    Total   = OPI_Tools.NumberToString(LocalPaths.Count());
    Counter = 0;

    For Each LocalPath In LocalPaths Do

        Response = UploadFile(Token, LocalPath.Key, LocalPath.Value);

        If Not Response["result"] = "success" Then

            ErrorsArray.Add(Response);

        Else

            // BSLLS:UnusedLocalVariable-off

            //@skip-check module-unused-local-variable
            Progress = "[" + OPI_Tools.NumberToString(Counter) + "/" + Total + "] ";
            // !OInt Message(Progress + LocalPath.Key + Chars.LF + Response["message"] + Chars.LF);

            // BSLLS:UnusedLocalVariable-on

        EndIf;

        Counter = Counter + 1;

    EndDo;

    Return New Structure("errors,items", ErrorsArray.Count(), ErrorsArray);

EndFunction

Procedure GetLocalPathsSets(LocalFolder, RemoteFolder, LocalPaths, LocalSubfolders)

    LocalFolder = StrReplace(LocalFolder, "\", "/");
    LocalFolder = ?(StrEndsWith(LocalFolder, "/"), LocalFolder, LocalFolder + "/");

    LocalFiles = FindFiles(LocalFolder, "*", True);

    For Each LocalFile In LocalFiles Do

        CurrentAbsPath = LocalFile.FullName;
        CurrentRelPath = Right(CurrentAbsPath, StrLen(CurrentAbsPath) - StrLen(LocalFolder));
        CurrentRelPath = RemoteFolder + CurrentRelPath;

        CurrentRelPath = StrReplace(CurrentRelPath, "\", "/");

        If LocalFile.IsDirectory() Then
            LocalSubfolders.Insert(CurrentRelPath, CurrentAbsPath);
        Else
            LocalPaths.Insert(CurrentRelPath, CurrentAbsPath);
        EndIf;

    EndDo;

EndProcedure

#EndRegion
