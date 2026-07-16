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

#Use oint
#Use asserts
#Use "internal"

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

Procedure Tar_Archiving() Export

    BaseDirectory = TempFilesDir()
        + GetPathSeparator()
        + "opi_tar_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    SourceDirectory            = TarPath(BaseDirectory, "src");
    DestinateDirectory         = TarPath(BaseDirectory, "out");
    DestinationDirectoryBuffer = TarPath(BaseDirectory, "out_buffer");
    ArchivePath                = TarPath(BaseDirectory, "archive.tar");
    ArchivePathDescription     = TarPath(BaseDirectory, "archive_desc.tar");
    GzipArchivePath            = TarPath(BaseDirectory, "archive.tar.gz");
    ArchiveBufferPath          = TarPath(BaseDirectory, "archive_buffer.tar");
    NewFilePath                = TarPath(BaseDirectory, "extra_info.txt");

    CreateDirectory(BaseDirectory);
    CreateDirectory(SourceDirectory);
    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);

    GetBinaryDataFromString("OpenIntegrations root", "UTF-8").Write(TarPath(SourceDirectory, "readme.txt"));

    CreateDirectory(TarPath(SourceDirectory, "docs"));
    GetBinaryDataFromString("Nested documentation", "UTF-8").Write(TarPath(SourceDirectory, "docs\note.txt"));

    CreateDirectory(TarPath(SourceDirectory, "config"));
    GetBinaryDataFromString("{""enabled"": true}", "UTF-8").Write(TarPath(SourceDirectory, "config\settings.json"));

    GetBinaryDataFromString("Added via path", "UTF-8").Write(NewFilePath);

    ExpectedFiles = New Map;
    ExpectedFiles.Insert("readme.txt"           , "OpenIntegrations root");
    ExpectedFiles.Insert("docs\note.txt"        , "Nested documentation");
    ExpectedFiles.Insert("config\settings.json" , "{""enabled"": true}");

    ExpectedPartial = New Map;
    ExpectedPartial.Insert("readme.txt"   , "OpenIntegrations root");
    ExpectedPartial.Insert("docs\note.txt", "Nested documentation");

    PartialPaths = New Array;
    PartialPaths.Add("readme.txt");
    PartialPaths.Add("docs/note.txt");

    ExpectedAfterModification = New Map;
    ExpectedAfterModification.Insert("readme.txt"    , "Replaced readme content");
    ExpectedAfterModification.Insert("docs\note.txt" , "Nested documentation");
    ExpectedAfterModification.Insert("extra\info.txt", "Added via path");

    DescriptionRecords = New Array;

    ReadmeItem = New Map;
    ReadmeItem.Insert("name"     , "readme.txt");
    ReadmeItem.Insert("directory", False);
    ReadmeItem.Insert("from_path", True);
    ReadmeItem.Insert("path"     , TarPath(SourceDirectory, "readme.txt"));
    DescriptionRecords.Add(ReadmeItem);

    DocsRecords = New Array;
    NoteItem    = New Map;
    NoteItem.Insert("name"     , "note.txt");
    NoteItem.Insert("directory", False);
    NoteItem.Insert("from_path", True);
    NoteItem.Insert("path"     , TarPath(SourceDirectory, "docs\note.txt"));
    DocsRecords.Add(NoteItem);

    DocsItem = New Map;
    DocsItem.Insert("name"     , "docs");
    DocsItem.Insert("directory", True);
    DocsItem.Insert("entries"  , DocsRecords);
    DescriptionRecords.Add(DocsItem);

    ArchiveDescription = New Map;
    ArchiveDescription.Insert("entries", DescriptionRecords);

    Parameters = New Structure;
    Parameters.Insert("Tar_BaseDir"             , BaseDirectory);
    Parameters.Insert("Tar_SourceDir"           , SourceDirectory);
    Parameters.Insert("Tar_ArchivePath"         , ArchivePath);
    Parameters.Insert("Tar_ArchiveDescPath"     , ArchivePathDescription);
    Parameters.Insert("Tar_ArchiveGzipPath"     , GzipArchivePath);
    Parameters.Insert("Tar_ArchiveBufferPath"   , ArchiveBufferPath);
    Parameters.Insert("Tar_DestDir"             , DestinateDirectory);
    Parameters.Insert("Tar_DestBufferDir"       , DestinationDirectoryBuffer);
    Parameters.Insert("Tar_NewFilePath"         , NewFilePath);
    Parameters.Insert("Tar_Description"         , ArchiveDescription);
    Parameters.Insert("Tar_ExpectedFiles"       , ExpectedFiles);
    Parameters.Insert("Tar_PartialPaths"        , PartialPaths);
    Parameters.Insert("Tar_PartialExpected"     , ExpectedPartial);
    Parameters.Insert("Tar_ExpectedAfterModify" , ExpectedAfterModification);

    OPI_TestDataRetrieval.WriteArchiveParameters(Parameters);

    Tar_GetArchivingSettingsStructure();
    Tar_ArchiveDirectory(Parameters);
    Tar_UnarchiveDirectory(Parameters);
    Tar_UnpackFiles(Parameters);
    Tar_ModifyArchive(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test tar directory");

EndProcedure

Procedure Tar_GettingMetadata() Export

    BaseDirectory = TempFilesDir()
        + GetPathSeparator()
        + "opi_tar_meta_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    SourceDirectory = TarPath(BaseDirectory, "src");
    ArchivePath     = TarPath(BaseDirectory, "archive.tar");

    CreateDirectory(BaseDirectory);
    CreateDirectory(SourceDirectory);

    GetBinaryDataFromString("tar metadata test", "UTF-8").Write(TarPath(SourceDirectory, "readme.txt"));

    CreateDirectory(TarPath(SourceDirectory, "docs"));
    GetBinaryDataFromString("Nested file", "UTF-8").Write(TarPath(SourceDirectory, "docs\note.txt"));

    OPI_Tar.ArchiveDirectory(SourceDirectory, ArchivePath);

    CompressionDirectory = TarPath(BaseDirectory, "src_compress");
    PlainArchivePath     = TarPath(BaseDirectory, "archive_plain.tar");
    GzipArchivePath      = TarPath(BaseDirectory, "archive_gzip.tar.gz");

    CreateDirectory(CompressionDirectory);

    Fragment        = "ABCD1234EFGH5678";
    CompressionText = "";

    For Index           = 1 To 2000 Do
        CompressionText = CompressionText + Fragment;
    EndDo;

    GetBinaryDataFromString(CompressionText, "UTF-8").Write(TarPath(CompressionDirectory, "compressible.txt"));
    GetBinaryDataFromString(CompressionText, "UTF-8").Write(TarPath(CompressionDirectory, "compressible2.txt"));

    OPI_Tar.ArchiveDirectory(CompressionDirectory, PlainArchivePath);

    GzipSettings               = OPI_Tar.GetArchivingSettingsStructure(True);
    GzipSettings["gzip"]       = True;
    GzipSettings["gzip_level"] = 9;

    OPI_Tar.ArchiveDirectory(CompressionDirectory, GzipArchivePath, GzipSettings);

    ExpectedFiles = New Map;
    ExpectedFiles.Insert("readme.txt"   , "tar metadata test");
    ExpectedFiles.Insert("docs\note.txt", "Nested file");

    ExpectedCompressionFiles = New Map;
    ExpectedCompressionFiles.Insert("compressible.txt" , CompressionText);
    ExpectedCompressionFiles.Insert("compressible2.txt", CompressionText);

    Parameters = New Structure;
    Parameters.Insert("Tar_BaseDir"          , BaseDirectory);
    Parameters.Insert("Tar_ArchivePath"      , ArchivePath);
    Parameters.Insert("Tar_ArchivePlainPath" , PlainArchivePath);
    Parameters.Insert("Tar_ArchiveGzipPath"  , GzipArchivePath);
    Parameters.Insert("Tar_ExpectedFiles"    , ExpectedFiles);
    Parameters.Insert("Tar_ExpectedCompress" , ExpectedCompressionFiles);

    OPI_TestDataRetrieval.WriteArchiveParameters(Parameters);

    Tar_GetFilesList(Parameters);
    Tar_GetMetadata(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test tar directory");

EndProcedure

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

Procedure Tar_GetArchivingSettingsStructure()

    Result = OPI_Tar.GetArchivingSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Tar", "GetArchivingSettingsStructure");

    Result = OPI_Tar.GetArchivingSettingsStructure(True);
    OPI_TestDataRetrieval.Process(Result, "Tar", "GetArchivingSettingsStructure", "Clear");

    Result = OPI_Tar.GetArchivingSettingsStructure(False, True);
    OPI_TestDataRetrieval.Process(Result, "Tar", "GetArchivingSettingsStructure", "AsMap");

EndProcedure

Procedure Tar_ArchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar"); // SKIP

    SourceDirectory = Parameters["Tar_SourceDir"];
    ArchivePath     = Parameters["Tar_ArchivePath"];

    Result = OPI_Tar.ArchiveDirectory(SourceDirectory, ArchivePath);

    // END

    OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", , ArchivePath);

    Result = OPI_Tar.ArchiveDirectory(SourceDirectory);
    OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "ToMemory");

    GzipArchivePath        = Parameters["Tar_ArchiveGzipPath"];
    Settings               = OPI_Tar.GetArchivingSettingsStructure(True);
    Settings["gzip"]       = True;
    Settings["gzip_level"] = 9;

    Result = OPI_Tar.ArchiveDirectory(SourceDirectory, GzipArchivePath, Settings);
    OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "WithGzip", GzipArchivePath);

    Description     = Parameters["Tar_Description"];
    ArchivePathDesc = Parameters["Tar_ArchiveDescPath"];

    Result = OPI_Tar.ArchiveDirectory(Description, ArchivePathDesc);
    OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "FromDescription", ArchivePathDesc);

    Result = OPI_Tar.ArchiveDirectory(Description);
    OPI_TestDataRetrieval.Process(Result, "Tar", "ArchiveDirectory", "FromDescriptionToMemory");

