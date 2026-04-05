// OneScript: ./OInt/tests/Modules/OPItc_Ollama.os

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

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("Ollama");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Ollama");

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

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("prompt", Prompt);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetResponse", Options);

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

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("prompt", Prompt);
    Options.Insert("options", AdditionalParameters);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetResponse", Options);

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

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("text", "What is 1C:Enterprise?");

    Question1 = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextMessageStructure", Options);
    Question2 = OPI_Ollama.GetContextMessageStructure("user", "When the first version was released?"); // Question without specifics

    // Adding the first question to the context
    MessagesArray.Add(Question1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("headers", AdditionalHeaders);

    Response1 = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    OPI_TestDataRetrieval.Process(Response1, "Ollama", "GetContextResponse", "Preliminary"); // SKIP

    MessagesArray.Add(Response1["message"]); // Add response to first question in context
    MessagesArray.Add(Question2); // Add second question in context

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("headers", AdditionalHeaders);

    Response2 = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    MessagesArray.Add(Response2["message"]);

    // ...

    // END

    OPI_TestDataRetrieval.Process(Response2, "Ollama", "GetContextResponse");

    MessagesArray = New Array;

    Question = New Structure("role,content", "user", "Hello!");
    MessagesArray.Add(Question);

    Options              = New Structure("seed,temperature", 101, 0);
    AdditionalParameters = New Structure("options", Options);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("options", AdditionalParameters);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextResponse", "Seed 1");

    Message1 = Result["message"]["content"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("options", AdditionalParameters);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextResponse", "Seed 2");

    Message2 = Result["message"]["content"];

    Options              = New Structure("seed,temperature", 555, 10);
    AdditionalParameters = New Structure("options", Options);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("options", AdditionalParameters);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

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

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("keep", Period);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "LoadModelToMemory", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "LoadModelToMemory");

EndProcedure

Procedure Ollama_UnloadModelFromMemory(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "UnloadModelFromMemory", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "UnloadModelFromMemory");

EndProcedure

Procedure Ollama_GetRequestParameterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetRequestParameterStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetRequestParameterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetRequestParameterStructure", Options);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetRequestParameterStructure", "Clear");

EndProcedure

Procedure Ollama_GetContextParameterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextParameterStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextParameterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextParameterStructure", Options);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextParameterStructure", "Clear");

EndProcedure

Procedure Ollama_GetContextMessageStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("text", "Hello!");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextMessageStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetContextMessageStructure");

EndProcedure

Procedure Ollama_GetModelSettingsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetModelSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelSettingsStructure", Options);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetModelSettingsStructure", "Clear");

EndProcedure

Procedure Ollama_CreateModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Settings = New Structure("from,system", "tinyllama", "You are Mario from Super Mario Bros.");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("settings", Settings);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "CreateModel", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CreateModel");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("prompt", "How are you?");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetResponse", Options);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CreateModel", "Request");

EndProcedure

Procedure Ollama_DeleteModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "DeleteModel", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "DeleteModel");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", "library/tinyllama:latest");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "DeleteModel", Options);
    OPI_TestDataRetrieval.Process(Result, "Ollama", "DeleteModel", "Tiny");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", "bayselonarrend/tinyllama:latest");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "DeleteModel", Options);
    OPI_TestDataRetrieval.Process(Result, "Ollama", "DeleteModel", "Tiny, account");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelList", Options);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "DeleteModel", "List");

EndProcedure

Procedure Ollama_GetModelList(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelList", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetModelList");

EndProcedure

Procedure Ollama_ListRunningModels(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "ListRunningModels", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "ListRunningModels");

EndProcedure

Procedure Ollama_GetModelInformation(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("verbose", Ложь);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelInformation", Options);

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

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("name", Name);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "CopyModel", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CopyModel");

    OPI_Ollama.DeleteModel(URL, Name, AdditionalHeaders);

EndProcedure

Procedure Ollama_GetVersion(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetVersion", Options);

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

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("input", StingsArray);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetEmbeddings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetEmbeddings");

EndProcedure

Procedure Ollama_GetEmbeddingsParameterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetEmbeddingsParameterStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetEmbeddingsParameterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetEmbeddingsParameterStructure", Options);

    OPI_TestDataRetrieval.Process(Result, "Ollama", "GetEmbeddingsParameterStructure", "Clear");

EndProcedure

Procedure Ollama_PushModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "bayselonarrend/tinyllama:latest";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "PushModel", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "PushModel");

EndProcedure

Procedure Ollama_PullModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "PullModel", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "PullModel");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", "bayselonarrend/tinyllama:latest");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "PullModel", Options);

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

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("data", Image);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "PushBlob", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "PushBlob", , FunctionParameters);

EndProcedure

Procedure Ollama_CheckBlob(FunctionParameters)

    URL    = FunctionParameters["Ollama_URL"];
    Token  = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama
    SHA256 = FunctionParameters["Ollama_Blob"];

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("digest", SHA256);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "CheckBlob", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Ollama", "CheckBlob");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("digest", "yoyoyo");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "CheckBlob", Options);

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
