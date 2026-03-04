// OneScript: ./OInt/api/metrika/Modules/OPI_RSS.os
// Lib: RSS
// CLI: rss

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

#Region CommonMethods

// Create feed RSS
// Creates RSS feed text
//
// Parameters:
// ChannelTitle       - String             - Channel title                        - name
// ChannelDescription - String             - Channel description                  - descr
// ChannelLink        - String             - Channel link                         - link
// Items              - Array of Structure - Feed items. See GetFeedItemStructure - items
// UpdateDate         - Date, Undefined    - Update date. Current if not filled   - date
//
// Returns:
// String - Channel XML feed
Function CreateFeedRSS(Val ChannelTitle
    , Val ChannelDescription
    , Val ChannelLink
    , Val Items
    , Val UpdateDate = Undefined) Export

    //@skip-check use-non-recommended-method
    UpdateDate = ?(UpdateDate = Undefined, CurrentDate(), UpdateDate);

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

// Get feed item structure RSS
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

#EndRegion

#Region Alternate

Function СоздатьФидRSS(Val НазваниеКанала, Val ОписаниеКанала, Val СсылкаКанала, Val Элементы, Val ДатаОбновления = Undefined) Export
    Return CreateFeedRSS(НазваниеКанала, ОписаниеКанала, СсылкаКанала, Элементы, ДатаОбновления);
EndFunction

Function ПолучитьСтруктуруЭлементаФидаRSS(Val Пустая = False, Val КакСоответствие = False) Export
    Return GetFeedItemStructureRSS(Пустая, КакСоответствие);
EndFunction

#EndRegion