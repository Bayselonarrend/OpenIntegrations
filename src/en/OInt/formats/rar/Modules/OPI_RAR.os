// OneScript: ./OInt/formats/rar/Modules/OPI_RAR.os
// Lib: rar
// CLI: rar
// Keywords: rar, unrar

// DocsCategory: Formats
// DocsNameRU: rar
// DocsNameEN: rar

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

// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:LineLength-off
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region Unarchiving

// Unarchive directory
// Extracts RAR archive to the specified directory
//
// Parameters:
// Archive              - String, BinaryData - Path to the archive on disk or binary data                 - src
// DestinationDirectory - String             - Directory path for unpacking. To binary data if not filled - dest
// Password             - String             - archive password, if required                              - password
//
// Returns:
// Map Of KeyAndValue - Execution information
Function UnarchiveDirectory(Val Archive, Val DestinationDirectory = "", Val Password = "") Export

    Return OPI_GenericArchiver.Unzip("rar", Archive, DestinationDirectory, Password);

EndFunction

// Unpack files
// Extracts selected files from the RAR archive by the list of paths
//
// Parameters:
// Archive              - String, BinaryData - Path to the archive on disk or binary data                 - src
// Paths                - Array Of String    - Full paths of files inside the archive                     - paths
// DestinationDirectory - String             - Directory path for unpacking. To binary data if not filled - dest
// Password             - String             - archive password, if required                              - password
//
// Returns:
// Map Of KeyAndValue - Information about the execution or description of selected files
Function UnpackFiles(Val Archive, Val Paths, Val DestinationDirectory = "", Val Password = "") Export

    Return OPI_GenericArchiver.UnpackFiles("rar", Archive, Paths, DestinationDirectory, Password);

EndFunction

// Get archiving settings structure
// Gets a structure with additional unpacking settings
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// AsMap - Boolean - True > returns the filter fields as a map                                - map
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetArchivingSettingsStructure(Val Clear = False, Val AsMap = False) Export

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(AsMap);

    If AsMap Then
        SettingsStructure = New Map;
    Else
        SettingsStructure = New Structure;
    EndIf;

    SettingsStructure.Insert("password", "<archive password, if necessary>");

    If Clear Then
        SettingsStructure = OPI_Tools.ClearCollectionRecursively(SettingsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction

#EndRegion

#Region GettingMetadata

// Get list of files
// Gets a hierarchical list of files and directories in the archive
//
// Parameters:
// Archive  - String, BinaryData - Path to the archive on disk or binary data - src
// Password - String             - archive password, if required              - password
//
// Returns:
// Map Of KeyAndValue - Information about files in the archive
Function GetFilesList(Val Archive, Val Password = "") Export

    Return OPI_GenericArchiver.GetFilesList("rar", Archive, Password);

EndFunction

// Get metadata
// Gets metadata and a flat list of archive files
//
// Parameters:
// Archive  - String, BinaryData - Path to the archive on disk or binary data - src
// Password - String             - archive password, if required              - password
//
// Returns:
// Map Of KeyAndValue - Archive information
Function GetMetadata(Val Archive, Val Password = "") Export

    Return OPI_GenericArchiver.GetMetadata("rar", Archive, Password);

EndFunction

#EndRegion

#EndRegion


#Region Alternate

Function РазархивироватьКаталог(Val Архив, Val КаталогНазначения = "", Val Пароль = "") Export
    Return UnarchiveDirectory(Архив, КаталогНазначения, Пароль);
EndFunction

Function РазархивироватьФайлы(Val Архив, Val Пути, Val КаталогНазначения = "", Val Пароль = "") Export
    Return UnpackFiles(Архив, Пути, КаталогНазначения, Пароль);
EndFunction

Function ПолучитьСтруктуруНастроекАрхивации(Val Пустая = False, Val КакСоответствие = False) Export
    Return GetArchivingSettingsStructure(Пустая, КакСоответствие);
EndFunction

Function ПолучитьСписокФайлов(Val Архив, Val Пароль = "") Export
    Return GetFilesList(Архив, Пароль);
EndFunction

Function ПолучитьМетаданные(Val Архив, Val Пароль = "") Export
    Return GetMetadata(Архив, Пароль);
EndFunction

#EndRegion