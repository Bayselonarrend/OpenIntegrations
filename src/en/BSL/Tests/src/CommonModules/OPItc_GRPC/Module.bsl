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

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use "../../formats"
//#Use asserts
//#Use "internal"

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

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    GRPC_CreateConnection(TestParameters);
    GRPC_CloseConnection(TestParameters);
    GRPC_IsConnector(TestParameters);
    GRPC_SetMetadata(TestParameters);
    GRPC_ExecuteMethod(TestParameters);
    GRPC_GetTlsSettings(TestParameters);
    GRPC_GetConnectionParameters(TestParameters);
    GRPC_GetLoggingSettings(TestParameters);
    GRPC_GetLog(TestParameters);

EndProcedure

Procedure GR_ExtendedCheck() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    GRPC_Extended_CallMethodWithoutConnection(TestParameters);
    GRPC_Extended_ConnectionWithoutAddress(TestParameters);
    GRPC_Extended_Reconnection(TestParameters);
    GRPC_Extended_GetLogOnConnection(TestParameters);
    GRPC_Extended_CallMethodMultipleBinaryFields(TestParameters);
    GRPC_Advanced_ConnectionParameters(TestParameters);
    GRPC_Advanced_UserAgent(TestParameters);
    GRPC_Advanced_Compression(TestParameters);
    GRPC_Advanced_MaxMessageSize(TestParameters);
    GRPC_Advanced_ConnectionTimeout(TestParameters);
    GRPC_Advanced_CallTimeout(TestParameters);
    GRPC_Extended_ClientCertificate(TestParameters);

EndProcedure

Procedure GR_Introspection() Export

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    GRPC_GetServiceList(TestParameters);
    GRPC_GetMethodList(TestParameters);
    GRPC_GetMethod(TestParameters);

EndProcedure

Procedure GR_Streaming() Export

    TestParameters = OPI_TestDataRetrieval.GetTestData();
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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CreateConnection");

    Options = New Structure;
    Options.Insert("conn", Result);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CloseConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CreateConnection", "Closing");

    Address    = FunctionParameters["GRPC_AddressNoTls"];
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CreateConnection", "No TLS");

    Scheme = New Map;
    Scheme.Insert("main.proto", Proto1);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);
    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CloseConnection", Options);

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);
    Options = New Structure;
    Options.Insert("value", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "IsConnector", Options);

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
    Options.Insert("cert", "ca.pem");
    Options.Insert("clientkey", "client.key");
    Options.Insert("clientcert", "client.crt");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result
        , "GRPC"
        , "GetTlsSettings"
        ,
        "ca.pem"
        , "client.key"
        , "client.crt");

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetTlsSettings", "WithoutClient");

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    Meta   = New Structure("somekey", "somevalue");
    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("meta", Meta);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "SetMetadata", Options);

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ExecuteMethod", , Data);

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

Procedure GRPC_GetLoggingSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", GetTempFileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetLoggingSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetLoggingSettings");

    Options = New Structure;
    Options.Insert("memory", Ложь);
    Options.Insert("path", GetTempFileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetLoggingSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetLoggingSettings", "File");

    Options = New Structure;
    Options.Insert("memory", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetLoggingSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetLoggingSettings", "Memory");

EndProcedure

Procedure GRPC_GetLog(FunctionParameters)

    LogFile         = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetLoggingSettings", Options);

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);
    Options.Insert("log", LoggingSettings);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    Service = "grpcbin.GRPCBin";
    Method  = "DummyUnary";

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("service", Service);
    Options.Insert("method", Method);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "ExecuteMethod", "Select"); // SKIP

    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetLog", , LogFile);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("str", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetLog", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "GetLog", "AsString", LogFile);

EndProcedure

#Region ExtendedCheck

Procedure GRPC_Extended_CallMethodWithoutConnection(FunctionParameters)

    Connector = OPI_AddIns.GetAddIn("GRPC");
    Request   = OPI_AddIns.SerializeJanx(New Structure);
    Result    = OPI_AddIns.DesrializeJanx(Connector.Call(Request));

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_CallMethodWithoutConnection");

