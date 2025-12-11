// OneScript: ./OInt/core/Modules/OPI_SFTP.os
// Lib: SFTP
// CLI: sftp
// Keywords: sftp

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

// Create connection !NOCLI
// Creates a new SFTP session
//
// Note:
// Get the connection configuration using the functions `GetSettingsLoginPassword`,^^
// `GetSettingsPrivateKey`, `GetSettingsViaAgent`
//
// Parameters:
// SSHSettings - Structure Of KeyAndValue - Connection settings structure - set
// Proxy - Structure Of KeyAndValue - Proxy settings structure, if necessary - proxy
//
// Returns:
// Arbitrary, Map of KeyAndValue - Create connection
Function CreateConnection(Val SSHSettings, Val Proxy = "") Export

    SSHConnection = OPI_SSHRequests.CreateConnection(SSHSettings, Proxy);

    If IsConnector(SSHConnection) Then
        Result = SSHConnection.ToSFTP();
        Result = OPI_Tools.JsonToStructure(Result);
    Else
        Return SSHConnection;
    EndIf;

    Return ?(Result["result"], SSHConnection, Result);

EndFunction

// Get connection configuration
// Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions
//
// Note:
// Can be passed as the `Connection` parameter in other functions instead of the actual connection from the `CreateConnection` function.^^
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

    Return OPI_SSHRequests.GetConnectionConfiguration(SSHSettings, Proxy);

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

    Return OPI_SSHRequests.CloseConnection(Connection);

EndFunction

// Update path
// Changes the object's path to the specified one
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Current path to object - old
// NewPath - String - New path to object - new
// Overwrite - Boolean - Overwrite if an object already exists at the target path - rw
//
// Returns:
// Map Of KeyAndValue - Processing result
Function UpdatePath(Val Connection, Val Path, Val NewPath, Val Overwrite = False) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);
        OPI_TypeConversion.GetLine(NewPath);
        OPI_TypeConversion.GetBoolean(Overwrite);

        Result = Connection.RenameObject(Path, NewPath, Overwrite);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Is connector !NOCLI
// Checks that the value is an object of an external component for working with SFTP
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return OPI_SSHRequests.IsConnector(Value);

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

    Return OPI_SSHRequests.GetSettingsLoginPassword(Host, Port, Login, Password);

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

    Return OPI_SSHRequests.GetSettingsPrivateKey(Host, Port, Login, Private, Public, Password);

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

    Return OPI_SSHRequests.GetSettingsViaAgent(Host, Port, Login);

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
    Else

        OPI_TypeConversion.GetBoolean(Recursively);
        OPI_TypeConversion.GetLine(Path);

        Result = Connection.ListDirectory(Path);
        Result = OPI_Tools.JsonToStructure(Result);

        ProcessListObtainResult(Result, Connection, Recursively);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// BSLLS:MagicNumber-off

// Create new directory
// Creates a directory at the specified path
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to new directory - path
// Permissions - String - Access mode to the directory in POSIX numeric format (as in chmod) - mode
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CreateNewDirectory(Val Connection, Val Path, Val Permissions = 700) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);

        Result = Connection.MakeDirectory(Path, Permissions);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// BSLLS:MagicNumber-on

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

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);

        Result = Connection.RemoveDirectory(Path);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

// Get current directory
// Gets the current directory from which relative paths are calculated
//
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

        Result = OPI_SSHRequests.ExecuteCommand(Connection, "pwd");
        ProcessSSHCommandExecution(Result, "path");

    EndIf;

    If CloseConnection Then
        Result.Insert("close_connection", CloseConnection(Connection));
    EndIf;

    Return Result;

EndFunction

#EndRegion

#Region FileManagement

// Upload file
// Uploads a file from disk or binary data to the server
//
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

                Result = Connection.UploadFile(TFN, Path);

                OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete temporary file after upload");

            Else
                Result = Connection.UploadData(File, Path);
            EndIf;

        Else
            Result = Connection.UploadFile(File, Path);
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

