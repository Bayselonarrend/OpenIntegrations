// OneScript: ./OInt/tests/Modules/OPIt_OpenAI.os

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

// #Use oint
// #Use asserts
// #Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("OpenAI");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("OpenAI");

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

    Result = OPI_OpenAI.GetResponse(URL, Token, Model, Messages);

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetResponse"); // SKIP

    // Pictures

    Model       = "moondream2-20250414";
    File        = FunctionParameters["Picture"]; // URL, Path or Binary Data
    FileName    = StrTemplate("%1.png", String(New UUID()));
    Destination = "user_data";

    Messages = New Array;

    ImageUpload = OPI_OpenAI.UploadFile(URL, Token, FileName, File, Destination);

    OPI_TestDataRetrieval.Process(ImageUpload, "OpenAI", "GetResponse", "Image upload"); // SKIP

    ImageID = ImageUpload["id"];

    Description = OPI_OpenAI.GetImageMessageStructure("user", ImageID, "What is in this image?");

    Messages.Add(Description);

    Result = OPI_OpenAI.GetResponse(URL, Token, Model, Messages);

    OPI_OpenAI.DeleteFile(URL, Token, ImageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetResponse", "Image");

EndProcedure

Procedure OpenAI_GetEmbeddings(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Text  = "What is 1C:Enterprise?";
    Model = "arcee-ai_afm-4.5b";

    Result = OPI_OpenAI.GetEmbeddings(URL, Token, Model, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetEmbeddings");

EndProcedure

Procedure OpenAI_CreateAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Instruction = "You are a personal math tutor. When asked a question, write and run Python code to answer the question.";
    Model       = "smolvlm-256m-instruct";
    Name        = "Math tutor";

    Result = OPI_OpenAI.CreateAssistant(URL, Token, Model, Name, Instruction);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "CreateAssistant", , FunctionParameters);

EndProcedure

Procedure OpenAI_DeleteAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    AssistantID = FunctionParameters["OpenAI_Assistant"];

    Result = OPI_OpenAI.DeleteAssistant(URL, Token, AssistantID);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "DeleteAssistant", , AssistantID);

EndProcedure

Procedure OpenAI_RetrieveAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    AssistantID = FunctionParameters["OpenAI_Assistant"];

    Result = OPI_OpenAI.RetrieveAssistant(URL, Token, AssistantID);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "RetrieveAssistant");

EndProcedure

Procedure OpenAI_GetAssistantsList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Count                = 2;
    AdditionalParameters = New Structure("after,order", "asst_2", "desc");

    Result = OPI_OpenAI.GetAssistantsList(URL, Token, Count, AdditionalParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetAssistantsList");

EndProcedure

Procedure OpenAI_UploadFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    File = FunctionParameters["Picture"]; // URL, Path or Binary Data

    FileName    = StrTemplate("%1.png", String(New UUID()));
    Destination = "assistants";

    Result = OPI_OpenAI.UploadFile(URL, Token, FileName, File, Destination);

    // END

    OPI_TypeConversion.GetBinaryData(File);
    OPI_TestDataRetrieval.Process(Result, "OpenAI", "UploadFile", , FunctionParameters, FileName, File.Size() + 2);

EndProcedure

Procedure OpenAI_DeleteFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Result = OPI_OpenAI.DeleteFile(URL, Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "DeleteFile", , FileID);

EndProcedure

Procedure OpenAI_GetFileInformation(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Result = OPI_OpenAI.GetFileInformation(URL, Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetFileInformation");

EndProcedure

Procedure OpenAI_GetFilesList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Result = OPI_OpenAI.GetFilesList(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetFilesList");

EndProcedure

Procedure OpenAI_DownloadFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Result = OPI_OpenAI.DownloadFile(URL, Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "DownloadFile", , FunctionParameters);

EndProcedure

Procedure OpenAI_GetMessageStructure(FunctionParameters)

    Result = OPI_OpenAI.GetMessageStructure("user", "What is 1C:Enterprise?");

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetMessageStructure");

EndProcedure

Procedure OpenAI_GetImageMessageStructure(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];
    Image = FunctionParameters["OpenAI_File"];

    Result = OPI_OpenAI.GetImageMessageStructure("user", Image, "What is in this image?");

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetImageMessageStructure");

EndProcedure

Procedure OpenAI_GenerateSpeech(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Text  = "Attack ships on fire off the shoulder of Orion bright as magnesium";
    Model = "bark-cpp-small";

    AdditionalParameters = New Structure("response_format", "wav");

    Result = OPI_OpenAI.GenerateSpeech(URL, Token, Model, Text, , AdditionalParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GenerateSpeech", , FunctionParameters);

EndProcedure

Procedure OpenAI_CreateTranscription(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Audio = FunctionParameters["OpenAI_Speech"];
    Model = "whisper-1";

    Result = OPI_OpenAI.CreateTranscription(URL, Token, Model, Audio, "audio/wav");

    // END

    OPI_Tools.RemoveFileWithTry(Audio, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "CreateTranscription");

EndProcedure

Procedure OpenAI_GetImages(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Model       = "sd-1.5-ggml";
    Description = OPI_OpenAI.GetImageDescriptionStructure("Yellow alpaca", 1, , "64x64");
    Result      = OPI_OpenAI.GetImages(URL, Token, Model, Description);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetImages");

EndProcedure

Procedure OpenAI_GetModelList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Result = OPI_OpenAI.GetModelList(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetModelList");

EndProcedure

Procedure OpenAI_GetAssistantMessage(FunctionParameters)

    Result = OPI_OpenAI.GetAssistantMessage("What is 1C:Enterprise?");

    // END

    Check  = OPI_OpenAI.GetMessageStructure("assistant", "What is 1C:Enterprise?");
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetAssistantMessage", , Check);

EndProcedure

Procedure OpenAI_GetUserMessage(FunctionParameters)

    Result = OPI_OpenAI.GetUserMessage("What is 1C:Enterprise?", "Vitaly");

    // END

    Check  = OPI_OpenAI.GetMessageStructure("user", "What is 1C:Enterprise?", "Vitaly");
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetUserMessage", , Check);

EndProcedure

Procedure OpenAI_GetSystemMessage(FunctionParameters)

    Result = OPI_OpenAI.GetSystemMessage("What is 1C:Enterprise?");

    // END

    Check  = OPI_OpenAI.GetMessageStructure("system", "What is 1C:Enterprise?");
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    OPI_TestDataRetrieval.Process(Result, "OpenAI", "GetSystemMessage", , Check);

EndProcedure

#EndRegion // OpenAI

#EndRegion // AtomicTests

#EndRegion // Private
