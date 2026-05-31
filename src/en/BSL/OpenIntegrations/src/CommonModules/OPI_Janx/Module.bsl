// OneScript: ./OInt/formats/janx/Modules/OPI_Janx.os
// Lib: Janx
// CLI: none
// Keywords: janx

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:DuplicateStringLiteral-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

#If Not WebClient Then // !OPI

#Region Public

// Serialize data to Janx-1 format
//
// Parameters:
// Data - Arbitrary - Serialization value - value
//
// Returns:
// BinaryData - [u32 BE: JSON UTF-8 length][JSON][appendix: binary blocks]
Function SerializeData(Val Data) Export

    ArrayOfBinary = New Array;
    Offset        = 0;
    Prepared      = PrepareValueForJSONJanx(Data, ArrayOfBinary, Offset);
    JSONBD        = GetBinaryDataFromString(ValueInJSONJanx(Prepared), "UTF-8");
    JSONSize      = JSONBD.Size();

    PrefixBD = PackInt32BEJanx(JSONSize);

    DataStream = New MemoryStream();
    Record     = New DataWriter(DataStream);

    Record.Write(PrefixBD);
    Record.Write(JSONBD);

    For Each Block In ArrayOfBinary Do
        Record.Write(Block);
    EndDo;

    Record.Close();

    Return DataStream.CloseAndGetBinaryData();

EndFunction

// Deserialize Janx-1 format data
//
// Parameters:
// Data - BinaryData - Serialized value - data
//
// Returns:
// Arbitrary - Restored value
Function DeserializeData(Val Data) Export

    TotalSize = Data.Size();

    If TotalSize < PrefixSizeJanx() Then
        Raise "Incorrect Janx format: data is too short";
    EndIf;

    Buffer = GetBinaryDataBufferFromBinaryData(Data);

    JSONSize  = ReadInt32BEJanx(Buffer, 0);
    JSONStart = PrefixSizeJanx();
    JSONEnd   = JSONStart + JSONSize;

    If JSONEnd > TotalSize Then
        Raise "Incorrect Janx format: JSON length exceeds data boundaries";
    EndIf;

    JSONBuffer = Buffer.Read(JSONStart, JSONSize);
    JSONString = GetStringFromBinaryDataBuffer(JSONBuffer, "UTF-8");
    JSONTree   = ReadJSONJanx(JSONString);
    Result     = RestoreValueFromJSONJanx(JSONTree, Buffer, JSONEnd);

    Return Result;

EndFunction

#EndRegion

#Region Private

#Region JanxConstants

Function MarkerKeyBinaryJanx()

    Return "__JANXB__";

EndFunction

Function PrefixSizeJanx()

    Return 4;

EndFunction

#EndRegion

#Region JSONPreparation

Function PrepareValueForJSONJanx(Val Data, ArrayOfBinary, Offset)

    If Data = Undefined Then
        Return Data;
    EndIf;

    DataType = TypeOf(Data);

    If DataType = Type("Structure") Or DataType = Type("Map") Then

        Result = New(DataType);

        For Each Pair In Data Do
            Result.Insert(Pair.Key, PrepareValueForJSONJanx(Pair.Value, ArrayOfBinary, Offset));
        EndDo;

        Return Result;

    EndIf;

    If DataType = Type("Array") Then

        Result = New Array;

        For Each Element In Data Do
            Result.Add(PrepareValueForJSONJanx(Element, ArrayOfBinary, Offset));
        EndDo;

        Return Result;

    EndIf;

    If DataType = Type("BinaryData") Then
        Return CreateBinaryMarkerJanx(Data, ArrayOfBinary, Offset);
    EndIf;

    Return Data;

EndFunction

Function CreateBinaryMarkerJanx(Val BinaryData, DataArray, Offset)

    Length = BinaryData.Size();
    Start  = Offset;

    DataArray.Add(BinaryData);
    Offset = Offset + Length;

    Return New Structure(MarkerKeyBinaryJanx(), New Structure("s, l", Start, Length));

EndFunction

Function ValueInJSONJanx(Val Data)

    JSONWriter = New JSONWriter;
    JSONWriter.SetString(New JSONWriterSettings(JSONLineBreak.None, ""));
    WriteJSON(JSONWriter, Data);
    Return JSONWriter.Close();

EndFunction

Function ReadJSONJanx(Val JSONString)

    JSONReader = New JSONReader;
    JSONReader.SetString(JSONString);
    Return ReadJSON(JSONReader, True);

EndFunction

#EndRegion

#Region JSONRestoration

Function RestoreValueFromJSONJanx(Val Data, Val Buffer, Val AppendixOffset)

    MarkerValue = Undefined;
    JanxMarker  = TryGetJanxMarker(Data, MarkerValue);

    If JanxMarker Then
        Return ExtractBinaryByJanxMarker(MarkerValue, Buffer, AppendixOffset);
    EndIf;

    DataType = TypeOf(Data);

    If DataType = Type("Array") Then

        Result = New Array;

        For Each Element In Data Do
            Result.Add(RestoreValueFromJSONJanx(Element, Buffer, AppendixOffset));
        EndDo;

        Return Result;

    EndIf;

    If DataType = Type("Map") Then

        Result = New Map;

        For Each Pair In Data Do
            RestoredValue = RestoreValueFromJSONJanx(Pair.Value, Buffer, AppendixOffset); Result.Insert(Pair.Key, RestoredValue);
        EndDo;

        Return Result;

    EndIf;

    Return Data;

EndFunction

Function TryGetJanxMarker(Val Data, MarkerValue)

    MarkerValue = Undefined;
    Key         = MarkerKeyBinaryJanx();
    DataType    = TypeOf(Data);

    If DataType = Type("Structure") Then

        If Data.Property(Key, MarkerValue) Then
            Return True;
        EndIf;

    ElsIf DataType = Type("Map") Then

        If Data.Get(Key) <> Undefined Then
            MarkerValue = Data[Key];
            Return True;
        EndIf;

    EndIf;

    Return False;

EndFunction

Function ExtractBinaryByJanxMarker(Val Description, Val Buffer, Val AppendixOffset)

    Start  = AppendixOffset + Description["s"];
    Length = Description["l"];

    If Length = 0 Then
        Return GetBinaryDataFromString("");
    EndIf;

    Fragment = Buffer.Read(Start, Length);

    Return GetBinaryDataFromBinaryDataBuffer(Fragment);

EndFunction

#EndRegion

#Region BinaryPrefix

Function PackInt32BEJanx(Val Number)

    Buffer = New BinaryDataBuffer(PrefixSizeJanx(), ByteOrder.BigEndian);

    Buffer.Set(0, Int(Number / 16777216) % 256);
    Buffer.Set(1, Int(Number / 65536) % 256);
    Buffer.Set(2, Int(Number / 256) % 256);
    Buffer.Set(3, Number % 256);

    Return GetBinaryDataFromBinaryDataBuffer(Buffer);

EndFunction

Function ReadInt32BEJanx(Val Buffer, Val Position)

    Byte0 = Buffer.Get(Position);
    Byte1 = Buffer.Get(Position + 1);
    Byte2 = Buffer.Get(Position + 2);
    Byte3 = Buffer.Get(Position + 3);

    Return Byte0 * 16777216 + Byte1 * 65536 + Byte2 * 256 + Byte3;

EndFunction

#EndRegion

#EndRegion

#EndIf // !OPI
