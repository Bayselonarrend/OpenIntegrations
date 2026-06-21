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

#Use "./internal"

#Region Internal

#Region Archiving

Function Archive(Val Archiver, Val Data, Val ArchivePath = "", Val Settings = Undefined) Export

    DataIsDescription = NormalizeArchivingData(Data);

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

    ArchiveAsBinary = TypeOf(Archive) = Type("BinaryData");

    If Not ArchiveAsBinary Then

        OPI_TypeConversion.GetLine(Archive);

        ArchiveFile = New File(Archive);

        If Not ArchiveFile.Exists() Then

            ErrorMap = New Map;
            ErrorMap.Insert("result", False);
            ErrorMap.Insert("error" , "Archive file not found!");
            Return ErrorMap;

        Else
            Archive = ArchiveFile.FullName;
        EndIf;

    EndIf;

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

#EndRegion

#EndRegion

#Region Private

Function CreateArchiver(Val View)

    If View   = "7z" Then
        AddIn = OPI_AddIns.GetAddIn(View);
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

#EndRegion

