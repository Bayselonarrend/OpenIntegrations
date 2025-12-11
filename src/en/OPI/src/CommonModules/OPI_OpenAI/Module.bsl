// OneScript: ./OInt/core/Modules/OPI_OpenAI.os
// Lib: OpenAI
// CLI: openai
// Keywords: openai, localai, ai llm

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

// Get response
// Generates a response for a given text query
//
// Note:
// Method at API documentation: [Create chat completion](@platform.openai.com/docs/api-reference/chat/create)
//
// Parameters:
// URL - String - OpenAI server URL - url
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

    Return ConvertKeysToLowerCase(Response);

EndFunction

// Get images
// Generates images based on the specified description
//
// Note:
// Method at API documentation: [Create image](@platform.openai.com/docs/api-reference/images/create)
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// Model - String - Models name - model
// Description - Structure Of KeyAndValue - Generation parameters. See GetImageDescriptionStructure - descr
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetImages(Val URL, Val Token, Val Model, Val Description, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetKeyValueCollection(Description);

    CompleteURL(URL, "v1/images/generations");

    Parameters = New Structure;
    OPI_Tools.AddField("model", Model, "String", Parameters);

    For Each Field In Description Do
        Parameters.Insert(Field.Key, Field.Value);
    EndDo;

    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return ConvertKeysToLowerCase(Response);

EndFunction

// Get embeddings
// Gets the embeddings for the given entries
//
// Note:
// Method at API documentation: [Create embeddings](@platform.openai.com/docs/api-reference/embeddings/create)
//
// Parameters:
// URL - String - OpenAI server URL - url
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

    Return ConvertKeysToLowerCase(Response);

EndFunction

// Get message structure
// Gets the structure of an arbitrary message for the request message list
//
// Parameters:
// Role - String - Source of the message: system, user, assistant, etc.. - role
// Text - String - Message text - text
// Name - String - Name of participant in conversation - name
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetMessageStructure(Val Role, Val Text, Val Name = "") Export

    String_         = "String";
    FieldsStructure = New Structure;

    OPI_Tools.AddField("role"   , Role , String_, FieldsStructure);
    OPI_Tools.AddField("content", Text , String_, FieldsStructure);
    OPI_Tools.AddField("name"   , Name , String_, FieldsStructure);

    Return FieldsStructure;

EndFunction

// Get user message
// Gets the structure of a message from the user for use in a request
//
// Note:
// Is a shorthand for the function `GetMessageStructure`
//
// Parameters:
// Text - String - Message text - text
// Name - String - Name of participant in conversation - name
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetUserMessage(Val Text, Val Name = "") Export
    Return GetMessageStructure("user", Text, Name);
EndFunction

// Get assistant message
// Gets the structure of a message from the assistant for use in a request
//
// Note:
// Is a shorthand for the function `GetMessageStructure`
//
// Parameters:
// Text - String - Message text - text
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetAssistantMessage(Val Text) Export
    Return GetMessageStructure("assistant", Text);
EndFunction

// Get system message
// Gets the structure of a system message for use in a request
//
// Note:
// Is a shorthand for the function `GetMessageStructure`
//
// Parameters:
// Text - String - Message text - text
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetSystemMessage(Val Text) Export
    Return GetMessageStructure("system", Text);
EndFunction

// Get image message structure
// Gets the message structure based on the image for the request message list
//
// Parameters:
// Role - String - Message source: system, user, developer - role
// FileID - String - Image file ID. See UploadFile - file
// Text - String - Input text query for image processing - prompt
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetImageMessageStructure(Val Role, Val FileID, Val Text = "") Export

    OPI_TypeConversion.GetLine(FileID);
    OPI_TypeConversion.GetLine(Text);

    FieldsStructure = New Structure;
    ContentArray    = New Array;

    ContentArray.Add(New Structure("type,file_id", "input_image", FileID));

    If ValueIsFilled(Text) Then
        ContentArray.Add(New Structure("type,text", "input_text", Text));
    EndIf;

    OPI_Tools.AddField("role"   , Role        , "String", FieldsStructure);
    OPI_Tools.AddField("content", ContentArray, "Array" , FieldsStructure);

    Return FieldsStructure;

EndFunction

// Get image description structure
// Get image description structure for generation
//
// Note:
// The set of fields and their interpretation may vary depending on the model used
//
// Parameters:
// Prompt - String - Text description of the image for generation - prompt
// Count - Number - Number of images to generate - amount
// Background - String - Generation background option: transparent, opaque, auto - bg
// Size - String - Size option for generated images - size
// AdditionalParameters - Structure Of KeyAndValue - Additional request parameters, if necessary - options
//
// Returns:
// Structure - Fields structure
Function GetImageDescriptionStructure(Val Prompt
    , Val Count
    , Val Background = ""
    , Val Size = ""
    , Val AdditionalParameters = "") Export

    String_     = "String";
    Description = New Structure;

    OPI_Tools.AddField("prompt"    , Prompt     , String_ , Description);
    OPI_Tools.AddField("n"         , Count      , "Number", Description);
    OPI_Tools.AddField("background", Background , String_ , Description);
    OPI_Tools.AddField("size"      , Size       , String_ , Description);

    ProcessParameters(Description, AdditionalParameters);

    Return Description;

EndFunction

#EndRegion

#Region Assistants

// Get assistants list
// Retrieves a list of assistants with or without filtering
//
// Note:
// Method at API documentation: [List assistants](@platform.openai.com/docs/api-reference/assistants/listAssistants)
//
// Parameters:
// URL - String - OpenAI server URL - url
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

    If TypeOf(Response) = Type("Array") Then
        Response        = New Structure("object,data", "list", Response);
    EndIf;

    Return ConvertKeysToLowerCase(Response);

EndFunction

// Create assistant
// Creates an assistant based on the model and instruction
//
// Note:
// Method at API documentation: [Create assistant](@platform.openai.com/docs/api-reference/assistants/createAssistant)
//
// Parameters:
// URL - String - OpenAI server URL - url
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

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("model"       , Model       , String_, Parameters);
    OPI_Tools.AddField("name"        , Name        , String_, Parameters);
    OPI_Tools.AddField("instructions", Instruction , String_, Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return ConvertKeysToLowerCase(Response);

EndFunction

// Retrieve assistant
// Retrieves information about an assistant by ID
//
// Note:
// Method at API documentation: [Retrieve assistant](@platform.openai.com/docs/api-reference/assistants/getAssistant)
//
// Parameters:
// URL - String - OpenAI server URL - url
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

    Return ConvertKeysToLowerCase(Response);

EndFunction

// Delete assistant
// Deletes a previously created assistant
//
// Note:
// Method at API documentation: [Delete assistant](@platform.openai.com/docs/api-reference/assistants/deleteAssistant)
//
// Parameters:
// URL - String - OpenAI server URL - url
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

    Return ConvertKeysToLowerCase(Response);

EndFunction

#EndRegion

#Region FileManagement

// Get list of files
// Get a list of files with or without filtering
//
// Note:
// Method at API documentation: [List files](@platform.openai.com/docs/api-reference/files/list)
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// Count - Number - Maximum number of assistants returned - limit
// AdditionalParameters - Structure Of KeyAndValue - Additional request parameters, if necessary - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetFilesList(Val URL
    , Val Token
    , Val Count = 10000
    , Val AdditionalParameters = ""
    , Val AdditionalHeaders = "") Export

    CompleteURL(URL, "v1/files");

    Parameters = New Structure;

    OPI_Tools.AddField("limit", Count, "Number", Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.Get(URL, Parameters, AdditionalHeaders);

    If TypeOf(Response) = Type("Array") Then
        Response        = New Structure("object,data", "list", Response);
    EndIf;

    Return ConvertKeysToLowerCase(Response);

EndFunction

// Upload file
// Uploads a file for further use in other requests
//
// Note:
// Method at API documentation: [Upload file](@platform.openai.com/docs/api-reference/files/create)
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// FileName - String - File name with extension - name
// Data - String, BinaryData - Path to file or data - data
// Destination - String - File purpose: assistants, batch, vision, user_data, evals - purpose
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function UploadFile(Val URL, Val Token, Val FileName, Val Data, Val Destination, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "v1/files");
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddMultipartFormDataFile("file", FileName, Data)
        .AddMultipartFormDataField("purpose", Destination)
        .SetHeaders(AdditionalHeaders)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

     Return ConvertKeysToLowerCase(Response);

EndFunction

// Get information about file
// Gets information about the file
//
// Note:
// Method at API documentation: [Retrieve file](@platform.openai.com/docs/api-reference/files/retrieve)
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// FileID - String - File ID - id
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetFileInformation(Val URL, Val Token, Val FileID, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetLine(FileID);

    CompleteURL(URL, StrTemplate("v1/files/%1", FileID));
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.Get(URL, , AdditionalHeaders);

    Return ConvertKeysToLowerCase(Response);

EndFunction

// Download file
// Get file data from the server
//
// Note:
// Method at API documentation: [Retrieve file content](@platform.openai.com/docs/api-reference/files/retrieve-contents)
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// FileID - String - File ID - id
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// BinaryData - File data
Function DownloadFile(Val URL, Val Token, Val FileID, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetLine(FileID);

    CompleteURL(URL, StrTemplate("v1/files/%1/content", FileID));
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.Get(URL, , AdditionalHeaders);

    Return Response;

EndFunction

// Delete file
// Deletes a previously uploaded file
//
// Note:
// Method at API documentation: [Delete file](@platform.openai.com/docs/api-reference/files/delete)
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// FileID - String - File ID - id
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function DeleteFile(Val URL, Val Token, Val FileID, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetLine(FileID);

    CompleteURL(URL, StrTemplate("v1/files/%1", FileID));
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.Delete(URL, , AdditionalHeaders);

    Return ConvertKeysToLowerCase(Response);

EndFunction

#EndRegion

#Region AudioProcessing

// Generate speech
// Generates audio with the specified text for speech synthesis
//
// Note:
// Method at API documentation: [Create speech](@platform.openai.com/docs/api-reference/audio/createSpeech)
// Available voices may vary depending on the selected model
// The audio file format of the response can be changed by adding `response_format` in additional parameters.^^
// Available formats: mp3 (default), opus, aac, flac, wav, pcm
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// Model - String - Models name - model
// Text - String - Text for speech synthesis - input
// Voice - String - Voice type: alloy, ash, ballad, coral, echo, etc.. - voice
// AdditionalParameters - Structure Of KeyAndValue - Additional request parameters, if necessary - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// BinaryData - Processing result
Function GenerateSpeech(Val URL
    , Val Token
    , Val Model
    , Val Text
    , Val Voice = "alloy"
    , Val AdditionalParameters = ""
    , Val AdditionalHeaders = "") Export

    CompleteURL(URL, "v1/audio/speech");

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("model", Model , String_, Parameters);
    OPI_Tools.AddField("input", Text  , String_, Parameters);
    OPI_Tools.AddField("voice", Voice , String_, Parameters);

    ProcessParameters(Parameters, AdditionalParameters);
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, AdditionalHeaders);

    Return Response;

EndFunction

// Create transcription
// Creates a text transcription for the selected audio file
//
// Note:
// Method at API documentation: [Create transcription](@platform.openai.com/docs/api-reference/audio/createTranscription)
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// Model - String - Models name - model
// Audio - String, BinaryData - Audio file - audio
// MIME - String - MIME type of audio file - type
// AdditionalParameters - Structure Of KeyAndValue - Additional request parameters, if necessary - options
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CreateTranscription(Val URL
    , Val Token
    , Val Model
    , Val Audio
    , Val MIME = "audio/mpeg"
    , Val AdditionalParameters = ""
    , Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetLine(MIME);

    CompleteURL(URL, "v1/audio/transcriptions");
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddMultipartFormDataFile("file", "audio.bin", Audio, MIME)
        .AddMultipartFormDataField("model", Model)
        .SetHeaders(AdditionalHeaders)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    Return ConvertKeysToLowerCase(Response);

EndFunction

#EndRegion

#Region ModelsManagement

// Get model list
// Receives a list of available models
//
// Note:
// Method at API documentation: [List models](@platform.openai.com/docs/api-reference/models/list)
//
// Parameters:
// URL - String - OpenAI server URL - url
// Token - String - OpenAI authorization token - token
// AdditionalHeaders - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetModelList(Val URL, Val Token, Val AdditionalHeaders = "") Export

    CompleteURL(URL, "v1/models");
    HeadersProcessing(AdditionalHeaders, Token);

    Response = OPI_HTTPRequests.Get(URL, , AdditionalHeaders);

    Return ConvertKeysToLowerCase(Response);

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

Function ConvertKeysToLowerCase(Val Collection)

    Try
        Collection_ = New(TypeOf(Collection));

        For Each KeyValue In Collection Do
            Collection_.Insert(Lower(KeyValue.Key), KeyValue.Value);
        EndDo;

        Return Collection_;

    Except
        Return Collection;
    EndTry;

EndFunction

#EndRegion
