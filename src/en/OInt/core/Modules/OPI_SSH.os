// OneScript: ./OInt/core/Modules/OPI_SSH.os
// Lib: SSH
// CLI: ssh
// Keywords: ssh, shell

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
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

#Region Public

#Region CommonMethods

// Create Connection !NOCLI
// Creates a new SSH session
//
// Note
// Get the connection configuration using the functions `GetSettingsLoginPassword`,^^
// `GetSettingsPrivateKey`, `GetSettingsViaAgent`
//
// Parameters:
// SSHSettings - Structure Of KeyAndValue - Connection settings structure - set
// Proxy - Structure Of KeyAndValue - Proxy settings structure, if necessary - proxy
//
// Returns:
// Arbitrary, Map of KeyAndValue - Create Connection
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

// Get connection configuration
// Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions
//
// Note
// Can be passed as the `Connection` parameter in other functions instead of the actual connection from the `CreateConnection` function.
// At the same time, a new connection will be opened and closed within the called function
// It is not recommended to use the connection configuration for multiple requests to the SSH server.^^
// This functionality is primarily intended for the CLI version of OInt, where maintaining a connection between calls is not possible
//
// Parameters:
// SSHSettings - Structure Of KeyAndValue - SSH settings - set
// Proxy - Structure Of KeyAndValue - Proxy settings, if required. See GetProxySettings - proxy
//
// Returns:
// Structure Of KeyAndValue - Connection settings structure
Function GetConnectionConfiguration(Val SSHSettings, Val Proxy = Undefined) Export

    ConfigurationStructure = New Structure;

    OPI_Tools.AddField("set"  , SSHSettings, "Collection", ConfigurationStructure);
    OPI_Tools.AddField("proxy", Proxy      , "Collection", ConfigurationStructure);

    Return ConfigurationStructure;

EndFunction

// Execute command
// Executes the specified command
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Command - String - Command text - comm
//
// Returns:
// Map Of KeyAndValue - Processing result
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

// Close connection !NOCLI
// Explicitly closes the passed connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - conn
//
// Returns:
// Structure Of KeyAndValue - Result of connection termination
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

// Is connector !NOCLI
// Checks that the value is an object of an external component for working with SSH
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_SSH.Main";

EndFunction

// Get settings (login/password)
// Gets connection settings with login and password authentication
//
// Parameters:
// Host - String - SSH host - host
// Port - Number - SSH port - port
// Login - String - SSH username - user
// Password - String - SSH user password - pass
//
// Returns:
// Structure Of KeyAndValue - Connection configuration
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

// Get settings (private key)
// Gets connection settings with private key authentication
//
// Parameters:
// Host - String - SSH host - host
// Port - Number - SSH port - port
// Login - String - SSH username - user
// Private - String - Path to private key file - key
// Public - String - Path to public key file - pub
// Password - String - Private key password (passphrase) - pass
//
// Returns:
// Structure Of KeyAndValue - Connection configuration
Function GetSettingsPrivateKey(Val Host
    , Val Port
    , Val Login
    , Val Private
    , Val Public = ""
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

// Get settings (via agent)
// Gets connection settings with SSH Agent authentication
//
// Parameters:
// Host - String - SSH host - host
// Port - Number - SSH port - port
// Login - String - SSH username - user
//
// Returns:
// Structure Of KeyAndValue - Connection configuration
Function GetSettingsViaAgent(Val Host, Val Port, Val Login) Export

    String_ = "String";

    ConfigurationStructure = New Structure;
    OPI_Tools.AddField("auth_type" , "agent", String_ , ConfigurationStructure);
    OPI_Tools.AddField("host"      , Host   , String_ , ConfigurationStructure);
    OPI_Tools.AddField("port"      , Port   , "Number", ConfigurationStructure);
    OPI_Tools.AddField("username"  , Login  , String_ , ConfigurationStructure);

    Return ConfigurationStructure;

EndFunction

// Get proxy settings
// Creates a structure of proxy server settings for the connection
//
// Parameters:
// Address - String - Proxy address - addr
// Port - Number - Proxy port - port
// View - String - Proxy type: socks5, socks4, http - type
// Login - String, Undefined - Authorization login, if required - login
// Password - String, Undefined - Authorization password, if required - pass
//
// Returns:
// Structure Of KeyAndValue - Proxy settings structure
Function GetProxySettings(Val Address
    , Val Port
    , Val View = "socks5"
    , Val Login = Undefined
    , Val Password = Undefined) Export

    //@skip-check constructor-function-return-section
    Return OPI_AddIns.GetProxySettings(Address, Port, View, Login, Password);

EndFunction

#EndRegion

#EndRegion

#Region Private

Function CheckCreateConnection(Connection)

    If Not IsConnector(Connection) Then

        CloseConnection = True;
        Connection      = CreateConnection(Connection);

    Else
        CloseConnection = False;
    EndIf;

    Return CloseConnection;

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

#Region Alternate

Function ОткрытьСоединение(Val НастройкиSSH, Val Прокси = "") Export
	Return CreateConnection(НастройкиSSH, Прокси);
EndFunction

Function ПолучитьКонфигурациюСоединения(Val НастройкиSSH, Val Прокси = Undefined) Export
	Return GetConnectionConfiguration(НастройкиSSH, Прокси);
EndFunction

Function ВыполнитьКоманду(Val Соединение, Val Команда) Export
	Return ExecuteCommand(Соединение, Команда);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
	Return CloseConnection(Соединение);
EndFunction

Function ЭтоКоннектор(Val Значение) Export
	Return IsConnector(Значение);
EndFunction

Function ПолучитьНастройкиЛогинПароль(Val Хост, Val Порт, Val Логин, Val Пароль = "") Export
	Return GetSettingsLoginPassword(Хост, Порт, Логин, Пароль);
EndFunction

Function ПолучитьНастройкиПриватныйКлюч(Val Хост, Val Порт, Val Логин, Val Приватный, Val Публичный = "", Val Пароль = "") Export
	Return GetSettingsPrivateKey(Хост, Порт, Логин, Приватный, Публичный, Пароль);
EndFunction

Function ПолучитьНастройкиЧерезАгента(Val Хост, Val Порт, Val Логин) Export
	Return GetSettingsViaAgent(Хост, Порт, Логин);
EndFunction

Function ПолучитьНастройкиПрокси(Val Адрес, Val Порт, Val Вид = "socks5", Val Логин = Undefined, Val Пароль = Undefined) Export
	Return GetProxySettings(Адрес, Порт, Вид, Логин, Пароль);
EndFunction

#EndRegion