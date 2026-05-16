// OneScript: ./OInt/tests/Modules/OPItc_Notion.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("Notion");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Notion");

EndFunction

#Region Internal

#Region RunnableTests

#Region Notion

Procedure NotionAPI_CreatePage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"     , TestParameters);

    Notion_CreatePage(TestParameters);
    Notion_GetPage(TestParameters);
    Notion_EditPageProperties(TestParameters);

EndProcedure

Procedure NotionAPI_CreateUpdateBase() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);

    Notion_CreateDatabase(TestParameters);
    Notion_EditDatabaseProperties(TestParameters);
    Notion_GetDatabase(TestParameters);
    Notion_CreatePageInDatabase(TestParameters);

EndProcedure

Procedure NotionAPI_CreateDeleteBlock() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Block" , TestParameters);

    Notion_ReturnBlock(TestParameters);
    Notion_CreateBlock(TestParameters);
    Notion_ReturnChildBlocks(TestParameters);
    Notion_DeleteBlock(TestParameters);

EndProcedure

Procedure NotionAPI_GetUsers() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_User" , TestParameters);

    Notion_UserList(TestParameters);
    Notion_GetUserData(TestParameters);

EndProcedure

#EndRegion // Notion

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Notion

Procedure Notion_CreatePage(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Title  = "TestTitle";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Parent);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreatePage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "CreatePage", , FunctionParameters);

EndProcedure

Procedure Notion_CreateDatabase(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Title  = "TestTitle";

    Properties = New Map;
    Properties.Insert("Name"        , "title");
    Properties.Insert("Description" , "rich_text");
    Properties.Insert("Number"      , "number");
    Properties.Insert("CreationDate", "date");
    Properties.Insert("Image"       , "files");
    Properties.Insert("Active"      , "checkbox");
    Properties.Insert("Website"     , "url");
    Properties.Insert("Email"       , "email");
    Properties.Insert("Phone"       , "phone_number");
    Properties.Insert("User"        , "people");

    ValueSelection = New Map;
    ValueSelection.Insert("New"        , "green");
    ValueSelection.Insert("InProgress" , "yellow");
    ValueSelection.Insert("Remote"     , "red");

    Properties.Insert("Status", ValueSelection);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Parent);
    Options.Insert("title", Title);
    Options.Insert("props", Properties);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreateDatabase", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "CreateDatabase", , FunctionParameters);

EndProcedure

Procedure Notion_EditDatabaseProperties(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Title       = "TestTitle";
    Description = "TestDescription";

    Properties = New Map;
    Properties.Insert("Email", "rich_text"); // Type fields "Email" will changed with email to text
    Properties.Insert("Website"); // Field "Website" will deleted

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("props", Properties);
    Options.Insert("title", Title);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "EditDatabaseProperties", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "EditDatabaseProperties");

EndProcedure

Procedure Notion_GetPage(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Page  = FunctionParameters["Notion_Page"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Page);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetPage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "GetPage");

EndProcedure

Procedure Notion_GetDatabase(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetDatabase", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "GetDatabase");

EndProcedure

Procedure Notion_CreatePageInDatabase(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Base   = FunctionParameters["Notion_Base"];
    Image_ = FunctionParameters["Picture"]; // URL, Binary data or File path

    Image = New Map;
    Image.Insert("Logo", Image_);

    Properties = New Map;
    Properties.Insert("Name"        , "LLC Vector");
    Properties.Insert("Description" , "OurFirstClient");
    Properties.Insert("Number"      , 1);
    Properties.Insert("CreationDate", OPI_Tools.GetCurrentDate());
    Properties.Insert("Image"       , Image);
    Properties.Insert("Active"      , True);
    Properties.Insert("Website"     , "https://vector.ru");
    Properties.Insert("Email"       , "mail@vector.ru");
    Properties.Insert("Phone"       , "88005553535");
    Properties.Insert("Status"      , "New");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("data", Properties);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreatePageInDatabase", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "CreatePageInDatabase", , Base);

EndProcedure

Procedure Notion_EditPageProperties(FunctionParameters)

    Token   = FunctionParameters["Notion_Token"];
    Page    = FunctionParameters["Notion_Page"];
    Icon    = FunctionParameters["Picture"];
    Cover   = FunctionParameters["Picture2"];
    Archive = False;

    Properties = New Map;
    Properties.Insert("Active", False);
    Properties.Insert("Email" , "vector@mail.ru");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Page);
    Options.Insert("data", Properties);
    Options.Insert("icon", Icon);
    Options.Insert("cover", Cover);
    Options.Insert("archive", Archive);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "EditPageProperties", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "EditPageProperties");

EndProcedure

Procedure Notion_ReturnBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_Block"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("block", Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnBlock", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "ReturnBlock");

EndProcedure

Procedure Notion_CreateBlock(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Block  = FunctionParameters["Notion_Block"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("block", Block);

    BlockData = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnBlock", Options);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Parent);
    Options.Insert("block", BlockData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreateBlock", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "CreateBlock", , FunctionParameters);

EndProcedure

Procedure Notion_ReturnChildBlocks(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("block", Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnChildBlocks", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "ReturnChildBlocks");

EndProcedure

Procedure Notion_DeleteBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("block", Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "DeleteBlock", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "DeleteBlock");

EndProcedure

Procedure Notion_UserList(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "UserList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "UserList");

EndProcedure

Procedure Notion_GetUserData(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    User  = FunctionParameters["Notion_User"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("user", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetUserData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Notion", "GetUserData");

EndProcedure

#EndRegion // Notion

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure НоушнАпи_СоздатьСтраницу() Export
    NotionAPI_CreatePage();
EndProcedure

Procedure НоушнАпи_СоздатьИзменитьБазу() Export
    NotionAPI_CreateUpdateBase();
EndProcedure

Procedure НоушнАпи_СоздатьУдалитьБлок() Export
    NotionAPI_CreateDeleteBlock();
EndProcedure

Procedure НоушнАпи_ПолучитьПользователей() Export
    NotionAPI_GetUsers();
EndProcedure

#EndRegion
