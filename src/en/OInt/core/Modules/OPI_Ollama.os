// OneScript: ./OInt/core/Modules/OPI_Ollama.os
// Lib: Ollama
// CLI: ollama
// Keywords: ollama, ai llm

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
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

#Region Public

#Region RequestsProcessing

// Get version
// Gets a version of Ollama
//
// Note:
// Method at API documentation: [Version](@github.com/ollama/ollama/blob/main/docs/api.md#version)
//
// Parameters:
// URL - String - Ollama server URL - url
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetVersion(Val URL, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/version");

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.Get(URL, , AdditionalHeaders);

    Return Response;

EndFunction

// Get response
// Generates a response for a given text query
//
// Note:
// Method at API documentation: [Generate a completion](@github.com/ollama/ollama/blob/main/docs/api.md#generate-a-completion)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Question - String - Request text - prompt
// AdditionalParameters - Structure Of KeyAndValue - Additional parameters. See GetRequestParametersStructure - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetResponse(Val URL, Val Model, Val Question, Val AdditionalParameters = "", Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/generate");

    Parameters = New Structure;
    Parameters.Insert("suffix", "");

    OPI_Tools.AddField("model" , Model   , "String" , Parameters);
    OPI_Tools.AddField("prompt", Question, "String" , Parameters);
    OPI_Tools.AddField("stream", False   , "Boolean", Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Get context response
// Receives the next response from the model according to the message history
//
// Note:
// Method at API documentation: [Generate a chat completion](@github.com/ollama/ollama/blob/main/docs/api.md#generate-a-chat-completion)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Messages - Array of Structure - Messages log. See GetContextMessageStructure - msgs
// AdditionalParameters - Structure Of KeyAndValue - Additional parameters. See GetRequestParametersStructure - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetContextResponse(Val URL, Val Model, Val Messages, Val AdditionalParameters = "", Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/chat");

    Parameters = New Structure;

    OPI_Tools.AddField("model"   , Model   , "String"    , Parameters);
    OPI_Tools.AddField("messages", Messages, "Collection", Parameters);
    OPI_Tools.AddField("stream"  , False   , "Boolean"   , Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Get embeddings
// Gets the embeddings for the given entries
//
// Note:
// Method at API documentation: [Generate Embeddings](@github.com/ollama/ollama/blob/main/docs/api.md#generate-embeddings)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Question - Array Of String - String or array of request strings - input
// AdditionalParameters - Structure Of KeyAndValue - Additional parameters. See GetEmbeddingsParameterStructure - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetEmbeddings(Val URL, Val Model, Val Question, Val AdditionalParameters = "", Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/embed");

    Parameters = New Structure;

    OPI_Tools.AddField("model", Model   , "String", Parameters);
    OPI_Tools.AddField("input", Question, "String", Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Get request parameter structure
// Gets the structure of additional parameters for request processing
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetRequestParameterStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FieldsStructure = New Structure;
    FieldsStructure.Insert("format"    , "<the format in which the response is returned: json or JSON schema>");
    FieldsStructure.Insert("options"   , "<additional model parameters listed in the Modelfile documentation>");
    FieldsStructure.Insert("system"    , "<system message (overrides what is defined in Modelfile)>");
    FieldsStructure.Insert("template"  , "<prompt template (overrides what is defined in Modelfile)>");
    FieldsStructure.Insert("raw"       , "<true > disable prompt formatting>");
    FieldsStructure.Insert("keep_alive", "<how long the model will remain loaded in memory after a request>");
    FieldsStructure.Insert("suffix"    , "<text after the model's response>");
    FieldsStructure.Insert("images"    , "<list of images in Base64 format (for multimodal models like llava)>");

    If Clear Then
        FieldsStructure = OPI_Tools.ClearCollectionRecursively(FieldsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FieldsStructure;

EndFunction

// Get embeddings parameter structure
// Gets the structure of additional parameters for processing embeddings requests
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetEmbeddingsParameterStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FieldsStructure = New Structure;
    FieldsStructure.Insert("options"   , "<additional model parameters listed in the Modelfile documentation>");
    FieldsStructure.Insert("keep_alive", "<how long the model will remain loaded in memory after a request>");
    FieldsStructure.Insert("truncate"  , "<trims the end of each response to fit within the context length. Returns an error if false and the length is exceeded>");

    If Clear Then
        FieldsStructure = OPI_Tools.ClearCollectionRecursively(FieldsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FieldsStructure;

EndFunction

// Get context parameter structure
// Gets the structure of additional parameters to process the request in context
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetContextParameterStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FieldsStructure = New Structure;
    FieldsStructure.Insert("format"    , "<the format in which the response is returned: json or JSON schema>");
    FieldsStructure.Insert("options"   , "<additional model parameters listed in the Modelfile documentation>");
    FieldsStructure.Insert("keep_alive", "<how long the model will remain loaded in memory after a request>");
    FieldsStructure.Insert("tools"     , "<list of tools in JSON format (for models that support this)>");

    If Clear Then
        FieldsStructure = OPI_Tools.ClearCollectionRecursively(FieldsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FieldsStructure;

EndFunction

// Get context message structure
// Gets the message structure for a list of request messages in context
//
// Parameters:
// Role - String - Message source: system, user, assistant, tool - role
// Text - String - Message text - text
// Pictures - Array Of String - List of pictures in Base64 format (for multimodal models like llava) - images
// Tools - Array Of String - List of tools in JSON format that the model should use - tools
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetContextMessageStructure(Val Role, Val Text, Val Pictures = "", Val Tools = "") Export

    FieldsStructure = New Structure;

    OPI_Tools.AddField("role"      , Role     , "String"    , FieldsStructure);
    OPI_Tools.AddField("content"   , Text     , "String"    , FieldsStructure);
    OPI_Tools.AddField("images"    , Pictures , "Collection", FieldsStructure);
    OPI_Tools.AddField("tool_calls", Tools    , "Collection", FieldsStructure);

    Return FieldsStructure;

EndFunction

#EndRegion

#Region ModelsManagement

// Get model list
// Gets a list of local models
//
// Note:
// Method at API documentation: [List Local Models](@github.com/ollama/ollama/blob/main/docs/api.md#list-local-models)
//
// Parameters:
// URL - String - Ollama server URL - url
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetModelList(Val URL, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/tags");

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.Get(URL, , AdditionalHeaders);

    Return Response;

EndFunction

// List running models
// Gets a list of running models
//
// Note:
// Method at API documentation: [List Running Models](@github.com/ollama/ollama/blob/main/docs/api.md#list-running-models)
//
// Parameters:
// URL - String - Ollama server URL - url
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ListRunningModels(Val URL, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/ps");

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.Get(URL, , AdditionalHeaders);

    Return Response;

EndFunction

// Get model information
// Gets information about the model
//
// Note:
// Method at API documentation: [Show Model Information](@github.com/ollama/ollama/blob/main/docs/api.md#show-model-information)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Detailed - Boolean - Return full model information - verbose
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetModelInformation(Val URL, Val Model, Val Detailed = True, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/show");

    Parameters = New Structure;

    OPI_Tools.AddField("model"  , Model   , "String" , Parameters);
    OPI_Tools.AddField("verbose", Detailed, "Boolean", Parameters);

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Create model
// Creates a new model with the specified settings
//
// Note:
// Method at API documentation: [Create a Model](@github.com/ollama/ollama/blob/main/docs/api.md#create-a-model)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Settings - Structure Of KeyAndValue - Model settings. See GetModelSettingsStructure - settings
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CreateModel(Val URL, Val Model, Val Settings, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/create");

    Parameters = New Structure;

    OPI_Tools.AddField("model" , Model , "String"  , Parameters);
    OPI_Tools.AddField("stream", False , "Boolean" , Parameters);

    ProcessParameters(Parameters, Settings);
    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Copy model
// Copies an existing model
//
// Note:
// Method at API documentation: [Copy a Model](@github.com/ollama/ollama/blob/main/docs/api.md#copy-a-model)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Name of existing model - model
// Name - String - The name of the new model - name
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CopyModel(Val URL, Val Model, Val Name, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/copy");

    Parameters = New Structure;

    OPI_Tools.AddField("source"     , Model, "String", Parameters);
    OPI_Tools.AddField("destination", Name , "String", Parameters);

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders, , True);
    Response = New Structure("status_code", Response.StatusCode);

    Return Response;

EndFunction

// Delete model
// Deletes an existing model
//
// Note:
// Method at API documentation: [Delete a Model](@github.com/ollama/ollama/blob/main/docs/api.md#delete-a-model)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function DeleteModel(Val URL, Val Model, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/delete");

    Parameters = New Structure;

    OPI_Tools.AddField("model" , Model, "String", Parameters);

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.DeleteWithBody(URL, Parameters, AdditionalHeaders, , True);
    Response = New Structure("status_code", Response.StatusCode);

    Return Response;

EndFunction

// Load model to memory
// Loads the selected model into RAM
//
// Note:
// Method at API documentation: [Load a model](@github.com/ollama/ollama/blob/main/docs/api.md#load-a-model)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Period - Number - Model hold time in seconds - keep
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function LoadModelToMemory(Val URL, Val Model, Val Period = 300, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/generate");

    Parameters = New Structure;
    OPI_Tools.AddField("model"     , Model , "String" , Parameters);
    OPI_Tools.AddField("keep_alive", Period, "Number" , Parameters);

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Unload model from memory
// Unloads the selected model from memory
//
// Note:
// Method at API documentation: [Unload a model](@github.com/ollama/ollama/blob/main/docs/api.md#unload-a-model)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function UnloadModelFromMemory(Val URL, Val Model, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/generate");

    Parameters = New Structure;
    Parameters.Insert("keep_alive", 0);

    OPI_Tools.AddField("model", Model, "String", Parameters);

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Push model
// Uploads the model to the model library
//
// Note:
// Method at API documentation: [Push a Model](@github.com/ollama/ollama/blob/main/docs/api.md#push-a-model)
// The model name must follow the format <namespace>/<model>:<tag>^
// Registration on ollama.ai and adding a public key is required.
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Insecure - Boolean - Allows an unsecured connection to the library - insecure
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function PushModel(Val URL, Val Model, Val Insecure = False, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/push");

    Parameters = New Structure;

    OPI_Tools.AddField("model"   , Model   , "String" , Parameters);
    OPI_Tools.AddField("insecure", Insecure, "Boolean", Parameters);
    OPI_Tools.AddField("stream"  , False   , "Boolean", Parameters);

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Pull model
// Downloads a model from the library
//
// Note:
// Method at API documentation: [Pull a Model](@github.com/ollama/ollama/blob/main/docs/api.md#pull-a-model)
//
// Parameters:
// URL - String - Ollama server URL - url
// Model - String - Models name - model
// Insecure - Boolean - Allows an unsecured connection to the library - insecure
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function PullModel(Val URL, Val Model, Val Insecure = False, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "api/pull");

    Parameters = New Structure;

    OPI_Tools.AddField("model"   , Model   , "String" , Parameters);
    OPI_Tools.AddField("insecure", Insecure, "Boolean", Parameters);
    OPI_Tools.AddField("stream"  , False   , "Boolean", Parameters);

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Get model settings structure
// Gets the settings structure for creating a new model
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetModelSettingsStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FieldsStructure = New Structure;
    FieldsStructure.Insert("from"      , "<the name of the existing model from which the new model will be created>");
    FieldsStructure.Insert("files"     , "<list of file names or SHA256 blobs from which the model will be created>");
    FieldsStructure.Insert("adapters"  , "<list of file names or SHA256 blobs for LORA adapters>");
    FieldsStructure.Insert("template"  , "<new model prompt template>");
    FieldsStructure.Insert("license"   , "<a string or list of strings of license text for the model>");
    FieldsStructure.Insert("system"    , "<system prompt for the model>");
    FieldsStructure.Insert("parameters", "<model parameter list>");
    FieldsStructure.Insert("messages"  , "<list of context message objects>");
    FieldsStructure.Insert("quantize"  , "<quantize non-quantized (e.g. float16) model>");

    If Clear Then
        FieldsStructure = OPI_Tools.ClearCollectionRecursively(FieldsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FieldsStructure;

EndFunction

#EndRegion

#Region WorkingWithBlob

// Push BLOB
// Sends binary data to the Ollama server
//
// Note:
// Method at API documentation: [Push a Blob](@github.com/ollama/ollama/blob/main/docs/api.md#push-a-blob)
//
// Parameters:
// URL - String - Ollama server URL - url
// Data - String, BinaryData - File data or filepath - data
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function PushBlob(Val URL, Val Data, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetBinaryData(Data, True);

    CompleteURL(URL, "api/blobs/sha256:%1");

    Hash = OPI_Cryptography.Hash(Data, HashFunction.SHA256);
    Hash = Lower(GetHexStringFromBinaryData(Hash));

    URL = StrTemplate(URL, Hash);

    HeadersProcessing(AdditionalHeaders);
    Response = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Data)
        .SetHeaders(AdditionalHeaders)
        .ProcessRequest("POST")
        .ReturnResponse(False, True);

    Response = New Structure("status_code,digest", Response.StatusCode, Hash);

    Return Response;

EndFunction

// Check BLOB
// Checks the existence of a BLOB by its SHA256 digest
//
// Note:
// Method at API documentation: [Check if a Blob Exists](@github.com/ollama/ollama/blob/main/docs/api.md#check-if-a-blob-exists)
//
// Parameters:
// URL - String - Ollama server URL - url
// SHA256 - String - SHA256 BLOB digest - digest
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CheckBlob(Val URL, Val SHA256, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetLine(SHA256);

    CompleteURL(URL, "api/blobs/sha256:%1");

    URL = StrTemplate(URL, SHA256);

    HeadersProcessing(AdditionalHeaders);

    Response = OPI_HTTPRequests.Head(URL, , AdditionalHeaders, , True);
    Response = New Structure("status_code", Response.StatusCode);

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

Procedure HeadersProcessing(AdditionalHeaders)

    If Not ValueIsFilled(AdditionalHeaders) Then
        AdditionalHeaders = New Map;
    Else
        ErrorText         = "An incorrect collection of additional headers has been passed!";
        OPI_TypeConversion.GetKeyValueCollection(AdditionalHeaders, ErrorText);
    EndIf;

EndProcedure

#EndRegion

#Region Alternate

Function ПолучитьВерсию(Val URL, Val ДопЗаголовки = "") Export
	Return GetVersion(URL, ДопЗаголовки);
EndFunction

Function ПолучитьОтвет(Val URL, Val Модель, Val Вопрос, Val ДопПараметры = "", Val ДопЗаголовки = "") Export
	Return GetResponse(URL, Модель, Вопрос, ДопПараметры, ДопЗаголовки);
EndFunction

Function ПолучитьОтветВКонтексте(Val URL, Val Модель, Val Сообщения, Val ДопПараметры = "", Val ДопЗаголовки = "") Export
	Return GetContextResponse(URL, Модель, Сообщения, ДопПараметры, ДопЗаголовки);
EndFunction

Function ПолучитьПредставления(Val URL, Val Модель, Val Вопрос, Val ДопПараметры = "", Val ДопЗаголовки = "") Export
	Return GetEmbeddings(URL, Модель, Вопрос, ДопПараметры, ДопЗаголовки);
EndFunction

Function ПолучитьСтруктуруПараметровЗапроса(Val Пустая = False) Export
	Return GetRequestParameterStructure(Пустая);
EndFunction

Function ПолучитьСтруктуруПараметровПредставлений(Val Пустая = False) Export
	Return GetEmbeddingsParameterStructure(Пустая);
EndFunction

Function ПолучитьСтруктуруПараметровВКонтексте(Val Пустая = False) Export
	Return GetContextParameterStructure(Пустая);
EndFunction

Function ПолучитьСтруктуруСообщенияКонтекста(Val Роль, Val Текст, Val Картинки = "", Val Инструменты = "") Export
	Return GetContextMessageStructure(Роль, Текст, Картинки, Инструменты);
EndFunction

Function ПолучитьСписокМоделей(Val URL, Val ДопЗаголовки = "") Export
	Return GetModelList(URL, ДопЗаголовки);
EndFunction

Function ПолучитьСписокЗапущенныхМоделей(Val URL, Val ДопЗаголовки = "") Export
	Return ListRunningModels(URL, ДопЗаголовки);
EndFunction

Function ПолучитьИнформациюОМодели(Val URL, Val Модель, Val Подробно = True, Val ДопЗаголовки = "") Export
	Return GetModelInformation(URL, Модель, Подробно, ДопЗаголовки);
EndFunction

Function СоздатьМодель(Val URL, Val Модель, Val Настройки, Val ДопЗаголовки = "") Export
	Return CreateModel(URL, Модель, Настройки, ДопЗаголовки);
EndFunction

Function КопироватьМодель(Val URL, Val Модель, Val Имя, Val ДопЗаголовки = "") Export
	Return CopyModel(URL, Модель, Имя, ДопЗаголовки);
EndFunction

Function УдалитьМодель(Val URL, Val Модель, Val ДопЗаголовки = "") Export
	Return DeleteModel(URL, Модель, ДопЗаголовки);
EndFunction

Function ЗагрузитьМодельВПамять(Val URL, Val Модель, Val Период = 300, Val ДопЗаголовки = "") Export
	Return LoadModelToMemory(URL, Модель, Период, ДопЗаголовки);
EndFunction

Function ВыгрузитьМодельИзПамяти(Val URL, Val Модель, Val ДопЗаголовки = "") Export
	Return UnloadModelFromMemory(URL, Модель, ДопЗаголовки);
EndFunction

Function ОтправитьМодель(Val URL, Val Модель, Val Небезопасно = False, Val ДопЗаголовки = "") Export
	Return PushModel(URL, Модель, Небезопасно, ДопЗаголовки);
EndFunction

Function СкачатьМодель(Val URL, Val Модель, Val Небезопасно = False, Val ДопЗаголовки = "") Export
	Return PullModel(URL, Модель, Небезопасно, ДопЗаголовки);
EndFunction

Function ПолучитьСтруктуруНастроекМодели(Val Пустая = False) Export
	Return GetModelSettingsStructure(Пустая);
EndFunction

Function ОтправитьBlob(Val URL, Val Данные, Val ДопЗаголовки = "") Export
	Return PushBlob(URL, Данные, ДопЗаголовки);
EndFunction

Function ПроверитьBlob(Val URL, Val SHA256, Val ДопЗаголовки = "") Export
	Return CheckBlob(URL, SHA256, ДопЗаголовки);
EndFunction

#EndRegion