// OneScript: ./OInt/tests/Modules/OPItc_Janx.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use asserts
//#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("Janx");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Janx");

EndFunction

#Region Internal

#Region RunnableTests

#Region Janx

Procedure Jnx_Data() Export

    Janx_SerializeData();
    Janx_DeserializeData();

EndProcedure

Procedure Jnx_Benchmark() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    Janx_Benchmark();

EndProcedure

Procedure Jnx_ExtendedDataCheck() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    Janx_Extended_RoundRobinMultipleBinaryFields();
    Janx_Extended_RoundRobinBinariesArray();
    Janx_Extended_RoundRobinMixedArray();
    Janx_Extended_RoundRobinDeepNesting();
    Janx_Extended_RoundRobinEmptyAndSpecial();

EndProcedure

#EndRegion // Janx

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Janx

Procedure Janx_SerializeData()

    Original = New Map;
    Original.Insert("title"  , "Example");
    Original.Insert("count"  , 42);
    Original.Insert("active" , True);
    Original.Insert("payload", GetBinaryDataFromHexString("DEADBEEF"));

    Nested = New Map;
    Nested.Insert("label", "nested");
    Nested.Insert("inner", GetBinaryDataFromHexString("010203"));
    Original.Insert("nested", Nested);

    Meta = New Array;
    Meta.Add("tag");
    Meta.Add(1);
    Meta.Add(False);
    Meta.Add(GetBinaryDataFromHexString("0A0B"));
    Original.Insert("items", Meta);

    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "SerializeData", , Restored, Original);

    Original = "Hello";
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "SerializeData", "String", Restored, Original);

    Original = 42;
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "SerializeData", "Number", Restored, Original);

    Original = GetBinaryDataFromString("");
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "SerializeData", "EmptyBinary", Restored, Original);

    Original = GetBinaryDataFromHexString("010203");
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "SerializeData", "BinaryOne", Restored, Original);

    Map    = New Map;
    Map.Insert("name", "test");
    Map.Insert("body", GetBinaryDataFromHexString("DEADBEEF"));
    Options = New Structure;
    Options.Insert("value", Map);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "SerializeData", "MapWithBinary", Restored, Map);

    Array  = New Array;
    Array.Add(1);
    Array.Add(GetBinaryDataFromHexString("0A0B"));
    Options = New Structure;
    Options.Insert("value", Array);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "SerializeData", "ArrayWithBinary", Restored, Array);

EndProcedure

Procedure Janx_DeserializeData()

    Original = New Map;
    Original.Insert("title"  , "Example");
    Original.Insert("count"  , 42);
    Original.Insert("active" , True);
    Original.Insert("payload", GetBinaryDataFromHexString("DEADBEEF"));

    Nested = New Map;
    Nested.Insert("label", "nested");
    Nested.Insert("inner", GetBinaryDataFromHexString("010203"));
    Original.Insert("nested", Nested);

    Meta = New Array;
    Meta.Add("tag");
    Meta.Add(1);
    Meta.Add(False);
    Meta.Add(GetBinaryDataFromHexString("0A0B"));
    Original.Insert("items", Meta);

    Options = New Structure;
    Options.Insert("value", Original);

    Binary = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Binary);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "DeserializeData", , Original);

    Original = "Hello";
    Options = New Structure;
    Options.Insert("value", Original);

    Binary = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Binary);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "DeserializeData", "String", Original);

    If Not OPI_TestDataRetrieval.IsCLITest() Then

        Original = GetBinaryDataFromHexString("CAFEBABE");
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "DeserializeData", "BinaryOne", Original);

        Original = New Map;
        Original.Insert("a", 1);
        Original.Insert("b", GetBinaryDataFromHexString("FF"));
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "DeserializeData", "MapWithBinary", Original);

        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "DeserializeData", "Prefix", Binary);

    EndIf;

EndProcedure

