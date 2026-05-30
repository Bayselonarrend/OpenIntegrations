// OneScript: ./OInt/formats/msgpack/Modules/OPI_MessagePack.os
// Lib: MessagePack
// CLI: none
// Keywords: msgpack, messagepack

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

Function SerializeData(Val Data) Export

    Context = NewWriteContext();
    WriteValue(Data, Context);

    Return GetBinaryDataFromRecordContext(Context);

EndFunction

Function DeserializeData(Val Data) Export

    Buffer  = GetBinaryDataBufferFromBinaryData(Data);
    Reading = ReadValue(Buffer, 0);

    Return Reading.Value;

EndFunction

#EndRegion

#Region Private

Procedure WriteValue(Val Data, Context)

    DataType = TypeOf(Data);

    If Data = Undefined Then

        WriteNilToContext(Context);

    ElsIf DataType = Type("Boolean") Then

        WriteBooleanToContext(Data, Context);

    ElsIf DataType = Type("String") Then

        WriteStringToContext(Data, Context);

    ElsIf DataType = Type("BinaryData") Then

        RecordBinaryDataInContext(Data, Context);

    ElsIf DataType = Type("Array") Then

        WriteArrayToContext(Data, Context);

    ElsIf DataType = Type("Structure")
        Or DataType   = Type("Map") Then

        WriteMapToContext(Data, Context);

    ElsIf DataType = Type("Number") Then

        WriteNumberToContext(Data, Context);

    EndIf;

EndProcedure

Function ReadValue(Val Buffer, Val Item)

    Tag = Buffer.Get(Item);

    If Tag <= _posFixintMax() Then
        Return ReadingResult(Tag, Item + 1);
    EndIf;

    If Tag >= _negFixintMin() Then
        Return ReadingResult(Tag - 256, Item + 1);
    EndIf;

    If Tag >= _fixstr() And Tag <= _fixstrMax() Then
        Return ReadStringFromBuffer(Buffer, Item + 1, Tag - _fixstr());
    EndIf;

    If Tag  = _str8() Then
        Length = Buffer.Get(Item + 1);
        Return ReadStringFromBuffer(Buffer, Item + 2, Length);
    EndIf;

    If Tag         = _str16() Then
        LengthReading = ReadUnsignedInteger16FromBuffer(Buffer, Item + 1);
        Return ReadStringFromBuffer(Buffer, LengthReading.Item, LengthReading.Value);
    EndIf;

    If Tag         = _str32() Then
        LengthReading = ReadUnsignedInteger32FromBuffer(Buffer, Item + 1);
        Return ReadStringFromBuffer(Buffer, LengthReading.Item, LengthReading.Value);
    EndIf;

    If Tag = _nil() Then
        Return ReadingResult(Undefined, Item + 1);
    EndIf;

    If Tag = _false() Then
        Return ReadingResult(False, Item + 1);
    EndIf;

    If Tag = _true() Then
        Return ReadingResult(True, Item + 1);
    EndIf;

    If Tag  = _bin8() Then
        Length = Buffer.Get(Item + 1);
        Return ReadBinaryDataFromBuffer(Buffer, Item + 2, Length);
    EndIf;

    If Tag         = _bin16() Then
        LengthReading = ReadUnsignedInteger16FromBuffer(Buffer, Item + 1);
        Return ReadBinaryDataFromBuffer(Buffer, LengthReading.Item, LengthReading.Value);
    EndIf;

    If Tag         = _bin32() Then
        LengthReading = ReadUnsignedInteger32FromBuffer(Buffer, Item + 1);
        Return ReadBinaryDataFromBuffer(Buffer, LengthReading.Item, LengthReading.Value);
    EndIf;

    If Tag >= _fixmap() And Tag <= _fixmapMax() Then
        Return ReadMapFromBuffer(Buffer, Item + 1, Tag - _fixmap());
    EndIf;

    If Tag         = _map16() Then
        LengthReading = ReadUnsignedInteger16FromBuffer(Buffer, Item + 1);
        Return ReadMapFromBuffer(Buffer, LengthReading.Item, LengthReading.Value);
    EndIf;

    If Tag         = _map32() Then
        LengthReading = ReadUnsignedInteger32FromBuffer(Buffer, Item + 1);
        Return ReadMapFromBuffer(Buffer, LengthReading.Item, LengthReading.Value);
    EndIf;

    If Tag >= _fixarray() And Tag <= _fixarrayMax() Then
        Return ReadArrayFromBuffer(Buffer, Item + 1, Tag - _fixarray());
    EndIf;

    If Tag         = _array16() Then
        LengthReading = ReadUnsignedInteger16FromBuffer(Buffer, Item + 1);
        Return ReadArrayFromBuffer(Buffer, LengthReading.Item, LengthReading.Value);
    EndIf;

    If Tag         = _array32() Then
        LengthReading = ReadUnsignedInteger32FromBuffer(Buffer, Item + 1);
        Return ReadArrayFromBuffer(Buffer, LengthReading.Item, LengthReading.Value);
    EndIf;

    NumberReading = ReadNumber(Buffer, Item, Tag);

    If NumberReading <> Undefined Then
        Return NumberReading;
    EndIf;

    Raise "Unsupported MessagePack tag: " + Format(Tag, "NZ=0; NG=");

