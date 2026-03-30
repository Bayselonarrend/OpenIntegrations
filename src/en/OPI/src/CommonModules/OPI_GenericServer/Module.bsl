// OneScript: ./OInt/tools/main/Modules/OPI_GenericServer.os

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
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:QueryParseError-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:NumberOfParams-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

// #Use "./internal"

#Region Internal

Function StartServer(Val Module, Val Port, Val PoolSize = 100, Val Logging = Undefined) Export

    OPI_TypeConversion.GetNumber(Port);
    OPI_TypeConversion.GetNumber(PoolSize);

    If Logging = Undefined Then

        SettingsString = "";

    Else

        ErrorText      = "Incorrect logging settings";
        OPI_TypeConversion.GetKeyValueCollection(Logging, ErrorText);
        SettingsString = OPI_Tools.JSONString(Logging);

    EndIf;

    AddInName = Module.AddInName();
    AddIn     = OPI_AddIns.GetAddIn(AddInName);

    Result = AddIn.Start(Port, PoolSize, SettingsString);
    Result = OPI_Tools.JsonToStructure(Result, False);

    Return ?(Result["result"], AddIn, Result);

EndFunction

Function StopServer(Val Module, Val ServerObject) Export

    If Not Module.IsServerObject(ServerObject) Then

        Result = NotAddinParameterError();

    Else

        Result = ServerObject.Stop();
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    Return Result;

EndFunction

Function GetNextConnectionData(Val Module
    , Val ServerObject
    , Val Timeout = 1000
    , Val MaxSize = 8192) Export

    If Not Module.IsServerObject(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    OPI_TypeConversion.GetNumber(Timeout);
    OPI_TypeConversion.GetNumber(MaxSize);

    Result = ServerObject.GetNextMessage(Timeout, MaxSize);
    Result = OPI_Tools.JsonToStructure(Result);

    CompleteMessageWithVaultData(ServerObject, Result);

    Return Result;

EndFunction

Function GetConnectionData(Val Module
    , Val ServerObject
    , Val ConnectionID
    , Val Timeout = 1000
    , Val MaxSize = 8192) Export

    If Not Module.IsServerObject(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    OPI_TypeConversion.GetNumber(Timeout);
    OPI_TypeConversion.GetNumber(MaxSize);
    OPI_TypeConversion.GetLine(ConnectionID);

    Result = ServerObject.GetMessageFromConnection(ConnectionID, Timeout, MaxSize);
    Result = OPI_Tools.JsonToStructure(Result);

    CompleteMessageWithVaultData(ServerObject, Result);

    Return Result;

EndFunction

Function SendData(Val Module, Val ServerObject, Val ConnectionID, Val Data) Export

    If Not Module.IsServerObject(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    OPI_TypeConversion.GetBinaryData(Data, True, False);
    OPI_TypeConversion.GetLine(ConnectionID);

    Result = ServerObject.SendMessage(ConnectionID, Data);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

Function CloseIncomingConnection(Val Module, Val ServerObject, Val ConnectionID) Export

    If Not Module.IsServerObject(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionID);

    Result = ServerObject.CloseConnection(ConnectionID);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

Function CompleteSend(Val Module, Val ServerObject, Val ConnectionID) Export

    If Not Module.IsServerObject(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionID);

    Result = ServerObject.ShutdownWrite(ConnectionID);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

Function FinishReceiving(Val Module, Val ServerObject, Val ConnectionID) Export

    If Not Module.IsServerObject(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionID);

    Result = ServerObject.ShutdownRead(ConnectionID);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

Function GetConnectionList(Val Module, Val ServerObject) Export

    If Not Module.IsServerObject(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    Result = ServerObject.GetConnectionsList();
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

Function GetLog(Val Module, Val ServerObject, Val AsString = False, Val EventCount = 100) Export

    If Not Module.IsServerObject(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    OPI_TypeConversion.GetNumber(EventCount);
    OPI_TypeConversion.GetBoolean(AsString);

    Result = ServerObject.GetLogs(EventCount);
    Result = OPI_Tools.JsonToStructure(Result);

    If AsString And Result["result"] Then
        Result = StrConcat(Result["logs"], Chars.LF);
    EndIf;

    Return Result;

EndFunction

Function GetLoggingSettings(Val WriteToMemory = True
    , Val MaxEvents                           = 300
    , Val FilePath                            = "") Export

    OPI_TypeConversion.GetBoolean(WriteToMemory);
    OPI_TypeConversion.GetLine(FilePath);
    OPI_TypeConversion.GetNumber(MaxEvents);

    SettingsStructure = New Structure;
    WriteToFile       = ValueIsFilled(FilePath);

    If WriteToMemory Then
        SettingsStructure.Insert("mode"       , "memory");
        SettingsStructure.Insert("max_entries", MaxEvents);
    EndIf;

    If WriteToFile Then
        SettingsStructure.Insert("mode"     , "file");
        SettingsStructure.Insert("file_path", FilePath);
    EndIf;

    If WriteToFile And WriteToMemory Then
        SettingsStructure.Insert("mode", "both");
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction


#EndRegion

#Region Internal

Function NotAddinParameterError()

    Result = New Map;
    Result.Insert("result", False);
    Result.Insert("error" , "The passed value is not a server object");

    Return Result;

EndFunction

Procedure CompleteMessageWithVaultData(Val ServerObject, MessageStructure)

    DataKey = Undefined;

    If OPI_Tools.CollectionFieldExists(MessageStructure, "message", DataKey) And ValueIsFilled(DataKey) Then

        DataBD = OPI_AddIns.ReceiveData(ServerObject, DataKey);
        MessageStructure.Insert("message", DataBD);

    EndIf;

EndProcedure

#EndRegion
