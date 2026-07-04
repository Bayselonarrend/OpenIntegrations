// OneScript: ./OInt/tests/Modules/OPItc_MessagePack.os

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

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use "../../formats"
#Use asserts
#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("MessagePack");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("MessagePack");

EndFunction

#Region Internal

#Region RunnableTests

#Region MessagePack

Procedure MP_Data() Export

    MessagePack_SerializeData();
    MessagePack_DeserializeData();

EndProcedure

Procedure MP_Benchmark() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    MessagePack_Benchmark();

EndProcedure

Procedure MP_Compatibility() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    MessagePack_ReferenceCompatibility();

EndProcedure

#EndRegion // MessagePack

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region MessagePack

Function MessagePackBaseReferenceURL()

    Return StrTemplate("http://%1:19090", OPI_TestDataRetrieval.GetLocalhost());

EndFunction

Function MessagePackPackReference(BaseURL, Data)

    Request = OPI_HTTPRequests.NewRequest().Initialize(BaseURL + "/pack");

    If Data = Undefined Then

        Request = Request
            .SetDataType("application/json")
            .SetStringBody("null");

    ElsIf OPI_Tools.ThisIsCollection(Data, True) Then

        Request = Request.SetJsonBody(Data);

    Else

        Request = Request
            .SetDataType("application/json; charset=utf-8")
            .SetStringBody(OPI_Tools.JSONString(Data, "None", False));

    EndIf;

    Return Request.ProcessRequest("POST").ReturnResponseAsBinaryData();

EndFunction

Function MessagePackUnpackReference(BaseURL, Binary)

    Return OPI_HTTPRequests.NewRequest()
        .Initialize(BaseURL + "/unpack")
        .SetDataType("application/msgpack")
        .SetBinaryBody(Binary)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

EndFunction

Procedure MessagePack_SerializeData()

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", , Restored, Original);

    //@skip-check undefined-function
    DataFile = GetTempFileName("json");

    Original.Delete("payload");
    Original["nested"].Delete("inner");
    Original["items"].Delete(3);

    OPI_Tools.WriteJSONFile(DataFile, Original);

    DataObject = New File(DataFile);
    If Not DataObject.Exists() Then
        Raise "Data file not found!";
    EndIf;

    Options = New Structure;
    Options.Insert("value", DataFile);
    Options.Insert("raw", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Result);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

    OPI_Tools.RemoveFileWithTry(DataFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "FromFile", Restored, Original);

    If Not OPI_TestDataRetrieval.IsCLITest() Then

        Options = New Structure;
        Options.Insert("value", "a");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "StringFixstr");

        Options = New Structure;
        Options.Insert("value", "Hello");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        Options = New Structure;
        Options.Insert("data", Result);

        Restored = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "StringUTF8", Restored);

        Options = New Structure;
        Options.Insert("value", 0);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "Integer0");

        Options = New Structure;
        Options.Insert("value", 127);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "Integer127");

        Options = New Structure;
        Options.Insert("value", 128);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "Uint8");

        Data   = -1;
        Options = New Structure;
        Options.Insert("value", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "NegativeFixint");

        Data   = -33;
        Options = New Structure;
        Options.Insert("value", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "Int8");

        Options = New Structure;
        Options.Insert("value", Истина);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "True");

        Options = New Structure;
        Options.Insert("value", Ложь);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "False");

        Data   = GetBinaryDataFromHexString("010203");
        Options = New Structure;
        Options.Insert("value", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        Options = New Structure;
        Options.Insert("data", Result);

        Restored = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "BinaryBin8", Restored);

        Array  = New Array;
        Array.Add(1);
        Array.Add(2);
        Array.Add(3);
        Options = New Structure;
        Options.Insert("value", Array);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "ArrayThreeNumbers");

        Structure = New Structure("a", 1);
        Options = New Structure;
        Options.Insert("value", Structure);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "MapOnePair");

        Map    = New Map;
        Map.Insert("x", 10);
        Map.Insert("y", 20);
        Options = New Structure;
        Options.Insert("value", Map);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        Options = New Structure;
        Options.Insert("data", Result);

        Restored = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "MapTwoPairs", Restored);

        Options = New Structure;
        Options.Insert("value", "");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "EmptyString");

        Array  = New Array;
        Options = New Structure;
        Options.Insert("value", Array);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "EmptyArray");

        Data   = GetBinaryDataFromHexString("");
        Options = New Structure;
        Options.Insert("value", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        Options = New Structure;
        Options.Insert("data", Result);

        Restored = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "EmptyBinary", Restored);

        Options = New Structure;
        Options.Insert("value", Неопределено);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "Nil");

        Original = 0.2;
        Options = New Structure;
        Options.Insert("value", Original);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        Options = New Structure;
        Options.Insert("data", Result);

        Restored = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "Float", Restored, Original);

        Map    = New Map;
        Options = New Structure;
        Options.Insert("value", Map);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "SerializeData", "EmptyMap");

    EndIf;