EndFunction

#Region Common

Function InitialSerializationBufferSize()

    Return 65536;

EndFunction

Function NewWriteContext()

    Capacity = InitialSerializationBufferSize();
    Buffer   = New BinaryDataBuffer(Capacity, ByteOrder.BigEndian);

    Return New Structure("Buffer, Position, Capacity", Buffer, 0, Capacity);

EndFunction

Procedure EnsureContextCapacity(Context, Val NeedByte)

    If NeedByte <= Context.Capacity - Context.Item Then
        Return;
    EndIf;

    NewCapacity = Context.Capacity;

    While NewCapacity - Context.Item < NeedByte Do
        NewCapacity = NewCapacity * 2;
    EndDo;

    NewBuffer = New BinaryDataBuffer(NewCapacity, ByteOrder.BigEndian);

    If Context.Item > 0 Then
        Fragment = Context.Buffer.Read(0, Context.Item);
        NewBuffer.Write(0, Fragment);
    EndIf;

    Context.Buffer   = NewBuffer;
    Context.Capacity = NewCapacity;

EndProcedure

Procedure WriteByteToContext(Context, Val Byte)

    EnsureContextCapacity(Context, 1);
    Context.Buffer.Set(Context.Item, Byte);
    Context.Item = Context.Item + 1;

EndProcedure

Function GetBinaryDataFromRecordContext(Val Context)

    If Context.Item = 0 Then
        Return GetBinaryDataFromString("");
    EndIf;

    If Context.Item = Context.Capacity Then
        Return GetBinaryDataFromBinaryDataBuffer(Context.Buffer);
    EndIf;

    Fragment = Context.Buffer.Read(0, Context.Item);

    Return GetBinaryDataFromBinaryDataBuffer(Fragment);

EndFunction

Function ReadingResult(Val Value, Val Item)

    Return New Structure("Value, Position", Value, Position);

EndFunction

Function ReadUnsignedInteger16FromBuffer(Val Buffer, Val Item)

    Byte0 = Buffer.Get(Item);
    Byte1 = Buffer.Get(Item + 1);

    Return ReadingResult(Byte0 * 256 + Byte1, Item + 2);

EndFunction

Function ReadUnsignedInteger32FromBuffer(Val Buffer, Val Item)

    Value = Buffer.ReadInt32(Item);

    If Value < 0 Then
        Value = Value + 4294967296;
    EndIf;

    Return ReadingResult(Value, Position + 4);

EndFunction

Function ReadUnsignedInteger64FromBuffer(Val Buffer, Val Item)

    Value = Buffer.ReadInt64(Item);

    If Value < 0 Then
        Value = Value + 18446744073709551616;
    EndIf;

    Return ReadingResult(Value, Position + 8);

