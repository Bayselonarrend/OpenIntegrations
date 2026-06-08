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

#Use oint
#Use asserts
#Use "internal"


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

Procedure MP_Compatibility() Export

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

    Result   = OPI_MessagePack.SerializeData(Original);
    Restored = OPI_MessagePack.DeserializeData(Result);

    // END

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", , Restored, Original);

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

    Result   = OPI_MessagePack.SerializeData(DataFile, True);
    Restored = OPI_MessagePack.DeserializeData(Result);

    OPI_Tools.RemoveFileWithTry(DataFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "FromFile", Restored, Original);

    Result = OPI_MessagePack.SerializeData("");
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

    Data   = -1;
    Result = OPI_MessagePack.SerializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "NegativeFixint");

    Data   = -33;
    Result = OPI_MessagePack.SerializeData(Data);

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

    Data   = GetBinaryDataFromHexString("");
    Result = OPI_MessagePack.SerializeData(Data);

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "SerializeData", "EmptyBinary");

    Data   = GetBinaryDataFromHexString("010203");
    Result = OPI_MessagePack.SerializeData(Data);

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

    Data   = OPI_MessagePack.SerializeData(Original);
    Result = OPI_MessagePack.DeserializeData(Data);

    // END

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "DeserializeData", , Original);

    Data   = GetBinaryDataFromHexString("00");
    Result = OPI_MessagePack.DeserializeData(Data);

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

Procedure MessagePack_ReferenceCompatibility()

    BaseURL = MessagePackBaseReferenceURL();

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(BaseURL + "/health")
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "MessagePack", "ReferenceCompatibility", "Health");

    Original      = "Hello";
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = 128;
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = 0.2;
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = True;
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = Undefined;
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = New Array;
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = New Array;
    Original.Add(1);
    Original.Add(2);
    Original.Add(3);
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = New Structure("a", 1);
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = New Map;
    Original.Insert("name"  , "test");
    Original.Insert("count" , 2);
    Original.Insert("active", True);
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    NestedData    = New Array;
    NestedData.Add(1);
    Original      = New Structure("items", NestedData);
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

    ReferenceBinary = MessagePackPackReference(BaseURL, Original);
    OPIResult       = OPI_MessagePack.DeserializeData(ReferenceBinary);
    OPI_TestDataRetrieval.Process(OPIResult, "MessagePack", "ReferenceCompatibility", "ReferencePackOPIUnpack", Original);

    Original      = GetBinaryDataFromHexString("DEADBEEF");
    OPIBinary     = OPI_MessagePack.SerializeData(Original);
    ReferenceJSON = MessagePackUnpackReference(BaseURL, OPIBinary);
    OPI_TestDataRetrieval.Process(ReferenceJSON, "MessagePack", "ReferenceCompatibility", "OPIPackReferenceUnpack", Original);

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