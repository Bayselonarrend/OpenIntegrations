// OneScript: ./OInt/tests/Modules/OPItc_ZeroMQ.os

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
//@skip-check use-non-recommended-method

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use "../../formats"
//#Use asserts
//#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("ZeroMQ");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("ZeroMQ");

EndFunction

#Region Internal

#Region RunnableTests

#Region ZeroMQ

Procedure ZMQ_Common() Export

    TestParameters = New Structure;

    ZeroMQ_GetLoggingSettings(TestParameters);
    ZeroMQ_GetLog(TestParameters);

EndProcedure

Procedure ZMQ_ConnectionMethods() Export

    TestParameters = New Structure;

    ZeroMQ_CreateConnectionReq(TestParameters);
    ZeroMQ_CreateConnectionSub(TestParameters);
    ZeroMQ_CreateConnectionPush(TestParameters);
    ZeroMQ_CreateConnectionPull(TestParameters);

EndProcedure

Procedure ZMQ_ListeningMethods() Export

    TestParameters = New Structure;

    ZeroMQ_BindPortRep(TestParameters);
    ZeroMQ_BindPortPub(TestParameters);
    ZeroMQ_BindPortPush(TestParameters);
    ZeroMQ_BindPortPull(TestParameters);

EndProcedure

Procedure ZMQ_InteractionMethods() Export

    TestParameters = New Structure;

    ZeroMQ_SendData(TestParameters);
    ZeroMQ_ReceiveData(TestParameters);
    ZeroMQ_ProcessRequest(TestParameters);
    ZeroMQ_Subscribe(TestParameters);
    ZeroMQ_CloseConnection(TestParameters);
    ZeroMQ_IsConnectorObject(TestParameters);

EndProcedure

Procedure ZMQ_ExtendedCheck() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;

    ZeroMQ_Extended_GetTimeoutData(TestParameters);
    ZeroMQ_Extended_HandleTimeoutRequest(TestParameters);
    ZeroMQ_Extended_GetLogOnPortOpening(TestParameters);
    ZeroMQ_Extended_JanxCollectionExchange(TestParameters);

EndProcedure

#EndRegion // ZeroMQ

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region ZeroMQ

