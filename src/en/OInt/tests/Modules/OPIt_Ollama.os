// OneScript: ./OInt/tests/Modules/OPIt_Ollama.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Test suite for YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

#Use oint
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("Ollama");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Ollama");

EndFunction

#Region Internal

#Region RunnableTests

#Region Ollama

Procedure OLLM_RequestsProcessing() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_URL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_Token", TestParameters);

    Ollama_PullModel(TestParameters);
    Ollama_GetVersion(TestParameters);
    Ollama_GetResponse(TestParameters);
    Ollama_GetContextResponse(TestParameters);
    Ollama_GetEmbeddings(TestParameters);
    Ollama_GetRequestParameterStructure(TestParameters);
    Ollama_GetContextParameterStructure(TestParameters);
    Ollama_GetContextMessageStructure(TestParameters);
    Ollama_GetEmbeddingsParameterStructure(TestParameters);

EndProcedure

Procedure OLLM_ModelsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_URL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_Token", TestParameters);

    Ollama_PullModel(TestParameters);
    Ollama_LoadModelToMemory(TestParameters);
    Ollama_UnloadModelFromMemory(TestParameters);
    Ollama_CreateModel(TestParameters);
    Ollama_GetModelInformation(TestParameters);
    Ollama_GetModelList(TestParameters);
    Ollama_ListRunningModels(TestParameters);
    Ollama_CopyModel(TestParameters);
    Ollama_PushModel(TestParameters);
    Ollama_GetModelSettingsStructure(TestParameters);
    Ollama_DeleteModel(TestParameters);

EndProcedure

Procedure OLLM_WorkingWithBlob() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_URL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);

    Ollama_PushBlob(TestParameters);
    Ollama_CheckBlob(TestParameters);

EndProcedure

#EndRegion // Ollama

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Ollama

