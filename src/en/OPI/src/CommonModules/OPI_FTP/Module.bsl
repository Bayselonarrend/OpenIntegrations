// OneScript: ./OInt/core/Modules/OPI_FTP.os
// Lib: FTP
// CLI: ftp
// Keywords: ftp, ftps

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
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Region Public

#Region CommonMethods

// Create Connection !NOCLI
// Creates an FTP connection with the specified settings
//
// Parameters:
// FTPSettings - Structure Of KeyAndValue - FTP settings. See GetConnectionSettings - set
// Proxy - Structure Of KeyAndValue - Proxy settings, if required. See GetProxySettings - proxy
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Arbitrary - Client object or map with error information
Function CreateConnection(Val FTPSettings, Val Proxy = Undefined, Val Tls = Undefined) Export

    If IsConnector(FTPSettings) Then
        Return FTPSettings;
    EndIf;

    Connector = OPI_AddIns.GetAddIn("FTP");

    SetSettings = SetFtpSettings(Connector, FTPSettings);

    If Not OPI_Tools.GetOr(SetSettings, "result", False) Then
        Return SetSettings;
    EndIf;

    Tls = OPI_AddIns.SetTls(Connector, Tls);

    If Not OPI_Tools.GetOr(Tls, "result", False) Then
        Return Tls;
    EndIf;

    SetProxy = SetProxySettings(Connector, Proxy);

    If Not OPI_Tools.GetOr(SetProxy, "result", False) Then
        Return SetProxy;
    EndIf;

    Result = Connector.Connect();
    Result = OPI_Tools.JSONToStructure(Result);

    Return ?(Result["result"], Connector, Result);

EndFunction

// Get connection configuration
// Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions
//
// Note
// Can be passed as the `Connection` parameter in other functions instead of the actual connection from the `CreateConnection` function.
// At the same time, a new connection will be opened and closed within the called function
// Using the connection configuration is not recommended for multiple requests to the FTP server.^^
// This functionality is primarily intended for the CLI version of OInt, where maintaining a connection between calls is not possible
//
// Parameters:
// FTPSettings - Structure Of KeyAndValue - FTP settings. See GetConnectionSettings - set
// Proxy - Structure Of KeyAndValue - Proxy settings, if required. See GetProxySettings - proxy
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Structure Of KeyAndValue - Connection settings structure
Function GetConnectionConfiguration(Val FTPSettings, Val Proxy = Undefined, Val Tls = Undefined) Export

    ConfigurationStructure = New Structure;

    OPI_Tools.AddField("set"  , FTPSettings, "Collection", ConfigurationStructure);
    OPI_Tools.AddField("proxy", Proxy      , "Collection", ConfigurationStructure);
    OPI_Tools.AddField("tls"  , Tls        , "Collection", ConfigurationStructure);

    Return ConfigurationStructure;

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
    Result = Connection.Close();
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Get welcome message
// Receives the FTP servers welcome message
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetWelcomeMessage(Val Connection) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Result = Connection;
    Else
        Result = Connection.GetWelcomeMsg();
        Result = OPI_Tools.JsonToStructure(Result);
    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Is connector !NOCLI
// Checks that the value is an AddIn object for working with FTP
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_FTP.Main";

EndFunction

