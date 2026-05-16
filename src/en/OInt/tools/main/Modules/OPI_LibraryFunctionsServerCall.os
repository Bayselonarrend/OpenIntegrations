// OneScript: ./OInt/tools/main/Modules/OPI_LibraryFunctionsServerCall.os

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

#Use "./internal"

#Region Internal

#Region S3

Function GenerateAWSSignature(Val DataStructure, Val Address, Val Method, Val Headers, Val Expire) Export

    AccessKey = DataStructure["AccessKey"];
    SecretKey = DataStructure["SecretKey"];
    Region    = DataStructure["Region"];
    Service   = DataStructure["Service"];

    HashString = "UNSIGNED-PAYLOAD";

    CurrentDate   = OPI_Tools.GetCurrentUniversalDate();
    Timestamp     = OPI_Tools.ISOTimestamp(CurrentDate);
    SignKey       = GetSignatureKey(SecretKey, Region, Service, CurrentDate);
    Scope         = CreateScope(Region, Service, CurrentDate);
    HeadersKeys   = GetHeadersKeysString(Headers);
    HeadersString = GetHeadersString(Headers);
    Base          = OPI_Tools.GetEncodedString(AccessKey + "/" + Scope, "URLencoding");

    URLParameters = New ValueTable;

    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Algorithm"    , "AWS4-HMAC-SHA256");
    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Credential"   , Base);
    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Date"         , Timestamp);
    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Expires"      , Expire);
    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-SignedHeaders", HeadersKeys);

    ParametersString = OPI_Tools.RequestParametersToString(URLParameters);
    ParametersString = Right(ParametersString, StrLen(ParametersString) - 1);
    RequestTemplate  = "";
    PartsAmount      = 6;

    For N = 1 To PartsAmount Do

        RequestTemplate = RequestTemplate + "%" + String(N) + ?(N = PartsAmount, "", Chars.LF);

    EndDo;

    CanonicalRequest = StrTemplate(RequestTemplate
        , Method
        , Address
        , ParametersString
        , HeadersString
        , HeadersKeys
        , HashString);

    StringToSign = CreateSignatureString(CanonicalRequest, Scope, CurrentDate);
    Signature    = OPI_Cryptography.HMAC(SignKey, StringToSign, "SHA256");
    Signature    = Lower(GetHexStringFromBinaryData(Signature));

    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Signature", Signature);

    URLSign = OPI_Tools.RequestParametersToString(URLParameters);

    Return URLSign;

EndFunction

#EndRegion

#Region RSS

Function CreateFeedRSS(Val ChannelTitle
    , Val ChannelDescription
    , Val ChannelLink
    , Val Items
    , Val UpdateDate = Undefined) Export

    UpdateDate = ?(UpdateDate = Undefined
        , OPI_Tools.GetCurrentDate()
        , UpdateDate);

    OPI_TypeConversion.GetLine(ChannelTitle);
    OPI_TypeConversion.GetLine(ChannelDescription);
    OPI_TypeConversion.GetLine(ChannelLink);
    OPI_TypeConversion.GetArray(Items);
    OPI_TypeConversion.GetDate(UpdateDate);

    XMLWriter = New XMLWriter;
    XMLWriter.SetString("UTF-8");

    XMLWriter.WriteXMLDeclaration();
    XMLWriter.WriteStartElement("rss");
    XMLWriter.WriteAttribute("version", "2.0");

    XMLWriter.WriteStartElement("channel");
    WriteXMLItem(XMLWriter, "title"      , ChannelTitle);
    WriteXMLItem(XMLWriter, "link"       , ChannelLink);
    WriteXMLItem(XMLWriter, "description", ChannelDescription);

    DateRFC822 = OPI_Tools.DateRFC822(UpdateDate);
    WriteXMLItem(XMLWriter, "lastBuildDate", DateRFC822);

    For Each Element In Items Do
        WriteFeedItem(XMLWriter, Element);
    EndDo;

    XMLWriter.WriteEndElement();
    XMLWriter.WriteEndElement();

    Feed = XMLWriter.Close();

    Return Feed;

EndFunction