EndFunction

Function ReadSignedInteger8FromBuffer(Val Buffer, Val Item)

    Byte = Buffer.Get(Item);

    If Byte >= 128 Then
        Byte    = Byte - 256;
    EndIf;

    Return ReadingResult(Byte, Item + 1);

EndFunction

Function ReadSignedInteger16FromBuffer(Val Buffer, Val Item)

    Value = Buffer.ReadInt16(Item);

    Return ReadingResult(Value, Position + 2);

EndFunction

Function ReadSignedInteger32FromBuffer(Val Buffer, Val Item)

    Value = Buffer.ReadInt32(Item);

    Return ReadingResult(Value, Position + 4);

EndFunction

Function ReadSignedInteger64FromBuffer(Val Buffer, Val Item)

    Value = Buffer.ReadInt64(Item);

    Return ReadingResult(Value, Position + 8);

EndFunction

Function ReadFloat32FromBuffer(Val Buffer, Val Item)

    NumberBuffer = Buffer.Read(Item, 4);
    Value        = DecodeFloat32BE(NumberBuffer);

    Return ReadingResult(Value, Position + 4);

EndFunction

Function ReadFloat64FromBuffer(Val Buffer, Val Item)

    NumberBuffer = Buffer.Read(Item, 8);
    Value        = DecodeFloat64BE(NumberBuffer);

    Return ReadingResult(Value, Position + 8);

EndFunction

Function MantissaDividerFloat32()

    Return 8388608;

EndFunction

Function MantissaDividerFloat64()

    Return 4503599627370496;

EndFunction

Function GetUnbiasedExponentIEEE754(Val Abs)

    ExponentNoShift = Int(Log(Abs) / Log(2));

    While Abs < Pow(2, ExponentNoShift) Do
        ExponentNoShift = ExponentNoShift - 1;
    EndDo;

    Return ExponentNoShift;

EndFunction

Function EncodeFloat32BE(Val Number)

    Buffer = New BinaryDataBuffer(4, ByteOrder.BigEndian);

    If Number = 0 Then
        Return Buffer;
    EndIf;

    Sign = ?(Number < 0, 1, 0);
    Abs  = ?(Number < 0, -Number, Number);

    ExponentNoShift = GetUnbiasedExponentIEEE754(Abs);
    Fraction        = Abs / Pow(2, ExponentNoShift);
    Mantissa        = (Fraction - 1) * MantissaDividerFloat32();
    MantissaInt     = Int(Round(Mantissa, 0));
    ExpShift        = ExponentNoShift + 127;

    Buffer.Set(0, Sign * 128 + Int(ExpShift / 2));
    Buffer.Set(1, (ExpShift % 2) * 128 + Int(MantissaInt / 65536));

    MantissaRemainder = MantissaInt % 65536;
    Buffer.Set(2, Int(MantissaRemainder / 256));
    Buffer.Set(3, MantissaRemainder % 256);

    Return Buffer;

EndFunction

Function DecodeFloat32BE(Val Buffer)

    Byte0 = Buffer.Get(0);
    Byte1 = Buffer.Get(1);

    Sign     = ?(Byte0 >= 128, -1, 1);
    Exponent = (Byte0 % 128) * 2 + Int(Byte1 / 128);
    Mantissa = (Byte1 % 128) * 65536 + Buffer.Get(2) * 256 + Buffer.Get(3);

    If Exponent = 0 And Mantissa = 0 Then
        Return 0;
    EndIf;

    Return Sign * (1 + Mantissa / MantissaDividerFloat32()) * Pow(2, Exponent - 127);

EndFunction

