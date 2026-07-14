// OneScript: ./OInt/tests/Modules/OPIt_RAR.os

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

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("RAR");

EndProcedure

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("RAR");

EndFunction

#Region Internal

#Region RunnableTests

#Region Unarchiving

Procedure ZRAR_Unarchiving() Export

    BaseDirectory = TempFilesDir()
        + GetPathSeparator()
        + "opi_rar_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    DestinateDirectory         = RARPath(BaseDirectory, "out");
    DestinationDirectoryBuffer = RARPath(BaseDirectory, "out_buffer");
    ArchivePath                = RARPath(BaseDirectory, "archive.rar");

    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);

    WriteTestArchiveRAR(ArchivePath);

    ExpectedFiles = ExpectedFilesTestArchiveRAR();

    Parameters = New Structure;
    Parameters.Insert("RAR_ArchivePath"  , ArchivePath);
    Parameters.Insert("RAR_DestDir"      , DestinateDirectory);
    Parameters.Insert("RAR_DestBufferDir", DestinationDirectoryBuffer);
    Parameters.Insert("RAR_ExpectedFiles", ExpectedFiles);

    ZRAR_UnarchiveDirectory(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test rar directory");

EndProcedure

#EndRegion // Unarchiving

#Region GettingMetadata

Procedure ZRAR_GetMetadata() Export

    BaseDirectory = TempFilesDir()
        + GetPathSeparator()
        + "opi_rar_meta_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    ArchivePath = RARPath(BaseDirectory, "archive.rar");

    WriteTestArchiveRAR(ArchivePath);

    ExpectedFiles = ExpectedFilesTestArchiveRAR();

    Parameters = New Structure;
    Parameters.Insert("RAR_ArchivePath"  , ArchivePath);
    Parameters.Insert("RAR_ExpectedFiles", ExpectedFiles);

    ZRAR_GetFilesList(Parameters);
    ZRAR_GetMetadata(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test rar directory");

EndProcedure

#EndRegion // GettingMetadata

#Region PartialUnpacking

Procedure ZRAR_PartialUnpacking() Export

    BaseDirectory = TempFilesDir()
        + GetPathSeparator()
        + "opi_rar_partial_"
        + Format(CurrentUniversalDateInMilliseconds(), "NG=0");

    CreateDirectory(BaseDirectory);

    DestinateDirectory         = RARPath(BaseDirectory, "out");
    DestinationDirectoryBuffer = RARPath(BaseDirectory, "out_buffer");
    ArchivePath                = RARPath(BaseDirectory, "archive.rar");

    CreateDirectory(DestinateDirectory);
    CreateDirectory(DestinationDirectoryBuffer);

    WriteTestArchiveRAR(ArchivePath);

    ExpectedPartial = New Map;
    ExpectedPartial.Insert("readme.txt"   , "OpenIntegrations root");
    ExpectedPartial.Insert("docs\note.txt", "Nested documentation");

    PartialPaths = New Array;
    PartialPaths.Add("readme.txt");
    PartialPaths.Add("docs/note.txt");

    Parameters = New Structure;
    Parameters.Insert("RAR_ArchivePath"     , ArchivePath);
    Parameters.Insert("RAR_DestDir"         , DestinateDirectory);
    Parameters.Insert("RAR_DestBufferDir"   , DestinationDirectoryBuffer);
    Parameters.Insert("RAR_PartialPaths"    , PartialPaths);
    Parameters.Insert("RAR_PartialExpected" , ExpectedPartial);

    ZRAR_UnpackFiles(Parameters);

    OPI_Tools.RemoveFileWithTry(BaseDirectory, "Failed to delete test rar directory");

EndProcedure

#EndRegion // PartialUnpacking

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Unarchiving

Procedure ZRAR_UnarchiveDirectory(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "RAR");

    ArchivePath                = Parameters["RAR_ArchivePath"];
    DestinateDirectory         = Parameters["RAR_DestDir"];
    DestinationDirectoryBuffer = Parameters["RAR_DestBufferDir"];
    ExpectedFiles              = Parameters["RAR_ExpectedFiles"];

    Result = OPI_RAR.UnarchiveDirectory(ArchivePath, DestinateDirectory);

    // END

    OPI_TestDataRetrieval.Process(Result, "RAR", "UnarchiveDirectory", , DestinateDirectory, ExpectedFiles);

    Result = OPI_RAR.UnarchiveDirectory(ArchivePath);
    OPI_TestDataRetrieval.Process(Result, "RAR", "UnarchiveDirectory", "ToDescription", "", ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Result = OPI_RAR.UnarchiveDirectory(ArchiveBinary, DestinationDirectoryBuffer);
    OPI_TestDataRetrieval.Process(Result, "RAR", "UnarchiveDirectory", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

    Result = OPI_RAR.UnarchiveDirectory(ArchiveBinary);
    OPI_TestDataRetrieval.Process(Result, "RAR", "UnarchiveDirectory", "ToDescriptionFromMemory", "", ExpectedFiles);

EndProcedure

#EndRegion // Unarchiving

#Region GettingMetadata

Procedure ZRAR_GetFilesList(Parameters)

    ArchivePath   = Parameters["RAR_ArchivePath"];
    ExpectedFiles = Parameters["RAR_ExpectedFiles"];

    Result = OPI_RAR.GetFilesList(ArchivePath);

    // END

    OPI_TestDataRetrieval.Process(Result, "RAR", "GetFilesList", , ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Result = OPI_RAR.GetFilesList(ArchiveBinary);
    OPI_TestDataRetrieval.Process(Result, "RAR", "GetFilesList", "FromMemory", ExpectedFiles);

EndProcedure

Procedure ZRAR_GetMetadata(Parameters)

    ArchivePath   = Parameters["RAR_ArchivePath"];
    ExpectedFiles = Parameters["RAR_ExpectedFiles"];

    Result = OPI_RAR.GetMetadata(ArchivePath);

    // END

    OPI_TestDataRetrieval.Process(Result, "RAR", "GetMetadata", , ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Result = OPI_RAR.GetMetadata(ArchiveBinary);
    OPI_TestDataRetrieval.Process(Result, "RAR", "GetMetadata", "FromMemory", ExpectedFiles);

EndProcedure

#EndRegion // GettingMetadata

#Region PartialUnpacking

Procedure ZRAR_UnpackFiles(Parameters)

    OPI_TestDataRetrieval.AddArchiveParameters(Parameters, "RAR");

    ArchivePath                = Parameters["RAR_ArchivePath"];
    DestinateDirectory         = Parameters["RAR_DestDir"];
    DestinationDirectoryBuffer = Parameters["RAR_DestBufferDir"];
    PartialPaths               = Parameters["RAR_PartialPaths"];
    ExpectedFiles              = Parameters["RAR_PartialExpected"];

    Result = OPI_RAR.UnpackFiles(ArchivePath, PartialPaths, DestinateDirectory);

    // END

    OPI_TestDataRetrieval.Process(Result, "RAR", "UnpackFiles", , DestinateDirectory, ExpectedFiles);

    Result = OPI_RAR.UnpackFiles(ArchivePath, PartialPaths);
    OPI_TestDataRetrieval.Process(Result, "RAR", "UnpackFiles", "ToDescription", "", ExpectedFiles);

    ArchiveBinary = New BinaryData(ArchivePath);

    Result = OPI_RAR.UnpackFiles(ArchiveBinary, PartialPaths, DestinationDirectoryBuffer);
    OPI_TestDataRetrieval.Process(Result, "RAR", "UnpackFiles", "FromMemory", DestinationDirectoryBuffer, ExpectedFiles);

    Result = OPI_RAR.UnpackFiles(ArchiveBinary, PartialPaths);
    OPI_TestDataRetrieval.Process(Result, "RAR", "UnpackFiles", "ToDescriptionFromMemory", "", ExpectedFiles);

EndProcedure

#EndRegion // PartialUnpacking

#EndRegion // AtomicTests

Function RARPath(BaseDirectory, Name)

    Name = StrReplace(Name, "\", "/");
    Return StrTemplate("%1/%2", BaseDirectory, Name);

EndFunction

Procedure WriteTestArchiveRAR(ArchivePath)

    ArchiveBinary = Base64Value(
        "UmFyIRoHAQDz4YLrCwEFBwAGAQGAgIAAPwEcmSYCAwuVAASVACC2PvOwgAAACnJlYWRtZS50eHQKAwKYhLY0Cg7dAU9wZW5JbnRlZ3JhdGlvbnMgcm9vdPjThn0pAgMLlAAElAAgnCAeeIAAAA1kb2NzL25vdGUudHh0CgMCqNK2NAoO3QFOZXN0ZWQgZG9jdW1lbnRhdGlvbnjXZDAzAgMLhQAEhQAg9JkLR4AAABdkYXRhL25lc3RlZC9wYXlsb2FkLmJpbgoDAvyVtzQKDt0BAQIDBAXtztZoMAIDC5EABJEAIOUyvtyAAAAUY29uZmlnL3NldHRpbmdzLmpzb24KAwJRC7g0Cg7dAXsiZW5hYmxlZCI6IHRydWV9fUJWaSECAwsAAQAQgAAAC2RhdGEvbmVzdGVkCgMC/JW3NAoO3QFtWRJmGgIDCwABABCAAAAEZG9jcwoDAqjStjQKDt0BAaE80hoCAwsAAQAQgAAABGRhdGEKAwLb/bQ0Cg7dAfV599YcAgMLAAEAEIAAAAZjb25maWcKAwJRC7g0Cg7dAR13VlEDBQQA");

    ArchiveBinary.Write(ArchivePath);

EndProcedure

Function ExpectedFilesTestArchiveRAR()

    ExpectedFiles = New Map;

    ExpectedFiles.Insert("readme.txt"   , "OpenIntegrations root");
    ExpectedFiles.Insert("docs\note.txt", "Nested documentation");

    BinaryDescription = New Structure("binary, hex", True, "0102030405");
    ExpectedFiles.Insert("data\nested\payload.bin", BinaryDescription);
    ExpectedFiles.Insert("config\settings.json"   , "{""enabled"": true}");

    Return ExpectedFiles;

EndFunction

#EndRegion // Private


#Region Alternate

Procedure ZRAR_Разархивирование() Export
    ZRAR_Unarchiving();
EndProcedure

Procedure ZRAR_ПолучениеМетаданных() Export
    ZRAR_GetMetadata();
EndProcedure

Procedure ZRAR_ЧастичнаяРаспаковка() Export
    ZRAR_PartialUnpacking();
EndProcedure

#EndRegion