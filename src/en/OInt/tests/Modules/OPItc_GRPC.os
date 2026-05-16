// OneScript: ./OInt/tests/Modules/OPItc_GRPC.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("GRPC");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("GRPC");

EndFunction

#Region Internal

#Region RunnableTests

#Region GRPC

Procedure GR_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Address"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_AddressNoTls", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Proto"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoTS"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoImport" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"         , TestParameters);

    GRPC_CreateConnection(TestParameters);
    GRPC_CloseConnection(TestParameters);
    GRPC_IsConnector(TestParameters);
    GRPC_SetMetadata(TestParameters);
    GRPC_ExecuteMethod(TestParameters);
    GRPC_GetTlsSettings(TestParameters);
    GRPC_GetConnectionParameters(TestParameters);

EndProcedure

Procedure GR_Introspection() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Address"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Proto"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoImport", TestParameters);

    GRPC_GetServiceList(TestParameters);
    GRPC_GetMethodList(TestParameters);
    GRPC_GetMethod(TestParameters);

EndProcedure

Procedure GR_Streaming() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Address"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_AddressNoTls", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_Proto"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoTS"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GRPC_ProtoImport" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"         , TestParameters);

    GRPC_InitializeServerStream(TestParameters);
    GRPC_InitializeClientStream(TestParameters);
    GRPC_InitializeBidirectionalStream(TestParameters);
    GRPC_SendMessage(TestParameters);
    GRPC_GetMessage(TestParameters);
    GRPC_CloseStream(TestParameters);
    GRPC_ProcessServerStream(TestParameters);
    GRPC_ProcessClientStream(TestParameters);
    GRPC_ProcessBidirectionalStream(TestParameters);
    GRPC_CompleteSend(TestParameters);

EndProcedure

#EndRegion // GRPC

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region GRPC

Procedure GRPC_CreateConnection(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta       = New Structure("somekey", "somevalue");
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("meta", Meta);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Result = OPI_GRPC.CreateConnection(Parameters, Tls);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CreateConnection");

    Result = OPI_GRPC.CloseConnection(Result);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CreateConnection", "Closing");

    Address    = FunctionParameters["GRPC_AddressNoTls"];
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Result     = OPI_GRPC.CreateConnection(Parameters);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CreateConnection", "No TLS");

    Scheme = New Map;
    Scheme.Insert("main.proto", Proto1);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Result     = OPI_GRPC.CreateConnection(Parameters);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CreateConnection", "Error");

EndProcedure

Procedure GRPC_CloseConnection(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta       = New Structure("somekey", "somevalue");
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("meta", Meta);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Result     = OPI_GRPC.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CloseConnection");

EndProcedure

Procedure GRPC_IsConnector(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta       = New Structure("somekey", "somevalue");
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("meta", Meta);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Result     = OPI_GRPC.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "IsConnector");

EndProcedure

Procedure GRPC_GetConnectionParameters(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta   = New Structure("somekey", "somevalue");
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("meta", Meta);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetConnectionParameters");

EndProcedure

Procedure GRPC_GetTlsSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetTlsSettings");

EndProcedure

Procedure GRPC_SetMetadata(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    Meta   = New Structure("somekey", "somevalue");
    Result = OPI_GRPC.SetMetadata(Connection, Meta);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "SetMetadata");

    If Not OPI_TestDataRetrieval.IsCLITest() Then

        Service = "grpcbin.GRPCBin";
        Method  = "HeadersUnary";

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("service", Service);
        Options.Insert("method", Method);
        Options.Insert("data", Неопределено);
        Options.Insert("tls", Tls);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "SetMetadata", "Check");

     EndIf;

EndProcedure

Procedure GRPC_ExecuteMethod(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Meta       = New Structure("somekey", "somevalue");
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("meta", Meta);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyUnary";

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    NumberArray = New Array;
    NumberArray.Add(1);
    NumberArray.Add(10);
    NumberArray.Add(100);

    StructuresArray = New Array;
    StructuresArray.Add(New Structure("f_string", "Nested value 1"));
    StructuresArray.Add(New Structure("f_string", "Nested value 2"));

    BoolArray = New Array;
    BoolArray.Add(True);
    BoolArray.Add(False);

    File = FunctionParameters["Document"];
    OPI_TypeConversion.GetBinaryData(File);

    TFN = GetTempFileName();
    File.Write(TFN);

    BinaryDataArray = New Array;
    BinaryDataArray.Add(File); // How Data
    BinaryDataArray.Add(TFN); // How path to file

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_int64"  , 123);
    Data.Insert("f_float"  , 123.22000122070312);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_enum"   , "ENUM_1");
    Data.Insert("f_bytes"  , File);
    Data.Insert("f_sub"    , New Structure("f_string" , "Nested value"));
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_int32s" , NumberArray);
    Data.Insert("f_int64s" , NumberArray);
    Data.Insert("f_floats" , NumberArray);
    Data.Insert("f_bytess" , BinaryDataArray);
    Data.Insert("f_subs"   , StructuresArray);
    Data.Insert("f_bools"  , BoolArray);
    Data.Insert("f_enums"  , StrSplit("ENUM_1,ENUM_2" , ","));

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("data", Data);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ExecuteMethod");

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("data", Неопределено);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ExecuteMethod", "Empty");

    Method = "HeadersUnary";
    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("data", Неопределено);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ExecuteMethod", "Meta");

EndProcedure

Procedure GRPC_GetServiceList(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];
    Scheme  = FunctionParameters["GRPC_Proto"]; // String, path to file or URL

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetServiceList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetServiceList");

EndProcedure

Procedure GRPC_GetMethodList(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];
    Scheme  = FunctionParameters["GRPC_Proto"]; // String, path to file or URL

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Service    = "grpcbin.GRPCBin";

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("service", Service);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetMethodList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetMethodList");

EndProcedure

Procedure GRPC_GetMethod(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];
    Scheme  = FunctionParameters["GRPC_Proto"]; // String, path to file or URL

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);
    Service    = "grpcbin.GRPCBin";
    Method     = "Index";

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("service", Service);
    Options.Insert("method", Method);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetMethod", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetMethod");

EndProcedure

Procedure GRPC_InitializeServerStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyServerStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeServerStream(Connection, Service, Method, Data); // <---

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    MessagesArray = New Array;

    While True Do

        CurrentMessage = OPI_GRPC.GetMessage(Connection, StreamID);

        If Not CurrentMessage["result"] Then

            Error = CurrentMessage["error"];

            If Error    = "Timeout" Then
                Continue;
            ElsIf Error = "Closed" Then
                Break;
            Else
                Raise Error;
            EndIf;

        Else

            MessageData = CurrentMessage["message"];

            If ValueIsFilled(MessageData) Then
                MessagesArray.Add(MessageData);
            EndIf;

        EndIf;

    EndDo;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result       , "GRPC", "InitializeServerStream");
    OPI_TestDataRetrieval.ProcessCLI(MessagesArray, "GRPC", "InitializeServerStream", "Array");

