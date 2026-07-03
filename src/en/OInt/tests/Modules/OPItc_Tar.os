// OneScript: ./OInt/tests/Modules/OPItc_Tar.os

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

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use asserts
#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("Tar");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Tar");

EndFunction

#Region Internal

#Region RunnableTests

#Region Archiving

Procedure ZTar_Archive() Export

    ZTar_GetArchivingSettingsStructure();

    BaseDirectory = TempFilesDir()
        + "\opi_tar_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory            = TarPath(BaseDirectory, "src");
    DestinateDirectory         = TarPath(BaseDirectory, "out");
    DestinationDirectoryBuffer = TarPath(BaseDirectory, "out_buffer");
    ArchivePath                = TarPath(BaseDirectory, "archive.tar");
    ArchivePathDescription     = TarPath(BaseDirectory, "archive_desc.tar");

    CreateDirectory(SourceDirectory);
    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);

    ExpectedFiles = New Map;

    ExpectedFiles.Insert("readme.txt", "OpenIntegrations root");
    GetBinaryDataFromString("OpenIntegrations root", "UTF-8").Write(TarPath(SourceDirectory, "readme.txt"));

    CreateDirectory(TarPath(SourceDirectory, "docs"));
    ExpectedFiles.Insert("docs\note.txt", "Nested documentation");
    GetBinaryDataFromString("Nested documentation", "UTF-8").Write(TarPath(SourceDirectory, "docs\note.txt"));

    CreateDirectory(TarPath(SourceDirectory, "data\nested"));
    BinaryDescription = New Structure("binary, hex", True, "0102030405");
    ExpectedFiles.Insert("data\nested\payload.bin", BinaryDescription);
    GetBinaryDataFromHexString("0102030405").Write(TarPath(SourceDirectory, "data\nested\payload.bin"));

    CreateDirectory(TarPath(SourceDirectory, "config"));
    ExpectedFiles.Insert("config\settings.json", "{""enabled"": true}");
    GetBinaryDataFromString("{""enabled"": true}", "UTF-8").Write(TarPath(SourceDirectory, "config\settings.json"));

    DescriptionRecords = New Array;

    ReadmeItem = New Map;
    ReadmeItem.Insert("name"      , "readme.txt");
    ReadmeItem.Insert("directory" , False);
    ReadmeItem.Insert("from_path" , True);
    ReadmeItem.Insert("path"      , TarPath(SourceDirectory, "readme.txt"));
    DescriptionRecords.Add(ReadmeItem);

    DocsRecords = New Array;
    NoteItem    = New Map;
    NoteItem.Insert("name"      , "note.txt");
    NoteItem.Insert("directory" , False);
    NoteItem.Insert("from_path" , True);
    NoteItem.Insert("path"      , TarPath(SourceDirectory, "docs\note.txt"));
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
    PayloadItem.Insert("path"      , TarPath(SourceDirectory, "data\nested\payload.bin"));
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
    SettingsItem.Insert("path"      , TarPath(SourceDirectory, "config\settings.json"));
    ConfigRecords.Add(SettingsItem);

    ConfigItem = New Map;
    ConfigItem.Insert("name"      , "config");
    ConfigItem.Insert("directory" , True);
    ConfigItem.Insert("entries"   , ConfigRecords);
    DescriptionRecords.Add(ConfigItem);

    ArchiveDescription = New Map;
    ArchiveDescription.Insert("entries", DescriptionRecords);

    Parameters = New Structure;
    Parameters.Insert("Tar_BaseDir"        , BaseDirectory);
    Parameters.Insert("Tar_SourceDir"      , SourceDirectory);
    Parameters.Insert("Tar_ArchivePath"    , ArchivePath);
    Parameters.Insert("Tar_ArchiveDescPath", ArchivePathDescription);
    Parameters.Insert("Tar_DestDir"        , DestinateDirectory);
    Parameters.Insert("Tar_DestBufferDir"  , DestinationDirectoryBuffer);
    Parameters.Insert("Tar_Description"    , ArchiveDescription);
    Parameters.Insert("Tar_ExpectedFiles"  , ExpectedFiles);

    OPI_TestDataRetrieval.WriteArchiveParameters(Parameters);

    ZTar_ArchiveDirectory(Parameters);
    ZTar_UnarchiveDirectory(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test tar directory");

EndProcedure

Procedure ZTar_ArchiveWithGzip() Export

    BaseDirectory = TempFilesDir()
        + "\opi_tar_gzip_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory            = TarPath(BaseDirectory, "src");
    DestinateDirectory         = TarPath(BaseDirectory, "out");
    DestinationDirectoryBuffer = TarPath(BaseDirectory, "out_buffer");
    ArchivePath                = TarPath(BaseDirectory, "archive.tar.gz");

    CreateDirectory(SourceDirectory);
    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);

    ExpectedFiles = New Map;
    ExpectedFiles.Insert("secret.txt", "Compressed content");
    GetBinaryDataFromString("Compressed content", "UTF-8").Write(TarPath(SourceDirectory, "secret.txt"));

    Parameters = New Structure;
    Parameters.Insert("Tar_BaseDir"         , BaseDirectory);
    Parameters.Insert("Tar_SourceDir"       , SourceDirectory);
    Parameters.Insert("Tar_ArchiveGzipPath" , ArchivePath);
    Parameters.Insert("Tar_DestDir"         , DestinateDirectory);
    Parameters.Insert("Tar_DestBufferDir"   , DestinationDirectoryBuffer);
    Parameters.Insert("Tar_ExpectedFiles"   , ExpectedFiles);

    OPI_TestDataRetrieval.WriteArchiveParameters(Parameters);

    ZTar_ArchiveDirectory(Parameters);
    ZTar_UnarchiveDirectory(Parameters);
    ZTar_GetFilesList(Parameters);
    ZTar_GetMetadata(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test tar directory");

EndProcedure

#EndRegion // Archiving

#Region GettingMetadata

Procedure ZTar_GetMetadata() Export

    BaseDirectory = TempFilesDir()
        + "\opi_tar_meta_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory = TarPath(BaseDirectory, "src");
    ArchivePath     = TarPath(BaseDirectory, "archive.tar");

    CreateDirectory(SourceDirectory);

    ExpectedFiles = New Map;

    ExpectedFiles.Insert("readme.txt", "tar metadata test");
    GetBinaryDataFromString("tar metadata test", "UTF-8").Write(TarPath(SourceDirectory, "readme.txt"));

    CreateDirectory(TarPath(SourceDirectory, "docs"));
    ExpectedFiles.Insert("docs\note.txt", "Nested file");
    GetBinaryDataFromString("Nested file", "UTF-8").Write(TarPath(SourceDirectory, "docs\note.txt"));

    OPI_Tar.ArchiveDirectory(SourceDirectory, ArchivePath);

    Parameters = New Structure;
    Parameters.Insert("Tar_ArchivePath"  , ArchivePath);
    Parameters.Insert("Tar_ExpectedFiles", ExpectedFiles);

    ZTar_GetFilesList(Parameters);
    ZTar_GetMetadata(Parameters);

    CompressionDirectory = TarPath(BaseDirectory, "src_compress");
    PlainArchivePath     = TarPath(BaseDirectory, "archive_plain.tar");
    GzipArchivePath      = TarPath(BaseDirectory, "archive_gzip.tar.gz");
    CompressionFilePath  = TarPath(CompressionDirectory, "compressible.txt");

    CreateDirectory(CompressionDirectory);

    ExpectedCompressionFiles = New Map;

    Fragment        = "ABCD1234EFGH5678";
    CompressionText = "";

    For Index           = 1 To 2000 Do
        CompressionText = CompressionText + Fragment;
    EndDo;

    ExpectedCompressionFiles.Insert("compressible.txt" , CompressionText);
    ExpectedCompressionFiles.Insert("compressible2.txt", CompressionText);
    GetBinaryDataFromString(CompressionText, "UTF-8").Write(CompressionFilePath);
    GetBinaryDataFromString(CompressionText, "UTF-8").Write(TarPath(CompressionDirectory, "compressible2.txt"));

    CompressionParameters = New Structure;
    CompressionParameters.Insert("Tar_SourceDirCompress", CompressionDirectory);
    CompressionParameters.Insert("Tar_ArchivePlainPath" , PlainArchivePath);
    CompressionParameters.Insert("Tar_ArchiveGzipPath"  , GzipArchivePath);
    CompressionParameters.Insert("Tar_ExpectedFiles"    , ExpectedCompressionFiles);

    ZTar_ArchiveDirectory(CompressionParameters);
    ZTar_GetMetadata(CompressionParameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test tar directory");

EndProcedure

#EndRegion // GettingMetadata

#Region ArchiveModification

Procedure ZTar_PartialUnpack() Export

    BaseDirectory = TempFilesDir()
        + "\opi_tar_partial_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory            = TarPath(BaseDirectory, "src");
    DestinateDirectory         = TarPath(BaseDirectory, "out");
    DestinationDirectoryBuffer = TarPath(BaseDirectory, "out_buffer");
    ArchivePath                = TarPath(BaseDirectory, "archive.tar");

    CreateDirectory(SourceDirectory);
    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);

    ExpectedFiles = New Map;

    ExpectedFiles.Insert("readme.txt", "OpenIntegrations root");
    GetBinaryDataFromString("OpenIntegrations root", "UTF-8").Write(TarPath(SourceDirectory, "readme.txt"));

    CreateDirectory(TarPath(SourceDirectory, "docs"));
    ExpectedFiles.Insert("docs\note.txt", "Nested documentation");
    GetBinaryDataFromString("Nested documentation", "UTF-8").Write(TarPath(SourceDirectory, "docs\note.txt"));

    CreateDirectory(TarPath(SourceDirectory, "data\nested"));
    BinaryDescription = New Structure("binary, hex", True, "0102030405");
    ExpectedFiles.Insert("data\nested\payload.bin", BinaryDescription);
    GetBinaryDataFromHexString("0102030405").Write(TarPath(SourceDirectory, "data\nested\payload.bin"));

    CreateDirectory(TarPath(SourceDirectory, "config"));
    ExpectedFiles.Insert("config\settings.json", "{""enabled"": true}");
    GetBinaryDataFromString("{""enabled"": true}", "UTF-8").Write(TarPath(SourceDirectory, "config\settings.json"));

    OPI_Tar.ArchiveDirectory(SourceDirectory, ArchivePath);

    ExpectedPartial = New Map;
    ExpectedPartial.Insert("readme.txt"   , "OpenIntegrations root");
    ExpectedPartial.Insert("docs\note.txt", "Nested documentation");

    PartialPaths = New Array;
    PartialPaths.Add("readme.txt");
    PartialPaths.Add("docs/note.txt");

    Parameters = New Structure;
    Parameters.Insert("Tar_ArchivePath"     , ArchivePath);
    Parameters.Insert("Tar_DestDir"         , DestinateDirectory);
    Parameters.Insert("Tar_DestBufferDir"   , DestinationDirectoryBuffer);
    Parameters.Insert("Tar_PartialPaths"    , PartialPaths);
    Parameters.Insert("Tar_PartialExpected" , ExpectedPartial);

    ZTar_UnpackFiles(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test tar directory");

EndProcedure

Procedure ZTar_ChangeArchive() Export

    BaseDirectory = TempFilesDir()
        + "\opi_tar_modify_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory    = TarPath(BaseDirectory, "src");
    DestinateDirectory = TarPath(BaseDirectory, "out");
    ArchivePath        = TarPath(BaseDirectory, "archive.tar");
    ArchiveBufferPath  = TarPath(BaseDirectory, "archive_buffer.tar");
    NewFilePath        = TarPath(BaseDirectory, "extra_info.txt");

    CreateDirectory(SourceDirectory);
    CreateDirectory(DestinateDirectory);

    ExpectedFiles = New Map;

    ExpectedFiles.Insert("readme.txt", "OpenIntegrations root");
    GetBinaryDataFromString("OpenIntegrations root", "UTF-8").Write(TarPath(SourceDirectory, "readme.txt"));

    CreateDirectory(TarPath(SourceDirectory, "docs"));
    ExpectedFiles.Insert("docs\note.txt", "Nested documentation");
    GetBinaryDataFromString("Nested documentation", "UTF-8").Write(TarPath(SourceDirectory, "docs\note.txt"));

    CreateDirectory(TarPath(SourceDirectory, "data\nested"));
    BinaryDescription = New Structure("binary, hex", True, "0102030405");
    ExpectedFiles.Insert("data\nested\payload.bin", BinaryDescription);
    GetBinaryDataFromHexString("0102030405").Write(TarPath(SourceDirectory, "data\nested\payload.bin"));

    CreateDirectory(TarPath(SourceDirectory, "config"));
    ExpectedFiles.Insert("config\settings.json", "{""enabled"": true}");
    GetBinaryDataFromString("{""enabled"": true}", "UTF-8").Write(TarPath(SourceDirectory, "config\settings.json"));

    OPI_Tar.ArchiveDirectory(SourceDirectory, ArchivePath);
    CopyFile(ArchivePath, ArchiveBufferPath);

    GetBinaryDataFromString("Added via path", "UTF-8").Write(NewFilePath);

    ExpectedAfterModification = New Map;
    ExpectedAfterModification.Insert("readme.txt"             , "Replaced readme content");
    ExpectedAfterModification.Insert("docs\note.txt"          , "Nested documentation");
    ExpectedAfterModification.Insert("data\nested\payload.bin", BinaryDescription);
    ExpectedAfterModification.Insert("extra\info.txt"         , "Added via path");

    Parameters = New Structure;
    Parameters.Insert("Tar_ArchivePath"        , ArchivePath);
    Parameters.Insert("Tar_ArchiveBufferPath"  , ArchiveBufferPath);
    Parameters.Insert("Tar_DestDir"            , DestinateDirectory);
    Parameters.Insert("Tar_NewFilePath"        , NewFilePath);
    Parameters.Insert("Tar_ExpectedAfterModify", ExpectedAfterModification);

    ZTar_ModifyArchive(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test tar directory");

EndProcedure

#EndRegion // ArchiveModification

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Archiving

Procedure ZTar_GetArchivingSettingsStructure()

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetArchivingSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "GetArchivingSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetArchivingSettingsStructure", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "GetArchivingSettingsStructure", "Clear");

    Options = New Structure;
    Options.Insert("empty", Ложь);
    Options.Insert("map", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetArchivingSettingsStructure", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "GetArchivingSettingsStructure", "AsMap");

EndProcedure

Procedure ZTar_ArchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar");

    If Parameters.Property("Tar_SourceDir")
        And Parameters.Property("Tar_ArchivePath")
        And NOT Parameters.Property("Tar_SourceDirCompress")
        And NOT (Parameters.Property("Tar_ArchiveGzipPath") And NOT Parameters.Property("Tar_Description")) Then

        SourceDirectory = Parameters["Tar_SourceDir"];
        ArchivePath     = Parameters["Tar_ArchivePath"];

        Options = New Structure;
        Options.Insert("src", SourceDirectory);
        Options.Insert("dest", ArchivePath);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ArchiveDirectory", Options);

        // END

        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ArchiveDirectory", , ArchivePath);

        Options = New Structure;
        Options.Insert("src", SourceDirectory);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ArchiveDirectory", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ArchiveDirectory", "ToMemory");

        If Parameters.Property("Tar_Description") And Parameters.Property("Tar_ArchiveDescPath") Then

            Description     = Parameters["Tar_Description"];
            ArchivePathDesc = Parameters["Tar_ArchiveDescPath"];

            Options = New Structure;
            Options.Insert("src", Description);
            Options.Insert("dest", ArchivePathDesc);

            Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ArchiveDirectory", Options);
            OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ArchiveDirectory", "FromDescription", ArchivePathDesc);

            Options = New Structure;
            Options.Insert("src", Description);

            Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ArchiveDirectory", Options);
            OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ArchiveDirectory", "FromDescriptionToMemory");

        EndIf;

    EndIf;

    If Parameters.Property("Tar_ArchiveGzipPath")
        And Parameters.Property("Tar_SourceDir")
        And NOT Parameters.Property("Tar_SourceDirCompress") Then

        SourceDirectory     = Parameters["Tar_SourceDir"];
        GzipArchivePath     = Parameters["Tar_ArchiveGzipPath"];
        Options = New Structure;
        Options.Insert("empty", Истина);

        Settings = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetArchivingSettingsStructure", Options);
        Settings.gzip       = True;
        Settings.gzip_level = 9;

        Options = New Structure;
        Options.Insert("src", SourceDirectory);
        Options.Insert("dest", GzipArchivePath);
        Options.Insert("settings", Settings);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ArchiveDirectory", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ArchiveDirectory", "WithGzip", GzipArchivePath);

    EndIf;

    If Parameters.Property("Tar_SourceDirCompress") Then

        CompressionDirectory = Parameters["Tar_SourceDirCompress"];
        PlainArchivePath     = Parameters["Tar_ArchivePlainPath"];
        GzipArchivePath      = Parameters["Tar_ArchiveGzipPath"];

        Options = New Structure;
        Options.Insert("src", CompressionDirectory);
        Options.Insert("dest", PlainArchivePath);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ArchiveDirectory", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ArchiveDirectory", "WithoutGzip", PlainArchivePath);

        Options = New Structure;
        Options.Insert("empty", Истина);

        GzipSettings = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetArchivingSettingsStructure", Options);
        GzipSettings.gzip       = True;
        GzipSettings.gzip_level = 9;

        Options = New Structure;
        Options.Insert("src", CompressionDirectory);
        Options.Insert("dest", GzipArchivePath);
        Options.Insert("settings", GzipSettings);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ArchiveDirectory", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ArchiveDirectory", "WithGzip", GzipArchivePath);

    EndIf;

