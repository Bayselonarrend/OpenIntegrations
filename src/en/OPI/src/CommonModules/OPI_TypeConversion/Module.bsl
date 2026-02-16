// OneScript: ./OInt/tools/main/Modules/internal/Modules/internal/Modules/OPI_TypeConversion.os

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:CognitiveComplexity-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

#Region Internal

Procedure GetBinaryData(Value, Val Force = False, Val TryB64 = True) Export

    If Value  = Undefined Then
        Value = GetBinaryDataFromString("");
        Return;
    EndIf;

    Try

        If TypeOf(Value) = Type("BinaryData") Then

            Return;

        ElsIf ThisIsCollection(Value) Then

            Value = JSONString(Value);
            Value = GetBinaryDataFromString(Value);

        Else
            GetLine(Value);
            ConvertSourceToValue(Value, TryB64);
        EndIf;

    Except

        If Force Then
            GetLine(Value);
            Value = GetBinaryDataFromString(Value);
        Else
            Raise "Error getting binary data from parameter: " + ErrorDescription();
        EndIf;

    EndTry;

EndProcedure

Procedure GetBinaryOrStream(Value) Export

    If Value = Undefined Then
        Return;
    EndIf;

    If TypeOf(Value) <> Type("String") Then
        GetBinaryData(Value);
        Return;
    EndIf;

    ValueES = Value;
    RestoreEscapeSequences(ValueES);

    File = New File(ValueES);

    If File.Exists() Then
        Value = New FileStream(ValueES, FileOpenMode.Open);
    Else
        GetBinaryData(Value);
    EndIf;

EndProcedure

Procedure GetCollection(Value, ByNetwork = True, Success = False) Export

    Success = False;

    If Value = Undefined Then
        Return;
    EndIf;

    Success = True;

    Try

        // BSLLS:ExternalAppStarting-off

        InitialValue = Value;

        If ThisIsCollection(Value) Then
            Return;
        Else

            If TypeOf(Value) = Type("BinaryData") Then
                Value        = GetStringFromBinaryData(Value);
            Else
                Value        = NumberToString(Value);
            EndIf;

            ValueES = Value;
            RestoreEscapeSequences(ValueES);

            File       = New File(ValueES);
            JSONReader = New JSONReader;

            If File.Exists() Then

                JSONReader.OpenFile(ValueES);
                Value = ReadJSON(JSONReader, True, Undefined, JSONDateFormat.ISO);
                JSONReader.Close();

            ElsIf ByNetwork And (StrStartsWith(TrimL(ValueES), "http://")
                Or StrStartsWith(TrimL(ValueES), "https://")) Then

                Value = GetHttpClient().Get(ValueES);

            Else

                JSONReader.SetString(TrimAll(Value));
                Value = ReadJSON(JSONReader, True, Undefined, JSONDateFormat.ISO);
                JSONReader.Close();

            EndIf;

            If (Not ThisIsCollection(Value)) Or Not ValueIsFilled(Value) Then

                Success = False;
                Value   = InitialValue;
                ValueToArray(Value);

            EndIf;

        EndIf;

        // BSLLS:ExternalAppStarting-on

    Except

        Success = False;
        Value   = InitialValue;
        ValueToArray(Value);

    EndTry;

EndProcedure

Procedure GetKeyValueCollection(Value
    , Val ErrorText = "The specified value is not a valid collection!") Export

    GetCollection(Value);

    If TypeOf(Value) = Type("Array") Then
        Raise ErrorText;
    EndIf;

EndProcedure

Procedure GetArray(Value) Export

    If TypeOf(Value) = Type("Array") Then
        Return;
    EndIf;

    GetCollection(Value);

    If Not TypeOf(Value) = Type("Array") Then
        ValueToArray(Value);
    EndIf;

EndProcedure

Procedure GetBoolean(Value) Export

    If Value = Undefined Then
        Return;
    EndIf;

    Try

        If TypeOf(Value) = Type("Boolean") Then

            Return;

        Else

            Value = Boolean(Value);

        EndIf;

    Except
        Raise "Error getting boolean data from parameter";
    EndTry;

EndProcedure

