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
//#Use "../../formats"
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

Procedure Z7_Archiving() Export

    BaseDirectory = TempFilesDir()
        + GetPathSeparator()
        + "opi_sevenz_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    SourceDirectory              = Path7z(BaseDirectory, "src");
    SourceDirectoryPassword      = Path7z(BaseDirectory, "src_pwd");
    SourceDirectoryCompression   = Path7z(BaseDirectory, "src_compress");
    DestinateDirectory           = Path7z(BaseDirectory, "out");
    DestinationDirectoryBuffer   = Path7z(BaseDirectory, "out_buffer");
    DestinationDirectoryPassword = Path7z(BaseDirectory, "out_pwd");
    ArchivePath                  = Path7z(BaseDirectory, "archive.7z");
    ArchivePathDescription       = Path7z(BaseDirectory, "archive_desc.7z");
    ArchivePasswordPath          = Path7z(BaseDirectory, "archive_pwd.7z");
    ArchiveBufferPath            = Path7z(BaseDirectory, "archive_buffer.7z");
    ArchivePathCopy              = Path7z(BaseDirectory, "archive_copy.7z");
    ArchivePathLzma              = Path7z(BaseDirectory, "archive_lzma.7z");
    NewFilePath                  = Path7z(BaseDirectory, "extra_info.txt");

    CreateDirectory(BaseDirectory);
    CreateDirectory(SourceDirectory);
    CreateDirectory(SourceDirectoryPassword);
    CreateDirectory(SourceDirectoryCompression);
    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);
    CreateDirectory(DestinationDirectoryPassword);

    GetBinaryDataFromString("OpenIntegrations root", "UTF-8").Write(Path7z(SourceDirectory, "readme.txt"));

    CreateDirectory(Path7z(SourceDirectory, "docs"));
    GetBinaryDataFromString("Nested documentation", "UTF-8").Write(Path7z(SourceDirectory, "docs\note.txt"));

    CreateDirectory(Path7z(SourceDirectory, "data\nested"));
    BinaryDescription = New Structure("binary, hex", True, "0102030405");
    GetBinaryDataFromHexString("0102030405").Write(Path7z(SourceDirectory, "data\nested\payload.bin"));

    CreateDirectory(Path7z(SourceDirectory, "config"));
    GetBinaryDataFromString("{""enabled"": true}", "UTF-8").Write(Path7z(SourceDirectory, "config\settings.json"));

    GetBinaryDataFromString("Protected content", "UTF-8").Write(Path7z(SourceDirectoryPassword, "secret.txt"));
    GetBinaryDataFromString("Added via path"   , "UTF-8").Write(NewFilePath);

    Fragment        = "ABCD1234EFGH5678";
    CompressionText = "";

    For Index           = 1 To 2000 Do
        CompressionText = CompressionText + Fragment;
    EndDo;

    GetBinaryDataFromString(CompressionText, "UTF-8").Write(Path7z(SourceDirectoryCompression, "compressible.txt"));
    GetBinaryDataFromString(CompressionText, "UTF-8").Write(Path7z(SourceDirectoryCompression, "compressible2.txt"));

    ExpectedFiles = New Map;
    ExpectedFiles.Insert("readme.txt"             , "OpenIntegrations root");
    ExpectedFiles.Insert("docs\note.txt"          , "Nested documentation");
    ExpectedFiles.Insert("data\nested\payload.bin", BinaryDescription);
    ExpectedFiles.Insert("config\settings.json"   , "{""enabled"": true}");

    ExpectedPassword = New Map;
    ExpectedPassword.Insert("secret.txt", "Protected content");

    ExpectedCompression = New Map;
    ExpectedCompression.Insert("compressible.txt" , CompressionText);
    ExpectedCompression.Insert("compressible2.txt", CompressionText);

    ExpectedPartial = New Map;
    ExpectedPartial.Insert("readme.txt"   , "OpenIntegrations root");
    ExpectedPartial.Insert("docs\note.txt", "Nested documentation");

    PartialPaths = New Array;
    PartialPaths.Add("readme.txt");
    PartialPaths.Add("docs/note.txt");

    ExpectedAfterModification = New Map;
    ExpectedAfterModification.Insert("readme.txt"             , "Replaced readme content");
    ExpectedAfterModification.Insert("docs\note.txt"          , "Nested documentation");
    ExpectedAfterModification.Insert("data\nested\payload.bin", BinaryDescription);
    ExpectedAfterModification.Insert("extra\info.txt"         , "Added via path");

    DescriptionRecords = New Array;

    ReadmeItem = New Map;
    ReadmeItem.Insert("name"     , "readme.txt");
    ReadmeItem.Insert("directory", False);
    ReadmeItem.Insert("from_path", True);
    ReadmeItem.Insert("path"     , Path7z(SourceDirectory, "readme.txt"));
    DescriptionRecords.Add(ReadmeItem);

    DocsRecords = New Array;
    NoteItem    = New Map;
    NoteItem.Insert("name"     , "note.txt");
    NoteItem.Insert("directory", False);
    NoteItem.Insert("from_path", True);
    NoteItem.Insert("path"     , Path7z(SourceDirectory, "docs\note.txt"));
    DocsRecords.Add(NoteItem);

    DocsItem = New Map;
    DocsItem.Insert("name"     , "docs");
    DocsItem.Insert("directory", True);
    DocsItem.Insert("entries"  , DocsRecords);
    DescriptionRecords.Add(DocsItem);

    DataRecords = New Array;
    PayloadItem = New Map;
    PayloadItem.Insert("name"     , "payload.bin");
    PayloadItem.Insert("directory", False);
    PayloadItem.Insert("from_path", True);
    PayloadItem.Insert("path"     , Path7z(SourceDirectory, "data\nested\payload.bin"));
    DataRecords.Add(PayloadItem);

    DataItem      = New Map;
    DataItem.Insert("name"     , "data");
    DataItem.Insert("directory", True);
    NestedRecords = New Array;
    NestedItem    = New Map;
    NestedItem.Insert("name"     , "nested");
    NestedItem.Insert("directory", True);
    NestedItem.Insert("entries"  , DataRecords);
    NestedRecords.Add(NestedItem);
    DataItem.Insert("entries"  , NestedRecords);
    DescriptionRecords.Add(DataItem);

    ConfigRecords = New Array;
    SettingsItem  = New Map;
    SettingsItem.Insert("name"     , "settings.json");
    SettingsItem.Insert("directory", False);
    SettingsItem.Insert("from_path", True);
    SettingsItem.Insert("path"     , Path7z(SourceDirectory, "config\settings.json"));
    ConfigRecords.Add(SettingsItem);

    ConfigItem = New Map;
    ConfigItem.Insert("name"     , "config");
    ConfigItem.Insert("directory", True);
    ConfigItem.Insert("entries"  , ConfigRecords);
    DescriptionRecords.Add(ConfigItem);

    ArchiveDescription = New Map;
    ArchiveDescription.Insert("entries", DescriptionRecords);

    Parameters = New Structure;
    Parameters.Insert("SevenZ_BaseDir"             , BaseDirectory);
    Parameters.Insert("SevenZ_SourceDir"           , SourceDirectory);
    Parameters.Insert("SevenZ_SourceDirPassword"   , SourceDirectoryPassword);
    Parameters.Insert("SevenZ_SourceDirCompress"   , SourceDirectoryCompression);
    Parameters.Insert("SevenZ_ArchivePath"         , ArchivePath);
    Parameters.Insert("SevenZ_ArchiveDescPath"     , ArchivePathDescription);
    Parameters.Insert("SevenZ_ArchivePasswordPath" , ArchivePasswordPath);
    Parameters.Insert("SevenZ_ArchiveBufferPath"   , ArchiveBufferPath);
    Parameters.Insert("SevenZ_ArchiveCopyPath"     , ArchivePathCopy);
    Parameters.Insert("SevenZ_ArchiveLzmaPath"     , ArchivePathLzma);
    Parameters.Insert("SevenZ_DestDir"             , DestinateDirectory);
    Parameters.Insert("SevenZ_DestBufferDir"       , DestinationDirectoryBuffer);
    Parameters.Insert("SevenZ_DestPasswordDir"     , DestinationDirectoryPassword);
    Parameters.Insert("SevenZ_NewFilePath"         , NewFilePath);
    Parameters.Insert("SevenZ_Description"         , ArchiveDescription);
    Parameters.Insert("SevenZ_Password"            , "OPI_Test7zPwd");
    Parameters.Insert("SevenZ_ExpectedFiles"       , ExpectedFiles);
    Parameters.Insert("SevenZ_ExpectedPassword"    , ExpectedPassword);
    Parameters.Insert("SevenZ_ExpectedCompress"    , ExpectedCompression);
    Parameters.Insert("SevenZ_PartialPaths"        , PartialPaths);
    Parameters.Insert("SevenZ_PartialExpected"     , ExpectedPartial);
    Parameters.Insert("SevenZ_ExpectedAfterModify" , ExpectedAfterModification);

    OPI_TestDataRetrieval.WriteArchiveParameters(Parameters);

    Z7_GetArchivingSettingsStructure();
    Z7_GetArchiveModificationStructure();
    Z7_ArchiveDirectory(Parameters);
    Z7_UnarchiveDirectory(Parameters);
    Z7_UnpackFiles(Parameters);
    Z7_ModifyArchive(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete 7z test directory");

EndProcedure

Procedure Z7_GettingMetadata() Export

    BaseDirectory = TempFilesDir()
        + GetPathSeparator()
        + "opi_sevenz_meta_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    SourceDirectory            = Path7z(BaseDirectory, "src");
    SourceDirectoryPassword    = Path7z(BaseDirectory, "src_pwd");
    SourceDirectoryCompression = Path7z(BaseDirectory, "src_compress");
    ArchivePath                = Path7z(BaseDirectory, "archive.7z");
    ArchivePasswordPath        = Path7z(BaseDirectory, "archive_pwd.7z");
    ArchivePathCopy            = Path7z(BaseDirectory, "archive_copy.7z");
    ArchivePathLzma            = Path7z(BaseDirectory, "archive_lzma.7z");

    CreateDirectory(BaseDirectory);
    CreateDirectory(SourceDirectory);
    CreateDirectory(SourceDirectoryPassword);
    CreateDirectory(SourceDirectoryCompression);

    GetBinaryDataFromString("7z metadata test", "UTF-8").Write(Path7z(SourceDirectory, "readme.txt"));

    CreateDirectory(Path7z(SourceDirectory, "docs"));
    GetBinaryDataFromString("Nested file", "UTF-8").Write(Path7z(SourceDirectory, "docs\note.txt"));

    GetBinaryDataFromString("Protected content", "UTF-8").Write(Path7z(SourceDirectoryPassword, "secret.txt"));

    Fragment        = "ABCD1234EFGH5678";
    CompressionText = "";

    For Index           = 1 To 2000 Do
        CompressionText = CompressionText + Fragment;
    EndDo;

    GetBinaryDataFromString(CompressionText, "UTF-8").Write(Path7z(SourceDirectoryCompression, "compressible.txt"));
    GetBinaryDataFromString(CompressionText, "UTF-8").Write(Path7z(SourceDirectoryCompression, "compressible2.txt"));

    OPI_7z.ArchiveDirectory(SourceDirectory, ArchivePath);

    SettingsPassword                   = OPI_7z.GetArchivingSettingsStructure(True);
    SettingsPassword["password"]       = "OPI_Test7zPwd";
    SettingsPassword["encrypt_header"] = True;

    OPI_7z.ArchiveDirectory(SourceDirectoryPassword, ArchivePasswordPath, SettingsPassword);

    CopySettings           = OPI_7z.GetArchivingSettingsStructure(True);
    CopySettings["method"] = "Copy";

    OPI_7z.ArchiveDirectory(SourceDirectoryCompression, ArchivePathCopy, CopySettings);

    LzmaSettings           = OPI_7z.GetArchivingSettingsStructure(True);
    LzmaSettings["method"] = "Lzma2";
    LzmaSettings["level"]  = 9;
    LzmaSettings["solid"]  = True;

    OPI_7z.ArchiveDirectory(SourceDirectoryCompression, ArchivePathLzma, LzmaSettings);

    ExpectedFiles = New Map;
    ExpectedFiles.Insert("readme.txt"   , "7z metadata test");
    ExpectedFiles.Insert("docs\note.txt", "Nested file");

    ExpectedPassword = New Map;
    ExpectedPassword.Insert("secret.txt", "Protected content");

    ExpectedCompression = New Map;
    ExpectedCompression.Insert("compressible.txt" , CompressionText);
    ExpectedCompression.Insert("compressible2.txt", CompressionText);

    Parameters = New Structure;
    Parameters.Insert("SevenZ_BaseDir"            , BaseDirectory);
    Parameters.Insert("SevenZ_ArchivePath"        , ArchivePath);
    Parameters.Insert("SevenZ_ArchivePasswordPath", ArchivePasswordPath);
    Parameters.Insert("SevenZ_ArchiveCopyPath"    , ArchivePathCopy);
    Parameters.Insert("SevenZ_ArchiveLzmaPath"    , ArchivePathLzma);
    Parameters.Insert("SevenZ_Password"           , "OPI_Test7zPwd");
    Parameters.Insert("SevenZ_ExpectedFiles"      , ExpectedFiles);
    Parameters.Insert("SevenZ_ExpectedPassword"   , ExpectedPassword);
    Parameters.Insert("SevenZ_ExpectedCompress"   , ExpectedCompression);

    OPI_TestDataRetrieval.WriteArchiveParameters(Parameters);

    Z7_GetFilesList(Parameters);
    Z7_GetMetadata(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete 7z test directory");

EndProcedure

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

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

Procedure Z7_GetArchiveModificationStructure()

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchiveModificationStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetArchiveModificationStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchiveModificationStructure", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetArchiveModificationStructure", "Clear");

    Options = New Structure;
    Options.Insert("empty", Ложь);
    Options.Insert("map", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchiveModificationStructure", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetArchiveModificationStructure", "AsMap");

EndProcedure

Procedure Z7_ArchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "SevenZ"); // SKIP

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

    DirectoryPassword          = Parameters["SevenZ_SourceDirPassword"];
    ArchivePasswordPath        = Parameters["SevenZ_ArchivePasswordPath"];
    Password                   = Parameters["SevenZ_Password"];
    Options = New Structure;
    Options.Insert("empty", Истина);

    Settings = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchivingSettingsStructure", Options);
    Settings["password"]       = Password;
    Settings["encrypt_header"] = True;

    Options = New Structure;
    Options.Insert("src", DirectoryPassword);
    Options.Insert("dest", ArchivePasswordPath);
    Options.Insert("settings", Settings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ArchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ArchiveDirectory", "WithPassword", ArchivePasswordPath);

    CompressionDirectory = Parameters["SevenZ_SourceDirCompress"];
    ArchivePathCopy      = Parameters["SevenZ_ArchiveCopyPath"];
    ArchivePathLzma      = Parameters["SevenZ_ArchiveLzmaPath"];

    Options = New Structure;
    Options.Insert("empty", Истина);

    CopySettings = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchivingSettingsStructure", Options);
    CopySettings["method"] = "Copy";

    Options = New Structure;
    Options.Insert("src", CompressionDirectory);
    Options.Insert("dest", ArchivePathCopy);
    Options.Insert("settings", CopySettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ArchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ArchiveDirectory", "Copy", ArchivePathCopy);

    Options = New Structure;
    Options.Insert("empty", Истина);

    LzmaSettings = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetArchivingSettingsStructure", Options);
    LzmaSettings["method"] = "Lzma2";
    LzmaSettings["level"]  = 9;
    LzmaSettings["solid"]  = True;

    Options = New Structure;
    Options.Insert("src", CompressionDirectory);
    Options.Insert("dest", ArchivePathLzma);
    Options.Insert("settings", LzmaSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ArchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ArchiveDirectory", "Lzma2Solid", ArchivePathLzma);

EndProcedure

Procedure Z7_UnarchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "SevenZ"); // SKIP

    ArchivePath        = Parameters["SevenZ_ArchivePath"];
    DestinateDirectory = Parameters["SevenZ_DestDir"];

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("dest", DestinateDirectory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);

    // END

    ExpectedFiles = Parameters["SevenZ_ExpectedFiles"];

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", , DestinateDirectory, ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchivePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", "ToDescription", "", ExpectedFiles);

    DestinationDirectoryBuffer = Parameters["SevenZ_DestBufferDir"];
    ArchiveBinary              = New BinaryData(ArchivePath);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);
    Options.Insert("dest", DestinationDirectoryBuffer);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result
        , "7z"
        , "UnarchiveDirectory"
        , "FromMemory"
        , DestinationDirectoryBuffer
        , ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", "ToDescriptionFromMemory", "", ExpectedFiles);

    Password            = Parameters["SevenZ_Password"];
    ArchivePasswordPath = Parameters["SevenZ_ArchivePasswordPath"];
    DirectoryPassword   = Parameters["SevenZ_DestPasswordDir"];
    ExpectedPassword    = Parameters["SevenZ_ExpectedPassword"];

    Options = New Structure;
    Options.Insert("src", ArchivePasswordPath);
    Options.Insert("dest", DirectoryPassword);
    Options.Insert("password", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", "WithPassword", DirectoryPassword, ExpectedPassword);

    ArchivePassword = New BinaryData(ArchivePasswordPath);

    Options = New Structure;
    Options.Insert("src", ArchivePassword);
    Options.Insert("dest", "");
    Options.Insert("password", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnarchiveDirectory", "InDescriptionWithPassword", "", ExpectedPassword);

EndProcedure

Procedure Z7_UnpackFiles(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "SevenZ"); // SKIP

    ArchivePath        = Parameters["SevenZ_ArchivePath"];
    DestinateDirectory = Parameters["SevenZ_DestDir"];
    Paths              = Parameters["SevenZ_PartialPaths"];

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("paths", Paths);
    Options.Insert("dest", DestinateDirectory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnpackFiles", Options);

    // END

    ExpectedFiles = Parameters["SevenZ_PartialExpected"];

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnpackFiles", , DestinateDirectory, ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("paths", Paths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnpackFiles", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnpackFiles", "ToDescription", "", ExpectedFiles);

    DestinationDirectoryBuffer = Parameters["SevenZ_DestBufferDir"];
    ArchiveBinary              = New BinaryData(ArchivePath);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);
    Options.Insert("paths", Paths);
    Options.Insert("dest", DestinationDirectoryBuffer);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnpackFiles", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result
        , "7z"
        , "UnpackFiles"
        , "FromMemory"
        , DestinationDirectoryBuffer
        , ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);
    Options.Insert("paths", Paths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnpackFiles", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "UnpackFiles", "ToDescriptionFromMemory", "", ExpectedFiles);

EndProcedure

Procedure Z7_ModifyArchive(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "SevenZ"); // SKIP

    ArchivePath = Parameters["SevenZ_ArchivePath"];
    NewFilePath = Parameters["SevenZ_NewFilePath"];

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ModifyArchive", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ModifyArchive", , ArchivePath);

    DestinateDirectory = Parameters["SevenZ_DestDir"];
    ExpectedFiles      = Parameters["SevenZ_ExpectedAfterModify"];

    Options = New Structure;
    Options.Insert("src", ArchivePath);

    FileList = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetFilesList", Options);
    OPI_TestDataRetrieval.ProcessCLI(FileList, "7z", "GetFilesList", "AfterModification", ExpectedFiles);

    Options = New Structure;
    Options.Insert("src", ArchivePath);
    Options.Insert("dest", DestinateDirectory);

    UnpackResult = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "UnarchiveDirectory", Options);
    OPI_TestDataRetrieval.ProcessCLI(UnpackResult
        , "7z"
        , "UnarchiveDirectory"
        , "AfterModification"
        , DestinateDirectory
        , ExpectedFiles);

    ArchiveBufferPath = Parameters["SevenZ_ArchiveBufferPath"];
    SourceDirectory   = Parameters["SevenZ_SourceDir"];
    OPI_7z.ArchiveDirectory(SourceDirectory, ArchiveBufferPath);

    ArchiveBinary  = New BinaryData(ArchiveBufferPath);
    Options = New Structure;
    Options.Insert("src", ArchiveBinary);
    Options.Insert("additions", AddableFiles);
    Options.Insert("deletions", DeletablePaths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ModifyArchive", Options);
    ArchiveForList = Result;

    If OPI_Tools.ThisIsCollection(Result, True)
        And OPI_Tools.CollectionFieldExists(Result, "result") Then

        Options = New Structure;
        Options.Insert("src", ArchiveBufferPath);
        Options.Insert("additions", AddableFiles);
        Options.Insert("deletions", DeletablePaths);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "ModifyArchive", Options);
        ArchiveForList = ArchiveBufferPath;

        OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ModifyArchive", "FromMemmoryToDisk", ArchiveBufferPath);

    Else

        OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "ModifyArchive", "FromMemory");

    EndIf;

    Options = New Structure;
    Options.Insert("src", ArchiveForList);

    FileList = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetFilesList", Options);
    OPI_TestDataRetrieval.ProcessCLI(FileList, "7z", "GetFilesList", "AfterModificationFromMemory", ExpectedFiles);