Function ParseFeedRSS(Val XMLText) Export

    Channel = New Structure;

    XMLReader = New XMLReader;
    XMLReader.SetString(XMLText);

    While XMLReader.Read() Do

        If XMLReader.NodeType = XMLNodeType.StartElement Then

            If XMLReader.Name = "channel" Then
                Channel       = ReadChannelRSS(XMLReader);
                Break;
            EndIf;

        EndIf;

    EndDo;

    XMLReader.Close();

    Return Channel;

EndFunction

Function CreateFeedAtom(Val FeedTitle
    , Val FeedLink
    , Val FeedID
    , Val Items
    , Val UpdateDate = Undefined) Export

    UpdateDate = ?(UpdateDate = Undefined
        , OPI_Tools.GetCurrentDate()
        , UpdateDate);

    OPI_TypeConversion.GetLine(FeedTitle);
    OPI_TypeConversion.GetLine(FeedLink);
    OPI_TypeConversion.GetLine(FeedID);
    OPI_TypeConversion.GetArray(Items);
    OPI_TypeConversion.GetDate(UpdateDate);

    XMLWriter = New XMLWriter;
    XMLWriter.SetString("UTF-8");

    XMLWriter.WriteXMLDeclaration();
    XMLWriter.WriteStartElement("feed");
    XMLWriter.WriteAttribute("xmlns", "http://www.w3.org/2005/Atom");

    WriteXMLItem(XMLWriter, "title", FeedTitle);
    WriteXMLItem(XMLWriter, "id"   , FeedID);

    XMLWriter.WriteStartElement("link");
    XMLWriter.WriteAttribute("href", FeedLink);
    XMLWriter.WriteAttribute("rel" , "alternate");
    XMLWriter.WriteEndElement();

    DateISO8601 = OPI_Tools.DateISO8601(UpdateDate);
    WriteXMLItem(XMLWriter, "updated", DateISO8601);

    For Each Element In Items Do
        WriteFeedItemAtom(XMLWriter, Element);
    EndDo;

    XMLWriter.WriteEndElement(); // feed

    Feed = XMLWriter.Close();

    Return Feed;

EndFunction

Function ParseFeedAtom(Val XMLText) Export

    Feed = New Structure;

    XMLReader = New XMLReader;
    XMLReader.SetString(XMLText);

    While XMLReader.Read() Do

        If XMLReader.NodeType = XMLNodeType.StartElement Then

            If XMLReader.Name = "feed" Then
                Feed          = ReadFeedAtom(XMLReader);
                Break;
            EndIf;

        EndIf;

    EndDo;

    XMLReader.Close();

    Return Feed;

EndFunction

#EndRegion

#EndRegion

#Region Private

#Region S3

Function CreateSignatureString(Val CanonicalRequest, Val Scope, Val CurrentDate)

    StringTemplate = "";
    Algorithm      = "AWS4-HMAC-SHA256";
    DateISO        = OPI_Tools.ISOTimestamp(CurrentDate);
    PartsAmount    = 4;

    CanonicalRequest = GetBinaryDataFromString(CanonicalRequest);
    CanonicalRequest = OPI_Cryptography.Hash(CanonicalRequest, "SHA256");
    CanonicalRequest = Lower(GetHexStringFromBinaryData(CanonicalRequest));

    For N = 1 To PartsAmount Do

        StringTemplate = StringTemplate + "%" + String(N) + ?(N = PartsAmount, "", Chars.LF);

    EndDo;

    SignatureString = StrTemplate(StringTemplate, Algorithm, DateISO, Scope, CanonicalRequest);
    SignatureString = GetBinaryDataFromString(SignatureString);

    Return SignatureString;

EndFunction

Function GetSignatureKey(Val SecretKey, Val Region, Val Service, Val CurrentDate)

    SecretKey  = GetBinaryDataFromString("AWS4" + SecretKey);
    DateData = GetBinaryDataFromString(Format(CurrentDate, "DF=yyyyMMdd;"));
    Region     = GetBinaryDataFromString(Region);
    Service    = GetBinaryDataFromString(Service);
    AWSRequest = GetBinaryDataFromString("aws4_request");
    Sha256_    = "SHA256";

    DataKey    = OPI_Cryptography.HMAC(SecretKey, DateData, Sha256_);
    RegionKey  = OPI_Cryptography.HMAC(DataKey, Region, Sha256_);
    ServiceKey = OPI_Cryptography.HMAC(RegionKey, Service, Sha256_);

    FinalKey = OPI_Cryptography.HMAC(ServiceKey, AWSRequest, Sha256_);

    Return FinalKey;

