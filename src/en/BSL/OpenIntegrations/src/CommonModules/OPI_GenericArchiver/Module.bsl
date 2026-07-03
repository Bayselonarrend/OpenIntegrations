// OneScript: ./OInt/tools/main/Modules/OPI_GenericArchiver.os

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:QueryParseError-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:NumberOfParams-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

// #Use "./internal"

#If Not WebClient Then // !OPI

#Region Internal

#Region Archiving

Function Archive(Val Archiver, Val Data, Val ArchivePath = "", Val Settings = Undefined) Export

    Try
        DataIsDescription = NormalizeArchivingData(Data);
    Except
        ErrorMap          = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , BriefErrorDescription(ErrorInfo()));
        Return ErrorMap;
    EndTry;

    ArchiverObject = CreateArchiver(Archiver);

    If Settings <> Undefined Then

        ErrorText = "Settings must be a valid key-value structure!";
        OPI_TypeConversion.GetKeyValueCollection(Settings, ErrorText);

    EndIf;

    JanxSettings = OPI_AddIns.SerializeJanx(Settings);

    If DataIsDescription Then
        SerializedData = OPI_AddIns.SerializeJanx(Data);
    Else
        SerializedData = Data;
    EndIf;

    If ValueIsFilled(ArchivePath) Then

        OPI_TypeConversion.GetLine(ArchivePath);

        If DataIsDescription Then
            Result = ArchiverObject.PackToFileFromDescription(SerializedData, ArchivePath, JanxSettings);
        Else
            Result = ArchiverObject.PackToFileFromFile(SerializedData, ArchivePath, JanxSettings);
        EndIf;

        Result = OPI_AddIns.DesrializeJanx(Result);

    Else

        If DataIsDescription Then
            Result = ArchiverObject.PackToBufferFromDescription(SerializedData, JanxSettings);
        Else
            Result = ArchiverObject.PackToBufferFromFile(SerializedData, JanxSettings);
        EndIf;

        If TypeOf(Result) = Type("BinaryData") Then
            Return Result;
        EndIf;

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , String(Result));
        Return ErrorMap;

    EndIf;

    Return Result;

EndFunction

Function Unzip(Val Archiver, Val Archive, Val DestinationDirectory = "", Val Password = "") Export

    OPI_TypeConversion.GetLine(Password);

    Try
        ArchiveAsBinary = NormalizeArchive(Archive);
    Except
        ErrorMap        = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , BriefErrorDescription(ErrorInfo()));
        Return ErrorMap;
    EndTry;

    ArchiverObject = CreateArchiver(Archiver);

    If ValueIsFilled(DestinationDirectory) Then

        OPI_TypeConversion.GetLine(DestinationDirectory);

        If ArchiveAsBinary Then
            Result = ArchiverObject.UnpackToFileFromBuffer(Archive, DestinationDirectory, Password);
        Else
            Result = ArchiverObject.UnpackToFileFromFile(Archive, DestinationDirectory, Password);
        EndIf;

    Else

        If ArchiveAsBinary Then
            Result = ArchiverObject.UnpackToDescriptionFromBuffer(Archive, Password);
        Else
            Result = ArchiverObject.UnpackToDescriptionFromFile(Archive, Password);
        EndIf;

    EndIf;

    If TypeOf(Result) = Type("String") Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , Result);
        Return ErrorMap;

    EndIf;

    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

Function GetFilesList(Val Archiver, Val Archive, Val Password = "") Export

    OPI_TypeConversion.GetLine(Password);

    Try
        ArchiveAsBinary = NormalizeArchive(Archive);
    Except
        ErrorMap        = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , BriefErrorDescription(ErrorInfo()));
        Return ErrorMap;
    EndTry;

    ArchiverObject = CreateArchiver(Archiver);

    If ArchiveAsBinary Then
        Result = ArchiverObject.ListToDescriptionFromBuffer(Archive, Password);
    Else
        Result = ArchiverObject.ListToDescriptionFromFile(Archive, Password);
    EndIf;

    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

