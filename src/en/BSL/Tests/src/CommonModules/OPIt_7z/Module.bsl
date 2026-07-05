// OneScript: ./OInt/tests/Modules/OPIt_7z.os

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

    OPI_TestDataRetrieval.FormYAXTests("7z");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("7z");

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

    OPI_TestDataRetrieval.WriteArchiveParameters(Parameters);

    Z7_ArchiveDirectory(Parameters);
    Z7_UnarchiveDirectory(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete 7z test directory");

EndProcedure

Procedure Z7_ArchivingWithPassword() Export

    BaseDirectory = TempFilesDir()
        + "\opi_sevenz_pwd_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory            = Path7z(BaseDirectory, "src");
    DestinateDirectory         = Path7z(BaseDirectory, "out");
    DestinationDirectoryBuffer = Path7z(BaseDirectory, "out_buffer");
    ArchivePath                = Path7z(BaseDirectory, "archive_pwd.7z");

    CreateDirectory(SourceDirectory);
    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);

    ExpectedFiles = New Map;
    ExpectedFiles.Insert("secret.txt", "Protected content");
    GetBinaryDataFromString("Protected content", "UTF-8").Write(Path7z(SourceDirectory, "secret.txt"));

    Password = "OPI_Test7zPwd";

    Parameters = New Structure;
    Parameters.Insert("SevenZ_BaseDir"            , BaseDirectory);
    Parameters.Insert("SevenZ_SourceDir"          , SourceDirectory);
    Parameters.Insert("SevenZ_ArchivePasswordPath", ArchivePath);
    Parameters.Insert("SevenZ_DestDir"            , DestinateDirectory);
    Parameters.Insert("SevenZ_DestBufferDir"      , DestinationDirectoryBuffer);
    Parameters.Insert("SevenZ_ExpectedFiles"      , ExpectedFiles);
    Parameters.Insert("SevenZ_Password"           , Password);

    OPI_TestDataRetrieval.WriteArchiveParameters(Parameters);

    Z7_ArchiveDirectory(Parameters);
    Z7_UnarchiveDirectory(Parameters);
    Z7_GetFilesList(Parameters);
    Z7_GetMetadata(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete 7z test directory");

EndProcedure

#EndRegion // Archiving

#Region GettingMetadata

Procedure Z7_GettingMetadata() Export

    BaseDirectory = TempFilesDir()
        + "\opi_sevenz_meta_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory = Path7z(BaseDirectory, "src");
    ArchivePath     = Path7z(BaseDirectory, "archive.7z");

    CreateDirectory(SourceDirectory);

    ExpectedFiles = New Map;

    ExpectedFiles.Insert("readme.txt", "7z metadata test");
    GetBinaryDataFromString("7z metadata test", "UTF-8").Write(Path7z(SourceDirectory, "readme.txt"));

    CreateDirectory(Path7z(SourceDirectory, "docs"));
    ExpectedFiles.Insert("docs\note.txt", "Nested file");
    GetBinaryDataFromString("Nested file", "UTF-8").Write(Path7z(SourceDirectory, "docs\note.txt"));

    OPI_7z.ArchiveDirectory(SourceDirectory, ArchivePath);

    Parameters = New Structure;
    Parameters.Insert("SevenZ_ArchivePath"  , ArchivePath);
    Parameters.Insert("SevenZ_ExpectedFiles", ExpectedFiles);

    Z7_GetFilesList(Parameters);
    Z7_GetMetadata(Parameters);

    CompressionDirectory = Path7z(BaseDirectory, "src_compress");
    ArchivePathCopy      = Path7z(BaseDirectory, "archive_copy.7z");
    ArchivePathLzma      = Path7z(BaseDirectory, "archive_lzma.7z");
    CompressionFilePath  = Path7z(CompressionDirectory, "compressible.txt");

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
    GetBinaryDataFromString(CompressionText, "UTF-8").Write(Path7z(CompressionDirectory, "compressible2.txt"));

    CompressionParameters = New Structure;
    CompressionParameters.Insert("SevenZ_SourceDirCompress", CompressionDirectory);
    CompressionParameters.Insert("SevenZ_ArchiveCopyPath"  , ArchivePathCopy);
    CompressionParameters.Insert("SevenZ_ArchiveLzmaPath"  , ArchivePathLzma);
    CompressionParameters.Insert("SevenZ_ExpectedFiles"    , ExpectedCompressionFiles);

    Z7_ArchiveDirectory(CompressionParameters);
    Z7_GetMetadata(CompressionParameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete 7z test directory");

EndProcedure

#EndRegion // GettingMetadata

#Region ArchiveModification

Procedure Z7_PartialUnpacking() Export

    BaseDirectory = TempFilesDir()
        + "\opi_sevenz_partial_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory            = Path7z(BaseDirectory, "src");
    DestinateDirectory         = Path7z(BaseDirectory, "out");
    DestinationDirectoryBuffer = Path7z(BaseDirectory, "out_buffer");
    ArchivePath                = Path7z(BaseDirectory, "archive.7z");

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

    OPI_7z.ArchiveDirectory(SourceDirectory, ArchivePath);

    ExpectedPartial = New Map;
    ExpectedPartial.Insert("readme.txt"   , "OpenIntegrations root");
    ExpectedPartial.Insert("docs\note.txt", "Nested documentation");

    PartialPaths = New Array;
    PartialPaths.Add("readme.txt");
    PartialPaths.Add("docs/note.txt");

    Parameters = New Structure;
    Parameters.Insert("SevenZ_ArchivePath"     , ArchivePath);
    Parameters.Insert("SevenZ_DestDir"         , DestinateDirectory);
    Parameters.Insert("SevenZ_DestBufferDir"   , DestinationDirectoryBuffer);
    Parameters.Insert("SevenZ_PartialPaths"    , PartialPaths);
    Parameters.Insert("SevenZ_PartialExpected" , ExpectedPartial);

    Z7_UnpackFiles(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete 7z test directory");

EndProcedure

Procedure Z7_ArchiveModification() Export

    Z7_GetArchiveModificationStructure();

    BaseDirectory = TempFilesDir()
        + "\opi_sevenz_modify_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    SourceDirectory    = Path7z(BaseDirectory, "src");
    DestinateDirectory = Path7z(BaseDirectory, "out");
    ArchivePath        = Path7z(BaseDirectory, "archive.7z");
    ArchiveBufferPath  = Path7z(BaseDirectory, "archive_buffer.7z");
    NewFilePath        = Path7z(BaseDirectory, "extra_info.txt");

    CreateDirectory(SourceDirectory);
    CreateDirectory(DestinateDirectory);

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

    OPI_7z.ArchiveDirectory(SourceDirectory, ArchivePath);
    FileCopy(ArchivePath, ArchiveBufferPath);

    GetBinaryDataFromString("Added via path", "UTF-8").Write(NewFilePath);

    ExpectedAfterModification = New Map;
    ExpectedAfterModification.Insert("readme.txt"             , "Replaced readme content");
    ExpectedAfterModification.Insert("docs\note.txt"          , "Nested documentation");
    ExpectedAfterModification.Insert("data\nested\payload.bin", BinaryDescription);
    ExpectedAfterModification.Insert("extra\info.txt"         , "Added via path");

    Parameters = New Structure;
    Parameters.Insert("SevenZ_ArchivePath"        , ArchivePath);
    Parameters.Insert("SevenZ_ArchiveBufferPath"  , ArchiveBufferPath);
    Parameters.Insert("SevenZ_DestDir"            , DestinateDirectory);
    Parameters.Insert("SevenZ_NewFilePath"        , NewFilePath);
    Parameters.Insert("SevenZ_ExpectedAfterModify", ExpectedAfterModification);

    Z7_ModifyArchive(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete 7z test directory");

EndProcedure

#EndRegion // ArchiveModification

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Archiving

Procedure Z7_GetArchivingSettingsStructure()

    Result = OPI_7z.GetArchivingSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchivingSettingsStructure");

    Result = OPI_7z.GetArchivingSettingsStructure(True);
    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchivingSettingsStructure", "Clear");

    Result = OPI_7z.GetArchivingSettingsStructure(False, True);
    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchivingSettingsStructure", "AsMap");

EndProcedure

Procedure Z7_ArchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "SevenZ");

    If Parameters.Property("SevenZ_SourceDir")
        And Parameters.Property("SevenZ_ArchivePath")
        And NOT Parameters.Property("SevenZ_SourceDirCompress")
        And NOT (Parameters.Property("SevenZ_ArchivePasswordPath") And NOT Parameters.Property("SevenZ_Description")) Then

        SourceDirectory = Parameters["SevenZ_SourceDir"];
        ArchivePath     = Parameters["SevenZ_ArchivePath"];

        Result = OPI_7z.ArchiveDirectory(SourceDirectory, ArchivePath);

        // END

        OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", , ArchivePath);

        Result = OPI_7z.ArchiveDirectory(SourceDirectory);
        OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", "ToMemory");

        If Parameters.Property("SevenZ_Description") And Parameters.Property("SevenZ_ArchiveDescPath") Then

            Description     = Parameters["SevenZ_Description"];
            ArchivePathDesc = Parameters["SevenZ_ArchiveDescPath"];

            Result = OPI_7z.ArchiveDirectory(Description, ArchivePathDesc);
            OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", "FromDescription", ArchivePathDesc);

            Result = OPI_7z.ArchiveDirectory(Description);
            OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", "FromDescriptionToMemory");

        EndIf;

    EndIf;

    If Parameters.Property("SevenZ_Password")
        And Parameters.Property("SevenZ_ArchivePasswordPath")
        And NOT Parameters.Property("SevenZ_Description") Then

        SourceDirectory            = Parameters["SevenZ_SourceDir"];
        Password                   = Parameters["SevenZ_Password"];
        ArchivePasswordPath        = Parameters["SevenZ_ArchivePasswordPath"];
        Settings                   = OPI_7z.GetArchivingSettingsStructure(True);
        Settings["password"]       = Password;
        Settings["encrypt_header"] = True;

        Result = OPI_7z.ArchiveDirectory(SourceDirectory, ArchivePasswordPath, Settings);
        OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", "WithPassword", ArchivePasswordPath);

    EndIf;

    If Parameters.Property("SevenZ_SourceDirCompress") Then

        CompressionDirectory = Parameters["SevenZ_SourceDirCompress"];
        ArchivePathCopy      = Parameters["SevenZ_ArchiveCopyPath"];
        ArchivePathLzma      = Parameters["SevenZ_ArchiveLzmaPath"];

        CopySettings           = OPI_7z.GetArchivingSettingsStructure(True);
        CopySettings["method"] = "Copy";

        Result = OPI_7z.ArchiveDirectory(CompressionDirectory, ArchivePathCopy, CopySettings);
        OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", "Copy", ArchivePathCopy);

        LzmaSettings           = OPI_7z.GetArchivingSettingsStructure(True);
        LzmaSettings["method"] = "Lzma2";
        LzmaSettings["level"]  = 9;
        LzmaSettings["solid"]  = True;

        Result = OPI_7z.ArchiveDirectory(CompressionDirectory, ArchivePathLzma, LzmaSettings);
        OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", "Lzma2Solid", ArchivePathLzma);

    EndIf;

EndProcedure

Procedure Z7_UnarchiveDirectory(Parameters)

    If Parameters.Property("SevenZ_ArchivePath") Then

        ArchivePath                = Parameters["SevenZ_ArchivePath"];
        DestinateDirectory         = Parameters["SevenZ_DestDir"];
        DestinationDirectoryBuffer = Parameters["SevenZ_DestBufferDir"];
        ExpectedFiles              = Parameters["SevenZ_ExpectedFiles"];

        Result = OPI_7z.UnarchiveDirectory(ArchivePath, DestinateDirectory);

        // END

        OPI_TestDataRetrieval.Process(Result, "7z", "UnarchiveDirectory", , DestinateDirectory, ExpectedFiles);

        Result = OPI_7z.UnarchiveDirectory(ArchivePath);
        OPI_TestDataRetrieval.Process(Result, "7z", "UnarchiveDirectory", "ToDescription", "", ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Result = OPI_7z.UnarchiveDirectory(ArchiveBinary, DestinationDirectoryBuffer);
        OPI_TestDataRetrieval.Process(Result, "7z", "UnarchiveDirectory", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

        Result = OPI_7z.UnarchiveDirectory(ArchiveBinary);
        OPI_TestDataRetrieval.Process(Result, "7z", "UnarchiveDirectory", "ToDescriptionFromMemory", "", ExpectedFiles);

    EndIf;

    If Parameters.Property("SevenZ_Password") Then

        Password            = Parameters["SevenZ_Password"];
        ArchivePasswordPath = Parameters["SevenZ_ArchivePasswordPath"];
        ExpectedFiles       = Parameters["SevenZ_ExpectedFiles"];
        DirectoryPassword   = Path7z(Parameters["SevenZ_BaseDir"], "out_pwd");

        CreateDirectory(DirectoryPassword);

        Result = OPI_7z.UnarchiveDirectory(ArchivePasswordPath, DirectoryPassword, Password);
        OPI_TestDataRetrieval.Process(Result, "7z", "UnarchiveDirectory", "WithPassword", DirectoryPassword, ExpectedFiles);

        ArchivePassword = New BinaryData(ArchivePasswordPath);

        Result = OPI_7z.UnarchiveDirectory(ArchivePassword, "", Password);
        OPI_TestDataRetrieval.Process(Result, "7z", "UnarchiveDirectory", "InDescriptionWithPassword", "", ExpectedFiles);

    EndIf;

EndProcedure

#EndRegion // Archiving

#Region GettingMetadata

Procedure Z7_GetFilesList(Parameters)

    If Parameters.Property("SevenZ_ArchivePath") Then

        ArchivePath   = Parameters["SevenZ_ArchivePath"];
        ExpectedFiles = Parameters["SevenZ_ExpectedFiles"];

        Result = OPI_7z.GetFilesList(ArchivePath);

        // END

        OPI_TestDataRetrieval.Process(Result, "7z", "GetFilesList", , ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Result = OPI_7z.GetFilesList(ArchiveBinary);
        OPI_TestDataRetrieval.Process(Result, "7z", "GetFilesList", "FromMemory", ExpectedFiles);

    EndIf;

    If Parameters.Property("SevenZ_Password") Then

        Password            = Parameters["SevenZ_Password"];
        ArchivePasswordPath = Parameters["SevenZ_ArchivePasswordPath"];
        ExpectedFiles       = Parameters["SevenZ_ExpectedFiles"];

        Result = OPI_7z.GetFilesList(ArchivePasswordPath, Password);
        OPI_TestDataRetrieval.Process(Result, "7z", "GetFilesList", "WithPassword", ExpectedFiles);

        ArchivePassword = New BinaryData(ArchivePasswordPath);

        Result = OPI_7z.GetFilesList(ArchivePassword, Password);
        OPI_TestDataRetrieval.Process(Result, "7z", "GetFilesList", "FromMemoryWithPassword", ExpectedFiles);

    EndIf;

EndProcedure

Procedure Z7_GetMetadata(Parameters)

    If Parameters.Property("SevenZ_ArchivePath") Then

        ArchivePath   = Parameters["SevenZ_ArchivePath"];
        ExpectedFiles = Parameters["SevenZ_ExpectedFiles"];

        Result = OPI_7z.GetMetadata(ArchivePath);

        // END

        OPI_TestDataRetrieval.Process(Result, "7z", "GetMetadata", , ExpectedFiles);

        ArchiveBinary = New BinaryData(ArchivePath);

        Result = OPI_7z.GetMetadata(ArchiveBinary);
        OPI_TestDataRetrieval.Process(Result, "7z", "GetMetadata", "FromMemory", ExpectedFiles);

    EndIf;

    If Parameters.Property("SevenZ_Password") Then

        Password            = Parameters["SevenZ_Password"];
        ArchivePasswordPath = Parameters["SevenZ_ArchivePasswordPath"];
        ExpectedFiles       = Parameters["SevenZ_ExpectedFiles"];

        Result = OPI_7z.GetMetadata(ArchivePasswordPath, Password);
        OPI_TestDataRetrieval.Process(Result, "7z", "GetMetadata", "WithPassword", ExpectedFiles);

        ArchivePassword = New BinaryData(ArchivePasswordPath);

        Result = OPI_7z.GetMetadata(ArchivePassword, Password);
        OPI_TestDataRetrieval.Process(Result, "7z", "GetMetadata", "FromMemoryWithPassword", ExpectedFiles);

    EndIf;

    If Parameters.Property("SevenZ_ArchiveLzmaPath") Then

        ArchivePathCopy = Parameters["SevenZ_ArchiveCopyPath"];
        ArchivePathLzma = Parameters["SevenZ_ArchiveLzmaPath"];
        ExpectedFiles   = Parameters["SevenZ_ExpectedFiles"];

        MetadataCopy = OPI_7z.GetMetadata(ArchivePathCopy);
        SizeCopy     = MetadataCopy["packed_size"];

        ExpectedMetadata = New Structure;
        ExpectedMetadata.Insert("solid"           , True);
        ExpectedMetadata.Insert("packed_less_than", SizeCopy);

        Result = OPI_7z.GetMetadata(ArchivePathLzma);
        OPI_TestDataRetrieval.Process(Result, "7z", "GetMetadata", "WithSettings", ExpectedFiles, ExpectedMetadata);

    EndIf;

EndProcedure

#EndRegion // GettingMetadata

#Region ArchiveModification

Procedure Z7_GetArchiveModificationStructure()

    Result = OPI_7z.GetArchiveModificationStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchiveModificationStructure");

    Result = OPI_7z.GetArchiveModificationStructure(True);
    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchiveModificationStructure", "Clear");

    Result = OPI_7z.GetArchiveModificationStructure(False, True);
    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchiveModificationStructure", "AsMap");

EndProcedure

Procedure Z7_UnpackFiles(Parameters)

    ArchivePath                = Parameters["SevenZ_ArchivePath"];
    DestinateDirectory         = Parameters["SevenZ_DestDir"];
    DestinationDirectoryBuffer = Parameters["SevenZ_DestBufferDir"];
    PartialPaths               = Parameters["SevenZ_PartialPaths"];
    ExpectedFiles              = Parameters["SevenZ_PartialExpected"];

    Result = OPI_7z.UnpackFiles(ArchivePath, PartialPaths, DestinateDirectory);

    // END

    OPI_TestDataRetrieval.Process(Result, "7z", "UnpackFiles", , DestinateDirectory, ExpectedFiles);

    Result = OPI_7z.UnpackFiles(ArchivePath, PartialPaths);
    OPI_TestDataRetrieval.Process(Result, "7z", "UnpackFiles", "ToDescription", "", ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Result = OPI_7z.UnpackFiles(ArchiveBinary, PartialPaths, DestinationDirectoryBuffer);
    OPI_TestDataRetrieval.Process(Result, "7z", "UnpackFiles", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

    Result = OPI_7z.UnpackFiles(ArchiveBinary, PartialPaths);
    OPI_TestDataRetrieval.Process(Result, "7z", "UnpackFiles", "ToDescriptionFromMemory", "", ExpectedFiles);

EndProcedure

Procedure Z7_ModifyArchive(Parameters)

    ArchivePath        = Parameters["SevenZ_ArchivePath"];
    ArchiveBufferPath  = Parameters["SevenZ_ArchiveBufferPath"];
    DestinateDirectory = Parameters["SevenZ_DestDir"];
    NewFilePath        = Parameters["SevenZ_NewFilePath"];
    ExpectedFiles      = Parameters["SevenZ_ExpectedAfterModify"];

    AddableFiles = New Map;
    AddableFiles.Insert("extra/info.txt", NewFilePath);
    AddableFiles.Insert("readme.txt"    , GetBinaryDataFromString("Replaced readme content", "UTF-8"));

    DeletablePaths = New Array;
    DeletablePaths.Add("config/settings.json");
    DeletablePaths.Add("missing/path.txt");

    Result = OPI_7z.ModifyArchive(ArchivePath, AddableFiles, DeletablePaths);

    // END

    OPI_TestDataRetrieval.Process(Result, "7z", "ModifyArchive", , ArchivePath);

    FileList = OPI_7z.GetFilesList(ArchivePath);
    OPI_TestDataRetrieval.Process(FileList, "7z", "GetFilesList", "AfterModification", ExpectedFiles);

    UnpackResult = OPI_7z.UnarchiveDirectory(ArchivePath, DestinateDirectory);
    OPI_TestDataRetrieval.Process(UnpackResult, "7z", "UnarchiveDirectory", "AfterModification", DestinateDirectory, ExpectedFiles);

    ArchiveBinary  = New BinaryData(ArchiveBufferPath);
    Result         = OPI_7z.ModifyArchive(ArchiveBinary, AddableFiles, DeletablePaths);
    ArchiveForList = Result;

    If OPI_Tools.ThisIsCollection(Result, True)
        And OPI_Tools.CollectionFieldExists(Result, "result") Then

        Result         = OPI_7z.ModifyArchive(ArchiveBufferPath, AddableFiles, DeletablePaths);
        ArchiveForList = ArchiveBufferPath;

        OPI_TestDataRetrieval.Process(Result, "7z", "ModifyArchive", , ArchiveBufferPath);

    Else

        OPI_TestDataRetrieval.Process(Result, "7z", "ModifyArchive", "FromMemory");

    EndIf;

    FileList = OPI_7z.GetFilesList(ArchiveForList);
    OPI_TestDataRetrieval.Process(FileList, "7z", "GetFilesList", "AfterModificationFromMemory", ExpectedFiles);

EndProcedure

#EndRegion // ArchiveModification

#EndRegion // AtomicTests

Function Path7z(BaseDirectory, RelativePath)

    Return StrTemplate("%1/%2", BaseDirectory, RelativePath);

EndFunction

#EndRegion // Private

#EndIf // !OPI