EndFunction

Function CreateScope(Val Region, Val Service, Val CurrentDate)

    CommonDate = Format(CurrentDate, "DF=yyyyMMdd;");

    Scope = New Array;
    Scope.Add(CommonDate);
    Scope.Add(Region);
    Scope.Add(Service);
    Scope.Add("aws4_request");

    ScopeString = StrConcat(Scope, "/");

    Return ScopeString;

EndFunction

Function GetHeadersString(Val Headers)

    HeadersList = New ValueList;

    For Each Title In Headers Do

        CurrentKey  = Title.Key;
        CurrentKeyN = Lower(CurrentKey);

        If Not StrStartsWith(CurrentKeyN, "host") And Not StrStartsWith(CurrentKeyN, "x-amz") Then
            Continue;
        EndIf;

        HeaderString = Lower(CurrentKey) + ":" + Title.Value;
        HeadersList.Add(HeaderString);

    EndDo;

    HeadersList.SortByValue();

    HeadersString = StrConcat(HeadersList.UnloadValues(), Chars.LF);
    HeadersString = HeadersString + Chars.LF;

    Return HeadersString;

EndFunction

Function GetHeadersKeysString(Val Headers)

    HeadersList = New ValueList;

    For Each Title In Headers Do

        CurrentKey  = Title.Key;
        CurrentKeyN = Lower(CurrentKey);

        If Not StrStartsWith(CurrentKeyN, "host") And Not StrStartsWith(CurrentKeyN, "x-amz") Then
            Continue;
        EndIf;

        HeaderString = Lower(CurrentKey);
        HeadersList.Add(HeaderString);

    EndDo;

    HeadersList.SortByValue();

    HeadersString = StrConcat(HeadersList.UnloadValues(), ";");

    Return HeadersString;

EndFunction

#EndRegion

#Region RSS

Procedure WriteXMLItem(XMLWriter, ElementName, Value)

    If ValueIsFilled(Value) Then
        XMLWriter.WriteStartElement(ElementName);
        XMLWriter.WriteText(Value);
        XMLWriter.WriteEndElement();
    EndIf;

EndProcedure

Procedure WriteFeedItem(XMLWriter, Element)

    OPI_TypeConversion.GetKeyValueCollection(Element);

    XMLWriter.WriteStartElement("item");

    For Each DataField In Element Do

        CurrentKey   = DataField.Key;
        CurrentValue = DataField.Value;

        If TypeOf(CurrentValue) = Type("Date") Then
            CurrentValue        = OPI_Tools.DateRFC822(CurrentValue);
        Else
            OPI_TypeConversion.GetLine(CurrentValue, False);
        EndIf;

        If CurrentKey = "guid" Then
            XMLWriter.WriteStartElement("guid");
            XMLWriter.WriteAttribute("isPermaLink", "false");
            XMLWriter.WriteText(CurrentValue);
            XMLWriter.WriteEndElement();
        Else
            WriteXMLItem(XMLWriter, CurrentKey, CurrentValue);
        EndIf;

    EndDo;

    XMLWriter.WriteEndElement();

EndProcedure

Function ReadChannelRSS(XMLReader)

    Channel = New Structure;
    Items   = New Array;

    While XMLReader.Read() Do

        If XMLReader.NodeType = XMLNodeType.StartElement Then

            ElementName = XMLReader.Name;

            If ElementName            = "item" Then
                Element               = ReadItemRSS(XMLReader);
                Items.Add(Element);
            Else
                XMLReader.Read();
                If XMLReader.NodeType = XMLNodeType.Text Then
                    Channel.Insert(ElementName, XMLReader.Value);
                EndIf;
            EndIf;

        ElsIf XMLReader.NodeType = XMLNodeType.EndElement And XMLReader.Name = "channel" Then
            Break;
        Else
            Continue;
        EndIf;

    EndDo;

    Channel.Insert("items", Items);

    Return Channel;

EndFunction

