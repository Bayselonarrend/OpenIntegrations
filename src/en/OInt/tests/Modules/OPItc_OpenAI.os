// OneScript: ./OInt/tests/Modules/OPItc_OpenAI.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("OpenAI");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("OpenAI");

EndFunction

#Region Internal

#Region RunnableTests

#Region OpenAI

Procedure OAI_RequestsProcessing() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token2" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL2"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_File"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"       , TestParameters);

    OpenAI_GetResponse(TestParameters);
    OpenAI_GetEmbeddings(TestParameters);
    OpenAI_GetMessageStructure(TestParameters);
    OpenAI_GetImageMessageStructure(TestParameters);
    OpenAI_GetImages(TestParameters);
    OpenAI_GetAssistantMessage(TestParameters);
    OpenAI_GetUserMessage(TestParameters);
    OpenAI_GetSystemMessage(TestParameters);

EndProcedure

Procedure OAI_Assistants() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"   , TestParameters);

    OpenAI_CreateAssistant(TestParameters);
    OpenAI_RetrieveAssistant(TestParameters);
    OpenAI_GetAssistantsList(TestParameters);
    OpenAI_DeleteAssistant(TestParameters);

EndProcedure

Procedure OAI_FileManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);

    OpenAI_UploadFile(TestParameters);
    OpenAI_GetFileInformation(TestParameters);
    OpenAI_GetFilesList(TestParameters);
    OpenAI_DownloadFile(TestParameters);
    OpenAI_DeleteFile(TestParameters);

EndProcedure

Procedure OAI_AudioProcessing() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"   , TestParameters);

    OpenAI_GenerateSpeech(TestParameters);
    OpenAI_CreateTranscription(TestParameters);

EndProcedure

Procedure OAI_ModelsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"   , TestParameters);

    OpenAI_GetModelList(TestParameters);

EndProcedure

#EndRegion // OpenAI

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region OpenAI

Procedure OpenAI_GetResponse(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    // Text messages

    Messages = New Array;
    Messages.Add(OPI_OpenAI.GetMessageStructure("user"     , "What is 1C:Enterprise?"));
    Messages.Add(OPI_OpenAI.GetMessageStructure("assistant", "1C:Enterprise is a full-stack, low-code platform"));
    Messages.Add(OPI_OpenAI.GetMessageStructure("user"     , "When the first version was released?"));

    Model = "smolvlm-256m-instruct";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("msgs", Messages);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetResponse", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetResponse"); // SKIP

    // Pictures

    Model       = "moondream2-20250414";
    File        = FunctionParameters["Picture"]; // URL, Path or Binary Data
    FileName    = StrTemplate("%1.png", String(New UUID()));
    Destination = "user_data";

    Messages = New Array;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("name", FileName);
    Options.Insert("data", File);
    Options.Insert("purpose", Destination);

    ImageUpload = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "UploadFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(ImageUpload, "OpenAI", "GetResponse", "Image upload"); // SKIP

    ImageID = ImageUpload["id"];

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("file", ImageID);
    Options.Insert("prompt", "What is in this image?");

    Description = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetImageMessageStructure", Options);

    Messages.Add(Description);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("msgs", Messages);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetResponse", Options);

    OPI_OpenAI.DeleteFile(URL, Token, ImageID);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetResponse", "Image");

EndProcedure