Procedure Janx_Benchmark()

    Items     = New Array;
    JsonItems = New Array;

    For Index = 0 To 499 Do

        Element                           = New Structure;
        Element.Insert("index"  , Index);
        Element.Insert("flag"   , Index % 2 = 0);
        Element.Insert("title"  , "item_" + Index);
        Element.Insert("ratio"  , Index / 3.0);
        Element.Insert("payload", GetBinaryDataFromHexString("0102030405060708090A0B0C0D0E0F"));

        If Index % 7 = 0 Then
            Element.Insert("note", Undefined);
        EndIf;

        NumberList = New Array;

        For SubIndex = 0 To 7 Do
            NumberList.Add(Index * 10 + SubIndex);
        EndDo;

        Element.Insert("values", NumberList);

        Attributes = New Map;
        Attributes.Insert("group"  , "g" + (Index % 10));
        Attributes.Insert("enabled", Index % 3 <> 0);

        If Index % 5 = 0 Then
            Attributes.Insert("extra", Undefined);
        EndIf;

        Element.Insert("attrs", Attributes);
        Items.Add(Element);

        JsonItem                           = New Structure;
        JsonItem.Insert("index", Index);
        JsonItem.Insert("flag" , Index % 2 = 0);
        JsonItem.Insert("title", "item_" + Index);
        JsonItem.Insert("ratio", Index / 3.0);

        If Index % 7 = 0 Then
            JsonItem.Insert("note", Undefined);
        EndIf;

        JsonItem.Insert("values", NumberList);
        JsonItem.Insert("attrs" , Attributes);
        JsonItems.Add(JsonItem);

    EndDo;

    Original = New Structure;
    Original.Insert("version", 1);
    Original.Insert("label"  , "benchmark");
    Original.Insert("root"   , Undefined);
    Original.Insert("items"  , Items);

    OriginalJson = New Structure;
    OriginalJson.Insert("version", 1);
    OriginalJson.Insert("label"  , "benchmark");
    OriginalJson.Insert("root"   , Undefined);
    OriginalJson.Insert("items"  , JsonItems);

    Result = New Structure;

    Start      = CurrentUniversalDateInMilliseconds();
    JsonString = OPI_Tools.JSONString(OriginalJson, "None", False);
    Result.Insert("JsonSerializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JsonString"         , JsonString);

    Start        = CurrentUniversalDateInMilliseconds();
    JsonRestored = OPI_Tools.JsonToStructure(JsonString, True);
    Result.Insert("JsonDeserializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JsonRestored"         , JsonRestored);

    Start    = CurrentUniversalDateInMilliseconds();
    Options = New Structure;
    Options.Insert("value", Original);

    JanxData = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Result.Insert("JanxSerializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JanxData"           , JanxData);

    Start        = CurrentUniversalDateInMilliseconds();
    Options = New Structure;
    Options.Insert("data", JanxData);

    JanxRestored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);
    Result.Insert("JanxDeserializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JanxRestored"         , JanxRestored);

    Start              = CurrentUniversalDateInMilliseconds();
    Options = New Structure;
    Options.Insert("value", OriginalJson);

    JanxDataWithoutBin = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Result.Insert("JanxSerializationWithoutBinMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JanxDataWithoutBin"           , JanxData);

    Start                  = CurrentUniversalDateInMilliseconds();
    Options = New Structure;
    Options.Insert("data", JanxDataWithoutBin);

    JanxRestoredWithoutBin = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);
    Result.Insert("JanxDeserializationWithoutBinMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JanxRestoredWithoutBin"         , JanxRestored);

    JanxReading  = New DataReader(JanxData);
    JanxReading.ReadInt16(ByteOrder.BigEndian);
    JSONJanxSize = JanxReading.ReadInt32(ByteOrder.BigEndian);
    JanxReading.ReadInt32(ByteOrder.BigEndian);
    JanxReading.Close();
    Result.Insert("AppendixSize", JanxData.Size() - 10 - JSONJanxSize);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "Benchmark", , Original);

EndProcedure

#Region ExtendedDataCheck

Procedure Janx_Extended_RoundRobinMultipleBinaryFields()

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("MultipleBinaries");
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "Extended_RoundRobin", "MultipleBinaries", Restored, Original);

EndProcedure

Procedure Janx_Extended_RoundRobinBinariesArray()

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("BinariesArray");
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "Extended_RoundRobin", "BinariesArray", Restored, Original);

EndProcedure

Procedure Janx_Extended_RoundRobinMixedArray()

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("MixedArray");
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "Extended_RoundRobin", "MixedArray", Restored, Original);

EndProcedure

Procedure Janx_Extended_RoundRobinDeepNesting()

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("DeepNesting");
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "Extended_RoundRobin", "DeepNesting", Restored, Original);

EndProcedure

Procedure Janx_Extended_RoundRobinEmptyAndSpecial()

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("EmptyAndSpecial");
    Options = New Structure;
    Options.Insert("value", Original);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Janx", "Extended_RoundRobin", "EmptyAndSpecial", Restored, Original);

EndProcedure

#EndRegion // ExtendedDataCheck

#EndRegion // Janx

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure Jnx_Данные() Export
    Jnx_Data();
EndProcedure

Procedure Jnx_Бенчмарк() Export
    Jnx_Benchmark();
EndProcedure

Procedure Jnx_РасширеннаяПроверкаДанные() Export
    Jnx_ExtendedDataCheck();
EndProcedure

#EndRegion
