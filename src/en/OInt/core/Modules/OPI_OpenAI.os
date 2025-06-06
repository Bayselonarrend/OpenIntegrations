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
#Use "../../tools"

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
// AdditionalParameters - Structure Of KeyAndValue - Additional request parameters, if necessary - options
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
// AdditionalParameters - Structure Of KeyAndValue - Additional request parameters, if necessary - options
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

#Region Assistants

// Get assistants list
// Retrieves a list of assistants with or without filtering
//
// Note
// Method at API documentation: [List assistants](@platform.openai.com/docs/api-reference/assistants/listAssistants)
//
// Parameters:
// URL - String - Ollama server URL - url
// Token - String - OpenAI authorization token - token
// Count - Number - Maximum number of assistants returned - limit
// AdditionalParameters - Structure Of KeyAndValue - Additional request parameters, if necessary - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetAssistantsList(Val URL
    , Val Token
    , Val Count = 20
    , Val AdditionalParameters = ""
    , Val AdditionalHeaders = "") Export

    CompleteURL(URL, "v1/assistants");

    Parameters = New Structure;

    OPI_Tools.AddField("limit", Count, "Number", Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.Get(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Create assistant
// Creates an assistant based on the model and instruction
//
// Note
// Method at API documentation: [Create assistant](@platform.openai.com/docs/api-reference/assistants/createAssistant)
//
// Parameters:
// URL - String - Ollama server URL - url
// Token - String - OpenAI authorization token - token
// Model - String - Models name - model
// Name - String - Assistant name - name
// Instruction - String - System instruction for the assistant - inst
// AdditionalParameters - Structure Of KeyAndValue - Additional request parameters, if necessary - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CreateAssistant(Val URL
    , Val Token
    , Val Model
    , Val Name = ""
    , Val Instruction = ""
    , Val AdditionalParameters = ""
    , Val AdditionalHeaders = "") Export

    CompleteURL(URL, "v1/assistants");

    Parameters = New Structure;

    OPI_Tools.AddField("model"       , Model       , "String", Parameters);
    OPI_Tools.AddField("name"        , Name        , "String", Parameters);
    OPI_Tools.AddField("instructions", Instruction , "String", Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Retrieve assistant
// Retrieves information about an assistant by ID
//
// Note
// Method at API documentation: [Retrieve assistant](@platform.openai.com/docs/api-reference/assistants/getAssistant)
//
// Parameters:
// URL - String - Ollama server URL - url
// Token - String - OpenAI authorization token - token
// AssistantID - String - Assistant ID - id
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function RetrieveAssistant(Val URL, Val Token, Val AssistantID, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetLine(AssistantID);

    CompleteURL(URL, StrTemplate("v1/assistants/%1", AssistantID));
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.Get(URL, , AdditionalHeaders);

    Return Response;

EndFunction

// Delete assistant
// Deletes a previously created assistant
//
// Note
// Method at API documentation: [Delete assistant](@platform.openai.com/docs/api-reference/assistants/deleteAssistant)
//
// Parameters:
// URL - String - Ollama server URL - url
// Token - String - OpenAI authorization token - token
// AssistantID - String - Assistant ID - id
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function DeleteAssistant(Val URL, Val Token, Val AssistantID, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetLine(AssistantID);

    CompleteURL(URL, StrTemplate("v1/assistants/%1", AssistantID));
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.Delete(URL, , AdditionalHeaders);

    Return Response;

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

    If ValueIsFilled(Token) Then
        OPI_TypeConversion.GetLine(Token);
        AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));
    EndIf;

EndProcedure

#EndRegion


#Region Alternate

Function ПолучитьОтвет(Val URL, Val Токен, Val Модель, Val Сообщения, Val ДопПараметры = "", Val ДопЗаголовки = "") Export
	Return GetResponse(URL, Токен, Модель, Сообщения, ДопПараметры, ДопЗаголовки);
EndFunction

Function ПолучитьПредставления(Val URL, Val Токен, Val Модель, Val Текст, Val ДопПараметры = "", Val ДопЗаголовки = "") Export
	Return GetEmbeddings(URL, Токен, Модель, Текст, ДопПараметры, ДопЗаголовки);
EndFunction

Function ПолучитьСтруктуруСообщения(Val Роль, Val Текст, Val Имя = "") Export
	Return GetMessageStructure(Роль, Текст, Имя);
EndFunction

Function ПолучитьСписокАссистентов(Val URL, Val Токен, Val Количество = 20, Val ДопПараметры = "", Val ДопЗаголовки = "") Export
	Return GetAssistantsList(URL, Токен, Количество, ДопПараметры, ДопЗаголовки);
EndFunction

Function СоздатьАссистента(Val URL, Val Токен, Val Модель, Val Имя = "", Val Инструкция = "", Val ДопПараметры = "", Val ДопЗаголовки = "") Export
	Return CreateAssistant(URL, Токен, Модель, Имя, Инструкция, ДопПараметры, ДопЗаголовки);
EndFunction

Function ПолучитьАссистента(Val URL, Val Токен, Val IDАссистента, Val ДопЗаголовки = "") Export
	Return RetrieveAssistant(URL, Токен, IDАссистента, ДопЗаголовки);
EndFunction

Function УдалитьАссистента(Val URL, Val Токен, Val IDАссистента, Val ДопЗаголовки = "") Export
	Return DeleteAssistant(URL, Токен, IDАссистента, ДопЗаголовки);
EndFunction

#EndRegion