EndProcedure

Procedure GRPC_InitializeClientStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyClientStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeClientStream(Connection, Service, Method); // <---

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    FinalMessage = Undefined;

    Counter = 0;
    While True Do

        CurrentSend = OPI_GRPC.SendMessage(Connection, StreamID, Data);
        Counter     = Counter + 1;

        If Not CurrentSend["result"] Then

            Error = CurrentSend["error"];

            If Error         = "Timeout" Then
                Continue;
            ElsIf Error      = "Closed" Then
                FinalMessage = OPI_GRPC.GetMessage(Connection, StreamID);
                Break;
            Else
                Raise StrTemplate("%1 (sent messages %2)", Error, Counter);
            EndIf;

        Else

            If Counter       = 10 Then
                Completion   = OPI_GRPC.CompleteSend(Connection, StreamID);
                FinalMessage = OPI_GRPC.GetMessage(Connection, StreamID);
                Break;
            EndIf;

        EndIf;

    EndDo;

    // END

    OPI_TestDataRetrieval.ProcessCLI(FinalMessage, "GRPC", "InitializeClientStream", , Counter);

EndProcedure

Procedure GRPC_InitializeBidirectionalStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyBidirectionalStreamStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeBidirectionalStream(Connection, Service, Method); // <---

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    ResultArray = New Array;
    Counter     = 0;

    While Counter < 10 Do

        Data.Insert("f_int32", Counter + 1);

        CurrentSend = OPI_GRPC.SendMessage(Connection, StreamID, Data);

        If Not CurrentSend["result"] Then

            Error = CurrentSend["error"];

            If Error = "Timeout" Then
                Continue;
            Else
                 Raise StrTemplate("Send error: %1 (processed messages %2)", Error, Counter);
            EndIf;

        EndIf;

        CurrentReceive = OPI_GRPC.GetMessage(Connection, StreamID);

        If Not CurrentReceive["result"] Then
            Raise StrTemplate("Receive error: %1 (processed messages %2)", Error, Counter);
        EndIf;

        ResultArray.Add(CurrentReceive["message"]);
        Counter = Counter + 1;

    EndDo;

    OPI_GRPC.CloseStream(Connection, StreamID);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "InitializeBidirectionalStream", , ResultArray);

