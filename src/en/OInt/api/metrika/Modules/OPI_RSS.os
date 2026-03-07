// OneScript: ./OInt/api/metrika/Modules/OPI_RSS.os
// Lib: RSS
// CLI: rss
// Keywords: rss, atom, feed

// DocsCategory: Other
// DocsNameRU: RSS/Atom
// DocsNameEN: RSS/Atom

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Use "../../../tools/main"
#Use "../../../tools/http"

#Region Public

#Region RSSMethods

// Create feed (RSS)
// Creates RSS feed text
//
// Parameters:
// ChannelTitle       - String             - Channel title                           - name
// ChannelDescription - String             - Channel description                     - descr
// ChannelLink        - String             - Channel link                            - link
// Items              - Array of Structure - Feed items. See GetFeedItemStructureRSS - items
// UpdateDate         - Date, Undefined    - Update date. Current if not filled      - date
//
// Returns:
// String - Channel XML feed
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

// Get feed item structure (RSS)
// Gets the structure of parameters for an RSS feed item
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// AsMap - Boolean - True > returns fields as map                                             - map
//
// Returns:
// Structure Of KeyAndValue - Feed item fields structure
Function GetFeedItemStructureRSS(Val Clear = False, Val AsMap = False) Export

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(AsMap);

    If AsMap Then
        ElementStructure = New Map;
    Else
        ElementStructure = New Structure;
    EndIf;

    ElementStructure.Insert("title"       , "<item title>");
    ElementStructure.Insert("description" , "<item description/content>");
    ElementStructure.Insert("link"        , "<item URL>");
    ElementStructure.Insert("pubDate"     , "<publication date>");
    ElementStructure.Insert("author"      , "<authors email>");
    ElementStructure.Insert("guid"        , "<unique identifier of the item>");

    If Clear Then
        ElementStructure = OPI_Tools.ClearCollectionRecursively(ElementStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return ElementStructure;

EndFunction

// Parse feed (RSS)
// Parses the XML of an RSS feed and returns a structure with channel data and items
//
// Parameters:
// XMLText - String - XML content of RSS feed - xml
//
// Returns:
// Structure Of KeyAndValue - Channel structure
Function ParseFeedRSS(Val XMLText) Export

    OPI_TypeConversion.GetLine(XMLText);

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

#EndRegion

#Region AtomMethods

// Create feed (Atom)
// Creates the text of an Atom feed
//
// Parameters:
// FeedTitle  - String             - Feed title                               - name
// FeedLink   - String             - Feed URL                                 - link
// FeedID     - String             - Feed unique identifier (usually a URL)   - id
// Items      - Array of Structure - Feed items. See GetFeedItemStructureAtom - items
// UpdateDate - Date, Undefined    - Update date. Current if not filled       - date
//
// Returns:
// String - Atom XML feed
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

// Get feed item structure (Atom)
// Gets the structure of parameters of an Atom feed item
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// AsMap - Boolean - True > returns fields as map                                             - map
//
// Returns:
// Structure Of KeyAndValue - Feed item fields structure
Function GetFeedItemStructureAtom(Val Clear = False, Val AsMap = False) Export

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(AsMap);

    If AsMap Then
        ElementStructure = New Map;
    Else
        ElementStructure = New Structure;
    EndIf;

    ElementStructure.Insert("title"     , "<item title>");
    ElementStructure.Insert("id"        , "<unique identifier of the item>");
    ElementStructure.Insert("link"      , "<item URL>");
    ElementStructure.Insert("updated"   , "<update date>");
    ElementStructure.Insert("summary"   , "<short description>");
    ElementStructure.Insert("content"   , "<full content>");
    ElementStructure.Insert("author"    , "<author's name>");
    ElementStructure.Insert("published" , "<publication date>");

    If Clear Then
        ElementStructure = OPI_Tools.ClearCollectionRecursively(ElementStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return ElementStructure;

EndFunction

// Parse feed (Atom)
// Parses the XML of an Atom feed and returns a structure with feed data and items
//
// Parameters:
// XMLText - String - XML content of Atom feed - xml
//
// Returns:
// Structure Of KeyAndValue - Feed structure
Function ParseFeedAtom(Val XMLText) Export

    OPI_TypeConversion.GetLine(XMLText);

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
        EndIf;

    EndDo;

    Return AuthorName;

EndFunction

#EndRegion

#Region Alternate

Function СоздатьФидRSS(Val НазваниеКанала, Val ОписаниеКанала, Val СсылкаКанала, Val Элементы, Val ДатаОбновления = Undefined) Export
    Return CreateFeedRSS(НазваниеКанала, ОписаниеКанала, СсылкаКанала, Элементы, ДатаОбновления);
EndFunction

Function ПолучитьСтруктуруЭлементаФидаRSS(Val Пустая = False, Val КакСоответствие = False) Export
    Return GetFeedItemStructureRSS(Пустая, КакСоответствие);
EndFunction

Function РазобратьФидRSS(Val ТекстXML) Export
    Return ParseFeedRSS(ТекстXML);
EndFunction

Function СоздатьФидAtom(Val НазваниеФида, Val СсылкаФида, Val IDФида, Val Элементы, Val ДатаОбновления = Undefined) Export
    Return CreateFeedAtom(НазваниеФида, СсылкаФида, IDФида, Элементы, ДатаОбновления);
EndFunction

Function ПолучитьСтруктуруЭлементаФидаAtom(Val Пустая = False, Val КакСоответствие = False) Export
    Return GetFeedItemStructureAtom(Пустая, КакСоответствие);
EndFunction

Function РазобратьФидAtom(Val ТекстXML) Export
    Return ParseFeedAtom(ТекстXML);
EndFunction

#EndRegion