// Get information about file
// Get file information by the specified path
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection configuration - conn
// Path - String - Path to file on server - path
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetFileInformation(Val Connection, Val Path) Export

    CloseConnection = CheckCreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    Else

        OPI_TypeConversion.GetLine(Path);

        Result = Connection.GetFileInfo(Path);
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

Function CheckCreateConnection(Connection)

    If Not IsConnector(Connection) Then

        CloseConnection = True;
        Connection      = CreateConnectionByConfiguration(Connection);

    Else
        CloseConnection = False;
    EndIf;

    If Not IsConnector(Connection) Then
        Return Connection;
    EndIf;

    IsSFTP = Connection.IsSFTP();

    If Not IsSFTP Then

        Result     = Connection.ToSFTP();
        Result     = OPI_Tools.JsonToStructure(Result);
        Connection = ?(Result["result"], Connection, Result);

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

Procedure ProcessSSHCommandExecution(Result, ResultField = "data")

    Result_ = "result";

    If Result[Result_] Then

        ProcessingResult = New Map;

        If Not ValueIsFilled(Result["stderr"]) Then

            ProcessingResult.Insert(Result_, True);

            StdOut = Result["stdout"];

            If ValueIsFilled(StdOut) Then
                ProcessingResult.Insert(ResultField, StdOut);
            EndIf;

        Else
            ProcessingResult.Insert(Result_, False);
            ProcessingResult.Insert("error", Result["stderr"]);
        EndIf;

        Result = ProcessingResult;

    EndIf;

EndProcedure

Procedure ProcessListObtainResult(Result, Connection, Val Recursively)

    If Result["result"] And Recursively Then

        For Each DirectoryObject In Result["data"] Do

            If Not DirectoryObject["is_directory"] Then
                Continue;
            EndIf;

            Child = ListObjects(Connection, DirectoryObject["path"], True);

            If Child["result"] Then

                DirectoryObject.Insert("objects", Child["data"]);

            Else

                DirectoryObject.Insert("objects", Child["error"]);

            EndIf;

        EndDo;

    EndIf;

EndProcedure

#EndRegion

#Region Alternate

Function ОткрытьСоединение(Val НастройкиSSH, Val Прокси = "") Export
	Return CreateConnection(НастройкиSSH, Прокси);
EndFunction

Function ПолучитьКонфигурациюСоединения(Val НастройкиSSH, Val Прокси = Undefined) Export
	Return GetConnectionConfiguration(НастройкиSSH, Прокси);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
	Return CloseConnection(Соединение);
EndFunction

Function ИзменитьПуть(Val Соединение, Val Путь, Val НовыйПуть, Val Перезаписывать = False) Export
	Return UpdatePath(Соединение, Путь, НовыйПуть, Перезаписывать);
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

Function ПолучитьСписокОбъектов(Val Соединение, Val Путь = "", Val Рекурсивно = False) Export
	Return ListObjects(Соединение, Путь, Рекурсивно);
EndFunction

Function СоздатьНовуюДиректорию(Val Соединение, Val Путь, Val Права = 700) Export
	Return CreateNewDirectory(Соединение, Путь, Права);
EndFunction

Function УдалитьДиректорию(Val Соединение, Val Путь) Export
	Return DeleteDirectory(Соединение, Путь);
EndFunction

Function ПолучитьТекущийКаталог(Val Соединение) Export
	Return GetCurrentDirectory(Соединение);
EndFunction

Function ЗагрузитьФайл(Val Соединение, Val Файл, Val Путь) Export
	Return UploadFile(Соединение, Файл, Путь);
EndFunction

Function УдалитьФайл(Val Соединение, Val Путь) Export
	Return DeleteFile(Соединение, Путь);
EndFunction

Function СохранитьФайл(Val Соединение, Val Путь, Val ИмяФайла) Export
	Return SaveFile(Соединение, Путь, ИмяФайла);
EndFunction

Function ПолучитьДанныеФайла(Val Соединение, Val Путь) Export
	Return GetFileData(Соединение, Путь);
EndFunction

Function ПолучитьИнформациюОФайле(Val Соединение, Val Путь) Export
	Return GetFileInformation(Соединение, Путь);
EndFunction

#EndRegion