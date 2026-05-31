// OneScript: ./OInt/tests/Modules/OPIt_MessagePack.os

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

    OPI_TestDataRetrieval.FormYAXTests("MessagePack");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("MessagePack");

EndFunction

#Region Internal

#Region RunnableTests

#Region MessagePack

Procedure MP_Data() Export

    MessagePack_SerializeData();
    MessagePack_DeserializeData();

EndProcedure

Procedure MP_Benchmark() Export

    MessagePack_Benchmark();

EndProcedure

#EndRegion // MessagePack

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region MessagePack

Procedure MessagePack_SerializeData()

    Result = OPI_MessagePack.SerializeData("");

    // END

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "EmptyString");

    Result = OPI_MessagePack.SerializeData("a");

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "StringFixstr");

    Result = OPI_MessagePack.SerializeData("Hello");

    Restored = OPI_MessagePack.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "StringUTF8", Restored);

    Result = OPI_MessagePack.SerializeData(0);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "Integer0");

    Result = OPI_MessagePack.SerializeData(127);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "Integer127");

    Result = OPI_MessagePack.SerializeData(128);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "Uint8");

    Result = OPI_MessagePack.SerializeData(-1);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "NegativeFixint");

    Result = OPI_MessagePack.SerializeData(-33);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "Int8");

    Original = 0.2;
    Result   = OPI_MessagePack.SerializeData(Original);

    Restored = OPI_MessagePack.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "Float", Restored, Original);

    Result = OPI_MessagePack.SerializeData(Undefined);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "Nil");

    Result = OPI_MessagePack.SerializeData(True);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "True");

    Result = OPI_MessagePack.SerializeData(False);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "False");

    Result = OPI_MessagePack.SerializeData(GetBinaryDataFromHexString(""));

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "EmptyBinary");

    Result = OPI_MessagePack.SerializeData(GetBinaryDataFromHexString("010203"));

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "BinaryBin8");

    Array  = New Array;
    Result = OPI_MessagePack.SerializeData(Array);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "EmptyArray");

    Array  = New Array;
    Array.Add(1);
    Array.Add(2);
    Array.Add(3);
    Result = OPI_MessagePack.SerializeData(Array);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "ArrayThreeNumbers");

    Map    = New Map;
    Result = OPI_MessagePack.SerializeData(Map);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "EmptyMap");

    Structure = New Structure("a", 1);
    Result    = OPI_MessagePack.SerializeData(Structure);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "MapOnePair");

    Map    = New Map;
    Map.Insert("x", 10);
    Map.Insert("y", 20);
    Result = OPI_MessagePack.SerializeData(Map);

    Restored = OPI_MessagePack.DeserializeData(Result);
    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "MapTwoPairs", Restored);

EndProcedure

Procedure MessagePack_DeserializeData()

    Data   = GetBinaryDataFromHexString("00");
    Result = OPI_MessagePack.DeserializeData(Data);

    // END

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "Fixint0");

    Data   = GetBinaryDataFromHexString("A161");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "StringFixstr");

    Original = 128;
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Original = -33;
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Original = "Hello";
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Original = 0.2;
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Data   = GetBinaryDataFromHexString("C0");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "Nil");

    Data   = GetBinaryDataFromHexString("C2");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "False");

    Data   = GetBinaryDataFromHexString("C3");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "True");

    Binary = OPI_MessagePack.SerializeData(Undefined);
    Result = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "Nil");

    Original = True;
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Original = False;
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Data   = GetBinaryDataFromHexString("C400");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "EmptyBinary");

    Data   = GetBinaryDataFromHexString("C403010203");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "BinaryBin8");

    Original = GetBinaryDataFromHexString("DEADBEEF");
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Data   = GetBinaryDataFromHexString("90");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "EmptyArray");

    Data   = GetBinaryDataFromHexString("93010203");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "ArrayThreeNumbers");

    Data   = GetBinaryDataFromHexString("92A161A162");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "ArrayTwoStrings");

    Original = New Array;
    Original.Add(1);
    Original.Add("a");
    Original.Add(True);
    Original.Add(Undefined);
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Embedded = New Array;
    Embedded.Add(42);
    Original = New Array;
    Original.Add(Embedded);
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    Data   = GetBinaryDataFromHexString("80");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "EmptyMap");

    Data   = GetBinaryDataFromHexString("81A16101");
    Result = OPI_MessagePack.DeserializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "MapOnePair");

    Original = New Map;
    Original.Insert("name"  , "test");
    Original.Insert("count" , 2);
    Original.Insert("active", True);
    Binary   = OPI_MessagePack.SerializeData(Original);
    Result   = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    NestedData = New Array;
    NestedData.Add(1);
    Original   = New Structure("items", NestedData);
    Binary     = OPI_MessagePack.SerializeData(Original);
    Result     = OPI_MessagePack.DeserializeData(Binary);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

EndProcedure

Procedure MessagePack_Benchmark()

    Items = New Array;

    For Index = 0 To 499 Do

        Element                           = New Structure;
        Element.Insert("index", Index);
        Element.Insert("flag" , Index % 2 = 0);
        Element.Insert("title", "item_" + Index);
        Element.Insert("ratio", Index / 3.0);

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

    EndDo;

    Original = New Structure;
    Original.Insert("version", 1);
    Original.Insert("label"  , "benchmark");
    Original.Insert("root"   , Undefined);
    Original.Insert("items"  , Items);

    Result = New Structure;

    Start      = CurrentUniversalDateInMilliseconds();
    JsonString = OPI_Tools.JSONString(Original, "None", False);
    Result.Insert("JsonSerializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JsonString"         , JsonString);

    Start        = CurrentUniversalDateInMilliseconds();
    JsonRestored = OPI_Tools.JsonToStructure(JsonString, True);
    Result.Insert("JsonDeserializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("JsonRestored"         , JsonRestored);

    Start           = CurrentUniversalDateInMilliseconds();
    MessagePackData = OPI_MessagePack.SerializeData(Original);
    Result.Insert("MessagePackSerializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("MessagePackData"           , MessagePackData);

    Start               = CurrentUniversalDateInMilliseconds();
    MessagePackRestored = OPI_MessagePack.DeserializeData(MessagePackData);
    Result.Insert("MessagePackDeserializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("MessagePackRestored"         , MessagePackRestored);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "Benchmark", , Original);

EndProcedure

#EndRegion // MessagePack

#EndRegion // AtomicTests

#EndRegion // Private

#EndIf // !OPI