Function EncodeFloat64BE(Val Number)

    Buffer = New BinaryDataBuffer(8, ByteOrder.BigEndian);

    If Number = 0 Then
        Return Buffer;
    EndIf;

    Sign = ?(Number < 0, 1, 0);
    Abs  = ?(Number < 0, -Number, Number);

    ExponentNoShift = GetUnbiasedExponentIEEE754(Abs);
    Fraction        = Abs / Pow(2, ExponentNoShift);
    Mantissa        = (Fraction - 1) * MantissaDividerFloat64();
    MantissaInt     = Int(Round(Mantissa, 0));
    ExpShift        = ExponentNoShift + 1023;

    Buffer.Set(0, Sign * 128 + Int(ExpShift / 16));
    Buffer.Set(1, (ExpShift % 16) * 16 + Int(MantissaInt / Pow(2, 48)));

    MantissaRemainder = MantissaInt % Pow(2, 48);

    For Index = 2 To 7 Do
        Shift    = (7 - Index) * 8;
        Buffer.Set(Index, Int(MantissaRemainder / Pow(2, Shift)) % 256);
    EndDo;

    Return Buffer;

EndFunction

Function DecodeFloat64BE(Val Buffer)

    Byte0 = Buffer.Get(0);
    Byte1 = Buffer.Get(1);

    Sign     = ?(Byte0 >= 128, -1, 1);
    Exponent = (Byte0 % 128) * 16 + Int(Byte1 / 16);
    Mantissa = (Byte1 % 16) * Pow(2, 48);

    For Index = 2 To 7 Do
        Mantissa = Mantissa + Buffer.Get(Index) * Pow(2, (7 - Index) * 8);
    EndDo;

    If Exponent = 0 And Mantissa = 0 Then
        Return 0;
    EndIf;

    Return Sign * (1 + Mantissa / MantissaDividerFloat64()) * Pow(2, Exponent - 1023);

EndFunction

#EndRegion

#Region NilType

Procedure WriteNilToContext(Context)

    WriteByteToContext(Context, _nil());

EndProcedure

#EndRegion

#Region BoolType

Procedure WriteBooleanToContext(Val Data, Context)

    WriteByteToContext(Context, ?(Data, _true(), _false()));

EndProcedure

#EndRegion

#Region TypeString

Procedure WriteStringToContext(Val Data, Context)

    BDString     = GetBinaryDataFromString(Data, "UTF-8");
    DataSize     = BDString.Size();
    BufferString = GetBinaryDataBufferFromBinaryData(BDString);

    If DataSize < 32 Then

        EnsureContextCapacity(Context, 1 + DataSize);
        Context.Buffer.Set(Context.Item, _fixstr() + DataSize);
        Context.Buffer.Write(Context.Item + 1, BufferString);
        Context.Item = Context.Item + 1 + DataSize;

    ElsIf DataSize < 256 Then

        EnsureContextCapacity(Context, 2 + DataSize);
        Context.Buffer.Set(Context.Item    , _str8());
        Context.Buffer.Set(Context.Item + 1, DataSize);
        Context.Buffer.Write(Context.Item + 2, BufferString);
        Context.Item = Context.Item + 2 + DataSize;

    ElsIf DataSize < 65536 Then

        EnsureContextCapacity(Context, 3 + DataSize);
        Context.Buffer.Set(Context.Item, _str16());
        Context.Buffer.WriteInt16(Context.Item + 1, DataSize);
        Context.Buffer.Write(Context.Item + 3, BufferString);
        Context.Item = Context.Item + 3 + DataSize;

    Else

        EnsureContextCapacity(Context, 5 + DataSize);
        Context.Buffer.Set(Context.Item, _str32());
        Context.Buffer.WriteInt32(Context.Item + 1, DataSize);
        Context.Buffer.Write(Context.Item + 5, BufferString);
        Context.Item = Context.Item + 5 + DataSize;

    EndIf;

EndProcedure

Function ReadStringFromBuffer(Val Buffer, Val Item, Val Length)

    If Length = 0 Then
        Return ReadingResult("", Item);
    EndIf;

    FragmentBuffer = Buffer.Read(Item, Length);
    BDFragment     = GetBinaryDataFromBinaryDataBuffer(FragmentBuffer);
    String         = GetStringFromBinaryData(BDFragment, "UTF-8");

    Return ReadingResult(String, Item + Length);

