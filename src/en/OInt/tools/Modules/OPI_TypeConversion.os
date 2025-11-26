// OneScript: ./OInt/tools/Modules/OPI_TypeConversion.os

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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

#Use "./internal"
#Region Internal

Procedure GetBinaryData(Value, Val Force = False, Val TryB64 = True) Export

    If Value = Undefined Then
        Return;
    EndIf;

    Try

        If TypeOf(Value) = Type("BinaryData") Then

            Return;

        ElsIf ThisIsCollection(Value) Then

            Value = OPI_Tools.JSONString(Value);
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
    OPI_Tools.RestoreEscapeSequences(ValueES);

    File = New File(ValueES);

    If File.Exists() Then
        Value = New FileStream(ValueES, FileOpenMode.Open);
    Else
        GetBinaryData(Value);
    EndIf;

EndProcedure

Procedure GetCollection(Value, ByNetwork = True) Export

    If Value = Undefined Then
        Return;
    EndIf;

    Try

        // BSLLS:ExternalAppStarting-off

        InitialValue = Value;

        If ThisIsCollection(Value) Then
            Return;
        Else

            If TypeOf(Value) = Type("BinaryData") Then
                Value        = GetStringFromBinaryData(Value);
            Else
                Value        = OPI_Tools.NumberToString(Value);
            EndIf;

            ValueES = Value;
            OPI_Tools.RestoreEscapeSequences(ValueES);

            File       = New File(ValueES);
            JSONReader = New JSONReader;

            If File.Exists() Then

                JSONReader.OpenFile(ValueES);
                Value = ReadJSON(JSONReader, True, Undefined, JSONDateFormat.ISO);
                JSONReader.Close();

            ElsIf ByNetwork And (StrStartsWith(TrimL(ValueES), "http://")
                Or StrStartsWith(TrimL(ValueES), "https://")) Then

                Value = OPI_HTTPRequests.Get(ValueES);

            Else

                JSONReader.SetString(TrimAll(Value));
                Value = ReadJSON(JSONReader, True, Undefined, JSONDateFormat.ISO);
                JSONReader.Close();

            EndIf;

            If (Not ThisIsCollection(Value)) Or Not ValueIsFilled(Value) Then

                Value = InitialValue;
                OPI_Tools.ValueToArray(Value);

            EndIf;

        EndIf;

        // BSLLS:ExternalAppStarting-on

    Except

        Value = InitialValue;
        OPI_Tools.ValueToArray(Value);

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
        OPI_Tools.ValueToArray(Value);
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

            Value = OPI_Tools.NumberToString(Value);

            If Not FromSource Then
                Return;
            EndIf;

            ValueES = Value;
            OPI_Tools.RestoreEscapeSequences(ValueES);

            File = New File(ValueES);

            If File.Exists() Then

                TextReader = New TextReader(ValueES);
                Value      = TextReader.Read();
                TextReader.Close();

            ElsIf StrStartsWith(TrimL(ValueES), "http://")
                Or StrStartsWith(TrimL(ValueES), "https://") Then

                Value = OPI_HTTPRequests.Get(ValueES);
                GetLine(Value);

            Else

                Value = OPI_Tools.NumberToString(Value);

            EndIf;

        ElsIf TypeOf(Value) = Type("BinaryData") Then

            Value = GetStringFromBinaryData(Value);

        ElsIf ThisIsCollection(Value) Then

            Value = OPI_Tools.JSONString(Value);

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
    ValueAsString   = OPI_Tools.NumberToString(Value);
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

Procedure ConvertSourceToValue(Value, TryB64)

    ValueES = Value;
    OPI_Tools.RestoreEscapeSequences(ValueES);

    File = New File(ValueES);

    If File.Exists() Then

        Value = New BinaryData(ValueES);

    ElsIf StrStartsWith(TrimL(ValueES), "http://")
        Or StrStartsWith(TrimL(ValueES), "https://") Then

        Value = OPI_HTTPRequests.Get(ValueES);

    Else

        If TryB64 Then
            Value = Base64Value(Value);
        Else
            Raise "value is not a file path or valid Base64 string";
        EndIf;

    EndIf;

EndProcedure

#EndRegion

#Region Alternate

Procedure ПолучитьДвоичныеДанные(Значение, Val Безусловно = False, Val ПопыткаB64 = True) Export
	GetBinaryData(Значение, Безусловно, ПопыткаB64);
EndProcedure

Procedure ПолучитьДвоичныеИлиПоток(Значение) Export
	GetBinaryOrStream(Значение);
EndProcedure

Procedure ПолучитьКоллекцию(Значение, ПоСети = True) Export
	GetCollection(Значение, ПоСети);
EndProcedure

Procedure ПолучитьКоллекциюКлючИЗначение(Значение, Val СообщениеОшибки = "Указанное значение не является подходящей коллекцией!") Export
	GetKeyValueCollection(Значение, СообщениеОшибки);
EndProcedure

Procedure ПолучитьМассив(Значение) Export
	GetArray(Значение);
EndProcedure

Procedure ПолучитьБулево(Значение) Export
	GetBoolean(Значение);
EndProcedure

Procedure ПолучитьСтроку(Значение, Val ИзИсточника = False) Export
	GetLine(Значение, ИзИсточника);
EndProcedure

Procedure ПолучитьДату(Значение) Export
	GetDate(Значение);
EndProcedure

Procedure ПолучитьЧисло(Значение) Export
	GetNumber(Значение);
EndProcedure

Procedure ПолучитьФайлНаДиске(Значение, Val Расширение = "tmp") Export
	GetFileOnDisk(Значение, Расширение);
EndProcedure

#EndRegion