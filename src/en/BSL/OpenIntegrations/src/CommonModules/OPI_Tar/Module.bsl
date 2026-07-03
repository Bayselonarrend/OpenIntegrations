// OneScript: ./OInt/formats/tar/Modules/OPI_Tar.os
// Lib: tar
// CLI: tar
// Keywords: tar, tgz, tar.gz

// DocsCategory: Formats
// DocsNameRU: tar
// DocsNameEN: tar

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

// #Use "../../../tools/main"
// #Use "../../../tools/http"

#If Not WebClient Then // !OPI

#Region Public

#Region Archiving

// Archive directory
// Pack files from the specified directory into a tar archive
//
// Parameters:
// Directory   - String, BinaryData - Path to the directory or data description for packing  - src
// ArchivePath - String             - Path to save the archive. To binary data if not filled - dest
// Settings    - Map Of KeyAndValue - Additional settings. See GetArchivingSettingsStructure - settings
//
// Returns:
// BinaryData, Map Of KeyAndValue - Execution information or binary archive data
Function ArchiveDirectory(Val Directory, Val ArchivePath = "", Val Settings = Undefined) Export

    Return OPI_GenericArchiver.Archive("tar", Directory, ArchivePath, Settings);

EndFunction

// Unarchive directory
// Extract tar archive to the specified directory
//
// Parameters:
// Archive              - String, BinaryData - Path to the archive on disk or binary data                 - src
// DestinationDirectory - String             - Directory path for unpacking. To binary data if not filled - dest
//
// Returns:
// Map Of KeyAndValue - Execution information
Function UnarchiveDirectory(Val Archive, Val DestinationDirectory = "") Export

    Return OPI_GenericArchiver.Unzip("tar", Archive, DestinationDirectory);

EndFunction

// Unpack files
// Extract selected files from the tar archive by the list of paths
//
// Parameters:
// Archive              - String, BinaryData - Path to the archive on disk or binary data                 - src
// Paths                - Array Of String    - Full paths of files inside the archive                     - paths
// DestinationDirectory - String             - Directory path for unpacking. To binary data if not filled - dest
//
// Returns:
// Map Of KeyAndValue - Information about the execution or description of selected files
Function UnpackFiles(Val Archive, Val Paths, Val DestinationDirectory = "") Export

    Return OPI_GenericArchiver.UnpackFiles("tar", Archive, Paths, DestinationDirectory);

EndFunction

// Modify archive
// Add, replace and delete files in an existing tar archive
//
// Parameters:
// Archive        - String, BinaryData - Path to the archive on disk or binary data         - src
// AddableFiles   - Map Of KeyAndValue - Key: archive path; value: file path or binary data - additions
// DeletablePaths - Array Of String    - Paths of files in the archive for deletion         - deletions
// Settings       - Map Of KeyAndValue - Change settings. See GetArchiveSettingsStructure   - settings
//
// Returns:
// BinaryData, Map Of KeyAndValue - Result of the operation for the archive on the disk or new binary data of the archive
//
// Note:
// The archive on the disk is modified in place. Gzip parameters are set in Settings.
Function ModifyArchive(Val Archive, Val AddableFiles = Undefined, Val DeletablePaths = Undefined, Val Settings = Undefined) Export

    Return OPI_GenericArchiver.ModifyArchive("tar", Archive, AddableFiles, DeletablePaths, Settings);

EndFunction

// Get archiving settings structure
// Gets a structure with additional data archiving settings
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

    SettingsStructure.Insert("gzip"      , "<compress gzip: True/False (by default False)>");
    SettingsStructure.Insert("gzip_level", "<Gzip level: 0-9 (6 by default.)>");

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
// Archive - String, BinaryData - Path to the archive on disk or binary data - src
//
// Returns:
// Map Of KeyAndValue - Information about files in the archive
Function GetFilesList(Val Archive) Export

    Return OPI_GenericArchiver.GetFilesList("tar", Archive);

EndFunction

// Get metadata
// Gets metadata and a flat list of archive files
//
// Parameters:
// Archive - String, BinaryData - Path to the archive on disk or binary data - src
//
// Returns:
// Map Of KeyAndValue - Archive information
Function GetMetadata(Val Archive) Export

    Return OPI_GenericArchiver.GetMetadata("tar", Archive);

EndFunction

#EndRegion

#EndRegion

#EndIf // !OPI
