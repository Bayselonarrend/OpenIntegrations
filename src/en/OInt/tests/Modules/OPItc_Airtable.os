// OneScript: ./OInt/tests/Modules/OPIt_Airtable.os

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

#Region Internal

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("Airtable");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Airtable");

EndFunction

#Region RunnableTests

#Region Airtable

Procedure AT_CreateDatabase() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Workspace", TestParameters);

    Airtable_CreateDatabase(TestParameters);
    Airtable_GetDatabaseTables(TestParameters);
    Airtable_GetListOfBases(TestParameters);

EndProcedure

Procedure AT_CreateTable() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);

    Airtable_GetNumberField(TestParameters);
    Airtable_GetStringField(TestParameters);
    Airtable_GetAttachmentField(TestParameters);
    Airtable_GetCheckboxField(TestParameters);
    Airtable_GetDateField(TestParameters);
    Airtable_GetPhoneField(TestParameters);
    Airtable_GetEmailField(TestParameters);
    Airtable_GetLinkField(TestParameters);
    Airtable_CreateTable(TestParameters);
    Airtable_ModifyTable(TestParameters);

EndProcedure

Procedure AT_CreateField() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Table", TestParameters);

    Airtable_CreateField(TestParameters);
    Airtable_ModifyField(TestParameters);

EndProcedure

Procedure AT_CreateDeleteRecords() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Table", TestParameters);

    Airtable_CreatePosts(TestParameters);
    Airtable_GetRecord(TestParameters);
    Airtable_CreateComment(TestParameters);
    Airtable_EditComment(TestParameters);
    Airtable_GetComments(TestParameters);
    Airtable_DeleteComment(TestParameters);
    Airtable_GetListOfRecords(TestParameters);
    Airtable_DeleteRecords(TestParameters);

EndProcedure

#EndRegion // Airtable

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Airtable

Procedure Airtable_CreateDatabase(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Region = FunctionParameters["Airtable_Workspace"];
    Name   = "TestDatabase";

    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    FieldArray.Add(OPI_Airtable.GetStringField("String"));

    TableName = "TestTable";

    TableMapping = New Map;
    TableMapping.Insert(TableName, FieldArray);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("ws", Region);
    Options.Insert("title", Name);
    Options.Insert("tablesdata", TableMapping);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateDatabase", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "CreateDatabase", , FunctionParameters, TableName);

EndProcedure

Procedure Airtable_GetDatabaseTables(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetDatabaseTables", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetDatabaseTables");

EndProcedure

Procedure Airtable_GetListOfBases(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetListOfBases", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetListOfBases");

EndProcedure

Procedure Airtable_GetNumberField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Number");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetNumberField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetNumberField");

EndProcedure

Procedure Airtable_GetStringField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "String");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetStringField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetStringField");

EndProcedure

Procedure Airtable_GetAttachmentField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Attachment");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetAttachmentField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetAttachmentField");

EndProcedure

Procedure Airtable_GetCheckboxField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Checkbox");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetCheckboxField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetCheckboxField");

EndProcedure

Procedure Airtable_GetDateField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Date");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetDateField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetDateField");

EndProcedure

Procedure Airtable_GetPhoneField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Phone");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetPhoneField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetPhoneField");

EndProcedure

Procedure Airtable_GetEmailField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Email");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetEmailField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetEmailField");

EndProcedure

Procedure Airtable_GetLinkField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Link");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetLinkField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetLinkField");

EndProcedure

Procedure Airtable_CreateTable(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];

    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    FieldArray.Add(OPI_Airtable.GetStringField("String"));
    FieldArray.Add(OPI_Airtable.GetAttachmentField("Attachment"));
    FieldArray.Add(OPI_Airtable.GetCheckboxField("Checkbox"));
    FieldArray.Add(OPI_Airtable.GetDateField("Date"));
    FieldArray.Add(OPI_Airtable.GetPhoneField("Phone"));
    FieldArray.Add(OPI_Airtable.GetEmailField("Email"));
    FieldArray.Add(OPI_Airtable.GetLinkField("Link"));

    Name        = "TestTable2";
    Description = "NewTable";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("title", Name);
    Options.Insert("fieldsdata", FieldArray);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateTable", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "CreateTable", , FunctionParameters, Name, Description);

EndProcedure

Procedure Airtable_ModifyTable(FunctionParameters)

    Token       = FunctionParameters["Airtable_Token"];
    Base        = FunctionParameters["Airtable_Base"];
    Table       = FunctionParameters["Airtable_Table"];
    Name        = "Test table 2 (change.)";
    Description = "New table (change.)";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("title", Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "ModifyTable", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "ModifyTable", , Name, Description);

EndProcedure

Procedure Airtable_CreateField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Name  = String(New UUID);

    Options = New Structure;
    Options.Insert("title", Name);

    Field = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetNumberField", Options);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("fielddata", Field);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "CreateField", , FunctionParameters, Name);

EndProcedure

Procedure Airtable_ModifyField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Field = FunctionParameters["Airtable_Field"];

    Name        = String(New UUID) + "(change.)";
    Description = "New description";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("field", Field);
    Options.Insert("title", Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "ModifyField", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "ModifyField", , Name, Description);

EndProcedure

Procedure Airtable_CreatePosts(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];

    Number = 10;
    String = "Hello";

    RowDescription1 = New Structure("Number,String", Number, String);
    RowDescription2 = New Structure("Number,String", Number, String);

    ArrayOfDescriptions = New Array;
    ArrayOfDescriptions.Add(RowDescription1);
    ArrayOfDescriptions.Add(RowDescription2);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("data", ArrayOfDescriptions);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreatePosts", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "CreatePosts", , FunctionParameters);

    ArrayOfDeletions = New Array;

    For Each Record In Result["records"] Do

        CurrentRecord = Record["id"];
        ArrayOfDeletions.Add(CurrentRecord);

    EndDo;

    OPI_Airtable.DeleteRecords(Token, Base, Table, ArrayOfDeletions);

    // Single

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("data", RowDescription1);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreatePosts", Options);

    OPI_TestDataRetrieval.Process(Result, "Airtable", "CreatePosts", "Single", FunctionParameters, Number, String);

EndProcedure

Procedure Airtable_GetRecord(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetRecord", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetRecord", , Record);

EndProcedure

Procedure Airtable_CreateComment(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];
    Text   = "TestComment";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateComment", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "CreateComment", , FunctionParameters, Text);

EndProcedure

Procedure Airtable_EditComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Text   = "Test comment (change.)";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);
    Options.Insert("comment", Comment);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "EditComment", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "EditComment", , Text);

EndProcedure

Procedure Airtable_GetComments(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetComments", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetComments");

EndProcedure

Procedure Airtable_DeleteComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);
    Options.Insert("comment", Comment);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "DeleteComment", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "DeleteComment", , Comment);

EndProcedure

Procedure Airtable_GetListOfRecords(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetListOfRecords", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "GetListOfRecords");

EndProcedure

Procedure Airtable_DeleteRecords(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("records", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "DeleteRecords", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "Airtable", "DeleteRecords");

EndProcedure

#EndRegion // Airtable

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure АТ_СоздатьБазу() Export
    AT_CreateDatabase();
EndProcedure

Procedure АТ_СоздатьТаблицу() Export
    AT_CreateTable();
EndProcedure

Procedure АТ_СоздатьПоле() Export
    AT_CreateField();
EndProcedure

Procedure АТ_СоздатьУдалитьЗаписи() Export
    AT_CreateDeleteRecords();
EndProcedure

#EndRegion
