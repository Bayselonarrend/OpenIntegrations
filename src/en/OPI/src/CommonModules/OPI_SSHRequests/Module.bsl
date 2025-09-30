// OneScript: ./OInt/tools/Modules/OPI_SSHRequests.os

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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

// Uncomment if OneScript is executed
// #Use "./internal"

#Region Internal

Function CreateConnection(Val SSHSettings, Val Proxy = "") Export

    Result_ = "result";

    If IsConnector(SSHSettings) Then
        Return SSHSettings;
    EndIf;

    Connector = OPI_AddIns.GetAddIn("SSH");

    ConfigureSetup = SetSettings(Connector, SSHSettings);

    If Not OPI_Tools.GetOr(ConfigureSetup, Result_, False) Then
        Return ConfigureSetup;
    EndIf;

    ProxySetup = SetProxy(Connector, Proxy);

     If Not OPI_Tools.GetOr(ProxySetup, Result_, False) Then
        Return ProxySetup;
    EndIf;

    Result = Connector.Connect();
    Result = OPI_Tools.JsonToStructure(Result);

    Return ?(Result[Result_], Connector, Result);

EndFunction

Function GetConnectionConfiguration(Val SSHSettings, Val Proxy = Undefined) Export

    ConfigurationStructure = New Structure;

    OPI_Tools.AddField("set"  , SSHSettings, "Collection", ConfigurationStructure);
    OPI_Tools.AddField("proxy", Proxy      , "Collection", ConfigurationStructure);

    Return ConfigurationStructure;

EndFunction

Function ExecuteCommand(Val Connection, Val Command) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Command);

        Result = Connection.Execute(Command);
        Result = OPI_Tools.JsonToStructure(Result);

        Output = Result["stdout"];

        If Output <> Undefined Then
            If StrEndsWith(Output, Chars.LF) Then
                Result["stdout"] = Left(Output, StrLen(Output) - 1);
            EndIf;
        EndIf;

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

Function CloseConnection(Val Connection) Export

    CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    EndIf;

    Result = Connection.Disconnect();
    Result = OPI_Tools.JsonToStructure(Result);

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_SSH.Main";

EndFunction

Function GetSettingsLoginPassword(Val Host, Val Port, Val Login, Val Password = "") Export

    String_ = "String";

    ConfigurationStructure = New Structure;
    OPI_Tools.AddField("auth_type", "password", String_  , ConfigurationStructure);
    OPI_Tools.AddField("host"     , Host      , String_  , ConfigurationStructure);
    OPI_Tools.AddField("port"     , Port      , "Number" , ConfigurationStructure);
    OPI_Tools.AddField("username" , Login     , String_  , ConfigurationStructure);
    OPI_Tools.AddField("password" , Password  , String_  , ConfigurationStructure);

    Return ConfigurationStructure;

EndFunction

Function GetSettingsPrivateKey(Val Host
    , Val Port
    , Val Login
    , Val Private
    , Val Public   = ""
    , Val Password = "") Export

    String_ = "String";

    OPI_TypeConversion.GetFileOnDisk(Private);
    Private_ = Private.Path;

    If ValueIsFilled(Public) Then
        OPI_TypeConversion.GetFileOnDisk(Public);
        Public_ = Public.Path;
    Else
        Public_ = Undefined;
    EndIf;

    ConfigurationStructure = New Structure;
    OPI_Tools.AddField("auth_type" , "private_key" , String_ , ConfigurationStructure);
    OPI_Tools.AddField("host"      , Host          , String_ , ConfigurationStructure);
    OPI_Tools.AddField("port"      , Port          , "Number", ConfigurationStructure);
    OPI_Tools.AddField("username"  , Login         , String_ , ConfigurationStructure);
    OPI_Tools.AddField("key_path"  , Private_      , String_ , ConfigurationStructure);
    OPI_Tools.AddField("pub_path"  , Public_       , String_ , ConfigurationStructure);
    OPI_Tools.AddField("passphrase", Password      , String_ , ConfigurationStructure);

    Return ConfigurationStructure;

EndFunction

Function GetSettingsViaAgent(Val Host, Val Port, Val Login) Export

    String_ = "String";

    ConfigurationStructure = New Structure;
    OPI_Tools.AddField("auth_type" , "agent", String_ , ConfigurationStructure);
    OPI_Tools.AddField("host"      , Host   , String_ , ConfigurationStructure);
    OPI_Tools.AddField("port"      , Port   , "Number", ConfigurationStructure);
    OPI_Tools.AddField("username"  , Login  , String_ , ConfigurationStructure);

    Return ConfigurationStructure;

EndFunction

Function GetProxySettings(Val Address
    , Val Port
    , Val View     = "socks5"
    , Val Login    = Undefined
    , Val Password = Undefined) Export

    //@skip-check constructor-function-return-section
    Return OPI_AddIns.GetProxySettings(Address, Port, View, Login, Password);

EndFunction

#EndRegion

#Region Private

Function CheckCreateConnection(Connection)

    If Not IsConnector(Connection) Then

        CloseConnection = True;
        Connection      = CreateConnectionByConfiguration(Connection);

    Else
        CloseConnection = False;
    EndIf;

    Return CloseConnection;

EndFunction

Function CreateConnectionByConfiguration(Val ConfigurationStructure)

    If IsConnector(ConfigurationStructure) Then
        Return ConfigurationStructure;
    EndIf;

    ErrorPattern = "Incorrect connection configuration provided: %1";

    Try
        OPI_TypeConversion.GetKeyValueCollection(ConfigurationStructure);
    Except

        Result = New Map;
        Result.Insert("result", False);
        Result.Insert("error" , StrTemplate(ErrorPattern, ErrorDescription()));
        Return Result;

    EndTry;

    If Not OPI_Tools.CollectionFieldExists(ConfigurationStructure, "set") Then

        Result = New Map;
        Result.Insert("result", False);
        Result.Insert("error" , StrTemplate(ErrorPattern, "missing main connection parameters"));
        Return Result;

    EndIf;

    SSHSettings = ConfigurationStructure["set"];
    Proxy       = OPI_Tools.GetOr(ConfigurationStructure, "proxy", Undefined);

    Return CreateConnection(SSHSettings, Proxy);

EndFunction

Function SetSettings(Val Connector, Val SSHSettings)

    ErrorPattern = "Incorrect connection configuration provided: %1";

    Try
        OPI_TypeConversion.GetKeyValueCollection(SSHSettings);
    Except

        Result = New Map;
        Result.Insert("result", False);
        Result.Insert("error" , StrTemplate(ErrorPattern, ErrorDescription()));
        Return Result;

    EndTry;

    SettingsString = OPI_Tools.JSONString(SSHSettings);

    Result = Connector.SetSettings(SettingsString);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

Function SetProxy(Val Connector, Val Proxy)

    If Not ValueIsFilled(Proxy) Then
        Return New Structure("result", True);
    EndIf;

    ErrorPattern = "Incorrect proxy configuration passed: %1";

    Try
        OPI_TypeConversion.GetKeyValueCollection(Proxy);
    Except

        Result = New Map;
        Result.Insert("result", False);
        Result.Insert("error" , StrTemplate(ErrorPattern, ErrorDescription()));
        Return Result;

    EndTry;

    ProxyString = OPI_Tools.JSONString(Proxy);

    Result = Connector.SetProxy(ProxyString);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

#EndRegion