Procedure GetLine(Value, Val FromSource = False) Export

    If Value = Undefined Then
        Return;
    EndIf;

    Try

        If ThisIsSymbolic(Value) Then

            Value = NumberToString(Value);

            If Not FromSource Then
                Return;
            EndIf;

            ValueES = Value;
            RestoreEscapeSequences(ValueES);

            File = New File(ValueES);

            If File.Exists() Then

                TextReader = New TextReader(ValueES);
                Value      = TextReader.Read();
                TextReader.Close();

            ElsIf StrStartsWith(TrimL(ValueES), "http://")
                Or StrStartsWith(TrimL(ValueES), "https://") Then

                Value = GetHttpClient().Get(ValueES);
                GetLine(Value);

            Else

                Value = NumberToString(Value);

            EndIf;

        ElsIf TypeOf(Value) = Type("BinaryData") Then

            Value = GetStringFromBinaryData(Value);

        ElsIf ThisIsCollection(Value) Then

            Value = JSONString(Value);

        ElsIf TypeOf(Value) = Type("XMLWriter") Then

            Value = Value.Close();

        Else
            Return;
        EndIf;

    Except
        Value = String(Value);
        Return;
    EndTry;

EndProcedure

Procedure GetDate(Value) Export

    If Value = Undefined Then
        Return;
    EndIf;

    Date = "Date";

    Try

        If TypeOf(Value) = Type(Date) Then

            Return;

        Else

            Value = XMLValue(Type(Date), Value);

        EndIf;

    Except
        OOD   = New TypeDescription(Date);
        Value = OOD.AdjustValue(Value);
    EndTry;

EndProcedure

Procedure GetNumber(Value) Export

    If TypeOf(Value) = Type("Number") Then

        Return;

    ElsIf TypeOf(Value) = Type("Boolean") Then

        Value = ?(Value, 1, 0);

    Else

        TypeDescription = New TypeDescription("Number");
        Value_          = TypeDescription.AdjustValue(Value);

        If Value_ = 0 Then

            Try

                Value_ = String(Value);
                Value_ = StrReplace(Value, Chars.NBSp, "");
                Value_ = StrReplace(Value, " "       , "");
                Value_ = StrReplace(Value, ","       , ".");

                If StrOccurrenceCount(Value_, ".") > 1 Then

                    PartsArray     = StrSplit(Value_, ".");
                    LastPart       = PartsArray.UBound();
                    FractionalPart = PartsArray[LastPart];

                    PartsArray.Delete(LastPart);

                    Value_ = StrTemplate("%1.%2", StrConcat(PartsArray), FractionalPart);

                EndIf;

                // BSLLS:TryNumber-off
                Value = Number(Value_);
                // BSLLS:TryNumber-on

            Except
                Return;
            EndTry;

        Else
            Value = Value_;
        EndIf;

    EndIf;

EndProcedure

Procedure GetFileOnDisk(Value, Val Extension = "tmp") Export

    ReturnStructure = New Structure("Path,Temporary", "", False);
    ValueAsString   = NumberToString(Value);
    ValueFile       = New File(ValueAsString);

    If ValueFile.Exists() Then

        ReturnStructure.Insert("Path", ValueFile.FullName);

    Else

        GetBinaryData(Value, True);

        // BSLLS:MissingTemporaryFileDeletion-off

        //@skip-check missing-temporary-file-deletion
        Path = GetTempFileName(Extension);

        // BSLLS:MissingTemporaryFileDeletion-on

        Value.Write(Path);

        ReturnStructure.Insert("Path"     , Path);
        ReturnStructure.Insert("Temporary", True);

    EndIf;

    Value = ReturnStructure;

EndProcedure

Procedure RestoreEscapeSequences(Text) Export

    GetLine(Text);

    CharacterMapping = GetEscapeSequencesMap();

    For Each Symbol In CharacterMapping Do

        Text = StrReplace(Text, Symbol.Value, Symbol.Key);

    EndDo;

EndProcedure