EndFunction

#EndRegion

#Region TypeBinary

Procedure RecordBinaryDataInContext(Val Data, Context)

    DataSize   = Data.Size();
    BufferBody = GetBinaryDataBufferFromBinaryData(Data);

    If DataSize < 256 Then

        EnsureContextCapacity(Context, 2 + DataSize);
        Context.Buffer.Set(Context.Item    , _bin8());
        Context.Buffer.Set(Context.Item + 1, DataSize);
        Context.Buffer.Write(Context.Item + 2, BufferBody);
        Context.Item = Context.Item + 2 + DataSize;

    ElsIf DataSize < 65536 Then

        EnsureContextCapacity(Context, 3 + DataSize);
        Context.Buffer.Set(Context.Item, _bin16());
        Context.Buffer.WriteInt16(Context.Item + 1, DataSize);
        Context.Buffer.Write(Context.Item + 3, BufferBody);
        Context.Item = Context.Item + 3 + DataSize;

    Else

        EnsureContextCapacity(Context, 5 + DataSize);
        Context.Buffer.Set(Context.Item, _bin32());
        Context.Buffer.WriteInt32(Context.Item + 1, DataSize);
        Context.Buffer.Write(Context.Item + 5, BufferBody);
        Context.Item = Context.Item + 5 + DataSize;

    EndIf;

EndProcedure

Function ReadBinaryDataFromBuffer(Val Buffer, Val Item, Val Length)

    If Length = 0 Then
        Return ReadingResult(GetBinaryDataFromString(""), Item);
    EndIf;

    FragmentBuffer = Buffer.Read(Item, Length);
    BDFragment     = GetBinaryDataFromBinaryDataBuffer(FragmentBuffer);

    Return ReadingResult(BDFragment, Item + Length);

EndFunction

#EndRegion

#Region ArrayType

Procedure WriteArrayToContext(Val Data, Context)

    ItemCount = Data.Count();

    If ItemCount <= 15 Then

        WriteByteToContext(Context, _fixarray() + ItemCount);

    ElsIf ItemCount < 65536 Then

        EnsureContextCapacity(Context, 3);
        Context.Buffer.Set(Context.Item, _array16());
        Context.Buffer.WriteInt16(Context.Item + 1, ItemCount);
        Context.Item = Context.Item + 3;

    Else

        EnsureContextCapacity(Context, 5);
        Context.Buffer.Set(Context.Item, _array32());
        Context.Buffer.WriteInt32(Context.Item + 1, ItemCount);
        Context.Item = Context.Item + 5;

    EndIf;

    For Each Element In Data Do
        WriteValue(Element, Context);
    EndDo;

EndProcedure

Function ReadArrayFromBuffer(Val Buffer, Val Item, Val ItemCount)

    Array = New Array;

    For Index = 1 To ItemCount Do

        ItemReading = ReadValue(Buffer, Item);
        Array.Add(ItemReading.Value);
        Item        = ItemReading.Item;

    EndDo;

    Return ReadingResult(Array, Item);

EndFunction

#EndRegion

#Region MapType

Procedure WriteMapToContext(Val Data, Context)

    PairCount = 0;

    For Each Pair In Data Do
        PairCount = PairCount + 1;
    EndDo;

    If PairCount <= 15 Then

        WriteByteToContext(Context, _fixmap() + PairCount);

    ElsIf PairCount < 65536 Then

        EnsureContextCapacity(Context, 3);
        Context.Buffer.Set(Context.Item, _map16());
        Context.Buffer.WriteInt16(Context.Item + 1, PairCount);
        Context.Item = Context.Item + 3;

    Else

        EnsureContextCapacity(Context, 5);
        Context.Buffer.Set(Context.Item, _map32());
        Context.Buffer.WriteInt32(Context.Item + 1, PairCount);
        Context.Item = Context.Item + 5;

    EndIf;

    For Each Pair In Data Do

        If TypeOf(Pair.Key) = Type("String") Then
            WriteStringToContext(Pair.Key        , Context);
        Else
            WriteStringToContext(String(Pair.Key), Context);
        EndIf;

        WriteValue(Pair.Value, Context);

    EndDo;