Procedure ZeroMQ_CreateConnectionReq(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    Message = StrTemplate("ZMQ_C_REQ_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("conn", Result);
    Options.Insert("data", Data);
    Options.Insert("tout", 3000);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("tout", 3000);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "CreateConnectionReq");
    OPI_TestDataRetrieval.ProcessCLI(Check , "ZeroMQ", "CreateConnectionReq", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ServerObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_CreateConnectionSub(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortPub", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionSub", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    OPI_ZeroMQ.Subscribe(Result, "topic.");

    // END

    OPI_Tools.Pause(1);

    Message = StrTemplate("topic.ZMQ_C_SUB_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("data", Data);
    Options.Insert("tout", 3000);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", Result);
    Options.Insert("tout", 3000);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "CreateConnectionSub");
    OPI_TestDataRetrieval.ProcessCLI(Check , "ZeroMQ", "CreateConnectionSub", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ServerObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_CreateConnectionPush(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortPull", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionPush", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    Message = StrTemplate("ZMQ_C_PUSH_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("conn", Result);
    Options.Insert("data", Data);
    Options.Insert("tout", 3000);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("tout", 3000);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "CreateConnectionPush");
    OPI_TestDataRetrieval.ProcessCLI(Check , "ZeroMQ", "CreateConnectionPush", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ServerObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_CreateConnectionPull(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortPush", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionPull", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    Message = StrTemplate("ZMQ_C_PULL_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("data", Data);
    Options.Insert("tout", 3000);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", Result);
    Options.Insert("tout", 3000);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "CreateConnectionPull");
    OPI_TestDataRetrieval.ProcessCLI(Check , "ZeroMQ", "CreateConnectionPull", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ServerObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_BindPortRep(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_C_REP_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("data", Data);
    Options.Insert("tout", 3000);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", Result);
    Options.Insert("tout", 3000);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "BindPortRep");
    OPI_TestDataRetrieval.ProcessCLI(Check , "ZeroMQ", "BindPortRep", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_BindPortPub(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortPub", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionSub", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    OPI_ZeroMQ.Subscribe(ClientObject, "topic.");

    // END

    OPI_Tools.Pause(1);

    Message = StrTemplate("topic.ZMQ_B_PUB_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data    = GetBinaryDataFromString(Message);
    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("data", Data);
    Options.Insert("tout", 3000);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("tout", 3000);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    OPI_TestDataRetrieval.ProcessCLI(ServerObject, "ZeroMQ", "BindPortPub");
    OPI_TestDataRetrieval.ProcessCLI(Check       , "ZeroMQ", "BindPortPub", "Check", Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_BindPortPush(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortPush", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionPull", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_B_PUSH_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("data", Data);
    Options.Insert("tout", 3000);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("tout", 3000);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(ServerObject, "ZeroMQ", "BindPortPush");
    OPI_TestDataRetrieval.ProcessCLI(Check       , "ZeroMQ", "BindPortPush", "Check", Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_BindPortPull(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortPull", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionPush", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_B_PULL_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data    = GetBinaryDataFromString(Message);
    Sending = OPI_ZeroMQ.SendData(ClientObject, Data, 3000); // SKIP
    Check   = OPI_ZeroMQ.ReceiveData(ServerObject, 3000); // SKIP

    // END

    OPI_TestDataRetrieval.ProcessCLI(ServerObject, "ZeroMQ", "BindPortPull");
    OPI_TestDataRetrieval.ProcessCLI(Check       , "ZeroMQ", "BindPortPull", "Check", Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_SendData(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_SEND_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("data", Data);
    Options.Insert("tout", 3000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Receiving = OPI_ZeroMQ.ReceiveData(ServerObject, 3000); // SKIP

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result    , "ZeroMQ", "SendData");
    OPI_TestDataRetrieval.ProcessCLI(Receiving , "ZeroMQ", "SendData", "Check", Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_ProcessRequest(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Request = StrTemplate("ZMQ_REQ_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss")); // SKIP
    ReqData = GetBinaryDataFromString(Request); // SKIP
    Result  = OPI_ZeroMQ.ProcessRequest(ClientObject, ReqData, 3000, 300); // SKIP

    // END

    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("data", ReqData);
    Options.Insert("tout", 3000);

    SendingResult = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("tout", 3000);

    ServerRequest = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);
    Response = StrTemplate("ZMQ_REP_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    ResponseData    = GetBinaryDataFromString(Response);
    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("data", ResponseData);
    Options.Insert("tout", 3000);

    ResponseSending = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "SendData", Options);
    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("tout", 3000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    OPI_TestDataRetrieval.ProcessCLI(ServerRequest, "ZeroMQ", "ProcessRequest", "Response", Request);
    OPI_TestDataRetrieval.ProcessCLI(Result       , "ZeroMQ", "ProcessRequest", "Response", Response);

    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_ReceiveData(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_RECV_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Sending = OPI_ZeroMQ.SendData(ClientObject, Data, 3000); // SKIP
    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("tout", 3000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "ReceiveData", , Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_Subscribe(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortPub", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionSub", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Prefix = "topic.";
    Message = StrTemplate("%1ZeroMQ_SUB_%2", Prefix, Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data   = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("prefix", Prefix);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "Subscribe", Options);
    OPI_Tools.Pause(1); // SKIP
    Sending     = OPI_ZeroMQ.SendData(ServerObject, Data, 3000); // SKIP
    Receiving   = OPI_ZeroMQ.ReceiveData(ClientObject, 3000); // SKIP
    ForeignMessage = StrTemplate("other.ZMQ_SUB_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss")); // SKIP
    ForeignData = GetBinaryDataFromString(ForeignMessage); // SKIP
    Sending2    = OPI_ZeroMQ.SendData(ServerObject, ForeignData, 3000); // SKIP
    NotArrived  = OPI_ZeroMQ.ReceiveData(ClientObject, 300); // SKIP

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result     , "ZeroMQ", "Subscribe");
    OPI_TestDataRetrieval.ProcessCLI(Receiving  , "ZeroMQ", "Subscribe", "Check", Message);
    OPI_TestDataRetrieval.ProcessCLI(NotArrived , "ZeroMQ", "Subscribe", "ForeignTopic");
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_CloseConnection(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    OPI_TestDataRetrieval.ProcessCLI(ServerObject, "ZeroMQ", "CloseConnection", "Openning"); // SKIP

    If OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Options = New Structure;
        Options.Insert("conn", ServerObject);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CloseConnection", Options);
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "CloseConnection");

EndProcedure

Procedure ZeroMQ_IsConnectorObject(FunctionParameters)

    // Host
    Port = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Options = New Structure;
    Options.Insert("value", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "IsConnectorObject", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "IsConnectorObject");

    Options = New Structure;
    Options.Insert("value", "not-a-client");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "IsConnectorObject", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "IsConnectorObject", "False");

    If OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        OPI_ZeroMQ.CloseConnection(ServerObject);
    EndIf;

EndProcedure

Procedure ZeroMQ_GetLog(FunctionParameters)

    LogFile         = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "GetLoggingSettings", Options);

    Port         = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Address    = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("log", LoggingSettings);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    Message = StrTemplate("ZMQ_LOG_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    OPI_ZeroMQ.SendData(Connection, Data, 3000);
    OPI_ZeroMQ.ReceiveData(ServerObject, 3000);

    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "GetLog", , LogFile);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("str", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "GetLog", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "GetLog", "AsString", LogFile);

    OPI_ZeroMQ.CloseConnection(Connection);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_GetLoggingSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", GetTempFileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "GetLoggingSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "GetLoggingSettings");

    Options = New Structure;
    Options.Insert("memory", Ложь);
    Options.Insert("path", GetTempFileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "GetLoggingSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "GetLoggingSettings", "File");

    Options = New Structure;
    Options.Insert("memory", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "GetLoggingSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "GetLoggingSettings", "Memory");

EndProcedure

#Region ExtendedCheck

Procedure ZeroMQ_Extended_GetTimeoutData(FunctionParameters)

    Port         = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("tout", 300);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "Extended_GetTimeoutData");
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_Extended_HandleTimeoutRequest(FunctionParameters)

    Port         = 5555;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Address      = "tcp://127.0.0.1:5555";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Request = StrTemplate("ZMQ_REQ_TO_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    ReqData = GetBinaryDataFromString(Request);
    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("data", ReqData);
    Options.Insert("treq", 3000);
    Options.Insert("trep", 300);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ProcessRequest", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "Extended_HandleTimeoutRequest");
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_Extended_GetLogOnPortOpening(FunctionParameters)

    LogFile         = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "GetLoggingSettings", Options);
    Port            = 5555;
    Address         = "tcp://127.0.0.1:5555";

    Options = New Structure;
    Options.Insert("port", Port);
    Options.Insert("log", LoggingSettings);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_LOG_BIND_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    OPI_ZeroMQ.SendData(ClientObject, Data, 3000);
    OPI_ZeroMQ.ReceiveData(ServerObject, 3000);

    Options = New Structure;
    Options.Insert("conn", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "ZeroMQ", "Extended_GetLogOnPortOpening", , LogFile);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_Extended_JanxCollectionExchange(FunctionParameters)

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("MultipleBinaries");
    Options = New Structure;
    Options.Insert("value", Original);

    JanxData = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    Port         = 5560;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "BindPortRep", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Address      = "tcp://127.0.0.1:5560";
    Options = New Structure;
    Options.Insert("addr", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "CreateConnectionReq", Options);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    OPI_ZeroMQ.SendData(ClientObject, JanxData             , 3000);
    Options = New Structure;
    Options.Insert("conn", ServerObject);
    Options.Insert("tout", 3000);

    ServerRequest = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);
    OPI_ZeroMQ.SendData(ServerObject, ServerRequest["data"], 3000);
    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("tout", 3000);

    ClientResponse = OPI_TestDataRetrieval.ExecuteTestCLI("zeromq", "ReceiveData", Options);
    Options = New Structure;
    Options.Insert("data", ClientResponse);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(ClientResponse, "ZeroMQ", "Extended_JanxCollectionExchange", , Restored, Original, JanxData);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

#EndRegion // ExtendedCheck

#EndRegion // ZeroMQ

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure ZMQ_Общие() Export
    ZMQ_Common();
EndProcedure

Procedure ZMQ_МетодыПодключения() Export
    ZMQ_ConnectionMethods();
EndProcedure

Procedure ZMQ_МетодыПрослушивания() Export
    ZMQ_ListeningMethods();
EndProcedure

Procedure ZMQ_МетодыВзаимодействия() Export
    ZMQ_InteractionMethods();
EndProcedure

Procedure ZMQ_РасширеннаяПроверка() Export
    ZMQ_ExtendedCheck();
EndProcedure

#EndRegion
