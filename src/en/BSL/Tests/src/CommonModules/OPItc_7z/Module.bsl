// OneScript: ./OInt/tests/Modules/OPItc_7z.os

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

// Test suite for YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use asserts
//#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("7z");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("7z");

EndFunction

#Region Internal

#Region RunnableTests

#Region Archiving

Procedure Z7_Archiving() Export

    Z7_GetArchivingSettingsStructure();

    BaseDirectory = TempFilesDir()
        + "\opi_sevenz_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory            = Path7z(BaseDirectory, "src");
    DestinateDirectory         = Path7z(BaseDirectory, "out");
    DestinationDirectoryBuffer = Path7z(BaseDirectory, "out_buffer");
    ArchivePath                = Path7z(BaseDirectory, "archive.7z");
    ArchivePathDescription     = Path7z(BaseDirectory, "archive_desc.7z");

    CreateDirectory(SourceDirectory);
    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);

    ExpectedFiles = New Map;

    ExpectedFiles.Insert("readme.txt", "OpenIntegrations root");
    GetBinaryDataFromString("OpenIntegrations root", "UTF-8").Write(Path7z(SourceDirectory, "readme.txt"));

    CreateDirectory(Path7z(SourceDirectory, "docs"));
    ExpectedFiles.Insert("docs\note.txt", "Nested documentation");
    GetBinaryDataFromString("Nested documentation", "UTF-8").Write(Path7z(SourceDirectory, "docs\note.txt"));

    CreateDirectory(Path7z(SourceDirectory, "data\nested"));
    BinaryDescription = New Structure("binary, hex", True, "0102030405");
    ExpectedFiles.Insert("data\nested\payload.bin", BinaryDescription);
    GetBinaryDataFromHexString("0102030405").Write(Path7z(SourceDirectory, "data\nested\payload.bin"));

    CreateDirectory(Path7z(SourceDirectory, "config"));
    ExpectedFiles.Insert("config\settings.json", "{""enabled"": true}");
    GetBinaryDataFromString("{""enabled"": true}", "UTF-8").Write(Path7z(SourceDirectory, "config\settings.json"));

    DescriptionRecords = New Array;

    ReadmeItem = New Map;
    ReadmeItem.Insert("name"      , "readme.txt");
    ReadmeItem.Insert("directory" , False);
    ReadmeItem.Insert("from_path" , True);
    ReadmeItem.Insert("path"      , Path7z(SourceDirectory, "readme.txt"));
    DescriptionRecords.Add(ReadmeItem);

    DocsRecords = New Array;
    NoteItem    = New Map;
    NoteItem.Insert("name"      , "note.txt");
    NoteItem.Insert("directory" , False);
    NoteItem.Insert("from_path" , True);
    NoteItem.Insert("path"      , Path7z(SourceDirectory, "docs\note.txt"));
    DocsRecords.Add(NoteItem);

    DocsItem = New Map;
    DocsItem.Insert("name"      , "docs");
    DocsItem.Insert("directory" , True);
    DocsItem.Insert("entries"   , DocsRecords);
    DescriptionRecords.Add(DocsItem);

    DataRecords = New Array;
    PayloadItem = New Map;
    PayloadItem.Insert("name"      , "payload.bin");
    PayloadItem.Insert("directory" , False);
    PayloadItem.Insert("from_path" , True);
    PayloadItem.Insert("path"      , Path7z(SourceDirectory, "data\nested\payload.bin"));
    DataRecords.Add(PayloadItem);

    DataItem      = New Map;
    DataItem.Insert("name"      , "data");
    DataItem.Insert("directory" , True);
    NestedRecords = New Array;
    NestedItem    = New Map;
    NestedItem.Insert("name"      , "nested");
    NestedItem.Insert("directory" , True);
    NestedItem.Insert("entries"   , DataRecords);
    NestedRecords.Add(NestedItem);
    DataItem.Insert("entries"   , NestedRecords);
    DescriptionRecords.Add(DataItem);

    ConfigRecords = New Array;
    SettingsItem  = New Map;
    SettingsItem.Insert("name"      , "settings.json");
    SettingsItem.Insert("directory" , False);
    SettingsItem.Insert("from_path" , True);
    SettingsItem.Insert("path"      , Path7z(SourceDirectory, "config\settings.json"));
    ConfigRecords.Add(SettingsItem);

    ConfigItem = New Map;
    ConfigItem.Insert("name"      , "config");
    ConfigItem.Insert("directory" , True);
    ConfigItem.Insert("entries"   , ConfigRecords);
    DescriptionRecords.Add(ConfigItem);

    ArchiveDescription = New Map;
    ArchiveDescription.Insert("entries", DescriptionRecords);

    Parameters = New Structure;
    Parameters.Insert("SevenZ_BaseDir"        , BaseDirectory);
    Parameters.Insert("SevenZ_SourceDir"      , SourceDirectory);
    Parameters.Insert("SevenZ_ArchivePath"    , ArchivePath);
    Parameters.Insert("SevenZ_ArchiveDescPath", ArchivePathDescription);
    Parameters.Insert("SevenZ_DestDir"        , DestinateDirectory);
    Parameters.Insert("SevenZ_DestBufferDir"  , DestinationDirectoryBuffer);
    Parameters.Insert("SevenZ_Description"    , ArchiveDescription);
    Parameters.Insert("SevenZ_ExpectedFiles"  , ExpectedFiles);

    Write7zParameters(Parameters);

    Z7_ArchiveDirectory(Parameters);
    Z7_UnarchiveDirectory(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete 7z test directory");

EndProcedure

#EndRegion // Archiving

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Archiving

Procedure Z7_GetArchivingSettingsStructure()

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchivingSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetArchivingSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchivingSettingsStructure", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetArchivingSettingsStructure", "Clear");

    Options = New Structure;
    Options.Insert("empty", Ложь);
    Options.Insert("map", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchivingSettingsStructure", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetArchivingSettingsStructure", "AsMap");

