// OneScript: ./OInt/tests/Modules/OPIt_Tar.os

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

// #Use oint
// #Use asserts
// #Use "internal"

#If Not WebClient Then // !OPI

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("Tar");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Tar");

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
    FileCopy(ArchivePath, ArchiveBufferPath);

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

    Result = OPI_Tar.GetArchivingSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Tar", "GetArchivingSettingsStructure");

    Result = OPI_Tar.GetArchivingSettingsStructure(True);
    OPI_TestDataRetrieval.Process(Result, "Tar", "GetArchivingSettingsStructure", "Clear");

    Result = OPI_Tar.GetArchivingSettingsStructure(False, True);
    OPI_TestDataRetrieval.Process(Result, "Tar", "GetArchivingSettingsStructure", "AsMap");

EndProcedure

Procedure ZTar_ArchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar");

    If Parameters.Property("Tar_SourceDir")
        And Parameters.Property("Tar_ArchivePath")
        And NOT Parameters.Property("Tar_SourceDirCompress")
        And NOT (Parameters.Property("Tar_ArchiveGzipPath") And NOT Parameters.Property("Tar_Description")) Then

        SourceDirectory = Parameters["Tar_SourceDir"];
        ArchivePath     = Parameters["Tar_ArchivePath"];

        Result = OPI_Tar.ArchiveDirectory(SourceDirectory, ArchivePath);

        // END

        OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", , ArchivePath);

        Result = OPI_Tar.ArchiveDirectory(SourceDirectory);
        OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "ToMemory");

        If Parameters.Property("Tar_Description") And Parameters.Property("Tar_ArchiveDescPath") Then

            Description     = Parameters["Tar_Description"];
            ArchivePathDesc = Parameters["Tar_ArchiveDescPath"];

            Result = OPI_Tar.ArchiveDirectory(Description, ArchivePathDesc);
            OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "FromDescription", ArchivePathDesc);

            Result = OPI_Tar.ArchiveDirectory(Description);
            OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "FromDescriptionToMemory");

        EndIf;

    EndIf;

    If Parameters.Property("Tar_ArchiveGzipPath")
        And Parameters.Property("Tar_SourceDir")
        And NOT Parameters.Property("Tar_SourceDirCompress") Then

        SourceDirectory        = Parameters["Tar_SourceDir"];
        GzipArchivePath        = Parameters["Tar_ArchiveGzipPath"];
        Settings               = OPI_Tar.GetArchivingSettingsStructure(True);
        Settings["gzip"]       = True;
        Settings["gzip_level"] = 9;

        Result = OPI_Tar.ArchiveDirectory(SourceDirectory, GzipArchivePath, Settings);
        OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "WithGzip", GzipArchivePath);

    EndIf;

    If Parameters.Property("Tar_SourceDirCompress") Then

        CompressionDirectory = Parameters["Tar_SourceDirCompress"];
        PlainArchivePath     = Parameters["Tar_ArchivePlainPath"];
        GzipArchivePath      = Parameters["Tar_ArchiveGzipPath"];

        Result = OPI_Tar.ArchiveDirectory(CompressionDirectory, PlainArchivePath);
        OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "WithoutGzip", PlainArchivePath);

        GzipSettings               = OPI_Tar.GetArchivingSettingsStructure(True);
        GzipSettings["gzip"]       = True;
        GzipSettings["gzip_level"] = 9;

        Result = OPI_Tar.ArchiveDirectory(CompressionDirectory, GzipArchivePath, GzipSettings);
        OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "WithGzip", GzipArchivePath);

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

        Result = OPI_Tar.UnarchiveDirectory(ArchivePath, DestinateDirectory);

        // END

        OPI_TestDataRetrieval.Process(Result, "Tar", "UnarchiveDirectory", , DestinateDirectory, ExpectedFiles);

        Result = OPI_Tar.UnarchiveDirectory(ArchivePath);
        OPI_TestDataRetrieval.Process(Result, "Tar", "UnarchiveDirectory", "ToDescription", "", ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Result = OPI_Tar.UnarchiveDirectory(ArchiveBinary, DestinationDirectoryBuffer);
        OPI_TestDataRetrieval.Process(Result, "Tar", "UnarchiveDirectory", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

        Result = OPI_Tar.UnarchiveDirectory(ArchiveBinary);
        OPI_TestDataRetrieval.Process(Result, "Tar", "UnarchiveDirectory", "ToDescriptionFromMemory", "", ExpectedFiles);

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

        Result = OPI_Tar.GetFilesList(ArchivePath);

        // END

        OPI_TestDataRetrieval.Process(Result, "Tar", "GetFilesList", , ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Result = OPI_Tar.GetFilesList(ArchiveBinary);
        OPI_TestDataRetrieval.Process(Result, "Tar", "GetFilesList", "FromMemory", ExpectedFiles);

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

        Result = OPI_Tar.GetMetadata(ArchivePath);

        // END

        OPI_TestDataRetrieval.Process(Result, "Tar", "GetMetadata", , ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Result = OPI_Tar.GetMetadata(ArchiveBinary);
        OPI_TestDataRetrieval.Process(Result, "Tar", "GetMetadata", "FromMemory", ExpectedFiles);

    EndIf;

    If Parameters.Property("Tar_ArchiveGzipPath") And Parameters.Property("Tar_ArchivePlainPath") Then

        PlainArchivePath = Parameters["Tar_ArchivePlainPath"];
        GzipArchivePath  = Parameters["Tar_ArchiveGzipPath"];
        ExpectedFiles    = Parameters["Tar_ExpectedFiles"];

        PlainMetadata = OPI_Tar.GetMetadata(PlainArchivePath);
        PlainSize     = PlainMetadata["archive_size"];

        ExpectedMetadata = New Structure;
        ExpectedMetadata.Insert("archive_less_than", PlainSize);

        Result = OPI_Tar.GetMetadata(GzipArchivePath);
        OPI_TestDataRetrieval.Process(Result, "Tar", "GetMetadata", "WithGzip", ExpectedFiles, ExpectedMetadata);

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

    Result = OPI_Tar.UnpackFiles(ArchivePath, PartialPaths, DestinateDirectory);

    // END

    OPI_TestDataRetrieval.Process(Result, "Tar", "UnpackFiles", , DestinateDirectory, ExpectedFiles);

    Result = OPI_Tar.UnpackFiles(ArchivePath, PartialPaths);
    OPI_TestDataRetrieval.Process(Result, "Tar", "UnpackFiles", "ToDescription", "", ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Result = OPI_Tar.UnpackFiles(ArchiveBinary, PartialPaths, DestinationDirectoryBuffer);
    OPI_TestDataRetrieval.Process(Result, "Tar", "UnpackFiles", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

    Result = OPI_Tar.UnpackFiles(ArchiveBinary, PartialPaths);
    OPI_TestDataRetrieval.Process(Result, "Tar", "UnpackFiles", "ToDescriptionFromMemory", "", ExpectedFiles);

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

    Result = OPI_Tar.ModifyArchive(ArchivePath, AddableFiles, DeletablePaths);

    // END

    OPI_TestDataRetrieval.Process(Result, "Tar", "ModifyArchive", , ArchivePath);

    FileList = OPI_Tar.GetFilesList(ArchivePath);
    OPI_TestDataRetrieval.Process(FileList, "Tar", "GetFilesList", "AfterModification", ExpectedFiles);

    UnpackResult = OPI_Tar.UnarchiveDirectory(ArchivePath, DestinateDirectory);
    OPI_TestDataRetrieval.Process(UnpackResult, "Tar", "UnarchiveDirectory", "AfterModification", DestinateDirectory, ExpectedFiles);

    ArchiveBinary  = New BinaryData(ArchiveBufferPath);
    Result         = OPI_Tar.ModifyArchive(ArchiveBinary, AddableFiles, DeletablePaths);
    ArchiveForList = Result;

    If OPI_Tools.ThisIsCollection(Result, True)
        And OPI_Tools.CollectionFieldExists(Result, "result") Then

        Result         = OPI_Tar.ModifyArchive(ArchiveBufferPath, AddableFiles, DeletablePaths);
        ArchiveForList = ArchiveBufferPath;

        OPI_TestDataRetrieval.Process(Result, "Tar", "ModifyArchive", , ArchiveBufferPath);

    Else

        OPI_TestDataRetrieval.Process(Result, "Tar", "ModifyArchive", "FromMemory");

    EndIf;

    FileList = OPI_Tar.GetFilesList(ArchiveForList);
    OPI_TestDataRetrieval.Process(FileList, "Tar", "GetFilesList", "AfterModificationFromMemory", ExpectedFiles);

EndProcedure

#EndRegion // ArchiveModification

#EndRegion // AtomicTests

Function TarPath(BaseDirectory, RelativePath)

    Return StrTemplate("%1/%2", BaseDirectory, RelativePath);

EndFunction

#EndRegion // Private

#EndIf // !OPI