Procedure Ollama_GetResponse(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Prompt = "What is 1C:Enterprise?";
    Model  = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.GetResponse(URL, Model, Prompt, , AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetResponse"); // SKIP

    // With paramether

    Prompt = "Ollama is 22 years old and is busy saving the world. Respond using JSON";

    Format = OPI_Tools.JSONToStructure("
    |{
    |""type"": ""object"",
    |""properties"": {
    |  ""age"": {
    |    ""type"": ""integer""
    |  },
    |  ""available"": {
    |    ""type"": ""boolean""
    |  }
    |},
    |""required"": [
    |  ""age"",
    |  ""available""
    |]
    |}");

    AdditionalParameters = New Structure("format", Format);

    Result = OPI_Ollama.GetResponse(URL, Model, Prompt, AdditionalParameters, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetResponse", "Parameters");

EndProcedure

Procedure Ollama_GetContextResponse(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Model = "tinyllama";

    MessagesArray = New Array;

    Question1 = OPI_Ollama.GetContextMessageStructure("user", "What is 1C:Enterprise?");
    Question2 = OPI_Ollama.GetContextMessageStructure("user", "When the first version was released?"); // Question without specifics

    // Adding the first question to the context
    MessagesArray.Add(Question1);

    Response1 = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, , AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Response1, "Ollama", "GetContextResponse", "Preliminary"); // SKIP

    MessagesArray.Add(Response1["message"]); // Add response to first question in context
    MessagesArray.Add(Question2); // Add second question in context

    Response2 = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, , AdditionalHeaders);

    MessagesArray.Add(Response2["message"]);

    // ...

    // END

    OPI_TestDataRetrieval.Process(Response2, "Ollama", "GetContextResponse");

    MessagesArray = New Array;

    Question = New Structure("role,content", "user", "Hello!");
    MessagesArray.Add(Question);

    Options              = New Structure("seed,temperature", 101, 0);
    AdditionalParameters = New Structure("options", Options);

    Result = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, AdditionalParameters, AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextResponse", "Seed 1");

    Message1 = Result["message"]["content"];

    Result = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, AdditionalParameters, AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextResponse", "Seed 2");

    Message2 = Result["message"]["content"];

    Options              = New Structure("seed,temperature", 555, 10);
    AdditionalParameters = New Structure("options", Options);

    Result = OPI_Ollama.GetContextResponse(URL, Model, MessagesArray, AdditionalParameters, AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextResponse", "Seed 3");

    Message3 = Result["message"]["content"];

    OPI_TestDataRetrieval.Process(Message3, "Ollama", "GetContextResponse", "Comparison", Message1, Message2, Message3);

EndProcedure

Procedure Ollama_LoadModelToMemory(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model  = "tinyllama";
    Period = 500;

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.LoadModelToMemory(URL, Model, Period, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "LoadModelToMemory");

EndProcedure

Procedure Ollama_UnloadModelFromMemory(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.UnloadModelFromMemory(URL, Model, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "UnloadModelFromMemory");

EndProcedure

Procedure Ollama_GetRequestParameterStructure(FunctionParameters)

    Result = OPI_Ollama.GetRequestParameterStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetRequestParameterStructure");

    Result = OPI_Ollama.GetRequestParameterStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetRequestParameterStructure", "Clear");

EndProcedure

Procedure Ollama_GetContextParameterStructure(FunctionParameters)

    Result = OPI_Ollama.GetContextParameterStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextParameterStructure");

    Result = OPI_Ollama.GetContextParameterStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextParameterStructure", "Clear");

EndProcedure

Procedure Ollama_GetContextMessageStructure(FunctionParameters)

    Result = OPI_Ollama.GetContextMessageStructure("user", "Hello!");

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextMessageStructure");

EndProcedure

Procedure Ollama_GetModelSettingsStructure(FunctionParameters)

    Result = OPI_Ollama.GetModelSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetModelSettingsStructure");

    Result = OPI_Ollama.GetModelSettingsStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetModelSettingsStructure", "Clear");

EndProcedure

Procedure Ollama_CreateModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Settings = New Structure("from,system", "tinyllama", "You are Mario from Super Mario Bros.");

    Result = OPI_Ollama.CreateModel(URL, Model, Settings, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CreateModel");

    Result = OPI_Ollama.GetResponse(URL, Model, "How are you?", , AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CreateModel", "Request");

EndProcedure

Procedure Ollama_DeleteModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.DeleteModel(URL, Model, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "DeleteModel");

    Result = OPI_Ollama.DeleteModel(URL, "library/tinyllama:latest", AdditionalHeaders);
    OPI_TestDataRetrieval.Process(Result, "Ollama", "DeleteModel", "Tiny");

    Result = OPI_Ollama.DeleteModel(URL, "bayselonarrend/tinyllama:latest", AdditionalHeaders);
    OPI_TestDataRetrieval.Process(Result, "Ollama", "DeleteModel", "Tiny, account");

    Result = OPI_Ollama.GetModelList(URL, AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "DeleteModel", "List");

EndProcedure

Procedure Ollama_GetModelList(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.GetModelList(URL, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetModelList");

EndProcedure

Procedure Ollama_ListRunningModels(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.ListRunningModels(URL, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "ListRunningModels");

EndProcedure

Procedure Ollama_GetModelInformation(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.GetModelInformation(URL, Model, False, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetModelInformation");

EndProcedure

Procedure Ollama_CopyModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";
    Name  = "mario2";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.CopyModel(URL, Model, Name, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CopyModel");

    OPI_Ollama.DeleteModel(URL, Name, AdditionalHeaders);

EndProcedure

Procedure Ollama_GetVersion(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.GetVersion(URL, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetVersion");

EndProcedure

Procedure Ollama_GetEmbeddings(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    StingsArray = New Array;
    StingsArray.Add("Why is the sky blue?");
    StingsArray.Add("Why is the grass green?");

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.GetEmbeddings(URL, Model, StingsArray, , AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetEmbeddings");

EndProcedure

Procedure Ollama_GetEmbeddingsParameterStructure(FunctionParameters)

    Result = OPI_Ollama.GetEmbeddingsParameterStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetEmbeddingsParameterStructure");

    Result = OPI_Ollama.GetEmbeddingsParameterStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetEmbeddingsParameterStructure", "Clear");

EndProcedure

Procedure Ollama_PushModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "bayselonarrend/tinyllama:latest";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.PushModel(URL, Model, , AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "PushModel");

EndProcedure

Procedure Ollama_PullModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.PullModel(URL, Model, , AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "PullModel");

    Result = OPI_Ollama.PullModel(URL, "bayselonarrend/tinyllama:latest", , AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "PullModel", "Account");

EndProcedure

Procedure Ollama_PushBlob(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    OPI_TypeConversion.GetBinaryData(Image, True); // SKIP
    Random = GetBinaryDataFromString(String(New UUID)); // SKIP
    Image  = OPI_Tools.MergeData(Image, Random); // SKIP

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.PushBlob(URL, Image, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "PushBlob", , FunctionParameters);

EndProcedure

Procedure Ollama_CheckBlob(FunctionParameters)

    URL    = FunctionParameters["Ollama_URL"];
    Token  = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama
    SHA256 = FunctionParameters["Ollama_Blob"];

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Result = OPI_Ollama.CheckBlob(URL, SHA256, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CheckBlob");

    Result = OPI_Ollama.CheckBlob(URL, "yoyoyo", AdditionalHeaders);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CheckBlob", "Error");

EndProcedure

#EndRegion // Ollama

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure OLLM_ОбработкаЗапросов() Export
    OLLM_RequestsProcessing();
EndProcedure

Procedure OLLM_РаботаСМоделями() Export
    OLLM_ModelsManagement();
EndProcedure

Procedure OLLM_РаботаСBlob() Export
    OLLM_WorkingWithBlob();
EndProcedure

#EndRegion