EndProcedure

Procedure MessagePack_DeserializeData()

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

    Data = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    Options = New Structure;
    Options.Insert("data", Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", , Original);

    If Not OPI_TestDataRetrieval.IsCLITest() Then

        Data   = GetBinaryDataFromHexString("00");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "Fixint0");

        Data   = GetBinaryDataFromHexString("A161");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "StringFixstr");

        Original = 128;
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Original = -33;
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Original = "Hello";
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Original = 0.2;
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Data   = GetBinaryDataFromHexString("C0");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "Nil");

        Data   = GetBinaryDataFromHexString("C2");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "False");

        Data   = GetBinaryDataFromHexString("C3");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "True");

        Options = New Structure;
        Options.Insert("value", Неопределено);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "Nil");

        Original = True;
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Original = False;
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Data   = GetBinaryDataFromHexString("C400");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "EmptyBinary");

        Data   = GetBinaryDataFromHexString("C403010203");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "BinaryBin8");

        Original = GetBinaryDataFromHexString("DEADBEEF");
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Data   = GetBinaryDataFromHexString("90");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "EmptyArray");

        Data   = GetBinaryDataFromHexString("93010203");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "ArrayThreeNumbers");

        Data   = GetBinaryDataFromHexString("92A161A162");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "ArrayTwoStrings");

        Original = New Array;
        Original.Add(1);
        Original.Add("a");
        Original.Add(True);
        Original.Add(Undefined);
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Embedded = New Array;
        Embedded.Add(42);
        Original = New Array;
        Original.Add(Embedded);
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        Data   = GetBinaryDataFromHexString("80");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "EmptyMap");

        Data   = GetBinaryDataFromHexString("81A16101");
        Options = New Structure;
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "MapOnePair");

        Original = New Map;
        Original.Insert("name"  , "test");
        Original.Insert("count" , 2);
        Original.Insert("active", True);
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

        NestedData = New Array;
        NestedData.Add(1);
        Original   = New Structure("items", NestedData);
        Options = New Structure;
        Options.Insert("value", Original);

        Binary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
        Options = New Structure;
        Options.Insert("data", Binary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "DeserializeData", "RoundTrip", Original);

    EndIf;

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
    Options = New Structure;
    Options.Insert("value", Original);

    MessagePackData = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    Result.Insert("MessagePackSerializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("MessagePackData"           , MessagePackData);

    Start               = CurrentUniversalDateInMilliseconds();
    Options = New Structure;
    Options.Insert("data", MessagePackData);

    MessagePackRestored = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    Result.Insert("MessagePackDeserializationMs", CurrentUniversalDateInMilliseconds() - Start);
    Result.Insert("MessagePackRestored"         , MessagePackRestored);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "Benchmark", , Original);

EndProcedure

Procedure MessagePack_ReferenceCompatibility()

    BaseURL = MessagePackBaseReferenceURL();

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(BaseURL + "/health")
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MessagePack", "ReferenceCompatibility", "Health");

    Original      = "Hello";
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = 128;
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = 0.2;
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = True;
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = Undefined;
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = New Array;
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = New Array;
    Original.Add(1);
    Original.Add(2);
    Original.Add(3);
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = New Structure("a", 1);
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = New Map;
    Original.Insert("name"  , "test");
    Original.Insert("count" , 2);
    Original.Insert("active", True);
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    NestedData    = New Array;
    NestedData.Add(1);
    Original      = New Structure("items", NestedData);
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    Options = New Structure;
    Options.Insert("data", ReferenceBinary);

    OPIResult = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "DeserializeData", Options);
    OPI_TestDataRetrieval.ProcessCLI(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = GetBinaryDataFromHexString("DEADBEEF");
    Options = New Structure;
    Options.Insert("value", Original);

    OPIBinary = OPI_TestDataRetrieval.ExecuteTestCLI("msgpack", "SerializeData", Options);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.ProcessCLI(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

EndProcedure

#EndRegion // MessagePack

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure MP_Данные() Export
    MP_Data();
EndProcedure

Procedure MP_Бенчмарк() Export
    MP_Benchmark();
EndProcedure

Procedure MP_Совместимость() Export
    MP_Compatibility();
EndProcedure

#EndRegion
