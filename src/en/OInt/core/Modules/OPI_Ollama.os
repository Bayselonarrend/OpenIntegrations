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

// Get response
// Generates a response for a given text query
//
// Note
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

    Response = OPI_Tools.Post(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Get context response
// Receives the next response from the model according to the message history
//
// Note
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

    Response = OPI_Tools.Post(URL, Parameters, AdditionalHeaders);

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
    FieldsStructure.Insert("raw"       , "<true > disable formatting prompt>");
    FieldsStructure.Insert("keep_alive", "<how long the model will remain loaded in memory after a request>");
    FieldsStructure.Insert("suffix"    , "<text after the model's response>");
    FieldsStructure.Insert("images"    , "<list of images in Base64 format (for multimodal models like llava)>");

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
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetContextMessageStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FieldsStructure = New Structure;
    FieldsStructure.Insert("role"      , "<message source: system, user, assistant, tool>");
    FieldsStructure.Insert("content"   , "<message text>");
    FieldsStructure.Insert("images"    , "<list of images in Base64 format (for multimodal models like llava)>");
    FieldsStructure.Insert("tool_calls", "<list of tools in JSON format that the model should use>");

    If Clear Then
        FieldsStructure = OPI_Tools.ClearCollectionRecursively(FieldsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FieldsStructure;

EndFunction

#EndRegion

#Region ModelsManagement

// Create model
// Creates a new model with the specified settings
//
// Note
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

    Response = OPI_Tools.Post(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Delete model
// Deletes an existing model
//
// Note
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

    Response = OPI_Tools.DeleteWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Load model to memory
// Loads the selected model into RAM
//
// Note
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

    Response = OPI_Tools.Post(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Unload model from memory
// Unloads the selected model from memory
//
// Note
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

    Response = OPI_Tools.Post(URL, Parameters, AdditionalHeaders);

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