EndProcedure

Procedure Tar_UnarchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar"); // SKIP

    ArchivePath        = Parameters["Tar_ArchivePath"];
    DestinateDirectory = Parameters["Tar_DestDir"];

    Result = OPI_Tar.UnarchiveDirectory(ArchivePath, DestinateDirectory);

    // END

    ExpectedFiles = Parameters["Tar_ExpectedFiles"];

    OPI_TestDataRetrieval.Process(Result, "Tar", "UnarchiveDirectory", , DestinateDirectory, ExpectedFiles);

    Result = OPI_Tar.UnarchiveDirectory(ArchivePath);
    OPI_TestDataRetrieval.Process(Result, "Tar", "UnarchiveDirectory", "ToDescription", "", ExpectedFiles);

    DestinationDirectoryBuffer = Parameters["Tar_DestBufferDir"];
    ArchiveBinary              = New BinaryData(ArchivePath);

    Result = OPI_Tar.UnarchiveDirectory(ArchiveBinary, DestinationDirectoryBuffer);
    OPI_TestDataRetrieval.Process(Result
        , "Tar"
        , "UnarchiveDirectory"
        , "FromMemory"
        , DestinationDirectoryBuffer
        , ExpectedFiles);

    Result = OPI_Tar.UnarchiveDirectory(ArchiveBinary);
    OPI_TestDataRetrieval.Process(Result, "Tar", "UnarchiveDirectory", "ToDescriptionFromMemory", "", ExpectedFiles);

    GzipArchivePath          = Parameters["Tar_ArchiveGzipPath"];
    DestinationDirectoryGzip = Parameters["Tar_BaseDir"] + GetPathSeparator() + "out_gzip";
    CreateDirectory(DestinationDirectoryGzip);

    Result = OPI_Tar.UnarchiveDirectory(GzipArchivePath, DestinationDirectoryGzip);
    OPI_TestDataRetrieval.Process(Result
        , "Tar"
        , "UnarchiveDirectory"
        , "WithGzip"
        , DestinationDirectoryGzip
        , ExpectedFiles);

