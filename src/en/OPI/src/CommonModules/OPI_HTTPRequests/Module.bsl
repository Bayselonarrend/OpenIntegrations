// OneScript: ./OInt/tools/Modules/OPI_HTTPRequests.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check use-non-recommended-method

// Uncomment if OneScript is executed
// #Use "./internal"

#Region Public

// New request
// Creates a new object to work with HTTP
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - Processor object
Function NewRequest() Export

    If OPI_Tools.IsOneScript() Then

        //@skip-check property-not-writable
        //@skip-check bsl-legacy-check-static-feature-access
        DataProcessors = Undefined;

        TypeName   = "OPI_HTTPClient";
        HTTPClient = New(TypeName);

    Else
        HTTPClient = DataProcessors.OPI_HTTPClient.Create();
    EndIf;

    Return HTTPClient;

EndFunction

#EndRegion

#Region Internal

#Region RequestsWithoutBody

Function Get(Val URL
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val ResponseFile      = Undefined
    , Val FullResponse      = False) Export

    Return ExecuteRequestWithoutBody(URL, "GET", Parameters, AdditionalHeaders, ResponseFile, FullResponse);

EndFunction

Function Head(Val URL
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val ResponseFile      = Undefined
    , Val FullResponse      = False) Export

    Return ExecuteRequestWithoutBody(URL, "HEAD", Parameters, AdditionalHeaders, ResponseFile, FullResponse);

EndFunction

Function Delete(Val URL
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val ResponseFile      = Undefined
    , Val FullResponse      = False) Export

    Return ExecuteRequestWithoutBody(URL, "DELETE", Parameters, AdditionalHeaders, ResponseFile, FullResponse);

EndFunction

#EndRegion

#Region RequestsWithBody

Function PostWithBody(Val URL
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val JSON              = True
    , Val FullResponse      = False
    , Val ResponseFile      = Undefined) Export

    Return ExecuteRequestWithBody(URL, "POST", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);

EndFunction

Function PatchWithBody(Val URL
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val JSON              = True
    , Val FullResponse      = False
    , Val ResponseFile      = Undefined) Export

    Return ExecuteRequestWithBody(URL, "PATCH", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);

EndFunction

Function PutWithBody(Val URL
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val JSON              = True
    , Val FullResponse      = False
    , Val ResponseFile      = Undefined) Export

    Return ExecuteRequestWithBody(URL, "PUT", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);

EndFunction

Function DeleteWithBody(Val URL
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val JSON              = True
    , Val FullResponse      = False
    , Val ResponseFile      = Undefined) Export

    Return ExecuteRequestWithBody(URL, "DELETE", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);

EndFunction

#EndRegion

#Region MultipartRequests

Function PostMultipart(Val URL
    , Val Parameters        = ""
    , Val Files             = ""
    , Val ContentType       = "image/jpeg"
    , Val AdditionalHeaders = ""
    , Val ResponseFile      = Undefined) Export

    HttpClient = NewRequest()
        .Initialize(URL)
        .SetHeaders(AdditionalHeaders)
        .SetResponseFile(ResponseFile)
        .StartMultipartBody();

    If ValueIsFilled(Files) Then

        OPI_TypeConversion.GetKeyValueCollection(Files);

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        For Each File In Files Do

            DataStructure = SplitFileKey(File.Key, ContentType);

            FieldName = DataStructure["FieldName"];
            FileName  = DataStructure["FileName"];

            HttpClient.AddMultipartFormDataFile(FieldName, FileName, File.Value, ContentType);

        EndDo;
    EndIf;

    If ValueIsFilled(Parameters) Then

        OPI_TypeConversion.GetKeyValueCollection(Parameters);

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        For Each Parameter In Parameters Do
            HttpClient.AddMultipartFormDataField(Parameter.Key, Parameter.Value);
        EndDo;
    EndIf;

    HttpClient.ProcessRequest("POST");

    Result = HttpClient.ReturnResponseAsJSONObject(True, True);

    If HttpClient.Error Then
        Raise HttpClient.GetLog(True);
    Else
        Return Result;
    EndIf;