EndProcedure

Procedure GRPC_SendMessage(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyClientStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeClientStream(Connection, Service, Method);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result  = OPI_GRPC.SendMessage(Connection, StreamID, Data); // <---
    Closing = OPI_GRPC.CloseStream(Connection, StreamID);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "SendMessage", , Closing);

EndProcedure

Procedure GRPC_GetMessage(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyServerStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    NumberArray = New Array;
    NumberArray.Add(1);
    NumberArray.Add(10);
    NumberArray.Add(100);

    File = FunctionParameters["Document"];
    OPI_TypeConversion.GetBinaryData(File);

    TFN = GetTempFileName();
    File.Write(TFN);

    BinaryDataArray = New Array;
    BinaryDataArray.Add(File); // How Data
    BinaryDataArray.Add(TFN); // How path to file

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_int64"  , 123);
    Data.Insert("f_float"  , 123.22000122070312);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_enum"   , "ENUM_1");
    Data.Insert("f_bytes"  , File);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_int32s" , NumberArray);
    Data.Insert("f_bytess" , BinaryDataArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeServerStream(Connection, Service, Method, Data);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result  = OPI_GRPC.GetMessage(Connection, StreamID); // <---
    Closing = OPI_GRPC.CloseStream(Connection, StreamID);

    // END

    Data.Insert("f_int64s", New Array);
    Data.Insert("f_enums" , New Array);
    Data.Insert("f_floats", New Array);
    Data.Insert("f_bools" , New Array);
    Data.Insert("f_subs"  , New Array);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetMessage", , Closing, Data);

EndProcedure

Procedure GRPC_CloseStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyServerStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Result = OPI_GRPC.InitializeServerStream(Connection, Service, Method, Data);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result = OPI_GRPC.CloseStream(Connection, StreamID); // <---

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CloseStream");

    Result = OPI_GRPC.GetMessage(Connection, StreamID);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CloseStream", "Sending");

EndProcedure

Procedure GRPC_ProcessServerStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyServerStream";

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("data", Data);
    Options.Insert("tls", Tls);
    Options.Insert("count", 3);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ProcessServerStream", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ProcessServerStream");

EndProcedure

Procedure GRPC_ProcessClientStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyClientStream";

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_int32"  , 123);
    Data.Insert("f_bool"   , True);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    ArrayOfRequests = New Array;

    For N = 1 To 10 Do
        ArrayOfRequests.Add(Data);
    EndDo;

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("data", ArrayOfRequests);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ProcessClientStream", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ProcessClientStream");

    ArrayOfRequests.Delete(ArrayOfRequests.UBound());

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("data", ArrayOfRequests);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ProcessClientStream", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ProcessClientStream", "Error");

EndProcedure

Procedure GRPC_ProcessBidirectionalStream(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    StingsArray = New Array;
    StingsArray.Add("one");
    StingsArray.Add("two");
    StingsArray.Add("three");

    Data = New Map;
    Data.Insert("f_string" , "Test message");
    Data.Insert("f_bool"   , True);
    Data.Insert("f_strings", StingsArray);
    Data.Insert("f_sub"    , New Structure("f_string", "Nested value"));

    Service = "grpcbin.GRPCBin";
    Method  = "DummyBidirectionalStreamStream";

    ExchangeOrder = New Array;

    For N = 1 To 10 Do

        ExchangeOrder.Add(Data); // Single send
        ExchangeOrder.Add(Undefined); // Single get

    EndDo;

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("exch", ExchangeOrder);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ProcessBidirectionalStream", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ProcessBidirectionalStream");

EndProcedure

Procedure GRPC_CompleteSend(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"]; // String, path to file or URL
    Proto2 = FunctionParameters["GRPC_ProtoTS"]; // String, path to file or URL

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1); // Primary
    Scheme.Insert("my_types.proto", Proto2); // For import in primary

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Service = "grpcbin.GRPCBin";
    Method  = "DummyClientStream";

    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    Result = OPI_GRPC.InitializeClientStream(Connection, Service, Method);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result = OPI_GRPC.CompleteSend(Connection, StreamID);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CompleteSend");

EndProcedure

#EndRegion // GRPC

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure GR_ОсновныеМетоды() Export
    GR_CommonMethods();
EndProcedure

Procedure GR_Интроспекция() Export
    GR_Introspection();
EndProcedure

Procedure GR_Стриминг() Export
    GR_Streaming();
EndProcedure

#EndRegion
