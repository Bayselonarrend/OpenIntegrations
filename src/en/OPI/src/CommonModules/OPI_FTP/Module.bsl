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

// Create connection !NOCLI
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

    Result_ = "result";

    If IsConnector(FTPSettings) Then
        Return FTPSettings;
    EndIf;

    Connector = OPI_AddIns.GetAddIn("FTP");

    SetSettings = SetFtpSettings(Connector, FTPSettings);

    If Not OPI_Tools.GetOr(SetSettings, Result_, False) Then
        Return SetSettings;
    EndIf;

    Tls = OPI_AddIns.SetTls(Connector, Tls);

    If Not OPI_Tools.GetOr(Tls, Result_, False) Then
        Return Tls;
    EndIf;

    SetProxy = SetProxySettings(Connector, Proxy);

    If Not OPI_Tools.GetOr(SetProxy, Result_, False) Then
        Return SetProxy;
    EndIf;

    Result = Connector.Connect();
    Result = OPI_Tools.JSONToStructure(Result);

    Return ?(Result[Result_], Connector, Result);

EndFunction

// Get connection configuration
// Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions
//
// Note:
// Can be passed as the `Connection` parameter in other functions instead of the actual connection from the `CreateConnection` function.^^
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

    Collection_            = "Collection";
    ConfigurationStructure = New Structure;

    OPI_Tools.AddField("set"  , FTPSettings, Collection_, ConfigurationStructure);
    OPI_Tools.AddField("proxy", Proxy      , Collection_, ConfigurationStructure);
    OPI_Tools.AddField("tls"  , Tls        , Collection_, ConfigurationStructure);

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

    If Not IsConnector(Connection) Then
        Return Connection;
    EndIf;

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

// Get protocol feature list
// Gets a list of FTP protocol features supported by the server
//
// Note:
// FTP Command: `FEAT`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetProtocolFeatureList(Val Connection) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else
        Result = Connection.GetFeatures();
        Result = OPI_Tools.JsonToStructure(Result);
    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Ping
// Checks the connection activity and resets the timeout until its automatic closure
//
// Note:
// FTP Command: `NOOP`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
//
// Returns:
// Boolean - Success of server access
Function Ping(Val Connection) Export

    CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else
        Result = Connection.Ping();
    EndIf;

    CloseConnection(Connection);

    Return Result;

EndFunction

// Execute custom command
// Executes a specific (SITE) server command and returns the response
//
// Note:
// The result can be returned as text or Base64 binary data in the structure `{"BYTES": <B64 string>}`
// FTP Command: `SITE`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// CommandText - String - Text of the executed command - cmd
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ExecuteCustomCommand(Val Connection, Val CommandText) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(CommandText);

        Result = Connection.ExecuteCommand(CommandText);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Execute arbitrary command
// Sends an arbitrary text request to the server for processing
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// CommandText - String - Text of the executed command - cmd
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ExecuteArbitraryCommand(Val Connection, Val CommandText) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(CommandText);

        Result = Connection.ExecuteStandardCommand(CommandText);
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
// Note:
// FTP Command: `SIZE`
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

// Update path
// Changes the object's path to the specified one
//
// Note:
// The ability to move an object from one directory to another by changing the path depends on the server settings
// FTP Command: `RNFR + RNTO`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Current path to object - old
// NewPath - String - New path to object - new
//
// Returns:
// Map Of KeyAndValue - Processing result
Function UpdatePath(Val Connection, Val Path, Val NewPath) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);
        OPI_TypeConversion.GetLine(NewPath);

        Result = Connection.RenameObject(Path, NewPath);
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

// BSLLS:NumberOfParams-off

// Get connection settings
// Creates a structure of FTP connection settings
//
// Note:
// When `IPResolve = True`, the connection address returned by the server in passive mode after `PASV` will be replaced with the IP^^
// from the `Host` field, in cases when a proxy is used or the server returns `127.0.0.1` (only if an IP address is specified in the `Host` field))
//
// Parameters:
// Host - String - Host address - host
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

    Number_ = "Number";

    SettingsStructure = New Structure;
    OPI_Tools.AddField("domain"          , Host         , "String" , SettingsStructure);
    OPI_Tools.AddField("port"            , Port         , Number_  , SettingsStructure);
    OPI_Tools.AddField("passive"         , Passive      , "Boolean", SettingsStructure);
    OPI_Tools.AddField("read_timeout"    , ReadTimeout  , Number_  , SettingsStructure);
    OPI_Tools.AddField("write_timeout"   , WriteTimeout , Number_  , SettingsStructure);
    OPI_Tools.AddField("advanced_resolve", IPResolve    , "Boolean", SettingsStructure);

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

