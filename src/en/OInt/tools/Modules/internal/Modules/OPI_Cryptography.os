// OneScript: ./OInt/tools/Modules/internal/Modules/OPI_Cryptography.os

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
#Use "./internal"

#Region Internal

Function CreateSignature(Val SignKey, Val SignatureData, Val Algorithm, Val HashFunc) Export

    OPI_TypeConversion.GetBinaryData(SignKey);
    OPI_TypeConversion.GetBinaryData(SignatureData);
    OPI_TypeConversion.GetLine(Algorithm);

    Algorithm = Upper(Algorithm);
    HashFunc  = Upper(HashFunc);

    If Algorithm    = "HMAC" Then
        Result      = HMAC(SignKey, SignatureData, HashFunc);
    ElsIf Algorithm = "RSA" Then
        Result      = RSA(SignKey, SignatureData, HashFunc);
    Else
        Raise "Cryptography processing error: unsupported method";
    EndIf;

    Return Result;

EndFunction

Function RSA(Val Key, Val Data, Val HashFunc) Export

    AddIn = OPI_AddIns.GetAddIn("Cryptography");

    If HashFunc    = "SHA256" Then
        Result     = AddIn.RsaSha256(Key, Data);
    ElsIf HashFunc = "SHA1" Then
        Result     = AddIn.RsaSha1(Key, Data);
    Else
        Result     = "unsupported hashing method";
    EndIf;

    If TypeOf(Result) = Type("String") Then
        Raise StrTemplate("Cryptography processing error: %1", Result);
    Else
        Return Result;
    EndIf;

EndFunction

Function JWT(Val Payload, Val SignKey, Val Method, Val AdditionalHeaders = "") Export

    OPI_TypeConversion.GetLine(Method);
    OPI_TypeConversion.GetKeyValueCollection(Payload);
    OPI_TypeConversion.GetBinaryData(SignKey, True, False);

    Method = Upper(Method);

    If Method = "HS256" Then

        Algorithm = "HMAC";
        HashFunc  = "SHA256";

    ElsIf Method = "RS256" Then

        Algorithm = "RSA";
        HashFunc  = "SHA256";

    Else
        Raise "JWT: Unsupported method";
    EndIf;

    Headers = New Structure("alg,typ", Method, "JWT");

    If ValueIsFilled(AdditionalHeaders) Then

        OPI_TypeConversion.GetKeyValueCollection(AdditionalHeaders);

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        For Each KeyValue In AdditionalHeaders Do
            Headers.Insert(KeyValue.Key, KeyValue.Value);
        EndDo;

    EndIf;

    PayloadAsString = OPI_Tools.JSONString(Payload, , False);
    HeadersAsString = OPI_Tools.JSONString(Headers, , False);

    PayloadBinary = GetBinaryDataFromString(PayloadAsString);
    HeadersBinary = GetBinaryDataFromString(HeadersAsString);

    PayloadBase64 = Base64UrlEncode(PayloadBinary);
    HeadersBase64 = Base64UrlEncode(HeadersBinary);

    Token       = StrTemplate("%1.%2", HeadersBase64, PayloadBase64);
    TokenBinary = GetBinaryDataFromString(Token);

    Signature       = CreateSignature(SignKey, TokenBinary, Algorithm, HashFunc);
    SignatureBase64 = Base64UrlEncode(Signature);

    Token = StrTemplate("%1.%2", Token, SignatureBase64);

    Return Token;

EndFunction

#Region Borrowed

///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, LLC 1C-Soft
// All rights reserved. This program and accompanying materials are provided
// under the terms of the Attribution 4.0 International (CC BY 4.0 license)
// License text available at:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

Function HMAC(Val Key, Val Data, Val HashFunc) Export

    Twice     = 2;
    BlockSize = 64;
    HashType  = HashFunction[HashFunc];

    If Key.Size() > BlockSize Then
        Key = Hash(Key, HashType);
    EndIf;

    If Key.Size() <= BlockSize Then
        Key        = GetHexStringFromBinaryData(Key);
        Key        = Left(Key + RepeatString("00", BlockSize), BlockSize * Twice);
    EndIf;

    Key = GetBinaryDataBufferFromBinaryData(GetBinaryDataFromHexString(Key));

    Ipad = GetBinaryDataBufferFromHexString(RepeatString("36", BlockSize));
    Opad = GetBinaryDataBufferFromHexString(RepeatString("5c", BlockSize));

    Ipad.WriteBitwiseXor(0, Key);
    Ikeypad = GetBinaryDataFromBinaryDataBuffer(ipad);

    Opad.WriteBitwiseXor(0, Key);
    Okeypad = GetBinaryDataFromBinaryDataBuffer(opad);

    Return Hash(UniteBinaryData(okeypad, Hash(UniteBinaryData(ikeypad, Data), HashType)), HashType);

EndFunction

Function Hash(BinaryData, Type) Export

    Hashing = New DataHashing(Type);
    Hashing.Append(BinaryData);

    Return Hashing.HashSum;

EndFunction

Function UniteBinaryData(BinaryData1, BinaryData2) Export

    BinaryDataArray = New Array;
    BinaryDataArray.Add(BinaryData1);
    BinaryDataArray.Add(BinaryData2);

    Return ConcatBinaryData(BinaryDataArray);

EndFunction

Function RepeatString(String, Count) Export

    Parts = New Array(Count);

    For K = 1 To Count Do
        Parts.Add(String);
    EndDo;

    Return StrConcat(Parts, "");

EndFunction

// The MIT License (MIT)
//
// Copyright (c) 2017 Vasily Pintov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/pintov/1c-jwt

Function Base64UrlEncode(Val Value) Export

    Output = Base64String(Value);
    Output = StrSplit(Output, "=")[0];
    Output = StrReplace(Output, Chars.CR + Chars.LF, "");
    Output = StrReplace(Output, "+"                , "-");
    Output = StrReplace(Output, "/"                , "_");
    Return Output;

EndFunction

#EndRegion

#EndRegion

#Region Alternate

Function СоздатьПодпись(Val КлючПодписи, Val ДанныеПодписи, Val Алгоритм, Val ФункцияХеша) Export
    Return CreateSignature(КлючПодписи, ДанныеПодписи, Алгоритм, ФункцияХеша);
EndFunction

Function Хеш(ДвоичныеДанные, Тип) Export
    Return Hash(ДвоичныеДанные, Тип);
EndFunction

Function СклеитьДвоичныеДанные(ДвоичныеДанные1, ДвоичныеДанные2) Export
    Return UniteBinaryData(ДвоичныеДанные1, ДвоичныеДанные2);
EndFunction

Function ПовторитьСтроку(Строка, Количество) Export
    Return RepeatString(Строка, Количество);
EndFunction

#EndRegion