Function ReadItemRSS(XMLReader)

    Element = New Structure;

    While XMLReader.Read() Do

        If XMLReader.NodeType = XMLNodeType.StartElement Then

            ElementName = XMLReader.Name;
            XMLReader.Read();

            If XMLReader.NodeType = XMLNodeType.Text Then
                Element.Insert(ElementName, XMLReader.Value);
            EndIf;

        ElsIf XMLReader.NodeType = XMLNodeType.EndElement And XMLReader.Name = "item" Then
            Break;
        Else
            Continue;
        EndIf;

    EndDo;

    Return Element;

EndFunction

Procedure WriteFeedItemAtom(XMLWriter, Element)

    OPI_TypeConversion.GetKeyValueCollection(Element);

    XMLWriter.WriteStartElement("entry");

    For Each DataField In Element Do

        CurrentKey   = DataField.Key;
        CurrentValue = DataField.Value;

        If TypeOf(CurrentValue) = Type("Date") Then
            CurrentValue        = OPI_Tools.DateISO8601(CurrentValue);
        Else
            OPI_TypeConversion.GetLine(CurrentValue, False);
        EndIf;

        If CurrentKey    = "link" Then
            XMLWriter.WriteStartElement("link");
            XMLWriter.WriteAttribute("href", CurrentValue);
            XMLWriter.WriteAttribute("rel" , "alternate");
            XMLWriter.WriteEndElement();
        ElsIf CurrentKey = "author" Then
            XMLWriter.WriteStartElement("author");
            WriteXMLItem(XMLWriter, "name"    , CurrentValue);
            XMLWriter.WriteEndElement();
        ElsIf CurrentKey = "content" Then
            XMLWriter.WriteStartElement("content");
            XMLWriter.WriteAttribute("type", "html");
            XMLWriter.WriteText(CurrentValue);
            XMLWriter.WriteEndElement();
        Else
            WriteXMLItem(XMLWriter, CurrentKey, CurrentValue);
        EndIf;

    EndDo;

    XMLWriter.WriteEndElement(); // entry

EndProcedure

Function ReadFeedAtom(XMLReader)

    Feed  = New Structure;
    Items = New Array;

    While XMLReader.Read() Do

        If XMLReader.NodeType = XMLNodeType.StartElement Then

            ElementName = XMLReader.Name;

            If ElementName            = "entry" Then
                Element               = ReadItemAtom(XMLReader);
                Items.Add(Element);
            ElsIf ElementName         = "link" Then
                Feed.Insert("link", XMLReader.GetAttribute("href"));
            Else
                XMLReader.Read();
                If XMLReader.NodeType = XMLNodeType.Text Then
                    Feed.Insert(ElementName, XMLReader.Value);
                EndIf;
            EndIf;

        ElsIf XMLReader.NodeType = XMLNodeType.EndElement And XMLReader.Name = "feed" Then
            Break;
        Else
            Continue;
        EndIf;

    EndDo;

    Feed.Insert("entries", Items);

    Return Feed;

EndFunction

Function ReadItemAtom(XMLReader)

    Element = New Structure;

    While XMLReader.Read() Do

        If XMLReader.NodeType = XMLNodeType.StartElement Then

            ElementName = XMLReader.Name;

            If ElementName            = "link" Then
                Element.Insert("link"  , XMLReader.GetAttribute("href"));
            ElsIf ElementName         = "author" Then
                AuthorName            = ReadAuthorAtom(XMLReader);
                Element.Insert("author", AuthorName);
            Else
                XMLReader.Read();
                If XMLReader.NodeType = XMLNodeType.Text Then
                    Element.Insert(ElementName, XMLReader.Value);
                EndIf;
            EndIf;

        ElsIf XMLReader.NodeType = XMLNodeType.EndElement And XMLReader.Name = "entry" Then
            Break;
        Else
            Continue;
        EndIf;

    EndDo;

    Return Element;

EndFunction

Function ReadAuthorAtom(XMLReader)

    AuthorName = "";

    While XMLReader.Read() Do

        If XMLReader.NodeType     = XMLNodeType.StartElement And XMLReader.Name = "name" Then
            XMLReader.Read();
            If XMLReader.NodeType = XMLNodeType.Text Then
                AuthorName        = XMLReader.Value;
            EndIf;
        ElsIf XMLReader.NodeType  = XMLNodeType.EndElement And XMLReader.Name = "author" Then
            Break;
        Else
            Continue;
        EndIf;

    EndDo;

    Return AuthorName;

EndFunction

#EndRegion

#EndRegion
