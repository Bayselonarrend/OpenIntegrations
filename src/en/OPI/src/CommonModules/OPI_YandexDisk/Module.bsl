﻿// OneScript: ./OInt/core/Modules/OPI_YandexDisk.os
// Lib: Yandex Disk
// CLI: yadisk
// Keywords: yandexdisk, yandex.disk, yandex disk, yandex drive, yadisk, ya disk
// Depends: OPI_YandexID

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region FileAndFolderManagement

// Get disk information
// Gets information about the current disk
//
// Parameters:
// Token - String - Token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetDiskInformation(Val Token) Export

    Headers  = OPI_YandexID.GetAuthorizationHeader(Token);
    Response = OPI_HTTPRequests.Get("https://cloud-api.yandex.net/v1/disk", , Headers);

    Return Response;

EndFunction

// Create folder
// Creates a directory on the disk
//
// Parameters:
// Token - String - Token - token
// Path - String - Path to the created folder - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function CreateFolder(Val Token, Val Path) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://cloud-api.yandex.net/v1/disk/resources";
    Href    = "href";

    Parameters = New Structure;
    OPI_Tools.AddField("path", Path, "String", Parameters);

    Parameters = OPI_Tools.RequestParametersToString(Parameters);
    Response   = OPI_HTTPRequests.PutWithBody(URL + Parameters, , Headers, False);

    ResponseURL = Response[Href];

    If Not ValueIsFilled(ResponseURL) Then
        Return Response;
    EndIf;

    Response = OPI_HTTPRequests.Get(ResponseURL, , Headers);

    Return Response;

EndFunction

// Get object
// Gets information about a disk object at the specified path
//
// Parameters:
// Token - String - Token - token
// Path - String - Path to folder or file - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetObject(Val Token, Val Path) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("path", Path, "String", Parameters);

    Response = OPI_HTTPRequests.Get("https://cloud-api.yandex.net/v1/disk/resources", Parameters, Headers);

    Return Response;

EndFunction

// Delete object
// Deletes an object at the specified path
//
// Parameters:
// Token - String - Token - token
// Path - String - Path to the folder or file to be deleted - path
// ToCart - Boolean - To cart - can
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function DeleteObject(Val Token, Val Path, Val ToCart = True) Export

    OPI_TypeConversion.GetBoolean(ToCart);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("path"       , Path      , "String" , Parameters);
    OPI_Tools.AddField("permanently", Not ToCart, "Boolean", Parameters);

    Response = OPI_HTTPRequests.Delete("https://cloud-api.yandex.net/v1/disk/resources", Parameters, Headers);

    Return Response;

EndFunction

// Create object copy
// Creates a copy of the object at the specified path and path to the original
//
// Parameters:
// Token - String - Token - token
// Original - String - Path to the original file or directory - from
// Path - String - Destination path for the copy - to
// Overwrite - Boolean - Overwrite if a file with the same name already exists - rewrite
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function CreateObjectCopy(Val Token, Val Original, Val Path, Val Overwrite = False) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://cloud-api.yandex.net/v1/disk/resources/copy";
    Href    = "href";

    Parameters = New Structure;
    OPI_Tools.AddField("from"     , Original , "String" , Parameters);
    OPI_Tools.AddField("path"     , Path     , "String" , Parameters);
    OPI_Tools.AddField("overwrite", Overwrite, "Boolean", Parameters);

    Parameters = OPI_Tools.RequestParametersToString(Parameters);
    Response   = OPI_HTTPRequests.PostWithBody(URL + Parameters, , Headers, False);

    ResponseURL = Response[Href];

    If Not ValueIsFilled(ResponseURL) Then
        Return Response;
    EndIf;

    Response = OPI_HTTPRequests.Get(ResponseURL, , Headers);

    Return Response;

EndFunction

// Get download link
// Gets a download link for the file
//
// Parameters:
// Token - String - Token - token
// Path - String - Path to the file for downloading - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetDownloadLink(Val Token, Val Path) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("path", Path, "String", Parameters);

    Response = OPI_HTTPRequests.Get("https://cloud-api.yandex.net/v1/disk/resources/download", Parameters, Headers);

    Return Response;

EndFunction

// Download file
// Downloads a file at the specified path
//
// Parameters:
// Token - String - Token - token
// Path - String - Path to the file for downloading - path
// SavePath - String - File save path - out
//
// Returns:
// BinaryData,String - Binary data or file path when SavePath parameter is specified
Function DownloadFile(Val Token, Val Path, Val SavePath = "") Export

    OPI_TypeConversion.GetLine(SavePath);

    Response = GetDownloadLink(Token, Path);
    URL      = Response["href"];

    If Not ValueIsFilled(URL) Then
        Return Response;
    EndIf;

    Response = OPI_HTTPRequests.Get(URL, , , SavePath);

    Return Response;

EndFunction

