// OneScript: ./OInt/api/rss/Modules/OPI_RSS.os
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

// #Use "../../../tools/main"
// #Use "../../../tools/http"

#If Not WebClient Then // !OPI

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

    Return OPI_LibraryFunctionsServerCall.CreateFeedRSS(ChannelTitle
        , ChannelDescription
        , ChannelLink
        , Items
        , UpdateDate);

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

    OPI_TypeConversion.GetLine(XMLText, True);
    Return OPI_LibraryFunctionsServerCall.ParseFeedRSS(XMLText);

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

    Return OPI_LibraryFunctionsServerCall.CreateFeedAtom(FeedTitle
        , FeedLink
        , FeedID
        , Items
        , UpdateDate);

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

    OPI_TypeConversion.GetLine(XMLText, True);
    Return OPI_LibraryFunctionsServerCall.ParseFeedAtom(XMLText);

EndFunction

#EndRegion

#EndRegion

#EndIf // !OPI
