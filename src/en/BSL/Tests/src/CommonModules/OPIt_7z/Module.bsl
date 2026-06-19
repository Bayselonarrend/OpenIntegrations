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

    SourceDirectory    = Path7z(BaseDirectory, "src");
    DestinateDirectory = Path7z(BaseDirectory, "out");
    ArchivePath        = Path7z(BaseDirectory, "archive.7z");

    CreateDirectory(SourceDirectory);

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

    Parameters = New Structure;
    Parameters.Insert("SevenZ_BaseDir"      , BaseDirectory);
    Parameters.Insert("SevenZ_SourceDir"    , SourceDirectory);
    Parameters.Insert("SevenZ_ArchivePath"  , ArchivePath);
    Parameters.Insert("SevenZ_DestDir"      , DestinateDirectory);
    Parameters.Insert("SevenZ_ExpectedFiles", ExpectedFiles);

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

    Result = OPI_7z.GetArchivingSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchivingSettingsStructure");

    Result = OPI_7z.GetArchivingSettingsStructure(True);
    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchivingSettingsStructure", "Clear");

    Result = OPI_7z.GetArchivingSettingsStructure(False, True);
    OPI_TestDataRetrieval.Process(Result, "7z", "GetArchivingSettingsStructure", "AsMap");

EndProcedure

Procedure Z7_ArchiveDirectory(Parameters)

    SourceDirectory = Parameters["SevenZ_SourceDir"];
    ArchivePath     = Parameters["SevenZ_ArchivePath"];

    Result = OPI_7z.ArchiveDirectory(SourceDirectory, ArchivePath);

    // END

    OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", , ArchivePath);

    Result = OPI_7z.ArchiveDirectory(SourceDirectory);
    OPI_TestDataRetrieval.Process(Result, "7z", "ArchiveDirectory", "ToMemory");

EndProcedure

Procedure Z7_UnarchiveDirectory(Parameters)

    ArchivePath        = Parameters["SevenZ_ArchivePath"];
    DestinateDirectory = Parameters["SevenZ_DestDir"];
    ExpectedFiles      = Parameters["SevenZ_ExpectedFiles"];

    Result = OPI_7z.UnarchiveDirectory(ArchivePath, DestinateDirectory);

    // END

    OPI_TestDataRetrieval.Process(Result, "7z", "UnarchiveDirectory", , DestinateDirectory, ExpectedFiles);

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

#EndIf // !OPI
