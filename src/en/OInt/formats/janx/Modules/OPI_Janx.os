// OneScript: ./OInt/formats/janx/Modules/OPI_Janx.os
// Lib: Janx
// CLI: janx
// Keywords: janx

// DocsCategory: Formats
// DocsNameRU: Janx
// DocsNameEN: Janx

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


#Region Public

// Serialize data to Janx-1 format
//
// Parameters:
// Data - Arbitrary - Collection for serialization - value
//
// Returns:
// BinaryData - [u16 BE: version][u32 BE: JSON length][u32 BE: markers count][JSON][appendix]
Function SerializeData(Val Data) Export

    OPI_TypeConversion.GetCollection(Data);

    ArrayOfBinary = New Array;
    Offset        = 0;
    Prepared      = PrepareValueForJSONJanx(Data, ArrayOfBinary, Offset);
    JSONBD        = GetBinaryDataFromString(ValueInJSONJanx(Prepared), "UTF-8");
    JSONSize      = JSONBD.Size();

    DataStream = New MemoryStream();
    Record     = New DataWriter(DataStream);

    Record.WriteInt16(JanxFormatVersion(), ByteOrder.BigEndian);
    Record.WriteInt32(JSONSize             , ByteOrder.BigEndian);
    Record.WriteInt32(ArrayOfBinary.Count(), ByteOrder.BigEndian);
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

    OPI_TypeConversion.GetBinaryData(Data, True);

    TotalSize = Data.Size();

    If TotalSize < JanxHeaderSize() Then
        Raise "Incorrect Janx format: data is too short";
    EndIf;

    Reading = New DataReader(Data);

    Version = Reading.ReadInt16(ByteOrder.BigEndian);

    If Version <> JanxFormatVersion() Then
        Raise StrTemplate("Invalid Janx format: unsupported version %1", Version);
    EndIf;

    JSONSize     = Reading.ReadInt32(ByteOrder.BigEndian);
    MarkersCount = Reading.ReadInt32(ByteOrder.BigEndian);

    If JSONSize > TotalSize - JanxHeaderSize() Then
        Reading.Close();
        Raise "Incorrect Janx format: JSON length exceeds data boundaries";
    EndIf;

    JSONData    = Reading.Read(JSONSize);
    AnnexBuffer = Reading.Read().GetBinaryDataBuffer();
    Reading.Close();

    JSONTree = ReadJSONJanx(JSONData);

    Context = New Structure;
    Context.Insert("AnnexBuffer"    , AnnexBuffer);
    Context.Insert("MarkersTotal"   , MarkersCount);
    Context.Insert("MarkersRestored", 0);

    Return RestoreValueFromJSONJanx(JSONTree, Context);

EndFunction

#EndRegion

#Region Private

#Region JanxConstants

Function MarkerKeyBinaryJanx()

    Return "__JANXB__";

EndFunction

Function JanxFormatVersion()

    Return 1;

EndFunction

Function PrefixSizeJanx()

    Return 2;

EndFunction

Function JanxHeaderSize()

    Return PrefixSizeJanx() + 8;

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

Function ReadJSONJanx(Val JSONData)

    JSONReader = New JSONReader;

    JSONReader.SetString(GetStringFromBinaryData(JSONData.GetBinaryData(), "UTF-8"));

    Return ReadJSON(JSONReader, True);

EndFunction

#EndRegion

#Region JSONRestoration

Function RestoreValueFromJSONJanx(Val Data, Context)

    If NeedToSearchJanxMarker(Data, Context) Then

        MarkerValue = Undefined;

        If TryGetJanxMarker(Data, MarkerValue) Then
            Return ExtractBinaryByJanxMarker(MarkerValue, Context);
        EndIf;

    EndIf;

    DataType = TypeOf(Data);

    If DataType = Type("Array") Then

        Result = New Array;

        For Each Element In Data Do
            Result.Add(RestoreValueFromJSONJanx(Element, Context));
        EndDo;

        Return Result;

    EndIf;

    If DataType = Type("Map") Then

        Result = New(DataType);

        For Each Pair In Data Do
            RestoredValue = RestoreValueFromJSONJanx(Pair.Value, Context);
            Result.Insert(Pair.Key, RestoredValue);
        EndDo;

        Return Result;

    EndIf;

    Return Data;

EndFunction

Function NeedToSearchJanxMarker(Val Data, Context)

    If Context.MarkersRestored = Context.MarkersTotal Then
        Return False;
    EndIf;

    Return TypeOf(Data) = Type("Map");

EndFunction

Function TryGetJanxMarker(Val Data, MarkerValue)

    MarkerValue = Data.Get(MarkerKeyBinaryJanx());
    Return MarkerValue <> Undefined;

EndFunction

Function ExtractBinaryByJanxMarker(Val Description, Context)

    Start  = Description["s"];
    Length = Description["l"];

    If Length    = 0 Then
        Result   = GetBinaryDataFromString("");
    Else
        Fragment = Context.AnnexBuffer.Read(Start, Length);
        Result   = GetBinaryDataFromBinaryDataBuffer(Fragment);
    EndIf;

    Context.MarkersRestored = Context.MarkersRestored + 1;

    Return Result;

EndFunction

#EndRegion

#EndRegion


#Region Alternate

Function СериализоватьДанные(Val Данные) Export
    Return SerializeData(Данные);
EndFunction

Function ДесериализоватьДанные(Val Данные) Export
    Return DeserializeData(Данные);
EndFunction

#EndRegion