EndProcedure

Procedure Tar_UnpackFiles(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar"); // SKIP

    ArchivePath        = Parameters["Tar_ArchivePath"];
    DestinateDirectory = Parameters["Tar_DestDir"];
    Paths              = Parameters["Tar_PartialPaths"];

    Result = OPI_Tar.UnpackFiles(ArchivePath, Paths, DestinateDirectory);

    // END

    ExpectedFiles = Parameters["Tar_PartialExpected"];

    OPI_TestDataRetrieval.Process(Result, "Tar", "UnpackFiles", , DestinateDirectory, ExpectedFiles);

    Result = OPI_Tar.UnpackFiles(ArchivePath, Paths);
    OPI_TestDataRetrieval.Process(Result, "Tar", "UnpackFiles", "ToDescription", "", ExpectedFiles);

    DestinationDirectoryBuffer = Parameters["Tar_DestBufferDir"];
    ArchiveBinary              = New BinaryData(ArchivePath);

    Result = OPI_Tar.UnpackFiles(ArchiveBinary, Paths, DestinationDirectoryBuffer);
    OPI_TestDataRetrieval.Process(Result
        , "Tar"
        , "UnpackFiles"
        , "FromMemory"
        , DestinationDirectoryBuffer
        , ExpectedFiles);

    Result = OPI_Tar.UnpackFiles(ArchiveBinary, Paths);
    OPI_TestDataRetrieval.Process(Result, "Tar", "UnpackFiles", "ToDescriptionFromMemory", "", ExpectedFiles);

EndProcedure

Procedure Tar_ModifyArchive(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar"); // SKIP

    ArchivePath = Parameters["Tar_ArchivePath"];
    NewFilePath = Parameters["Tar_NewFilePath"];

    AddableFiles = New Map;
    AddableFiles.Insert("extra/info.txt", NewFilePath);
    AddableFiles.Insert("readme.txt"    , GetBinaryDataFromString("Replaced readme content", "UTF-8"));

    DeletablePaths = New Array;
    DeletablePaths.Add("config/settings.json");

    Result = OPI_Tar.ModifyArchive(ArchivePath, AddableFiles, DeletablePaths);

    // END

    OPI_TestDataRetrieval.Process(Result, "Tar", "ModifyArchive", , ArchivePath);

    DestinateDirectory = Parameters["Tar_DestDir"];
    ExpectedFiles      = Parameters["Tar_ExpectedAfterModify"];

    FileList = OPI_Tar.GetFilesList(ArchivePath);
    OPI_TestDataRetrieval.Process(FileList, "Tar", "GetFilesList", "AfterModification", ExpectedFiles);

    UnpackResult = OPI_Tar.UnarchiveDirectory(ArchivePath, DestinateDirectory);
    OPI_TestDataRetrieval.Process(UnpackResult
        , "Tar"
        , "UnarchiveDirectory"
        , "AfterModification"
        , DestinateDirectory
        , ExpectedFiles);

    ArchiveBufferPath = Parameters["Tar_ArchiveBufferPath"];
    SourceDirectory   = Parameters["Tar_SourceDir"];
    OPI_Tar.ArchiveDirectory(SourceDirectory, ArchiveBufferPath);

    ArchiveBinary  = New BinaryData(ArchiveBufferPath);
    Result         = OPI_Tar.ModifyArchive(ArchiveBinary, AddableFiles, DeletablePaths);
    ArchiveForList = Result;

    If OPI_Tools.ThisIsCollection(Result, True)
        And OPI_Tools.CollectionFieldExists(Result, "result") Then

        Result         = OPI_Tar.ModifyArchive(ArchiveBufferPath, AddableFiles, DeletablePaths);
        ArchiveForList = ArchiveBufferPath;

        OPI_TestDataRetrieval.Process(Result, "Tar", "ModifyArchive", "FromMemmoryToDisk", ArchiveBufferPath);

    Else

        OPI_TestDataRetrieval.Process(Result, "Tar", "ModifyArchive", "FromMemory");

    EndIf;

    FileList = OPI_Tar.GetFilesList(ArchiveForList);
    OPI_TestDataRetrieval.Process(FileList, "Tar", "GetFilesList", "AfterModificationFromMemory", ExpectedFiles);

EndProcedure

Procedure Tar_GetFilesList(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar"); // SKIP

    ArchivePath = Parameters["Tar_ArchivePath"];

    Result = OPI_Tar.GetFilesList(ArchivePath);

    // END

    ExpectedFiles = Parameters["Tar_ExpectedFiles"];

    OPI_TestDataRetrieval.Process(Result, "Tar", "GetFilesList", , ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Result = OPI_Tar.GetFilesList(ArchiveBinary);
    OPI_TestDataRetrieval.Process(Result, "Tar", "GetFilesList", "FromMemory", ExpectedFiles);

EndProcedure

Procedure Tar_GetMetadata(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "Tar"); // SKIP

    ArchivePath = Parameters["Tar_ArchivePath"];

    Result = OPI_Tar.GetMetadata(ArchivePath);

    // END

    ExpectedFiles = Parameters["Tar_ExpectedFiles"];

    OPI_TestDataRetrieval.Process(Result, "Tar", "GetMetadata", , ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Result = OPI_Tar.GetMetadata(ArchiveBinary);
    OPI_TestDataRetrieval.Process(Result, "Tar", "GetMetadata", "FromMemory", ExpectedFiles);

    PlainArchivePath    = Parameters["Tar_ArchivePlainPath"];
    GzipArchivePath     = Parameters["Tar_ArchiveGzipPath"];
    ExpectedCompression = Parameters["Tar_ExpectedCompress"];

    PlainMetadata = OPI_Tar.GetMetadata(PlainArchivePath);
    PlainSize     = PlainMetadata["archive_size"];

    ExpectedMetadata = New Structure;
    ExpectedMetadata.Insert("archive_less_than", PlainSize);

    Result = OPI_Tar.GetMetadata(GzipArchivePath);
    OPI_TestDataRetrieval.Process(Result
        , "Tar"
        , "GetMetadata"
        , "WithGzip"
        , ExpectedCompression
        , ExpectedMetadata);

EndProcedure

#EndRegion // AtomicTests

Function TarPath(BaseDirectory, RelativePath)

    RelativePath = StrReplace(RelativePath, "\", "/");
    Return StrTemplate("%1/%2", BaseDirectory, RelativePath);

EndFunction

#EndRegion // Private


#Region Alternate

Procedure Tar_Архивация() Export
    Tar_Archiving();
EndProcedure

Procedure Tar_ПолучениеМетаданных() Export
    Tar_GettingMetadata();
EndProcedure

#EndRegion