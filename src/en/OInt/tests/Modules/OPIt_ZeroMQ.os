// OneScript: ./OInt/tests/Modules/OPIt_ZeroMQ.os

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

#Use oint
#Use asserts
#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("ZeroMQ");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("ZeroMQ");

EndFunction

#Region Internal

#Region RunnableTests

#Region ZeroMQ

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

#EndRegion // ZeroMQ

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region ZeroMQ

Procedure ZeroMQ_CreateConnectionReq(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortRep(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Result = OPI_ZeroMQ.CreateConnectionReq(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    Message = StrTemplate("ZMQ_C_REQ_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Sending = OPI_ZeroMQ.SendData(Result, Data, 3000);
    Check   = OPI_ZeroMQ.ReceiveData(ServerObject, 3000);

    // END

    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "CreateConnectionReq");
    OPI_TestDataRetrieval.Process(Check , "ZeroMQ", "CreateConnectionReq", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ServerObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_CreateConnectionSub(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortPub(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Result = OPI_ZeroMQ.CreateConnectionSub(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    OPI_ZeroMQ.Subscribe(Result, "topic.");

    // END

    OPI_Tools.Pause(1);

    Message = StrTemplate("topic.ZMQ_C_SUB_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Sending = OPI_ZeroMQ.SendData(ServerObject, Data, 3000);
    Check   = OPI_ZeroMQ.ReceiveData(Result, 3000);

    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "CreateConnectionSub");
    OPI_TestDataRetrieval.Process(Check , "ZeroMQ", "CreateConnectionSub", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ServerObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_CreateConnectionPush(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortPull(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Result = OPI_ZeroMQ.CreateConnectionPush(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    Message = StrTemplate("ZMQ_C_PUSH_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Sending = OPI_ZeroMQ.SendData(Result, Data, 3000);
    Check   = OPI_ZeroMQ.ReceiveData(ServerObject, 3000);

    // END

    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "CreateConnectionPush");
    OPI_TestDataRetrieval.Process(Check , "ZeroMQ", "CreateConnectionPush", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ServerObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_CreateConnectionPull(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortPush(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    Result = OPI_ZeroMQ.CreateConnectionPull(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    Message = StrTemplate("ZMQ_C_PULL_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Sending = OPI_ZeroMQ.SendData(ServerObject, Data, 3000);
    Check   = OPI_ZeroMQ.ReceiveData(Result, 3000);

    // END

    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "CreateConnectionPull");
    OPI_TestDataRetrieval.Process(Check , "ZeroMQ", "CreateConnectionPull", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ServerObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_BindPortRep(FunctionParameters)

    // Host
    Port = 5555;
    Result = OPI_ZeroMQ.BindPortRep(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(Result) Then
        Raise OPI_Tools.JSONString(Result);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    ClientObject = OPI_ZeroMQ.CreateConnectionReq(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_C_REP_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Sending = OPI_ZeroMQ.SendData(ClientObject, Data, 3000);
    Check   = OPI_ZeroMQ.ReceiveData(Result, 3000);

    // END

    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "BindPortRep");
    OPI_TestDataRetrieval.Process(Check , "ZeroMQ", "BindPortRep", "Check", Message);

    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(Result);

EndProcedure

Procedure ZeroMQ_BindPortPub(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortPub(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    ClientObject = OPI_ZeroMQ.CreateConnectionSub(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    OPI_ZeroMQ.Subscribe(ClientObject, "topic.");

    // END

    OPI_Tools.Pause(1);

    Message = StrTemplate("topic.ZMQ_B_PUB_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data    = GetBinaryDataFromString(Message);
    Sending = OPI_ZeroMQ.SendData(ServerObject, Data, 3000);
    Check   = OPI_ZeroMQ.ReceiveData(ClientObject, 3000);

    OPI_TestDataRetrieval.Process(ServerObject, "ZeroMQ", "BindPortPub");
    OPI_TestDataRetrieval.Process(Check       , "ZeroMQ", "BindPortPub", "Check", Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_BindPortPush(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortPush(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    ClientObject = OPI_ZeroMQ.CreateConnectionPull(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_B_PUSH_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Sending = OPI_ZeroMQ.SendData(ServerObject, Data, 3000);
    Check   = OPI_ZeroMQ.ReceiveData(ClientObject, 3000);

    // END

    OPI_TestDataRetrieval.Process(ServerObject, "ZeroMQ", "BindPortPush");
    OPI_TestDataRetrieval.Process(Check       , "ZeroMQ", "BindPortPush", "Check", Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_BindPortPull(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortPull(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    ClientObject = OPI_ZeroMQ.CreateConnectionPush(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_B_PULL_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data    = GetBinaryDataFromString(Message);
    Sending = OPI_ZeroMQ.SendData(ClientObject, Data, 3000); // SKIP
    Check   = OPI_ZeroMQ.ReceiveData(ServerObject, 3000); // SKIP

    // END

    OPI_TestDataRetrieval.Process(ServerObject, "ZeroMQ", "BindPortPull");
    OPI_TestDataRetrieval.Process(Check       , "ZeroMQ", "BindPortPull", "Check", Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_SendData(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortRep(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    ClientObject = OPI_ZeroMQ.CreateConnectionReq(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_SEND_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Result    = OPI_ZeroMQ.SendData(ClientObject, Data, 3000);
    Receiving = OPI_ZeroMQ.ReceiveData(ServerObject, 3000); // SKIP

    // END

    OPI_TestDataRetrieval.Process(Result   , "ZeroMQ", "SendData");
    OPI_TestDataRetrieval.Process(Receiving, "ZeroMQ", "SendData", "Check", Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_ProcessRequest(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortRep(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    ClientObject = OPI_ZeroMQ.CreateConnectionReq(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Request = StrTemplate("ZMQ_REQ_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss")); // SKIP
    ReqData = GetBinaryDataFromString(Request); // SKIP
    Result  = OPI_ZeroMQ.ProcessRequest(ClientObject, ReqData, 3000, 300); // SKIP

    // END

    SendingResult   = OPI_ZeroMQ.SendData(ClientObject, ReqData, 3000);
    ServerRequest   = OPI_ZeroMQ.ReceiveData(ServerObject, 3000);
    Response = StrTemplate("ZMQ_REP_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    ResponseData    = GetBinaryDataFromString(Response);
    ResponseSending = OPI_ZeroMQ.SendData(ServerObject, ResponseData, 3000);
    Result          = OPI_ZeroMQ.ReceiveData(ClientObject, 3000);

    OPI_TestDataRetrieval.Process(ServerRequest, "ZeroMQ", "ProcessRequest", "Response", Request);
    OPI_TestDataRetrieval.Process(Result       , "ZeroMQ", "ProcessRequest", "Response", Response);

    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_ReceiveData(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortRep(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    ClientObject = OPI_ZeroMQ.CreateConnectionReq(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("ZMQ_RECV_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data = GetBinaryDataFromString(Message);

    Sending = OPI_ZeroMQ.SendData(ClientObject, Data, 3000); // SKIP
    Result  = OPI_ZeroMQ.ReceiveData(ServerObject, 3000);

    // END

    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "ReceiveData", , Message);
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_Subscribe(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortPub(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    // Client
    Address = "tcp://127.0.0.1:5555";
    ClientObject = OPI_ZeroMQ.CreateConnectionSub(Address);

    If Not OPI_ZeroMQ.IsConnectorObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Prefix = "topic.";
    Message = StrTemplate("%1ZeroMQ_SUB_%2", Prefix, Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    Data   = GetBinaryDataFromString(Message);

    Result      = OPI_ZeroMQ.Subscribe(ClientObject, Prefix);
    OPI_Tools.Pause(1); // SKIP
    Sending     = OPI_ZeroMQ.SendData(ServerObject, Data, 3000); // SKIP
    Receiving   = OPI_ZeroMQ.ReceiveData(ClientObject, 3000); // SKIP
    ForeignMessage = StrTemplate("other.ZMQ_SUB_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss")); // SKIP
    ForeignData = GetBinaryDataFromString(ForeignMessage); // SKIP
    Sending2    = OPI_ZeroMQ.SendData(ServerObject, ForeignData, 3000); // SKIP
    NotArrived  = OPI_ZeroMQ.ReceiveData(ClientObject, 300); // SKIP

    // END

    OPI_TestDataRetrieval.Process(Result    , "ZeroMQ", "Subscribe");
    OPI_TestDataRetrieval.Process(Receiving , "ZeroMQ", "Subscribe", "Check", Message);
    OPI_TestDataRetrieval.Process(NotArrived, "ZeroMQ", "Subscribe", "ForeignTopic");
    OPI_ZeroMQ.CloseConnection(ClientObject);
    OPI_ZeroMQ.CloseConnection(ServerObject);

EndProcedure

Procedure ZeroMQ_CloseConnection(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortRep(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    OPI_TestDataRetrieval.Process(ServerObject, "ZeroMQ", "CloseConnection", "Openning"); // SKIP

    If OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Result = OPI_ZeroMQ.CloseConnection(ServerObject);
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "CloseConnection");

EndProcedure

Procedure ZeroMQ_IsConnectorObject(FunctionParameters)

    // Host
    Port = 5555;
    ServerObject = OPI_ZeroMQ.BindPortRep(Port);

    If Not OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Result = OPI_ZeroMQ.IsConnectorObject(ServerObject);

    // END

    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "IsConnectorObject");

    Result = OPI_ZeroMQ.IsConnectorObject("not-a-client");
    OPI_TestDataRetrieval.Process(Result, "ZeroMQ", "IsConnectorObject", "False");

    If OPI_ZeroMQ.IsConnectorObject(ServerObject) Then
        OPI_ZeroMQ.CloseConnection(ServerObject);
    EndIf;

EndProcedure

#EndRegion // ZeroMQ

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure ZMQ_МетодыПодключения() Export
    ZMQ_ConnectionMethods();
EndProcedure

Procedure ZMQ_МетодыПрослушивания() Export
    ZMQ_ListeningMethods();
EndProcedure

Procedure ZMQ_МетодыВзаимодействия() Export
    ZMQ_InteractionMethods();
EndProcedure

#EndRegion