Function GetMetadata(Val Archiver, Val Archive, Val Password = "") Export

    OPI_TypeConversion.GetLine(Password);

    Try
        ArchiveAsBinary = NormalizeArchive(Archive);
    Except
        ErrorMap        = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , BriefErrorDescription(ErrorInfo()));
        Return ErrorMap;
    EndTry;

    ArchiverObject = CreateArchiver(Archiver);

    If ArchiveAsBinary Then
        Result = ArchiverObject.GetMetadataFromBuffer(Archive, Password);
    Else
        Result = ArchiverObject.GetMetadataFromFile(Archive, Password);
    EndIf;

    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

Function UnpackFiles(Val Archiver, Val Archive, Val Paths, Val DestinationDirectory = "", Val Password = "") Export

    OPI_TypeConversion.GetLine(Password);
    OPI_TypeConversion.GetArray(Paths);

    Try
        ArchiveAsBinary = NormalizeArchive(Archive);
    Except
        ErrorMap        = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , BriefErrorDescription(ErrorInfo()));
        Return ErrorMap;
    EndTry;

    ArchiverObject = CreateArchiver(Archiver);
    JanxPaths      = OPI_AddIns.SerializeJanx(Paths);

    If ValueIsFilled(DestinationDirectory) Then

        OPI_TypeConversion.GetLine(DestinationDirectory);

        If ArchiveAsBinary Then
            Result = ArchiverObject.UnpackPartialToFileFromBuffer(Archive, DestinationDirectory, JanxPaths, Password);
        Else
            Result = ArchiverObject.UnpackPartialToFileFromFile(Archive, DestinationDirectory, JanxPaths, Password);
        EndIf;

    Else

        If ArchiveAsBinary Then
            Result = ArchiverObject.UnpackPartialToDescriptionFromBuffer(Archive, JanxPaths, Password);
        Else
            Result = ArchiverObject.UnpackPartialToDescriptionFromFile(Archive, JanxPaths, Password);
        EndIf;

    EndIf;

    If TypeOf(Result) = Type("String") Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , Result);
        Return ErrorMap;

    EndIf;

    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

Function ModifyArchive(Val Archiver
    , Val Archive
    , Val AddableFiles   = Undefined
    , Val DeletablePaths = Undefined
    , Val Settings       = Undefined) Export

    Try
        ArchiveAsBinary = NormalizeArchive(Archive);
    Except
        ErrorMap        = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , BriefErrorDescription(ErrorInfo()));
        Return ErrorMap;
    EndTry;

    If AddableFiles <> Undefined Then

        ErrorText = "Addable files must be a valid key-value structure!";
        OPI_TypeConversion.GetKeyValueCollection(AddableFiles, ErrorText);

    EndIf;

    If DeletablePaths <> Undefined Then
        OPI_TypeConversion.GetArray(DeletablePaths);
    EndIf;

    If Settings <> Undefined Then

        ErrorText = "Settings must be a valid key-value structure!";
        OPI_TypeConversion.GetKeyValueCollection(Settings, ErrorText);

    EndIf;

    ModificationParameters = ParseArchiveModificationSettings(Archiver, Settings);

    ModificationStructure = New Structure;
    ModificationStructure.Insert("UnpackPassword"  , ModificationParameters.UnpackPassword);
    ModificationStructure.Insert("PackingSettings" , ModificationParameters.PackingSettings);
    ModificationStructure.Insert("ArchiveAsBinary" , ArchiveAsBinary);
    ModificationStructure.Insert("AddableFiles"    , AddableFiles);
    ModificationStructure.Insert("DeletablePaths"  , DeletablePaths);

    Return ModifyArchiveThroughDescription(Archiver, Archive, ModificationStructure);

EndFunction

#EndRegion

#EndRegion

#Region Private

Function CreateArchiver(Val View)

    If View    = "7z" Then
        AddIn  = OPI_AddIns.GetAddIn(View);
    ElsIf View = "tar" Then
        AddIn  = OPI_AddIns.GetAddIn("Tar");
    Else
        Raise StrTemplate("Unsupported archiver %1", View);
    EndIf;

    Return AddIn;

