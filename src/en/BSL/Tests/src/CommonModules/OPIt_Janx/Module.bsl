// OneScript: ./OInt/tests/Modules/OPIt_Janx.os

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

// #Use oint
// #Use asserts
// #Use "internal"

#If Not WebClient Then // !OPI

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("Janx");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Janx");

EndFunction

#Region Internal

#Region RunnableTests

#Region Janx

Procedure Jnx_Data() Export

    Janx_SerializeData();
    Janx_DeserializeData();

EndProcedure

Procedure Jnx_Benchmark() Export

    Janx_Benchmark();

EndProcedure

#EndRegion // Janx

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Janx

Procedure Janx_SerializeData()

    Original = "Hello";
    Result   = OPI_Janx.SerializeData(Original);

    // END

    Restored = OPI_Janx.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "Janx", "SerializeData", "String", Restored, Original);

    Original = 42;
    Result   = OPI_Janx.SerializeData(Original);

    Restored = OPI_Janx.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "Janx", "SerializeData", "Number", Restored, Original);

    Original = GetBinaryDataFromString("");
    Result   = OPI_Janx.SerializeData(Original);

    Restored = OPI_Janx.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "Janx", "SerializeData", "EmptyBinary", Restored, Original);

    Original = GetBinaryDataFromHexString("010203");
    Result   = OPI_Janx.SerializeData(Original);

    Restored = OPI_Janx.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "Janx", "SerializeData", "BinaryOne", Restored, Original);

    Map    = New Map;
    Map.Insert("name", "test");
    Map.Insert("body", GetBinaryDataFromHexString("DEADBEEF"));
    Result = OPI_Janx.SerializeData(Map);

    Restored = OPI_Janx.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "Janx", "SerializeData", "MapWithBinary", Restored, Map);

    Array  = New Array;
    Array.Add(1);
    Array.Add(GetBinaryDataFromHexString("0A0B"));
    Result = OPI_Janx.SerializeData(Array);

    Restored = OPI_Janx.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "Janx", "SerializeData", "ArrayWithBinary", Restored, Array);

EndProcedure

Procedure Janx_DeserializeData()

    Original = "Hello";
    Binary   = OPI_Janx.SerializeData(Original);
    Result   = OPI_Janx.DeserializeData(Binary);

    // END

    OPI_TestDataRetrieval.Process(Result, "Janx", "DeserializeData", "String", Original);

    Original = GetBinaryDataFromHexString("CAFEBABE");
    Binary   = OPI_Janx.SerializeData(Original);
    Result   = OPI_Janx.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "Janx", "DeserializeData", "BinaryOne", Original);

    Original = New Map;
    Original.Insert("a", 1);
    Original.Insert("b", GetBinaryDataFromHexString("FF"));
    Binary   = OPI_Janx.SerializeData(Original);
    Result   = OPI_Janx.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "Janx", "DeserializeData", "MapWithBinary", Original);

    Binary = OPI_Janx.SerializeData(Original);
    Result = OPI_Janx.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "Janx", "DeserializeData", "Prefix", Binary);

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
    JanxData = OPI_Janx.SerializeData(Original);
    Result.Insert("JanxSerializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JanxData"           , JanxData);

    Start        = CurrentUniversalDateInMilliseconds();
    JanxRestored = OPI_Janx.DeserializeData(JanxData);
    Result.Insert("JanxDeserializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JanxRestored"         , JanxRestored);

    Start              = CurrentUniversalDateInMilliseconds();
    JanxDataWithoutBin = OPI_Janx.SerializeData(OriginalJson);
    Result.Insert("JanxSerializationWithoutBinMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JanxDataWithoutBin"           , JanxData);

    Start                  = CurrentUniversalDateInMilliseconds();
    JanxRestoredWithoutBin = OPI_Janx.DeserializeData(JanxDataWithoutBin);
    Result.Insert("JanxDeserializationWithoutBinMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JanxRestoredWithoutBin"         , JanxRestored);

    JanxBuffer   = GetBinaryDataBufferFromBinaryData(JanxData);
    JSONJanxSize = JanxBuffer.Get(0) * 16777216
        + JanxBuffer.Get(1) * 65536
        + JanxBuffer.Get(2) * 256
        + JanxBuffer.Get(3);
    Result.Insert("AppendixSize", JanxData.Size() - 4 - JSONJanxSize);

    OPI_TestDataRetrieval.Process(Result, "Janx", "Benchmark", , Original);

EndProcedure

#EndRegion // Janx

#EndRegion // AtomicTests

#EndRegion // Private

#EndIf // !OPI