EndProcedure

Function ReadMapFromBuffer(Val Buffer, Val Item, Val PairCount)

    Map = New Map;

    For Index = 1 To PairCount Do

        KeyReading = ReadValue(Buffer, Item);
        Item       = KeyReading.Item;

        If TypeOf(KeyReading.Value) <> Type("String") Then
            Raise "MessagePack map key must be a string";
        EndIf;

        ValueReading = ReadValue(Buffer, Item);
        Map.Insert(KeyReading.Value, ValueReading.Value);
        Item         = ValueReading.Item;

    EndDo;

    Return ReadingResult(Map, Item);

EndFunction

#EndRegion

#Region TypeNumber

Procedure WriteNumberToContext(Val Data, Context)

    If Data = Int(Data) Then

        If Data >= 0 Then
            RecordPositiveIntegerInContext(Data, Context);
        Else
            RecordNegativeIntegerInContext(Data, Context);
        EndIf;

    Else
        RecordFloatInContext(Data, Context);
    EndIf;

EndProcedure

Procedure RecordFloatInContext(Val Number, Context)

    CheckBuffer = EncodeFloat32BE(Number);

    If DecodeFloat32BE(CheckBuffer) = Number Then
        RecordFloat32InContext(Number, Context);
    Else
        RecordFloat64InContext(Number, Context);
    EndIf;

EndProcedure

Procedure RecordFloat32InContext(Val Number, Context)

    Body = EncodeFloat32BE(Number);

    EnsureContextCapacity(Context, 5);
    Context.Buffer.Set(Context.Item, _float32());
    Context.Buffer.Write(Context.Item + 1, Body);
    Context.Item = Context.Item + 5;

EndProcedure

Procedure RecordFloat64InContext(Val Number, Context)

    Body = EncodeFloat64BE(Number);

    EnsureContextCapacity(Context, 9);
    Context.Buffer.Set(Context.Item, _float64());
    Context.Buffer.Write(Context.Item + 1, Body);
    Context.Item = Context.Item + 9;

EndProcedure

Procedure RecordPositiveIntegerInContext(Val Number, Context)

    If Number <= _posFixintMax() Then

        WriteByteToContext(Context, Number);

    ElsIf Number < 256 Then

        EnsureContextCapacity(Context, 2);
        Context.Buffer.Set(Context.Item    , _uint8());
        Context.Buffer.Set(Context.Item + 1, Number);
        Context.Item = Context.Item + 2;

    ElsIf Number < 65536 Then

        EnsureContextCapacity(Context, 3);
        Context.Buffer.Set(Context.Item, _uint16());
        Context.Buffer.WriteInt16(Context.Item + 1, Number);
        Context.Item = Context.Item + 3;

    ElsIf Number < 4294967296 Then

        EnsureContextCapacity(Context, 5);
        Context.Buffer.Set(Context.Item, _uint32());
        Context.Buffer.WriteInt32(Context.Item + 1, Number);
        Context.Item = Context.Item + 5;

    Else

        EnsureContextCapacity(Context, 9);
        Context.Buffer.Set(Context.Item, _uint64());
        Context.Buffer.WriteInt64(Context.Item + 1, Number);
        Context.Item = Context.Item + 9;

    EndIf;

EndProcedure