EndFunction

Function NormalizeArchivingData(Data)

    If TypeOf(Data) = Type("String") Then

        DataOnDisk = New File(Data);

        If DataOnDisk.Exists() And DataOnDisk.IsDirectory() Then
            Data = DataOnDisk.FullName;
            Return False;
        EndIf;

    EndIf;

    ErrorText = "Data for archiving should be represented as a path to a directory on disk or as a collection";
    OPI_TypeConversion.GetKeyValueCollection(Data, ErrorText);

    Return True;

EndFunction

Function NormalizeArchive(Archive)

    ArchiveAsBinary = TypeOf(Archive) = Type("BinaryData");

    If Not ArchiveAsBinary Then

        OPI_TypeConversion.GetLine(Archive);

        ArchiveFile = New File(Archive);

        If Not ArchiveFile.Exists() Then
            Raise "Archive file not found!";
        Else
            Archive = ArchiveFile.FullName;
        EndIf;

    EndIf;

    Return ArchiveAsBinary;

EndFunction

Function ModifyArchiveThroughDescription(Val Archiver, Val Archive, Val ModificationStructure)

    UnpackPassword  = ModificationStructure["UnpackPassword"];
    PackingSettings = ModificationStructure["PackingSettings"];
    AddableFiles    = ModificationStructure["AddableFiles"];
    DeletablePaths  = ModificationStructure["DeletablePaths"];
    ArchiveAsBinary = ModificationStructure["ArchiveAsBinary"];

    Description = Unzip(Archiver, Archive, "", UnpackPassword);

    If OPI_Tools.ThisIsCollection(Description) And Description["result"] = False Then

        Return Description;

    ElsIf Not OPI_Tools.ThisIsCollection(Description) Or Description["entries"] = Undefined Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Failed to unpack archive to description");
        Return ErrorMap;

    EndIf;

    ApplyModificationToArchiveDescription(Description, AddableFiles, DeletablePaths);

    If ArchiveAsBinary Then
        Return Archive(Archiver, Description, "", PackingSettings);
    Else
        Return PackArchiveInPlace(Archiver, Description, Archive, PackingSettings);
    EndIf;

EndFunction

Function PackArchiveInPlace(Val Archiver, Val Data, Val ArchivePath, Val Settings)

    TemporaryPath = ArchivePath + ".tmp";
    Result        = Archive(Archiver, Data, TemporaryPath, Settings);

    If Result["result"] = False Then
        OPI_Tools.RemoveFileWithTry(TemporaryPath, "Failed to delete temporary archive");
        Return Result;
    EndIf;

    Try
        OPI_Tools.RemoveFileWithTry(ArchivePath, "Failed to delete original archive");
        MoveFile(TemporaryPath, ArchivePath);
    Except

        OPI_Tools.RemoveFileWithTry(TemporaryPath, "Failed to delete temporary archive");
        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , BriefErrorDescription(ErrorInfo()));
        Return ErrorMap;

    EndTry;

    Return Result;

EndFunction

Procedure ApplyModificationToArchiveDescription(Description, AddableFiles, DeletablePaths)

    Records = Description["entries"];

    If DeletablePaths <> Undefined Then

        For Each Path In DeletablePaths Do
            DeletePathFromDescriptionRecords(Records, NormalizeArchivePath(Path));
        EndDo;

    EndIf;

    If AddableFiles <> Undefined Then

        For Each Pair In AddableFiles Do
            DeletePathFromDescriptionRecords(Records, NormalizeArchivePath(Pair.Key));
            InsertFileIntoDescriptionRecords(Records, NormalizeArchivePath(Pair.Key), Pair.Value);
        EndDo;

    EndIf;

EndProcedure