EndProcedure

Procedure Z7_GetFilesList(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "SevenZ"); // SKIP

    ArchivePath = Parameters["SevenZ_ArchivePath"];

    Options = New Structure;
    Options.Insert("src", ArchivePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetFilesList", Options);

    // END

    ExpectedFiles = Parameters["SevenZ_ExpectedFiles"];

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetFilesList", , ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetFilesList", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetFilesList", "FromMemory", ExpectedFiles);

    Password            = Parameters["SevenZ_Password"];
    ArchivePasswordPath = Parameters["SevenZ_ArchivePasswordPath"];
    ExpectedPassword    = Parameters["SevenZ_ExpectedPassword"];

    Options = New Structure;
    Options.Insert("src", ArchivePasswordPath);
    Options.Insert("password", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetFilesList", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetFilesList", "WithPassword", ExpectedPassword);

    ArchivePassword = New BinaryData(ArchivePasswordPath);

    Options = New Structure;
    Options.Insert("src", ArchivePassword);
    Options.Insert("password", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetFilesList", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetFilesList", "FromMemoryWithPassword", ExpectedPassword);

EndProcedure

Procedure Z7_GetMetadata(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "SevenZ"); // SKIP

    ArchivePath = Parameters["SevenZ_ArchivePath"];

    Options = New Structure;
    Options.Insert("src", ArchivePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetMetadata", Options);

    // END

    ExpectedFiles = Parameters["SevenZ_ExpectedFiles"];

    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetMetadata", , ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Options = New Structure;
    Options.Insert("src", ArchiveBinary);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetMetadata", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetMetadata", "FromMemory", ExpectedFiles);

    Password            = Parameters["SevenZ_Password"];
    ArchivePasswordPath = Parameters["SevenZ_ArchivePasswordPath"];
    ExpectedPassword    = Parameters["SevenZ_ExpectedPassword"];

    Options = New Structure;
    Options.Insert("src", ArchivePasswordPath);
    Options.Insert("password", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetMetadata", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetMetadata", "WithPassword", ExpectedPassword);

    ArchivePassword = New BinaryData(ArchivePasswordPath);

    Options = New Structure;
    Options.Insert("src", ArchivePassword);
    Options.Insert("password", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetMetadata", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "7z", "GetMetadata", "FromMemoryWithPassword", ExpectedPassword);

    ArchivePathCopy     = Parameters["SevenZ_ArchiveCopyPath"];
    ArchivePathLzma     = Parameters["SevenZ_ArchiveLzmaPath"];
    ExpectedCompression = Parameters["SevenZ_ExpectedCompress"];

    Options = New Structure;
    Options.Insert("src", ArchivePathCopy);

    MetadataCopy = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetMetadata", Options);
    SizeCopy     = MetadataCopy["packed_size"];

    ExpectedMetadata = New Structure;
    ExpectedMetadata.Insert("solid"           , True);
    ExpectedMetadata.Insert("packed_less_than", SizeCopy);

    Options = New Structure;
    Options.Insert("src", ArchivePathLzma);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("7z", "GetMetadata", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result
        , "7z"
        , "GetMetadata"
        , "WithSettings"
        , ExpectedCompression
        , ExpectedMetadata);

EndProcedure

#EndRegion // AtomicTests

Function Path7z(BaseDirectory, RelativePath)

    RelativePath = StrReplace(RelativePath, "\", "/");
    Return StrTemplate("%1/%2", BaseDirectory, RelativePath);

EndFunction

#EndRegion // Private


#Region Alternate

Procedure Z7_Архивация() Export
    Z7_Archiving();
EndProcedure

Procedure Z7_ПолучениеМетаданных() Export
    Z7_GettingMetadata();
EndProcedure

#EndRegion