EndProcedure

Procedure ZTar_UnarchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar");

    ArchivePath = Undefined;

    If Parameters.Property("Tar_ArchivePath") Then
        ArchivePath = Parameters["Tar_ArchivePath"];
    ElsIf Parameters.Property("Tar_ArchiveGzipPath") Then
        ArchivePath = Parameters["Tar_ArchiveGzipPath"];
    EndIf;

    If ArchivePath <> Undefined Then
        DestinateDirectory         = Parameters["Tar_DestDir"];
        DestinationDirectoryBuffer = Parameters["Tar_DestBufferDir"];
        ExpectedFiles              = Parameters["Tar_ExpectedFiles"];

        Options = New Structure;
        Options.Insert("src", ArchivePath);
        Options.Insert("dest", DestinateDirectory);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnarchiveDirectory", Options);

        // END

        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "UnarchiveDirectory", , DestinateDirectory, ExpectedFiles);

        Options = New Structure;
        Options.Insert("src", ArchivePath);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnarchiveDirectory", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "UnarchiveDirectory", "ToDescription", "", ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Options = New Structure;
        Options.Insert("src", ArchiveBinary);
        Options.Insert("dest", DestinationDirectoryBuffer);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnarchiveDirectory", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "UnarchiveDirectory", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

        Options = New Structure;
        Options.Insert("src", ArchiveBinary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnarchiveDirectory", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "UnarchiveDirectory", "ToDescriptionFromMemory", "", ExpectedFiles);

    EndIf;

EndProcedure

#EndRegion // Archiving

#Region GettingMetadata

Procedure ZTar_GetFilesList(Parameters)

    ArchivePath = Undefined;

    If Parameters.Property("Tar_ArchivePath") Then
        ArchivePath = Parameters["Tar_ArchivePath"];
    ElsIf Parameters.Property("Tar_ArchiveGzipPath") Then
        ArchivePath = Parameters["Tar_ArchiveGzipPath"];
    EndIf;

    If ArchivePath <> Undefined Then
        ExpectedFiles = Parameters["Tar_ExpectedFiles"];

        Options = New Structure;
        Options.Insert("src", ArchivePath);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetFilesList", Options);

        // END

        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "GetFilesList", , ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Options = New Structure;
        Options.Insert("src", ArchiveBinary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetFilesList", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "GetFilesList", "FromMemory", ExpectedFiles);

    EndIf;

EndProcedure

Procedure ZTar_GetMetadata(Parameters)

    ArchivePath = Undefined;

    If Parameters.Property("Tar_ArchivePath") Then
        ArchivePath = Parameters["Tar_ArchivePath"];
    ElsIf Parameters.Property("Tar_ArchiveGzipPath") Then
        ArchivePath = Parameters["Tar_ArchiveGzipPath"];
    EndIf;

    If ArchivePath <> Undefined Then
        ExpectedFiles = Parameters["Tar_ExpectedFiles"];

        Options = New Structure;
        Options.Insert("src", ArchivePath);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetMetadata", Options);

        // END

        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "GetMetadata", , ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Options = New Structure;
        Options.Insert("src", ArchiveBinary);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetMetadata", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "GetMetadata", "FromMemory", ExpectedFiles);

    EndIf;

    If Parameters.Property("Tar_ArchiveGzipPath") And Parameters.Property("Tar_ArchivePlainPath") Then

        PlainArchivePath = Parameters["Tar_ArchivePlainPath"];
        GzipArchivePath  = Parameters["Tar_ArchiveGzipPath"];
        ExpectedFiles    = Parameters["Tar_ExpectedFiles"];

        Options = New Structure;
        Options.Insert("src", PlainArchivePath);

        PlainMetadata = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetMetadata", Options);
        PlainSize     = PlainMetadata["archive_size"];

        ExpectedMetadata = New Structure;
        ExpectedMetadata.Insert("archive_less_than", PlainSize);

        Options = New Structure;
        Options.Insert("src", GzipArchivePath);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetMetadata", Options);
        OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "GetMetadata", "WithGzip", ExpectedFiles, ExpectedMetadata);

    EndIf;

EndProcedure

#EndRegion // GettingMetadata

#Region ArchiveModification

Procedure ZTar_UnpackFiles(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar");

    ArchivePath                = Parameters["Tar_ArchivePath"];
    DestinateDirectory         = Parameters["Tar_DestDir"];
    DestinationDirectoryBuffer = Parameters["Tar_DestBufferDir"];
    PartialPaths               = Parameters["Tar_PartialPaths"];
    ExpectedFiles              = Parameters["Tar_PartialExpected"];

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("paths", PartialPaths);
    Options.Insert("dest", DestinateDirectory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnpackFiles", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "UnpackFiles", , DestinateDirectory, ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("paths", PartialPaths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnpackFiles", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "UnpackFiles", "ToDescription", "", ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);
    Options.Insert("paths", PartialPaths);
    Options.Insert("dest", DestinationDirectoryBuffer);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnpackFiles", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "UnpackFiles", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);
    Options.Insert("paths", PartialPaths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnpackFiles", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "UnpackFiles", "ToDescriptionFromMemory", "", ExpectedFiles);

EndProcedure

Procedure ZTar_ModifyArchive(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar");

    ArchivePath        = Parameters["Tar_ArchivePath"];
    ArchiveBufferPath  = Parameters["Tar_ArchiveBufferPath"];
    DestinateDirectory = Parameters["Tar_DestDir"];
    NewFilePath        = Parameters["Tar_NewFilePath"];
    ExpectedFiles      = Parameters["Tar_ExpectedAfterModify"];

    AddableFiles = New Map;
    AddableFiles.Insert("extra/info.txt", NewFilePath);
    AddableFiles.Insert("readme.txt"    , GetBinaryDataFromString("Replaced readme content", "UTF-8"));

    DeletablePaths = New Array;
    DeletablePaths.Add("config/settings.json");
    DeletablePaths.Add("missing/path.txt");

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("additions", AddableFiles);
    Options.Insert("deletions", DeletablePaths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ModifyArchive", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ModifyArchive", , ArchivePath);

    Options = New Structure;
    Options.Insert("src", ArchivePath);

    FileList = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetFilesList", Options);
    OPI_TestDataRetrieval.ProcessCLI(FileList, "Tar", "GetFilesList", "AfterModification", ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("dest", DestinateDirectory);

    UnpackResult = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(UnpackResult, "Tar", "UnarchiveDirectory", "AfterModification", DestinateDirectory, ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchiveBufferPath);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);
    Options.Insert("additions", AddableFiles);
    Options.Insert("deletions", DeletablePaths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "ModifyArchive", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "Tar", "ModifyArchive", "FromMemory");

    Options = New Structure;
    Options.Insert("src", Result);

    FileList = OPI_TestDataRetrieval.ExecuteTestCLI("tar", "GetFilesList", Options);
    OPI_TestDataRetrieval.ProcessCLI(FileList, "Tar", "GetFilesList", "AfterModificationFromMemory", ExpectedFiles);

EndProcedure

#EndRegion // ArchiveModification

#EndRegion // AtomicTests

Function TarPath(BaseDirectory, RelativePath)

    Return StrTemplate("%1/%2", BaseDirectory, RelativePath);

EndFunction

#EndRegion // Private


#Region Alternate

Procedure ZTar_Архивация() Export
    ZTar_Archive();
EndProcedure

Procedure ZTar_АрхивацияСGzip() Export
    ZTar_ArchiveWithGzip();
EndProcedure

Procedure ZTar_ПолучениеМетаданных() Export
    ZTar_GetMetadata();
EndProcedure

Procedure ZTar_ЧастичнаяРаспаковка() Export
    ZTar_PartialUnpack();
EndProcedure

Procedure ZTar_ИзменениеАрхива() Export
    ZTar_ChangeArchive();
EndProcedure

#EndRegion