Procedure DeletePathFromDescriptionRecords(Records, PathInArchive)

    Parts = StrSplit(PathInArchive, "/", False);

    If Parts.Count() = 0 Then
        Return;
    EndIf;

     If Parts.Count() = 1 Then
        DeleteFileFromDescriptionRecords(Records, Parts[0]);
        Return;
    EndIf;

    Directory = FindCatalogInDescriptionRecords(Records, Parts[0]);

    If Directory = Undefined Then
        Return;
    EndIf;

    DeletePathFromDescriptionRecords(Directory["entries"], ArchiveTailPath(Parts, 1));

EndProcedure

Procedure InsertFileIntoDescriptionRecords(Records, Val PathInArchive, Val Value)

    Parts = StrSplit(PathInArchive, "/", False);

    If Parts.Count() = 0 Then
        Return;
    EndIf;

    If Parts.Count() = 1 Then

        Record = New Map;
        Record.Insert("name", Parts[0]);
        SetFileDataInDescriptionRecords(Record, Value);
        Records.Add(Record);
        Return;

    EndIf;

    Directory = CreateCatalogInDescriptionRecords(Records, Parts[0]);
    InsertFileIntoDescriptionRecords(Directory["entries"], ArchiveTailPath(Parts, 1), Value);

EndProcedure

Procedure DeleteFileFromDescriptionRecords(Records, FileName)

    For Index = Records.Count() - 1 To 0 Do

        Record = Records[Index];

        If Not Record["directory"] And Record["name"] = FileName Then
            Records.Delete(Index);
        EndIf;

    EndDo;

EndProcedure

Function FindCatalogInDescriptionRecords(Records, DirectoryName)

    For Each Record In Records Do

        If Record["directory"] And Record["name"] = DirectoryName Then
            Return Record;
        EndIf;

    EndDo;

    Return Undefined;

EndFunction

Function CreateCatalogInDescriptionRecords(Records, DirectoryName)

    Directory = FindCatalogInDescriptionRecords(Records, DirectoryName);

    If Directory = Undefined Then

        Directory = New Map;
        Directory.Insert("name"     , DirectoryName);
        Directory.Insert("directory", True);
        Directory.Insert("entries"  , New Array);
        Records.Add(Directory);

    EndIf;

    Return Directory;

EndFunction

Procedure SetFileDataInDescriptionRecords(Record, Value)

    Record.Insert("directory", False);

    If TypeOf(Value) = Type("BinaryData") Then
        Record.Insert("from_path", False);
        Record.Insert("data"     , Value);
    Else
        OPI_TypeConversion.GetLine(Value);
        Record.Insert("from_path", True);
        Record.Insert("path"     , Value);
    EndIf;

EndProcedure

Function ArchiveTailPath(Parts, InitialIndex)

    Text = "";

    For Index = InitialIndex To Parts.UBound() Do

        If ValueIsFilled(Text) Then
            Text = Text + "/";
        EndIf;

        Text = Text + Parts[Index];

    EndDo;

    Return Text;

EndFunction

Function NormalizeArchivePath(Path)

    NormalizedPath = StrReplace(Path, "\", "/");

    While Left(NormalizedPath, 1) = "/" Do
        NormalizedPath            = Mid(NormalizedPath, 2);
    EndDo;

    While Right(NormalizedPath, 1) = "/" Do
        NormalizedPath             = Left(NormalizedPath, StrLen(NormalizedPath) - 1);
    EndDo;

    Return NormalizedPath;

EndFunction

Function ParseArchiveModificationSettings(Archiver, Settings)

    ChangingSettings = New Structure;

    If Settings <> Undefined Then

        UnpackPassword = OPI_Tools.GetOr(Settings, "unpack_password", "");

        OPI_Tools.AddField("UnpackPassword" , UnpackPassword, "String"    , ChangingSettings, True);
        OPI_Tools.AddField("PackingSettings", Settings      , "Collection", ChangingSettings);

    Else
        ChangingSettings.Insert("UnpackPassword" , "");
        ChangingSettings.Insert("PackingSettings", New Structure);
    EndIf;

    Return ChangingSettings;

EndFunction

#EndRegion

#EndIf // !OPI
