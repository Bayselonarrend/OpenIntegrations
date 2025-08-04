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

    //@skip-check constructor-function-return-section
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
        Return Connection;
    Else
        Result = Connection.GetWelcomeMsg();
        Result = OPI_Tools.JsonToStructure(Result);
    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Get object size
// Get the size of a file or directory if it exists
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to the object - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetObjectSize(Val Connection, Val Path) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);

        Result = Connection.GetObjectSize(Path);
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
// Note
// When `IPResolve = True`, the connection address returned by the server in passive mode after `PASV` will be replaced with the IP^^
// from the `Host` field, in cases when a proxy is used or the server returns `127.0.0.1` (only if an IP address is specified in the `Host` field))
//
// Parameters:
// Host - String - Host addres - host
// Port - Number - Server port - port
// Login - String, Undefined - Username for authorization, if required - login
// Password - String, Undefined - User password for authorization, if required - pass
// Passive - Boolean - Passive connection mode - passive
// ReadTimeout - Number - Read timeout - rtout
// WriteTimeout - Number - Write timeout - wtout
// IPResolve - Boolean - Advanced passive mode address resolution - ipresl
//
// Returns:
// Structure Of KeyAndValue - Connection settings structure
Function GetConnectionSettings(Val Host
    , Val Port = 21
    , Val Login = Undefined
    , Val Password = Undefined
    , Val Passive = True
    , Val ReadTimeout = 120
    , Val WriteTimeout = 120
    , Val IPResolve = True) Export

    SettingsStructure = New Structure;
    OPI_Tools.AddField("domain"          , Host         , "String" , SettingsStructure);
    OPI_Tools.AddField("port"            , Port         , "Number" , SettingsStructure);
    OPI_Tools.AddField("passive"         , Passive      , "Boolean", SettingsStructure);
    OPI_Tools.AddField("read_timeout"    , ReadTimeout  , "Number" , SettingsStructure);
    OPI_Tools.AddField("write_timeout"   , WriteTimeout , "Number" , SettingsStructure);
    OPI_Tools.AddField("advanced_resolve", WriteTimeout , "Boolean", SettingsStructure);

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

#Region DirectoryManagement

// List objects
// Gets information about the contents of a directory at the specified path
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to search directory - path
// Recursively - Boolean - Get information about objects in nested directories - rcv
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ListObjects(Val Connection, Val Path = "", Val Recursively = False) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    EndIf;

    OPI_TypeConversion.GetLine(Path);
    OPI_TypeConversion.GetBoolean(Recursively);

    Path = ?(Path = ".", "", Path);

    Result = Connection.ListDirectory(Path);
    Result = OPI_Tools.JsonToStructure(Result);

    If Result["result"] Then

        ObjectList = Result["data"];

        For Each Object In ObjectList Do

            ObjectName = Object["name"];

            If ValueIsFilled(Path) Then
                ObjectPath = StrTemplate("%1/%2", Path, ObjectName);
            Else
                ObjectPath = ObjectName;
            EndIf;

            Object.Insert("path", ObjectPath);

            If Recursively Then
                If Object["is_directory"] Then

                    ResultSubdirectory = ListObjects(Connection, ObjectPath, True);

                    If Not ResultSubdirectory["result"] Then
                        Subfolders = ResultSubdirectory;
                    Else
                        Subfolders = ResultSubdirectory["data"];
                    EndIf;

                    Object.Insert("objects", Subfolders);

                EndIf;
            EndIf;

        EndDo;

        Result = New Map;
        Result.Insert("result", True);
        Result.Insert("data"  , ObjectList);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Create directory
// Creates a directory at the specified path
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to new directory - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CreateDirectory(Val Connection, Val Path) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);

        Result = Connection.MakeDirectory(Path);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Delete directory
// Deletes an existing directory
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to directory to delete - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function DeleteDirectory(Val Connection, Val Path) Export

    Return ClearDeleteDirectory(Connection, Path, True);