// Get list of files
// Gets a list of files with or without filtering by type
// List of available types: audio, backup, book, compressed, data, development,
// diskimage, document, encoded, executable, flash, font,
// mage, settings, spreadsheet, text, unknown, video, web
//
// Parameters:
// Token - String - Token - token
// Count - Number, String - Number of returned objects - amount
// OffsetFromStart - Number - Offset for getting objects not from the beginning of the list - offset
// FilterByType - String - Filter by file type - type
// SortByDate - Boolean - True > sort by date, False > alphabetically - datesort
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetFilesList(Val Token
    , Val Count = 0
    , Val OffsetFromStart = 0
    , Val FilterByType = ""
    , Val SortByDate = False) Export

    OPI_TypeConversion.GetLine(Count);
    OPI_TypeConversion.GetLine(OffsetFromStart);
    OPI_TypeConversion.GetLine(FilterByType);
    OPI_TypeConversion.GetBoolean(SortByDate);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);

    Parameters = New Structure;

    If ValueIsFilled(Count) Then
        Parameters.Insert("limit", OPI_Tools.NumberToString(Count));
    EndIf;

    If ValueIsFilled(OffsetFromStart) Then
        Parameters.Insert("offset", OPI_Tools.NumberToString(OffsetFromStart));
    EndIf;

    If ValueIsFilled(FilterByType) Then
        Parameters.Insert("media_type", FilterByType);
    EndIf;

    If SortByDate Then
        Destination = "last-uploaded";
    Else
        Destination = "files";
    EndIf;

    Response = OPI_HTTPRequests.Get("https://cloud-api.yandex.net/v1/disk/resources/" + Destination, Parameters, Headers);

    Return Response;

EndFunction

// Move object
// Moves the object to the specified path and path to the original
//
// Parameters:
// Token - String - Token - token
// Original - String - Path to the original file or folder - from
// Path - String - Destination path for moving - to
// Overwrite - Boolean - Overwrite if a file with the same name already exists - rewrite
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function MoveObject(Val Token, Val Original, Val Path, Val Overwrite = False) Export

    OPI_TypeConversion.GetLine(Original);
    OPI_TypeConversion.GetLine(Path);
    OPI_TypeConversion.GetBoolean(Overwrite);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://cloud-api.yandex.net/v1/disk/resources/move";
    Href    = "href";

    Parameters = New Structure;
    Parameters.Insert("from"      , Original);
    Parameters.Insert("path"      , Path);
    Parameters.Insert("overwrite" , Overwrite);

    Parameters  = OPI_Tools.RequestParametersToString(Parameters);
    Response    = OPI_HTTPRequests.PostWithBody(URL + Parameters, , Headers, False);
    ResponseURL = Response[Href];

    If Not ValueIsFilled(ResponseURL) Then
        Return Response;
    EndIf;

    Response = OPI_HTTPRequests.Get(ResponseURL, , Headers);

    Return Response;

EndFunction

// Upload file
// Uploads a file to disk at the specified path
//
// Parameters:
// Token - String - Token - token
// Path - String - Path for saving the file to disk - path
// File - String, BinaryData - File for upload - file
// Overwrite - Boolean - Overwrite if a file with the same name already exists - rewrite
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function UploadFile(Val Token, Val Path, Val File, Val Overwrite = False) Export

    OPI_TypeConversion.GetLine(Path);
    OPI_TypeConversion.GetBoolean(Overwrite);
    OPI_TypeConversion.GetBinaryData(File);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    Href    = "href";
    File    = New Structure("file", File);

    Parameters = New Structure;
    Parameters.Insert("path"      , Path);
    Parameters.Insert("overwrite" , Overwrite);

    Response = OPI_HTTPRequests.Get("https://cloud-api.yandex.net/v1/disk/resources/upload", Parameters, Headers);
    URL      = Response[Href];

    If Not ValueIsFilled(URL) Then
        Return Response;
    EndIf;

    Response = OPI_HTTPRequests.PutMultipart(URL, New Structure(), File, "multipart", Headers);

    Return Response;

EndFunction

// Upload file by URL
// Downloads a file to disk from the specified URL
//
// Parameters:
// Token - String - Token - token
// Path - String - Path to place the downloaded file - path
// Address - String - File URL - url
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function UploadFileByURL(Val Token, Val Path, Val Address) Export

    OPI_TypeConversion.GetLine(Path);
    OPI_TypeConversion.GetLine(Address);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://cloud-api.yandex.net/v1/disk/resources/upload";

    Parameters = New Structure;
    Parameters.Insert("url" , EncodeString(Address, StringEncodingMethod.URLencoding));
    Parameters.Insert("path", Path);

    Parameters = OPI_Tools.RequestParametersToString(Parameters);
    Response   = OPI_HTTPRequests.PostWithBody(URL + Parameters, , Headers, False);

    Return Response;

EndFunction

#EndRegion

#Region ManagePublicAccess

// Publish object
// Publishes the disk object for public access
//
// Parameters:
// Token - String - Token - token
// Path - String - Path to the object to be published - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function PublishObject(Val Token, Val Path) Export

    Return TogglePublicAccess(Token, Path, True);

EndFunction