Procedure RecordNegativeIntegerInContext(Val Number, Context)

    If Number >= -32 Then

        WriteByteToContext(Context, _negFixintMin() + 32 + Number);

    ElsIf Number >= -128 Then

        EnsureContextCapacity(Context, 2);
        Context.Buffer.Set(Context.Item    , _int8());
        Context.Buffer.Set(Context.Item + 1, _negFixintMin() + 32 + Number);
        Context.Item = Context.Item + 2;

    ElsIf Number >= -32768 Then

        EnsureContextCapacity(Context, 3);
        Context.Buffer.Set(Context.Item, _int16());
        Context.Buffer.WriteInt16(Context.Item + 1, Number);
        Context.Item = Context.Item + 3;

    ElsIf Number >= -2147483648 Then

        EnsureContextCapacity(Context, 5);
        Context.Buffer.Set(Context.Item, _int32());
        Context.Buffer.WriteInt32(Context.Item + 1, Number);
        Context.Item = Context.Item + 5;

    Else

        EnsureContextCapacity(Context, 9);
        Context.Buffer.Set(Context.Item, _int64());
        Context.Buffer.WriteInt64(Context.Item + 1, Number);
        Context.Item = Context.Item + 9;

    EndIf;

EndProcedure

Function ReadNumber(Val Buffer, Val Item, Val Tag)

    If Tag = _uint8() Then
        Return ReadingResult(Buffer.Get(Item + 1), Item + 2);
    EndIf;

    If Tag = _uint16() Then
        Return ReadUnsignedInteger16FromBuffer(Buffer, Item + 1);
    EndIf;

    If Tag = _uint32() Then
        Return ReadUnsignedInteger32FromBuffer(Buffer, Item + 1);
    EndIf;

    If Tag = _uint64() Then
        Return ReadUnsignedInteger64FromBuffer(Buffer, Item + 1);
    EndIf;

    If Tag = _int8() Then
        Return ReadSignedInteger8FromBuffer(Buffer, Item + 1);
    EndIf;

    If Tag = _int16() Then
        Return ReadSignedInteger16FromBuffer(Buffer, Item + 1);
    EndIf;

    If Tag = _int32() Then
        Return ReadSignedInteger32FromBuffer(Buffer, Item + 1);
    EndIf;

    If Tag = _int64() Then
        Return ReadSignedInteger64FromBuffer(Buffer, Item + 1);
    EndIf;

    If Tag = _float32() Then
        Return ReadFloat32FromBuffer(Buffer, Item + 1);
    EndIf;

    If Tag = _float64() Then
        Return ReadFloat64FromBuffer(Buffer, Item + 1);
    EndIf;

    Return Undefined;

EndFunction

#EndRegion

#Region Marks

Function _nil()

    Return 192;

EndFunction

Function _false()

    Return 194;

EndFunction

Function _true()

    Return 195;

EndFunction

Function _bin8()

    Return 196;

EndFunction

Function _bin16()

    Return 197;

EndFunction

Function _bin32()

    Return 198;

EndFunction

Function _float32()

    Return 202;

EndFunction

Function _float64()

    Return 203;

EndFunction

Function _uint8()

    Return 204;

EndFunction

Function _uint16()

    Return 205;

EndFunction

Function _uint32()

    Return 206;

EndFunction

Function _uint64()

    Return 207;

EndFunction

Function _int8()

    Return 208;

EndFunction

Function _int16()

    Return 209;

EndFunction

Function _int32()

    Return 210;

EndFunction

Function _int64()

    Return 211;

EndFunction

Function _fixmap()

    Return 128;

EndFunction

Function _fixmapMax()

    Return 143;

EndFunction

Function _fixarray()

    Return 144;

EndFunction

Function _fixarrayMax()

    Return 159;

EndFunction

Function _array16()

    Return 220;

EndFunction

Function _array32()

    Return 221;

EndFunction

Function _map16()

    Return 222;

EndFunction

Function _map32()

    Return 223;

EndFunction

Function _fixstr()

    Return 160;

EndFunction

Function _str8()

    Return 217;

EndFunction

Function _str16()

    Return 218;

EndFunction

Function _str32()

    Return 219;

EndFunction

Function _posFixintMax()

    Return 127;

EndFunction

Function _negFixintMin()

    Return 224;

EndFunction

Function _fixstrMax()

    Return 191;

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