EndFunction

// Clear directory
// Deletes all objects in the selected directory
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to the directory to be cleaned - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ClearDirectory(Val Connection, Val Path) Export

    Return ClearDeleteDirectory(Connection, Path, False);

EndFunction

#EndRegion

#Region FileManagement

// Upload file
// Uploads a file from disk or binary data to the FTP server
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// File - String, BinaryData - File on disk or file data - file
// Path - String - Path to save file on server - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function UploadFile(Val Connection, Val File, Val Path) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        ProcessingConnection = GetConnectionForFileOperation(Connection, CloseConnection);

        If Not IsConnector(ProcessingConnection) Then
            Return ProcessingConnection;
        EndIf;

        If TypeOf(File)  = Type("String") Then
            FileOnDisk   = New File(File);
            IsFileOnDisk = FileOnDisk.Exists();
        Else
            IsFileOnDisk = False;
        EndIf;

        If Not IsFileOnDisk Then

            OPI_TypeConversion.GetBinaryData(File);
            Result = ProcessingConnection.UploadData(File, Path);

        Else
            Result = ProcessingConnection.UploadFile(File, Path);
        EndIf;

        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Delete file
// Delete file from server
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to save file on server - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function DeleteFile(Val Connection, Val Path) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);

        Result = Connection.RemoveFile(Path);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

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

Function ClearDeleteDirectory(Val Connection, Val Path, Val DeleteCurrent)

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);
        Result = DeleteDirectoryRecursively(Connection, Path, DeleteCurrent);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

Function DeleteDirectoryRecursively(Val Connection, Val Path, Val DeleteCurrent = True, DeletedArray = Undefined)

    If DeletedArray  = Undefined Then
        DeletedArray = New Array;
        Primary      = True;
    Else
        Primary      = False;
    EndIf;

    NeedParts = ListObjects(Connection, Path, True);

    If NeedParts["result"] Then
        For Each Object In NeedParts["data"] Do

            ObjectPath = Object["path"];

            If Object["is_directory"] Then
                Deletion = DeleteDirectoryRecursively(Connection, ObjectPath, DeleteCurrent, DeletedArray);
            Else
                Deletion = DeleteFile(Connection, ObjectPath);
            EndIf;

            Deletion.Insert("path", ObjectPath);
            DeletedArray.Add(Deletion);

        EndDo;
    Else
        Return NeedParts;
    EndIf;

    If Not Primary Or DeleteCurrent Then
        Result = Connection.RemoveDirectory(Path);
        Result = OPI_Tools.JsonToStructure(Result);
    Else
        Result = New Map;
        Result.Insert("result", True);
    EndIf;

    If Primary Then
        Result.Insert("deleted_objects", DeletedArray);
    EndIf;

    Return Result;

EndFunction

Function GetConnectionForFileOperation(Val Connection, Val CloseConnection)

    If CloseConnection Then
        Return Connection;
    EndIf;

    IsTls = Connection.IsTls();

    If IsTls Then
        // Avoiding the not always correctly functioning TLS Session reuse for multiple data streams
        ProcessingConnection = GetConnectionCopy(Connection);
    Else
        ProcessingConnection = Connection;
    EndIf;

    Return ProcessingConnection;

EndFunction

Function GetConnectionCopy(Val Connection)

    Configuration = Connection.GetConfiguration();
    Configuration = OPI_Tools.JSONToStructure(Configuration);

    If Not Configuration["result"] Then
        Return Configuration;
    EndIf;

    Configuration = OPI_Tools.JSONToStructure(Configuration["data"]);

    FTPSettings = Configuration["ftp_settings"];
    Proxy       = Configuration["proxy_settings"];
    TLS         = Configuration["tls_settings"];

    Return CreateConnection(FTPSettings, Proxy, TLS);

EndFunction

#EndRegion
