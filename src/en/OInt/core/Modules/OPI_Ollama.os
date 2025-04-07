// OneScript: ./OInt/core/Modules/OPI_Ollama.os
// Lib: Ollama
// CLI: ollama

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

// Uncomment if OneScript is executed
#Use "../../tools"

#Region Public

#Region RequestsProcessing

// Process request
// Generates a response for a given text query
//
// Note
// Method at API documentation: [Generate a completion](@github.com/ollama/ollama/blob/main/docs/api.md#generate-a-completion)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Prompt - String - Request text - prompt
// AdditionalParameters - Structure Of KeyAndValue - Additional parameters. See GetRequestParametersStructure - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ProcessRequest(Val URL, Val Model, Val Prompt, Val AdditionalParameters = "", Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/generate");

    Parameters = New Structure;
    Parameters.Insert("suffix", "");

    OPI_Tools.AddField("model" , Model , "String" , Parameters);
    OPI_Tools.AddField("prompt", Prompt, "String" , Parameters);
    OPI_Tools.AddField("stream", False , "Boolean", Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders);

    Response = OPI_Tools.Post(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

#EndRegion

Procedure CompleteURL(URL, Val Path)

    OPI_TypeConversion.GetLine(URL);

    URL = ?(StrEndsWith(URL, "/"), URL, URL + "/");
    URL = URL + Path;

EndProcedure

Procedure ProcessParameters(Parameters, Val AdditionalParameters)

    If Not ValueIsFilled(AdditionalParameters) Then
        Return;
    EndIf;

    ErrorText = "An incorrect collection of additional parameters has been passed!";
    OPI_TypeConversion.GetKeyValueCollection(AdditionalParameters, ErrorText);

    For Each AdditionalParameter In AdditionalParameters Do
        Parameters.Insert(AdditionalParameter.Key, AdditionalParameter.Value);
    EndDo;

EndProcedure

Procedure HeadersProcessing(AdditionalHeaders)

    If Not ValueIsFilled(AdditionalHeaders) Then
        AdditionalHeaders = New Map;
    Else
        ErrorText         = "An incorrect collection of additional headers has been passed!";
        OPI_TypeConversion.GetKeyValueCollection(AdditionalHeaders, ErrorText);
    EndIf;

EndProcedure

#EndRegion