// Unpublish object
// Unpublishes a previously published object
//
// Parameters:
// Token - String - Token - token
// Path - String - Path to the previously published object - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function CancelObjectPublication(Val Token, Val Path) Export

    Return TogglePublicAccess(Token, Path, False);

EndFunction

// Get list of published objects.
// Gets a list of published objects
//
// Parameters:
// Token - String - Token - token
// Count - Number - Number of returned objects - amount
// OffsetFromStart - Number - Offset for getting objects not from the beginning of the list - offset
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetPublishedObjectsList(Val Token, Val Count = 0, Val OffsetFromStart = 0) Export

    OPI_TypeConversion.GetLine(Count);
    OPI_TypeConversion.GetLine(OffsetFromStart);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);

    Parameters = New Structure;

    If ValueIsFilled(Count) Then
        Parameters.Insert("limit", Count);
    EndIf;

    If ValueIsFilled(OffsetFromStart) Then
        Parameters.Insert("offset", OffsetFromStart);
    EndIf;

    Response = OPI_HTTPRequests.Get("https://cloud-api.yandex.net/v1/disk/resources/public", Parameters, Headers);

    Return Response;

EndFunction

// Get public object
// Gets information about the published object by its URL
//
// Parameters:
// Token - String - Token - token
// URL - String - Object address - url
// Count - Number - Number of returned nested objects (for catalog) - amount
// OffsetFromStart - Number - Offset for getting nested objects not from the beginning of the list - offset
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetPublicObject(Val Token, Val URL, Val Count = 0, Val OffsetFromStart = 0) Export

    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(Count);
    OPI_TypeConversion.GetLine(OffsetFromStart);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);

    Parameters = New Structure;

    If ValueIsFilled(Count) Then
        Parameters.Insert("limit", OPI_Tools.NumberToString(Count));
    EndIf;

    If ValueIsFilled(OffsetFromStart) Then
        Parameters.Insert("offset", OPI_Tools.NumberToString(OffsetFromStart));
    EndIf;

    Parameters.Insert("public_key", URL);

    Response = OPI_HTTPRequests.Get("https://cloud-api.yandex.net/v1/disk/public/resources", Parameters, Headers);

    Return Response;

EndFunction

// Get download link for public object
// Gets a direct link to download the public object
//
// Parameters:
// Token - String - Token - token
// URL - String - Object address - url
// Path - String - Path inside the object - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetDownloadLinkForPublicObject(Val Token, Val URL, Val Path = "") Export

    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(Path);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);

    Parameters = New Structure;

    If ValueIsFilled(Path) Then
        Parameters.Insert("path", Path);
    EndIf;

    Parameters.Insert("public_key", URL);

    Response = OPI_HTTPRequests.Get("https://cloud-api.yandex.net/v1/disk/public/resources/download", Parameters, Headers);

    Return Response;

EndFunction

// Save public object to disk
// Saves the public object to your disk
//
// Parameters:
// Token - String - Token - token
// URL - String - Object address - url
// From - String - Path within public catalog (folders only) - from
// Target - String - File save path - to
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function SavePublicObjectToDisk(Val Token, Val URL, From = "", Target = "") Export

    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(From);
    OPI_TypeConversion.GetLine(Target);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    Address = "https://cloud-api.yandex.net/v1/disk/public/resources/save-to-disk";
    Href    = "href";

    Parameters = New Structure;
    Parameters.Insert("public_key", EncodeString(URL, StringEncodingMethod.URLencoding));

    If ValueIsFilled(From) Then
        Parameters.Insert("path", From);
    EndIf;

    If ValueIsFilled(Target) Then
        Parameters.Insert("save_path", Target);
    EndIf;

    Parameters = OPI_Tools.RequestParametersToString(Parameters);
    Response   = OPI_HTTPRequests.PostWithBody(Address + Parameters, , Headers, False);

    ResponseURL = Response[Href];

    If Not ValueIsFilled(ResponseURL) Then
        Return Response;
    EndIf;

    Response = OPI_HTTPRequests.Get(ResponseURL, , Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function TogglePublicAccess(Val Token, Val Path, Val PublicAccess)

    OPI_TypeConversion.GetLine(Path);
    OPI_TypeConversion.GetBoolean(PublicAccess);

    Headers     = OPI_YandexID.GetAuthorizationHeader(Token);
    Destination = ?(PublicAccess, "publish", "unpublish");
    Href        = "href";

    URL = "https://cloud-api.yandex.net/v1/disk/resources/" + Destination;

    Parameters = New Structure;
    Parameters.Insert("path", Path);

    Parameters = OPI_Tools.RequestParametersToString(Parameters);
    Response   = OPI_HTTPRequests.PutWithBody(URL + Parameters, , Headers, False);

    ResponseURL = Response[Href];

    If Not ValueIsFilled(ResponseURL) Then
        Return Response;
    EndIf;

    Response = OPI_HTTPRequests.Get(ResponseURL, , Headers);

    Return Response;

EndFunction

#EndRegion