EndFunction

Function PutMultipart(Val URL
    , Val Parameters        = ""
    , Val Files             = ""
    , Val ContentType       = "image/jpeg"
    , Val AdditionalHeaders = ""
    , Val ResponseFile      = Undefined) Export

    Return ExecuteMultipartRequest(URL, "PUT", Parameters, Files, ContentType, AdditionalHeaders, ResponseFile);

EndFunction

#EndRegion

#EndRegion

#Region Private

Function ExecuteRequestWithBody(Val URL
    , Val View
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val JSON              = True
    , Val FullResponse      = False
    , Val ResponseFile      = Undefined)

    Attempts = 5;

    HttpClient = NewRequest()
        .Initialize(URL)
        .SetHeaders(AdditionalHeaders)
        .SetResponseFile(ResponseFile)
        .MaxAttempts(Attempts);

    If JSON Then
        HttpClient.SetJsonBody(Parameters);
    Else
        HttpClient.SetFormBody(Parameters);
    EndIf;

    HttpClient.ProcessRequest(View);

    If FullResponse Then
        Result = HttpClient.ReturnResponse(False, True);
    Else
        Result = HttpClient.ReturnResponseAsJSONObject(True, True);
    EndIf;

    Return Result;

EndFunction

Function ExecuteRequestWithoutBody(Val URL
    , Val View
    , Val Parameters        = ""
    , Val AdditionalHeaders = ""
    , Val ResponseFile      = Undefined
    , Val FullResponse      = False)

    Attempts = 5;

    HttpClient = NewRequest()
        .Initialize(URL)
        .SetURLParams(Parameters)
        .SetHeaders(AdditionalHeaders)
        .SetResponseFile(ResponseFile)
        .MaxAttempts(Attempts)
        .ProcessRequest(View);

    If FullResponse Then
        Result = HttpClient.ReturnResponse(False, True);
    Else
        Result = HttpClient.ReturnResponseAsJSONObject(True, True);
    EndIf;

    Return Result;

EndFunction

Function ExecuteMultipartRequest(Val URL
    , Val View
    , Val Parameters        = ""
    , Val Files             = ""
    , Val ContentType       = "image/jpeg"
    , Val AdditionalHeaders = ""
    , Val ResponseFile      = Undefined)

    Attempts = 5;

    HttpClient = NewRequest()
        .Initialize(URL)
        .SetHeaders(AdditionalHeaders)
        .SetResponseFile(ResponseFile)
        .MaxAttempts(Attempts)
        .StartMultipartBody();

    //@skip-check bsl-legacy-check-for-each-statetement-collection
    For Each File In Files Do

        DataStructure = SplitFileKey(File.Key, ContentType);

        FieldName = DataStructure["FieldName"];
        FileName  = DataStructure["FileName"];

        HttpClient.AddMultipartFormDataFile(FieldName, FileName, File.Value, ContentType);

    EndDo;

    //@skip-check bsl-legacy-check-for-each-statetement-collection
    For Each Parameter In Parameters Do
        HttpClient.AddMultipartFormDataField(Parameter.Key, Parameter.Value);
    EndDo;

    Result = HttpClient.ProcessRequest("POST").ReturnResponseAsJSONObject(True, True);

    Return Result;

EndFunction

Function SplitFileKey(Val FileData, Val ContentType)

    DotReplacement = "___";
    FileName       = StrReplace(FileData, DotReplacement, ".");
    NameParts      = StrSplit(FileName, "|", False);
    NeedParts      = 2;

    If NameParts.Count() = NeedParts Then
        FieldName        = NameParts[0];
        FileName         = NameParts[1];
    Else

        If ContentType = "image/jpeg" Then

            FieldName = "photo";

        Else

            FieldName = Left(FileName, StrFind(FileName, ".") - 1);
            FieldName = ?(ValueIsFilled(FieldName), FieldName, StrReplace(FileData, DotReplacement, "."));

        EndIf;

    EndIf;

    ReturnStructure = New Structure("FieldName,FileName", FieldName, FileName);

    Return ReturnStructure;

EndFunction

#EndRegion