// BSLLS:NumberOfParams-on

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

// Get TLS Settings
// Forms settings for using TLS
//
// Note:
// Tls settings can only be set when a connection is created: explicitly, by using the `CreateConnection` function^^
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
// Note:
// FTP Command: `LIST`
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

        ProcessObjectList(ObjectList, Path, Connection, Recursively);

        Result = New Map;
        Result.Insert("result", True);
        Result.Insert("data"  , ObjectList);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Create new directory
// Creates a directory at the specified path
//
// Note:
// FTP Command: `MKD`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to new directory - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CreateNewDirectory(Val Connection, Val Path) Export

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
// Note:
// FTP Command: `RMD`
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

// Get current directory
// Gets the current directory from which relative paths are calculated
//
// Note:
// FTP Command: `PWD`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetCurrentDirectory(Val Connection) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else
        Result = Connection.GetCurrentDirectory();
        Result = OPI_Tools.JsonToStructure(Result);
    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Change current directory !NOCLI
// Changes the current directory from which relative paths are calculated
//
// Note:
// FTP Command: `CWD`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to new directory - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ChangeCurrentDirectory(Val Connection, Val Path) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);

        Result = Connection.ChangeCurrentDirectory(Path);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

#EndRegion

#Region FileManagement

// Upload file
// Uploads a file from disk or binary data to the FTP server
//
// Note:
// FTP Command: `STOR`
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

            If OPI_AddIns.FileTransferRequired() Then

                // BSLLS:MissingTemporaryFileDeletion-off

                //@skip-check missing-temporary-file-deletion
                TFN = GetTempFileName();

                // BSLLS:MissingTemporaryFileDeletion-on

                File.Write(TFN);

                Result = ProcessingConnection.UploadFile(TFN, Path);

                OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete temporary file after upload");

            Else
                Result = ProcessingConnection.UploadData(File, Path);
            EndIf;

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
// Note:
// FTP Command: `DELE`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to file on server - path
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

// Save file
// Saves the file from the server to the specified path
//
// Note:
// FTP Command: `RETR`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to file on server - path
// FileName - String - Path to save file on disk - file
//
// Returns:
// Map Of KeyAndValue - Processing result
Function SaveFile(Val Connection, Val Path, Val FileName) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);
        OPI_TypeConversion.GetLine(FileName);

        OPI_Tools.RestoreEscapeSequences(FileName);

        Result = Connection.DownloadToFile(Path, FileName);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Get file data !NOCLI
// Gets file from server as binary data
//
// Note:
// FTP Command: `RETR`
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to file on server - path
//
// Returns:
// Map Of KeyAndValue, BinaryData - File data or error information
Function GetFileData(Val Connection, Val Path) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);

        If OPI_AddIns.FileTransferRequired() Then

            // BSLLS:MissingTemporaryFileDeletion-off

            //@skip-check missing-temporary-file-deletion
            TFN = GetTempFileName();

            // BSLLS:MissingTemporaryFileDeletion-on

            Result = Connection.DownloadToFile(Path, TFN);
            Result = OPI_Tools.JsonToStructure(Result);

            If Result["result"] Then

                Data = New BinaryData(TFN);
                OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete temporary file after upload");
                Return Data;

            EndIf;

        Else

            Data = Connection.DownloadToBuffer(Path);

            If TypeOf(Data) = Type("String") Then
                Result      = OPI_Tools.JsonToStructure(Data);
            Else
                Return Data;
            EndIf;

        EndIf;

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

        Check = Connection.Ping();

        If Not Check Then
            Connection = GetConnectionCopy(Connection);
        EndIf;

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

    Configuration = Configuration["data"];

    FTPSettings = Configuration["ftp_settings"];
    Proxy       = Configuration["proxy_settings"];
    TLS         = Configuration["tls_settings"];

    Return CreateConnection(FTPSettings, Proxy, TLS);

EndFunction

Procedure ProcessObjectList(ObjectList, Val Path, Val Connection, Val Recursively)

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

EndProcedure

#EndRegion