Procedure OpenAI_GetEmbeddings(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Text  = "What is 1C:Enterprise?";
    Model = "arcee-ai_afm-4.5b";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("input", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetEmbeddings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetEmbeddings");

EndProcedure

Procedure OpenAI_CreateAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Instruction = "You are a personal math tutor. When asked a question, write and run Python code to answer the question.";
    Model       = "smolvlm-256m-instruct";
    Name        = "Math tutor";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("name", Name);
    Options.Insert("inst", Instruction);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "CreateAssistant", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "CreateAssistant", , FunctionParameters);

EndProcedure

Procedure OpenAI_DeleteAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    AssistantID = FunctionParameters["OpenAI_Assistant"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", AssistantID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "DeleteAssistant", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "DeleteAssistant", , AssistantID);

EndProcedure

Procedure OpenAI_RetrieveAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    AssistantID = FunctionParameters["OpenAI_Assistant"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", AssistantID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "RetrieveAssistant", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "RetrieveAssistant");

EndProcedure

Procedure OpenAI_GetAssistantsList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Count                = 2;
    AdditionalParameters = New Structure("after,order", "asst_2", "desc");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("limit", Count);
    Options.Insert("options", AdditionalParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetAssistantsList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetAssistantsList");

EndProcedure

Procedure OpenAI_UploadFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    File = FunctionParameters["Picture"]; // URL, Path or Binary Data

    FileName    = StrTemplate("%1.png", String(New UUID()));
    Destination = "assistants";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("name", FileName);
    Options.Insert("data", File);
    Options.Insert("purpose", Destination);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "UploadFile", Options);

    // END

    OPI_TypeConversion.GetBinaryData(File);
    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "UploadFile", , FunctionParameters, FileName, File.Size() + 2);

EndProcedure

Procedure OpenAI_DeleteFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "DeleteFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "DeleteFile", , FileID);

EndProcedure

Procedure OpenAI_GetFileInformation(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetFileInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetFileInformation");

EndProcedure

Procedure OpenAI_GetFilesList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetFilesList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetFilesList");

EndProcedure

Procedure OpenAI_DownloadFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "DownloadFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "DownloadFile", , FunctionParameters);

EndProcedure

Procedure OpenAI_GetMessageStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("text", "What is 1C:Enterprise?");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetMessageStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetMessageStructure");

EndProcedure

Procedure OpenAI_GetImageMessageStructure(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];
    Image = FunctionParameters["OpenAI_File"];

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("file", Image);
    Options.Insert("prompt", "What is in this image?");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetImageMessageStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetImageMessageStructure");

EndProcedure

Procedure OpenAI_GenerateSpeech(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Text  = "Attack ships on fire off the shoulder of Orion bright as magnesium";
    Model = "bark-cpp-small";

    AdditionalParameters = New Structure("response_format", "wav");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("input", Text);
    Options.Insert("options", AdditionalParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GenerateSpeech", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GenerateSpeech", , FunctionParameters);

EndProcedure

Procedure OpenAI_CreateTranscription(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Audio = FunctionParameters["OpenAI_Speech"];
    Model = "whisper-1";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("audio", Audio);
    Options.Insert("type", "audio/wav");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "CreateTranscription", Options);

    // END

    OPI_Tools.RemoveFileWithTry(Audio, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "CreateTranscription");

EndProcedure

Procedure OpenAI_GetImages(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Model       = "sd-1.5-ggml";
    Options = New Structure;
    Options.Insert("prompt", "Yellow alpaca");
    Options.Insert("amount", 1);
    Options.Insert("size", "64x64");

    Description = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetImageDescriptionStructure", Options);
    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("descr", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetImages", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetImages");

EndProcedure

Procedure OpenAI_GetModelList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetModelList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetModelList");

EndProcedure

Procedure OpenAI_GetAssistantMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("text", "What is 1C:Enterprise?");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetAssistantMessage", Options);

    // END

    Options = New Structure;
    Options.Insert("role", "assistant");
    Options.Insert("text", "What is 1C:Enterprise?");

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetMessageStructure", Options);
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetAssistantMessage", , Check);

EndProcedure

Procedure OpenAI_GetUserMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("text", "What is 1C:Enterprise?");
    Options.Insert("name", "Vitaly");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetUserMessage", Options);

    // END

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("text", "What is 1C:Enterprise?");
    Options.Insert("name", "Vitaly");

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetMessageStructure", Options);
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetUserMessage", , Check);

EndProcedure

Procedure OpenAI_GetSystemMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("text", "What is 1C:Enterprise?");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetSystemMessage", Options);

    // END

    Options = New Structure;
    Options.Insert("role", "system");
    Options.Insert("text", "What is 1C:Enterprise?");

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetMessageStructure", Options);
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    OPI_TestDataRetrieval.ProcessCLI(Result, "OpenAI", "GetSystemMessage", , Check);

EndProcedure

#EndRegion // OpenAI

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure OAI_ОбработкаЗапросов() Export
    OAI_RequestsProcessing();
EndProcedure

Procedure OAI_Ассистенты() Export
    OAI_Assistants();
EndProcedure

Procedure OAI_РаботаСФайлами() Export
    OAI_FileManagement();
EndProcedure

Procedure OAI_РаботаСАудио() Export
    OAI_AudioProcessing();
EndProcedure

Procedure OAI_РаботаСМоделями() Export
    OAI_ModelsManagement();
EndProcedure

#EndRegion