EndProcedure

Procedure Z7_ArchiveDirectory(Parameters)

    SourceDirectory = Parameters["SevenZ_SourceDir"];
    ArchivePath     = Parameters["SevenZ_ArchivePath"];

    Options = New Structure;
    Options.Insert("src", SourceDirectory);
    Options.Insert("dest", ArchivePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ArchiveDirectory", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ArchiveDirectory", , ArchivePath);

    Options = New Structure;
    Options.Insert("src", SourceDirectory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ArchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ArchiveDirectory", "ToMemory");

    Description     = Parameters["SevenZ_Description"];
    ArchivePathDesc = Parameters["SevenZ_ArchiveDescPath"];

    Options = New Structure;
    Options.Insert("src", Description);
    Options.Insert("dest", ArchivePathDesc);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ArchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ArchiveDirectory", "FromDescription", ArchivePathDesc);

    Options = New Structure;
    Options.Insert("src", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ArchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ArchiveDirectory", "FromDescriptionToMemory");

EndProcedure

Procedure Z7_UnarchiveDirectory(Parameters)

    ArchivePath                = Parameters["SevenZ_ArchivePath"];
    DestinateDirectory         = Parameters["SevenZ_DestDir"];
    DestinationDirectoryBuffer = Parameters["SevenZ_DestBufferDir"];
    ExpectedFiles              = Parameters["SevenZ_ExpectedFiles"];

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("dest", DestinateDirectory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", , DestinateDirectory, ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchivePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", "ToDescription", "", ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);
    Options.Insert("dest", DestinationDirectoryBuffer);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", "ToDescriptionFromMemory", "", ExpectedFiles);

EndProcedure

#EndRegion // Archiving

#EndRegion // AtomicTests

Procedure Write7zParameters(Parameters)

    OPI_TestDataRetrieval.WriteParameter("SevenZ_BaseDir"    , Parameters["SevenZ_BaseDir"]);
    OPI_TestDataRetrieval.WriteParameter("SevenZ_SourceDir"  , Parameters["SevenZ_SourceDir"]);
    OPI_TestDataRetrieval.WriteParameter("SevenZ_ArchivePath", Parameters["SevenZ_ArchivePath"]);
    OPI_TestDataRetrieval.WriteParameter("SevenZ_DestDir"    , Parameters["SevenZ_DestDir"]);

EndProcedure

Function Path7z(BaseDirectory, RelativePath)

    Return StrTemplate("%1/%2", BaseDirectory, RelativePath);

EndFunction

#EndRegion // Private


#Region Alternate

Procedure Z7_Архивация() Export
    Z7_Archiving();
EndProcedure

#EndRegion