EndProcedure

Procedure GRPC_Extended_ConnectionWithoutAddress(FunctionParameters)

    Connector = OPI_AddIns.GetAddIn("GRPC");
    Result    = OPI_AddIns.DesrializeJanx(Connector.Connect());

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_ConnectionWithoutAddress");

EndProcedure

Procedure GRPC_Extended_Reconnection(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    Result = OPI_AddIns.DesrializeJanx(Connection.Connect());

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_Reconnection");
    OPI_GRPC.CloseConnection(Connection);

EndProcedure

Procedure GRPC_Extended_GetLogOnConnection(FunctionParameters)

    LogFile         = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetLoggingSettings", Options);

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);
    Options.Insert("log", LoggingSettings);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    OPI_GRPC.ExecuteMethod(Connection, "grpcbin.GRPCBin", "DummyUnary");

    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_GetLogOnConnection", , LogFile);
    OPI_GRPC.CloseConnection(Connection);

EndProcedure

Procedure GRPC_Extended_CallMethodMultipleBinaryFields(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    BinData = OPI_TestDataRetrieval.GetJanxTestCollection("BinariesArray");

    Data = New Map;
    Data.Insert("f_string", "janx multi-bin");
    Data.Insert("f_int32" , 7);
    Data.Insert("f_bool"  , True);
    Data.Insert("f_bytes" , BinData["chunks"][0]);
    Data.Insert("f_bytess", BinData["chunks"]);

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", "grpcbin.GRPCBin");
    Options.Insert("method", "DummyUnary");
    Options.Insert("data", Data);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_CallMethodMultipleBinaryFields", , Data);

EndProcedure

Procedure GRPC_Advanced_ConnectionParameters(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("meta", Неопределено);
    Options.Insert("ua", "OpenIntegrations");
    Options.Insert("compress", "gzip");
    Options.Insert("maxresp", 1048576);
    Options.Insert("maxreq", 2097152);
    Options.Insert("ctout", 2500);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_ConnectionParameters");

    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("compress", "br");

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_ConnectionParameters", "Compression");

    InvalidUserAgent = "bad" + Chars.LF + "agent";
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("ua", InvalidUserAgent);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_ConnectionParameters", "UserAgent");

EndProcedure

Procedure GRPC_Advanced_UserAgent(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("ua", "OpenIntegrationsTest");

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", "grpcbin.GRPCBin");
    Options.Insert("method", "HeadersUnary");
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_UserAgent", , "OpenIntegrationsTest");

    Metadata = New Map;
    Metadata.Insert("user-agent", "FromMetadataToken");

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("meta", Metadata);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", "grpcbin.GRPCBin");
    Options.Insert("method", "HeadersUnary");
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_UserAgent", "Metadata", "FromMetadataToken");

EndProcedure

Procedure GRPC_Advanced_Compression(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("compress", "gzip");

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", "grpcbin.GRPCBin");
    Options.Insert("method", "HeadersUnary");
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_Compression");

EndProcedure

Procedure GRPC_Advanced_MaxMessageSize(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);

    Data = New Structure("f_string", "size-limit-payload");

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("maxresp", 1);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", "grpcbin.GRPCBin");
    Options.Insert("method", "DummyUnary");
    Options.Insert("data", Data);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_MaxMessageSize");

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);
    Options.Insert("maxreq", 1);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("conn", Parameters);
    Options.Insert("service", "grpcbin.GRPCBin");
    Options.Insert("method", "DummyUnary");
    Options.Insert("data", Data);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_MaxMessageSize", "Request");

EndProcedure

Procedure GRPC_Advanced_ConnectionTimeout(FunctionParameters)

    Options = New Structure;
    Options.Insert("addr", "http://192.0.2.1:81");
    Options.Insert("ctout", 1000);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options.Insert("params", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_ConnectionTimeout");

EndProcedure

Procedure GRPC_Advanced_CallTimeout(FunctionParameters)

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("service", "grpcbin.GRPCBin");
    Options.Insert("method", "DummyUnary");
    Options.Insert("tout", 1);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "ExecuteMethod", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Advanced_CallTimeout");
    OPI_GRPC.CloseConnection(Connection);

EndProcedure

Procedure GRPC_Extended_ClientCertificate(FunctionParameters)

    KeyStrings = New Array;
    KeyStrings.Add("-----BEGIN PRIVATE KEY-----");
    KeyStrings.Add("MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDFviVmSJmbB+ig");
    KeyStrings.Add("TZ2d1CWHm9GmPgXVJbghj1/cfP8l5GnYUZnCxj9ZD64nT46rB7xu4Y+pVqjVnjWT");
    KeyStrings.Add("Rs4qdsVFkfmiWgkPFL/Q4Vo5INNMFSLVI1iCn/lGh/fRa65cOlCJ3Yi8mkJMPBeK");
    KeyStrings.Add("/l5RFWEFsGKp/w0xCuImviqlJHBukUHhjA2SdZ9bXs+PgAzKd1kF7Byi1P5aGv8r");
    KeyStrings.Add("ROzBAL24DVsGHaINey8TsTrBVCojjI1js5msbNiMOEN31obiiunBy+QK4yYePIVk");
    KeyStrings.Add("Id2g2+MMWdOh855I1IC5sByBbftkTpwg1pmL2UENtl7fFqLHRr6HQ+fMR3Y4ggl+");
    KeyStrings.Add("K5dsna9LAgMBAAECggEAD3trkTO7ob7qRewdxuwubgzTSs6jWpoOmG4R0Cu8jFpz");
    KeyStrings.Add("C7vugSilcBMsDFQ3Ht6cWxrE9ToIPlrEkL3j9BYtgYdu105w/sxzQjxKpJtp1RSj");
    KeyStrings.Add("OrMplxHwYfHRA4Vd9vGdOatt18UaI2mMYau4dbpp823pI6yI+18smreb6NHOuGal");
    KeyStrings.Add("hEXMW4de6CjM3EP7QbT7KxBxr2hkvmTPDect1ccswD2yqTZOHCQJ+LMm0yNMy4dI");
    KeyStrings.Add("keK4YGF90h6Of1LN1YGoayP4SgB+lt/tch3ZwVmU7AGJUFX7OCi8ZXOugxAXjQEl");
    KeyStrings.Add("mRFdm2fs1iPsSnaLNeTH8/CrD2C6Zr11wvsA91fWWQKBgQDhnNwqR00tas9CzSyC");
    KeyStrings.Add("qbz4bfOAo/Xm5xxGuLYSDB9kpKOGE6Bqf76HtT1e+Ih4AsnwH6YWPspEzkhn/zog");
    KeyStrings.Add("xA4vEeqSaVkugP9dY6rfO2vfMQMOgKmUhPr5ADKYUXDl8ICv0PetqMFqMVYQ6WcJ");
    KeyStrings.Add("AAaWjx5im0TsBwpvVRzgN4p5QwKBgQDgYFPj7QTAStQZbqzNVqgoGRE5/eLmlUSD");
    KeyStrings.Add("Nhpr3ftW/i/wIDMQCMLcESxc/PNhGLts0kUP/dxGR8R4meGyvqnNJgUNg6o3o7Lu");
    KeyStrings.Add("8NNmCyJjL6g59OVySdOQvtmGnJJT3qcz0f9EY4lQIn5eDihSBXLer0ykrcX9wmqU");
    KeyStrings.Add("m9oob0htWQKBgCFCG16MJj9kuGrzjfUxCm9g3f1/rhc8yHlQb16XtOUENCrmp8Yr");
    KeyStrings.Add("UK32tLZUUuHGH3irYbNzzCN6eUgDYtFDtYeQz5CHwSLO11YwBBdmTg+XzQiNRPJk");
    KeyStrings.Add("7A5azhqQHuF2o7HHT0ulTeXWogZaMdssysvVCzikBPP6Ubp5xIj1Bw+7AoGATYrc");
    KeyStrings.Add("0yNhhfcWT+fAzoIJQTpQisMkPF4PvGzhOrAPoaPc+1aVbxAoD5fbxhMhJUg/1b7h");
    KeyStrings.Add("YUJxctRwoOFFb9mWozBlhKMhG3N2bj9KP7TPYIni0IzDEvlSpW5fjLbllxiWnkEP");
    KeyStrings.Add("wBnKJaiWFXk9FAOQDEd27F6l0ynyXYNzJJA47pkCgYARjf3bsQEmdRRpKN/K6M5A");
    KeyStrings.Add("XujPlWQwIkSoPj7tD6+ZOO4mfZ8VJDEH4+jZm+DhQCTMPMs7xHKwaXZ6PtK5Ix6B");
    KeyStrings.Add("3PIOR6UE8CNxltgJx2fPS2X6r2hw/YJa3pvScBO0CotjP+A1pIFxWi7W1kAXNSUB");
    KeyStrings.Add("Qb6miwjiuykVqHAWAUt9fA==");
    KeyStrings.Add("-----END PRIVATE KEY-----");

    LeafStrings = New Array;
    LeafStrings.Add("-----BEGIN CERTIFICATE-----");
    LeafStrings.Add("MIIDETCCAfmgAwIBAgIUKb/KGjlhpEXP0tt0Eo9rWHx1MY0wDQYJKoZIhvcNAQEL");
    LeafStrings.Add("BQAwGDEWMBQGA1UEAwwNb3BpLW10bHMtbGVhZjAeFw0yNjExMjYyMzEyMDlaFw0z");
    LeafStrings.Add("NjExMjMyMzEyMDlaMBgxFjAUBgNVBAMMDW9waS1tdGxzLWxlYWYwggEiMA0GCSqG");
    LeafStrings.Add("SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDFviVmSJmbB+igTZ2d1CWHm9GmPgXVJbgh");
    LeafStrings.Add("j1/cfP8l5GnYUZnCxj9ZD64nT46rB7xu4Y+pVqjVnjWTRs4qdsVFkfmiWgkPFL/Q");
    LeafStrings.Add("4Vo5INNMFSLVI1iCn/lGh/fRa65cOlCJ3Yi8mkJMPBeK/l5RFWEFsGKp/w0xCuIm");
    LeafStrings.Add("viqlJHBukUHhjA2SdZ9bXs+PgAzKd1kF7Byi1P5aGv8rROzBAL24DVsGHaINey8T");
    LeafStrings.Add("sTrBVCojjI1js5msbNiMOEN31obiiunBy+QK4yYePIVkId2g2+MMWdOh855I1IC5");
    LeafStrings.Add("sByBbftkTpwg1pmL2UENtl7fFqLHRr6HQ+fMR3Y4ggl+K5dsna9LAgMBAAGjUzBR");
    LeafStrings.Add("MB0GA1UdDgQWBBQOR5ZL+ZJcMu9KQGcsoU91OnsU+DAfBgNVHSMEGDAWgBQOR5ZL");
    LeafStrings.Add("+ZJcMu9KQGcsoU91OnsU+DAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUA");
    LeafStrings.Add("A4IBAQCEPRasDY6K8N6XVnokH0pzevjKAjqWJGXY9txAsA4fPX2t/h2ReGmlOZDF");
    LeafStrings.Add("+aCjP49KxIUdGt9RiWAWQCOP+E9EQYvz50qG65xu/oCQ1dqbENyC3mfS4W37QRQb");
    LeafStrings.Add("0zY+CvZtyXijQwkpkiMmIjs56KYqkQjmxGMWuQnxlRunE6k3B5erBNapiyutKI0M");
    LeafStrings.Add("LaMk+WXTpz1UZFOR142iVV4olWvAT1T2yA9pwWsdNZziilmJJYi5f7qtJZrgKRzg");
    LeafStrings.Add("uPkid+nv5dmhE7SjCX6D2nusqYtvzsNOCoe69lbfM9TsZtSkKw7WGb4YIAQnT7Qs");
    LeafStrings.Add("9kDbQ5FemaAIcxW37XBGZW7OOoKU");
    LeafStrings.Add("-----END CERTIFICATE-----");

    OtherStrings = New Array;
    OtherStrings.Add("-----BEGIN CERTIFICATE-----");
    OtherStrings.Add("MIIDEzCCAfugAwIBAgIULj/kN0bH+57cZ4k6F9r4oz2v/gwwDQYJKoZIhvcNAQEL");
    OtherStrings.Add("BQAwGTEXMBUGA1UEAwwOb3BpLW10bHMtb3RoZXIwHhcNMjYxMTI2MjMxMjA5WhcN");
    OtherStrings.Add("MzYxMTIzMjMxMjA5WjAZMRcwFQYDVQQDDA5vcGktbXRscy1vdGhlcjCCASIwDQYJ");
    OtherStrings.Add("KoZIhvcNAQEBBQADggEPADCCAQoCggEBANZqBbQR5WO/+3td1SgQk/G8M01d845X");
    OtherStrings.Add("7QBAQV/v3WHPjn+olktwg4l2mGcglmVmHMmS6glwgnKjpVA/uqUT7WkL8SvNXanh");
    OtherStrings.Add("sGFNbN81yDYK+HbbG1qGCGnLcDTDTLLnLw/maOOaDk46X+c12TRFR5x+00TOcpvw");
    OtherStrings.Add("/PsOeXyFo3RsrCg6Ir/gaDpZ0iIagTy1x8gQJhBL+BLTSrn5YX6KKQKDuRCjleum");
    OtherStrings.Add("fU0pm+riSVlx/qdXbd9VpZ0b3VsLtoV/zwrnY0beoyuGH3F9ukccihc3a9wJ+iOa");
    OtherStrings.Add("PombWRUbB/C/UViwHqD9KYnMorHLIdxvaMLh7qcFXnyDdNwjJz9EVykCAwEAAaNT");
    OtherStrings.Add("MFEwHQYDVR0OBBYEFFXE2vvHrtlDyqDl6VYTHJgAcXHmMB8GA1UdIwQYMBaAFFXE");
    OtherStrings.Add("2vvHrtlDyqDl6VYTHJgAcXHmMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEL");
    OtherStrings.Add("BQADggEBABGcU4DQWu0NMaQPnUpBmaV/q04pPcI/pB7Zn52KrtIjRjQtrNLcK+qn");
    OtherStrings.Add("5pkvAxL1oSv+j9IFYizUYU9rmvvOMnwwok2Uoik7pON5E2/HlNR8P7FSljoJpdBw");
    OtherStrings.Add("MFNurAkjRCp4B3I9HjzOpx3/eDWJSs8vsyZC8A+sXfyfrC5nLGO0hSMYBKhbSeVS");
    OtherStrings.Add("venmkXmDKljExr/SZWNYX4hMaiPxuPiAG6tgSqCK/3fINgXhtoxmuciuzCT6TaqR");
    OtherStrings.Add("h+gVW2JMtmacQgK7po440qChYYb2EtZ7Lmno0F5Uh2Cv1N9dALPNWMbioIiDlG0w");
    OtherStrings.Add("1V/aZyEy9+ENlDl3bCkPZUxTHCPK2FA=");
    OtherStrings.Add("-----END CERTIFICATE-----");

    KeyText      = StrConcat(KeyStrings , Chars.LF) + Chars.LF;
    LeafText     = StrConcat(LeafStrings , Chars.LF);
    OtherText    = StrConcat(OtherStrings, Chars.LF);
    ChainText    = LeafText + Chars.LF + OtherText + Chars.LF;
    ReversedText = OtherText + Chars.LF + LeafText + Chars.LF;

    CipherStrings = New Array;
    CipherStrings.Add("-----BEGIN ENCRYPTED PRIVATE KEY-----");
    CipherStrings.Add("not-a-real-key");
    CipherStrings.Add("-----END ENCRYPTED PRIVATE KEY-----");
    CipherText    = StrConcat(CipherStrings, Chars.LF) + Chars.LF;

    KeyPath         = GetTempFileName("key");
    CertificatePath = GetTempFileName("crt");

    GetBinaryDataFromString(KeyText  , TextEncoding.UTF8, False).Write(KeyPath);
    GetBinaryDataFromString(ChainText, TextEncoding.UTF8, False).Write(CertificatePath);

    Address = FunctionParameters["GRPC_Address"];

    Proto1 = FunctionParameters["GRPC_ProtoImport"];
    Proto2 = FunctionParameters["GRPC_ProtoTS"];

    Scheme = New Map;
    Scheme.Insert("main.proto"    , Proto1);
    Scheme.Insert("my_types.proto", Proto2);

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("proto", Scheme);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetConnectionParameters", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);
    Options.Insert("cert", "");
    Options.Insert("clientkey", KeyPath);
    Options.Insert("clientcert", CertificatePath);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_ClientCertificate");
    OPI_GRPC.CloseConnection(Result);

    GetBinaryDataFromString("not a pem certificate", TextEncoding.UTF8, False).Write(CertificatePath);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_ClientCertificate", "Repeat");

    GetBinaryDataFromString(ReversedText, TextEncoding.UTF8, False).Write(CertificatePath);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_ClientCertificate", "Order");

    Options = New Structure;
    Options.Insert("trust", Истина);
    Options.Insert("cert", "");
    Options.Insert("clientkey", KeyPath);
    Options.Insert("clientcert", "");

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_ClientCertificate", "OnlyKey");

    Options = New Structure;
    Options.Insert("trust", Истина);
    Options.Insert("cert", "");
    Options.Insert("clientkey", "");
    Options.Insert("clientcert", CertificatePath);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_ClientCertificate", "OnlyCertificate");

    MissingPath = CertificatePath + ".missing";
    Options = New Structure;
    Options.Insert("trust", Истина);
    Options.Insert("cert", "");
    Options.Insert("clientkey", KeyPath);
    Options.Insert("clientcert", MissingPath);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result
        , "GRPC"
        , "Extended_ClientCertificate"
        , "File"
        , MissingPath);

    GetBinaryDataFromString(CipherText , TextEncoding.UTF8, False).Write(KeyPath);
    GetBinaryDataFromString(ChainText  , TextEncoding.UTF8, False).Write(CertificatePath);
    Options = New Structure;
    Options.Insert("trust", Истина);
    Options.Insert("cert", "");
    Options.Insert("clientkey", KeyPath);
    Options.Insert("clientcert", CertificatePath);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetTlsSettings", Options);
    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "Extended_ClientCertificate", "Encrypted");

    DeleteFiles(KeyPath);
    DeleteFiles(CertificatePath);

EndProcedure

#EndRegion // ExtendedCheck

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);
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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);
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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);
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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

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

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("service", Service);
    Options.Insert("method", Method);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "InitializeClientStream", Options);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result  = OPI_GRPC.SendMessage(Connection, StreamID, Data); // <---
    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("stream", StreamID);

    Closing = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CloseStream", Options);

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

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

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("data", Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "InitializeServerStream", Options);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result  = OPI_GRPC.GetMessage(Connection, StreamID); // <---
    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("stream", StreamID);

    Closing = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CloseStream", Options);

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

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

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("service", Service);
    Options.Insert("method", Method);
    Options.Insert("data", Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "InitializeServerStream", Options);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Result = OPI_GRPC.CloseStream(Connection, StreamID); // <---

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GRPC", "CloseStream");

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("stream", StreamID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "GetMessage", Options);

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

    Options = New Structure;
    Options.Insert("params", Parameters);
    Options.Insert("tls", Tls);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CreateConnection", Options);

    If Not OPI_GRPC.IsConnector(Connection) Then
        Raise Connection["error"];
    EndIf;

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("service", Service);
    Options.Insert("method", Method);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "InitializeClientStream", Options);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("stream", StreamID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("grpc", "CompleteSend", Options);

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

Procedure GR_РасширеннаяПроверка() Export
    GR_ExtendedCheck();
EndProcedure

Procedure GR_Интроспекция() Export
    GR_Introspection();
EndProcedure

Procedure GR_Стриминг() Export
    GR_Streaming();
EndProcedure

#EndRegion
