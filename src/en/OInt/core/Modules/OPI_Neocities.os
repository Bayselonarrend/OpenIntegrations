// OneScript: ./OInt/core/Modules/OPI_Neocities.os
// Lib: Neocities
// CLI: neocities

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
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Uncomment if OneScript is executed
#Use "../../tools"

#Region Public

#Region DataRetrieving

// Get site data
// Gets information about a site by its name or token
//
// Note
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// Website - String - Site name (login) for information. Current, if not filled in - sitename
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Neocities
Function GetSiteData(Val Token, Val Website = "") Export

    URL = "https://neocities.org/api/info";

    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("sitename", Website, "String", Parameters);

    Response = OPI_Tools.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get token
// Receives authorization token by login and password
//
// Note
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Login - String - Users login - login
// Password - String - Users password - password
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Neocities
Function GetToken(Val Login, Val Password) Export

    OPI_TypeConversion.GetLine(Login);
    OPI_TypeConversion.GetLine(Password);

    SecureConnection = New OpenSSLSecureConnection();
    SafeConnection   = New HTTPConnection("neocities.org",443, Login, Password, , , SecureConnection);

    Response = SafeConnection.Get(New HTTPRequest("/api/key"));

    JSONReader = New JSONReader();
    JSONReader.OpenStream(Response.GetBodyAsStream());
    Response   = ReadJSON(JSONReader);

    Return Response;

EndFunction

#EndRegion

#Region FileManagment

// Upload file
// Upload single file to Neocities
//
// Note
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// Path - String - File path on Neocities - path
// Data - String, BinaryData - URL, path or file data - file
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Neocities
Function UploadFile(Val Token, Val Path, Val Data) Export

    OPI_TypeConversion.GetLine(Path);
    OPI_TypeConversion.GetBinaryData(Data);

    URL     = "https://neocities.org/api/upload";
    Headers = CreateRequestHeaders(Token);

    FileMapping = New Map;
    FileMapping.Insert(Path + "|" + Path, Data);

    Response = OPI_Tools.PostMultipart(URL, , FileMapping, "multipart/form-data", Headers);

    Return Response;

EndFunction

// Upload files
// Uploads multiple files to Neocities
//
// Note
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// FileMapping - Map Of KeyAndValue - Files: Key > destination path on NC, Value - File - files
// Singly - Boolean - True > sends files in separate requests - singly
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Neocities
Function UploadFiles(Val Token, Val FileMapping, Val Singly = False) Export

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

        FinalResponse = OPI_Tools.PostMultipart(URL
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
// Note
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// Paths - String, Array of String - Path or multiple paths of the files to be deleted - paths
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Neocities
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
    Response    = OPI_Tools.Post(URL, PathsString, Headers, False);

    Return Response;

EndFunction

// Get list of files
// Gets a list of files with or without directory selection
//
// Note
// Neocities API docs: [neocities.org/api](@neocities.org/api)
//
// Parameters:
// Token - String - Auth token - token
// Path - String - Selection of files by catalog. All if not filled in - path
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Neocities
Function GetFilesList(Val Token, Val Path = "") Export

    URL     = "https://neocities.org/api/list";
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("path", Path, "String", Parameters);

    Response = OPI_Tools.Get(URL, Parameters, Headers);

    Return Response;

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

#EndRegion
