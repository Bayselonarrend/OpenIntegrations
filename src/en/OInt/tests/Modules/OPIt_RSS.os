// OneScript: ./OInt/tests/Modules/OPIt_RSS.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Test suite for YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

#Use oint
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("RSS");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("RSS");

EndFunction

#Region Internal

#Region RunnableTests

#Region RSS

Procedure RSS_RSSMethods() Export

    TestParameters = New Structure;

    RSS_CreateFeedRSS(TestParameters);
    RSS_GetFeedItemStructureRSS(TestParameters);
    RSS_ParseFeedRSS(TestParameters);

EndProcedure

Procedure RSS_AtomMethods() Export

    TestParameters = New Structure;

    RSS_CreateFeedAtom(TestParameters);
    RSS_GetFeedItemStructureAtom(TestParameters);
    RSS_ParseFeedAtom(TestParameters);

EndProcedure

#EndRegion // RSS

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region RSS

Procedure RSS_CreateFeedRSS(FunctionParameters)

    ChannelTitle       = "Test RSS channel";
    ChannelDescription = "Test RSS channel description";
    ChannelLink        = "https://example.com";

    ItemsArray = New Array;

    ElementStructure                = OPI_RSS.GetFeedItemStructureRSS(True);
    ElementStructure["title"]       = "First element";
    ElementStructure["description"] = "First element description";
    ElementStructure["link"]        = "https://example.com/item1";
    ElementStructure["pubDate"]     = OPI_Tools.GetCurrentDate();
    ElementStructure["author"]      = "test@example.com";
    ElementStructure["guid"]        = "item-1";

    ItemsArray.Add(ElementStructure);

    ElementStructure                = OPI_RSS.GetFeedItemStructureRSS(True);
    ElementStructure["title"]       = "Second element";
    ElementStructure["description"] = "Second element description";
    ElementStructure["link"]        = "https://example.com/item2";
    ElementStructure["pubDate"]     = OPI_Tools.GetCurrentDate();
    ElementStructure["author"]      = "test@example.com";
    ElementStructure["guid"]        = "item-2";

    ItemsArray.Add(ElementStructure);

    Result = OPI_RSS.CreateFeedRSS(ChannelTitle, ChannelDescription, ChannelLink, ItemsArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "RSS", "CreateFeedRSS", , FunctionParameters);

EndProcedure

Procedure RSS_GetFeedItemStructureRSS(FunctionParameters)

    Result = OPI_RSS.GetFeedItemStructureRSS();

    // END

    OPI_TestDataRetrieval.Process(Result, "RSS", "GetFeedItemStructureRSS");

    Result = OPI_RSS.GetFeedItemStructureRSS(True);

    OPI_TestDataRetrieval.Process(Result, "RSS", "GetFeedItemStructureRSS", "Clear");

    Result = OPI_RSS.GetFeedItemStructureRSS(False, True);

    OPI_TestDataRetrieval.Process(Result, "RSS", "GetFeedItemStructureRSS", "Map");

EndProcedure

Procedure RSS_ParseFeedRSS(FunctionParameters)

    FeedXML = FunctionParameters["RSS_FeedXML"];

    Result = OPI_RSS.ParseFeedRSS(FeedXML);

    // END

    OPI_TestDataRetrieval.Process(Result, "RSS", "ParseFeedRSS");

    OPI_Tools.RemoveFileWithTry(FeedXML, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure RSS_CreateFeedAtom(FunctionParameters)

    FeedTitle = "Test Atom feed";
    FeedLink  = "https://example.com";
    FeedID    = "https://example.com/feed";

    ItemsArray = New Array;

    ElementStructure              = OPI_RSS.GetFeedItemStructureAtom(True);
    ElementStructure["title"]     = "First record";
    ElementStructure["id"]        = "https://example.com/entry1";
    ElementStructure["link"]      = "https://example.com/entry1";
    ElementStructure["updated"]   = OPI_Tools.GetCurrentDate();
    ElementStructure["summary"]   = "First record summary";
    ElementStructure["content"]   = "Full content of the first record";
    ElementStructure["author"]    = "First Author";
    ElementStructure["published"] = OPI_Tools.GetCurrentDate();

    ItemsArray.Add(ElementStructure);

    ElementStructure              = OPI_RSS.GetFeedItemStructureAtom(True);
    ElementStructure["title"]     = "Second record";
    ElementStructure["id"]        = "https://example.com/entry2";
    ElementStructure["link"]      = "https://example.com/entry2";
    ElementStructure["updated"]   = OPI_Tools.GetCurrentDate();
    ElementStructure["summary"]   = "Second record summary";
    ElementStructure["content"]   = "Full content of the second record";
    ElementStructure["author"]    = "Second Author";
    ElementStructure["published"] = OPI_Tools.GetCurrentDate();

    ItemsArray.Add(ElementStructure);

    Result = OPI_RSS.CreateFeedAtom(FeedTitle, FeedLink, FeedID, ItemsArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "RSS", "CreateFeedAtom", , FunctionParameters);

EndProcedure

Procedure RSS_GetFeedItemStructureAtom(FunctionParameters)

    Result = OPI_RSS.GetFeedItemStructureAtom();

    // END

    OPI_TestDataRetrieval.Process(Result, "RSS", "GetFeedItemStructureAtom");

    Result = OPI_RSS.GetFeedItemStructureAtom(True);

    OPI_TestDataRetrieval.Process(Result, "RSS", "GetFeedItemStructureAtom", "Clear");

    Result = OPI_RSS.GetFeedItemStructureAtom(False, True);

    OPI_TestDataRetrieval.Process(Result, "RSS", "GetFeedItemStructureAtom", "Map");

EndProcedure

Procedure RSS_ParseFeedAtom(FunctionParameters)

    FeedXML = FunctionParameters["RSS_AtomFeedXML"];

    Result = OPI_RSS.ParseFeedAtom(FeedXML);

    // END

    OPI_TestDataRetrieval.Process(Result, "RSS", "ParseFeedAtom");

    OPI_Tools.RemoveFileWithTry(FeedXML, "Failed to delete the temporary file after the test!!");

EndProcedure

#EndRegion // RSS

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure RSS_МетодыRSS() Export
    RSS_RSSMethods();
EndProcedure

Procedure RSS_МетодыAtom() Export
    RSS_AtomMethods();
EndProcedure

#EndRegion