Procedure ReplaceEscapeSequences(Text) Export

    GetLine(Text);

    CharacterMapping = GetEscapeSequencesMap();

    For Each Symbol In CharacterMapping Do

        Text = StrReplace(Text, Symbol.Key        , Symbol.Value);
        Text = StrReplace(Text, "\" + Symbol.Value, Symbol.Key);

    EndDo;

EndProcedure

Procedure ValueToArray(Value) Export

    If TypeOf(Value) = Type("Array") Then
        Return;
    EndIf;

    Value_ = New Array;
    Value_.Add(Value);

    Value = Value_;

EndProcedure

Function JSONString(Val Data
    , Val Escaping     = "None"
    , Val LineBreaks   = True
    , Val DoubleQuotes = True) Export

    LineBreak = ?(LineBreaks, JSONLineBreak.Windows, JSONLineBreak.None);

    JSONParameters = New JSONWriterSettings(LineBreak
        , " "
        , DoubleQuotes
        , JSONCharactersEscapeMode[Escaping]
        , False
        , False
        , False
        , False);

    Try

        JSONWriter = New JSONWriter;
        JSONWriter.SetString(JSONParameters);

        WriteJSON(JSONWriter, Data);
        Return JSONWriter.Close();

    Except
        Return "NOT JSON: " + String(Data);
    EndTry;

EndFunction

Function NumberToString(Val Value) Export

    If TypeOf(Value) = Type("Number") Then

        If Value   = 0 Then
            Value_ = "0";
        Else
            Value_ = Format(Value, "NG=0");
        EndIf;

    Else
        Value_ = String(Value);
    EndIf;

    Return Value_;

EndFunction

#EndRegion

#Region Private

Function ThisIsCollection(Val Value)

    Return TypeOf(Value) = Type("Array")
        Or TypeOf(Value) = Type("Structure")
        Or TypeOf(Value) = Type("Map");

EndFunction

Function ThisIsSymbolic(Val Value)

    Return TypeOf(Value) = Type("String")
        Or TypeOf(Value) = Type("Number")
        Or TypeOf(Value) = Type("Date");

EndFunction

Function GetEscapeSequencesMap()

    CharacterMapping = New Map;

    CharacterMapping.Insert("\n" , Chars.LF);
    CharacterMapping.Insert("\r" , Chars.CR);
    CharacterMapping.Insert("\f" , Chars.FF);
    CharacterMapping.Insert("\v" , Chars.VTab);

    Return CharacterMapping;

EndFunction

Procedure ConvertSourceToValue(Value, TryB64)

    ValueES = Value;
    RestoreEscapeSequences(ValueES);

    File = New File(ValueES);

    If File.Exists() Then

        Value = New BinaryData(ValueES);

    ElsIf StrStartsWith(TrimL(ValueES), "http://")
        Or StrStartsWith(TrimL(ValueES), "https://") Then

        Value = GetHttpClient().Get(ValueES);

    Else

        If TryB64 Then

            Value_ = Base64Value(Value);

            If TypeOf(Value_) = Type("BinaryData") Then
                Success       = Value_.Size() <> 0;
            Else
                Success       = False;
            EndIf;

            If Success Then
                Value = Value_;
            EndIf;

        Else
            Success = False;
        EndIf;

        If Not Success Then
            Raise "The value is not a file path or Base64 string";
        EndIf;

    EndIf;

EndProcedure

#Region HttpClient

Function GetHttpClient()

    If IsOneScript() Then

        Try
            // !OInt OPI_HTTPRequests = Undefined;
        Except
            Return OPI_HTTPRequests;
        EndTry;

        // !OInt ClientPath = GetHttpClientPath();
        // !OInt Try AttachScript(ClientPath, "OPI_HTTPRequests"); Except EndTry;

        //@skip-check bsl-legacy-check-string-literal
        HttpClient = New("OPI_HTTPRequests");
        Return HttpClient;

    Else
        Return OPI_HTTPRequests; // !OPI
    EndIf;

EndFunction

Function GetHttpClientPath() Export

    ScriptDirectory = "";

    // !OInt ScriptDirectory = CurrentScript().Path;

    If Not ValueIsFilled(ScriptDirectory) Then
        Return "";
    EndIf;

    ScriptDirectory = StrReplace(ScriptDirectory, "\", "/");
    PartsArray      = StrSplit(ScriptDirectory, "/");

    PartsArray.Delete(PartsArray.UBound());
    PartsArray.Delete(PartsArray.UBound());
    PartsArray.Delete(PartsArray.UBound());
    PartsArray.Delete(PartsArray.UBound());
    PartsArray.Delete(PartsArray.UBound());
    PartsArray.Delete(PartsArray.UBound());
    PartsArray.Delete(PartsArray.UBound());

    PartsArray.Add("tools");
    PartsArray.Add("http");
    PartsArray.Add("Modules");
    PartsArray.Add("OPI_HTTPRequests.os");

    Path = StrConcat(PartsArray, "/");

    Return Path;

EndFunction

Function IsOneScript()

    Try

        Response = False;

        // BSLLS:UnusedLocalVariable-off

        //@skip-check module-unused-local-variable
        Check = New OpenSSLSecureConnection;

        // BSLLS:UnusedLocalVariable-on

    Except

        Response = True;

    EndTry;

    Return Response;

EndFunction

#EndRegion

#EndRegion
