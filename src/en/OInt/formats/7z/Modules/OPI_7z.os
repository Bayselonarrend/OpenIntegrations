// OneScript: ./OInt/formats/7z/Modules/OPI_7z.os
// Lib: 7z
// CLI: 7z
// Keywords: 7z, 7-Zip

// DocsCategory: Formats
// DocsNameRU: 7z
// DocsNameEN: 7z

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

#Use "../../../tools/main"
#Use "../../../tools/http"

#Region Public

#Region Archiving

// Archive directory
// Packs files from the specified directory into an archive
//
// Parameters:
// Directory   - String             - Path to the directory or data description for packing  - src
// ArchivePath - String             - Path to save the archive. To binary data if not filled - dest
// Settings    - Map Of KeyAndValue - Additional settings. See GetArchivingSettingsStructure - settings
//
// Returns:
// BinaryData, Map Of KeyAndValue - Execution information or binary archive data
Function ArchiveDirectory(Val Directory, Val ArchivePath = "", Val Settings = Undefined) Export

    Return OPI_GenericArchiver.Archive("7z", Directory, ArchivePath, Settings);

EndFunction

// Unarchive directory
// Unpacks 7z archive to the specified directory
//
// Parameters:
// Archive              - String - Path to the archive on disk or binary data                 - src
// DestinationDirectory - String - Directory path for unpacking. To binary data if not filled - dest
// Password             - String - archive password, if required                              - password
//
// Returns:
// Map Of KeyAndValue - Execution information
Function UnarchiveDirectory(Val Archive, Val DestinationDirectory = "", Val Password = "") Export

    Return OPI_GenericArchiver.Unzip("7z", Archive, DestinationDirectory, Password);

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

    SettingsStructure.Insert("password"        , "<archive password, if necessary>");
    SettingsStructure.Insert("method"          , "<compression method: Lzma2 (by default), Lzma, Bzip2, Ppmd, Copy>");
    SettingsStructure.Insert("level"           , "<compression level: 0-9 (6 by default.)>");
    SettingsStructure.Insert("solid"           , "<single-threaded compression: True/False (by default.)>");
    SettingsStructure.Insert("encrypt_header"  , "<encrypt header: True (by default, if password is present)/False>");
    SettingsStructure.Insert("threads"         , "<number of threads for LZMA2 (by default 1)>");
    SettingsStructure.Insert("chunk_size"      , "<chunk size when threads > 1>");
    SettingsStructure.Insert("dictionary_size" , "<LZMA2 dictionary size>");
    SettingsStructure.Insert("ppmd_order "     , "<model order (for Ppmd)>");
    SettingsStructure.Insert("ppmd_memory "    , "<memory in bytes (for Ppmd)>");
    SettingsStructure.Insert("filters"         , "<array of filters: X86, PPC, IA64, ARM, ARM64, ARM_THUMB, SPARC, RISCV, DELTA>");
    SettingsStructure.Insert("delta_distance"  , "<distance for DELTA filter, if used (by default 1)>");

    If Clear Then
        SettingsStructure = OPI_Tools.ClearCollectionRecursively(SettingsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction

#EndRegion

#EndRegion


#Region Alternate

Function АрхивироватьКаталог(Val Каталог, Val ПутьАрхива = "", Val Настройки = Undefined) Export
    Return ArchiveDirectory(Каталог, ПутьАрхива, Настройки);
EndFunction

Function РазархивироватьКаталог(Val Архив, Val КаталогНазначения = "", Val Пароль = "") Export
    Return UnarchiveDirectory(Архив, КаталогНазначения, Пароль);
EndFunction

Function ПолучитьСтруктуруНастроекАрхивации(Val Пустая = False, Val КакСоответствие = False) Export
    Return GetArchivingSettingsStructure(Пустая, КакСоответствие);
EndFunction

#EndRegion