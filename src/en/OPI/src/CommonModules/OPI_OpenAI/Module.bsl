// OneScript: ./OInt/core/Modules/OPI_OpenAI.os
// Lib: OpenAI
// CLI: openai

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
// #Use "../../tools"

#Region Public

#Region RequestsProcessing

// Get response
// Generates a response for a given text query
//
// Note
// Method at API documentation: [Create chat completion](@platform.openai.com/docs/api-reference/chat/create)
//
// Parameters:
// URL - String - Ollama server URL - url
// Token - String - OpenAI authorization token - token
// Model - String - Models name - model
// Messages - String, Array of String - Conversation messages. See GetMessageStructure - msgs
// AdditionalParameters - Structure Of KeyAndValue - KeyValue collection of additional parameters - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetResponse(Val URL, Val Token, Val Model, Val Messages, Val AdditionalParameters = "", Val AdditionalHeaders = "") Export

    CompleteURL(URL, "v1/chat/completions");

    Parameters = New Structure;
    OPI_Tools.AddField("model"   , Model   , "String" , Parameters);
    OPI_Tools.AddField("messages", Messages, "Array"  , Parameters);
    OPI_Tools.AddField("stream"  , False   , "Boolean", Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Get embeddings
// Gets the embeddings for the given entries
//
// Note
// Method at API documentation: [Create embeddings](@platform.openai.com/docs/api-reference/embeddings/create)
//
// Parameters:
// URL - String - Ollama server URL - url
// Token - String - OpenAI authorization token - token
// Model - String - Models name - model
// Text - Array Of String - String or array of request strings - input
// AdditionalParameters - Structure Of KeyAndValue - Additional parameters. See GetEmbeddingsParameterStructure - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetEmbeddings(Val URL, Val Token, Val Model, Val Text, Val AdditionalParameters = "", Val AdditionalHeaders = "") Export

    CompleteURL(URL, "v1/embeddings");

    Parameters = New Structure;

    OPI_Tools.AddField("model", Model, "String", Parameters);
    OPI_Tools.AddField("input", Text , "Array" , Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Get context message structure
// Receives the message structure for the request message list
//
// Parameters:
// Role - String - Message source: system, user, developer - role
// Text - String - Message text - text
// Name - String - Name of participant in conversation - name
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetMessageStructure(Val Role, Val Text, Val Name = "") Export

    FieldsStructure = New Structure;

    OPI_Tools.AddField("role"   , Role , "String", FieldsStructure);
    OPI_Tools.AddField("content", Text , "String", FieldsStructure);
    OPI_Tools.AddField("name"   , Name , "String", FieldsStructure);

    Return FieldsStructure;

EndFunction

#EndRegion

#EndRegion

#Region Private

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

Procedure HeadersProcessing(AdditionalHeaders, Val Token)

    If Not ValueIsFilled(AdditionalHeaders) Then
        AdditionalHeaders = New Map;
    Else
        ErrorText         = "An incorrect collection of additional headers has been passed!";
        OPI_TypeConversion.GetKeyValueCollection(AdditionalHeaders, ErrorText);
    EndIf;

    OPI_TypeConversion.GetLine(Token);
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

EndProcedure

#EndRegion