// Get connection settings
// Creates a structure of FTP connection settings
//
// Parameters:
// Domain - String - Server domain - host
// Port - Number - Server port - port
// Login - String, Undefined - Username for authorization, if required - login
// Password - String, Undefined - User password for authorization, if required - pass
// Passive - Boolean - Passive connection mode - passive
// ReadTimeout - Number - Read timeout - rtout
// WriteTimeout - Number - Write timeout - wtout
//
// Returns:
// Structure Of KeyAndValue - Connection settings structure
Function GetConnectionSettings(Val Domain
    , Val Port = 21
    , Val Login = Undefined
    , Val Password = Undefined
    , Val Passive = True
    , Val ReadTimeout = 120
    , Val WriteTimeout = 120) Export

    SettingsStructure = New Structure;
    OPI_Tools.AddField("domain"       , Domain       , "String" , SettingsStructure);
    OPI_Tools.AddField("port"         , Port         , "Number" , SettingsStructure);
    OPI_Tools.AddField("passive"      , Passive      , "Boolean", SettingsStructure);
    OPI_Tools.AddField("read_timeout" , ReadTimeout  , "Number" , SettingsStructure);
    OPI_Tools.AddField("write_timeout", WriteTimeout , "Number" , SettingsStructure);

    If Not Login = Undefined Then
        OPI_TypeConversion.GetLine(Login);
        SettingsStructure.Insert("login", Login);
    EndIf;

    If Not Password = Undefined Then
        OPI_TypeConversion.GetLine(Password);
        SettingsStructure.Insert("password", Password);
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

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

    SettingsStructure = New Structure;
    OPI_Tools.AddField("server"    , Address, "String" , SettingsStructure);
    OPI_Tools.AddField("port"      , Port   , "Number" , SettingsStructure);
    OPI_Tools.AddField("proxy_type", View   , "String" , SettingsStructure);

    If Not Login = Undefined Then
        OPI_TypeConversion.GetLine(Login);
        SettingsStructure.Insert("login", Login);
    EndIf;

    If Not Password = Undefined Then
        OPI_TypeConversion.GetLine(Password);
        SettingsStructure.Insert("password", Password);
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction

// Get TLS Settings
// Forms settings for using TLS
//
// Note
// Tls settings can only be set when a connection is created: explicitly, by using the `OpenConnection` function^^
// or implicit, when passing settings
//
// Parameters:
// DisableCertVerification - Boolean - Allows to work with invalid certificates, including self signed - trust
// CertFilepath - String - Path to the root PEM file of the certificate if it is not in the system repository - cert
//
// Returns:
// Structure Of KeyAndValue - Structure of TLS connection settings
Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export

    Return OPI_AddIns.GetTlsSettings(DisableCertVerification, CertFilepath);

EndFunction

#EndRegion

#EndRegion

#Region Private

Function SetFtpSettings(Val Connector, Val FTPSettings)

    ErrorText = "FTP settings are not a valid key-value structure";
    Settings  = SettingAsJson(FTPSettings, ErrorText);

    If TypeOf(Settings) = Type("Map") Then
        Return Settings;
    EndIf;

    Result = Connector.UpdateSettings(Settings);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

Function SetProxySettings(Val Connector, Val ProxySettings)

    If ProxySettings = Undefined Then
        Result       = New Map;
        Result.Insert("result", True);
        Return Result;
    EndIf;

    ErrorText = "Proxy settings are not a valid key-value structure";
    Settings  = SettingAsJson(ProxySettings, ErrorText);

    If TypeOf(Settings) = Type("Map") Then
        Return Settings;
    EndIf;

    Result = Connector.UpdateProxy(Settings);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

Function SettingAsJson(Val Collection, Val ErrorText)

    OPI_TypeConversion.GetKeyValueCollection(Collection);

    Try
        Result = OPI_Tools.JSONString(Collection);
    Except

        Result = New Map;
        Result.Insert("result", False);
        Result.Insert("error" , "FTP settings must contain only serializable values");

    EndTry;

    Return Result;

EndFunction

Function CreateConnectionByConfiguration(Val ConfigurationStructure)

    If IsConnector(ConfigurationStructure) Then
        Return ConfigurationStructure;
    EndIf;

    ErrorText = "Unexpected connection configuration";

    Try
        OPI_TypeConversion.GetKeyValueCollection(ConfigurationStructure);
    Except

        Result = New Map;
        Result.Insert("result", False);
        Result.Insert("error" , ErrorText);
        Return Result;

    EndTry;

    If Not OPI_Tools.CollectionFieldExists(ConfigurationStructure, "set") Then

        Result = New Map;
        Result.Insert("result", False);
        Result.Insert("error" , ErrorText);
        Return Result;

    EndIf;

    FTPSettings = ConfigurationStructure["set"];
    Proxy       = OPI_Tools.GetOr(ConfigurationStructure, "proxy", Undefined);
    Tls         = OPI_Tools.GetOr(ConfigurationStructure, "tls", Undefined);

    Return CreateConnection(FTPSettings, Proxy, Tls);

EndFunction

Function CheckCreateConnection(Connection)

    If IsConnector(Connection) Then
        CloseConnection = False;
    Else
        CloseConnection = True;
        Connection      = CreateConnectionByConfiguration(Connection);
    EndIf;

    Return CloseConnection;

EndFunction

#EndRegion
