// OneScript: ./OInt/tests/Modules/OPIt_GoogleCalendar.os

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

    OPI_TestDataRetrieval.FormYAXTests("GoogleCalendar");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("GoogleCalendar");

EndFunction

#Region Internal

#Region RunnableTests

#Region GoogleCalendar

Procedure GC_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ServiceData" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Access_Token"       , TestParameters);

    GoogleCalendar_FormCodeRetrievalLink(TestParameters);
    GoogleCalendar_GetTokenByCode(TestParameters);
    GoogleCalendar_RefreshToken(TestParameters);
    GoogleCalendar_GetServiceAccountToken(TestParameters);

EndProcedure

Procedure GC_GetCalendarList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleCalendar_GetCalendarList(TestParameters);

EndProcedure

Procedure GC_CreateDeleteCalendar() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleCalendar_CreateCalendar(TestParameters);
    GoogleCalendar_EditCalendarMetadata(TestParameters);
    GoogleCalendar_GetCalendarMetadata(TestParameters);
    GoogleCalendar_AddCalendarToList(TestParameters);
    GoogleCalendar_EditListCalendar(TestParameters);
    GoogleCalendar_GetListCalendar(TestParameters);
    GoogleCalendar_ClearMainCalendar(TestParameters);
    // !DISABLED! GoogleCalendar_DeleteCalendarFromList(TestParameters);
    GoogleCalendar_DeleteCalendar(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GC_CreateDeleteEvent() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_NewCalendarID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_CalendarID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"            , TestParameters);

    GoogleCalendar_CreateCalendar(TestParameters);
    GoogleCalendar_CreateEvent(TestParameters);
    GoogleCalendar_EditEvent(TestParameters);
    GoogleCalendar_GetEvent(TestParameters);
    GoogleCalendar_MoveEvent(TestParameters);
    GoogleCalendar_GetEventList(TestParameters);
    GoogleCalendar_GetEventDescription(TestParameters);
    GoogleCalendar_DeleteEvent(TestParameters);
    GoogleCalendar_DeleteCalendar(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion // GoogleCalendar

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region GoogleCalendar

Procedure GoogleCalendar_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Result   = OPI_GoogleCalendar.FormCodeRetrievalLink(ClientID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleCalendar_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Result = OPI_GoogleCalendar.GetTokenByCode(ClientID, ClientSecret, Code);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "GetTokenByCode");

EndProcedure

Procedure GoogleCalendar_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Result = OPI_GoogleCalendar.RefreshToken(ClientID, ClientSecret, RefreshToken);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "RefreshToken");

EndProcedure

Procedure GoogleCalendar_GetServiceAccountToken(FunctionParameters)

    Data = FunctionParameters["Google_ServiceData"]; // URL, binary Data, file or collection

    Token = FunctionParameters["Access_Token"]; // SKIP
    Data  = OPI_HTTPRequests // SKIP
        .NewRequest() // SKIP
        .Initialize(Data) // SKIP
        .AddBearerAuthorization(Token) // SKIP
        .ProcessRequest("GET") // SKIP
        .ReturnResponseAsBinaryData(); // SKIP

    Scope = New Array;
    Scope.Add("https://www.googleapis.com/auth/calendar");
    Scope.Add("https://www.googleapis.com/auth/drive");
    Scope.Add("https://www.googleapis.com/auth/spreadsheets");

    Result = OPI_GoogleCalendar.GetServiceAccountToken(Data, Scope);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "GetServiceAccountToken");

EndProcedure

Procedure GoogleCalendar_GetCalendarList(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    Result = OPI_GoogleCalendar.GetCalendarList(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "GetCalendarList");

EndProcedure

Procedure GoogleCalendar_CreateCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestCalendar";

    Result = OPI_GoogleCalendar.CreateCalendar(Token, Name);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "CreateCalendar", , FunctionParameters, Name);

EndProcedure

Procedure GoogleCalendar_EditCalendarMetadata(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New name";
    Description = "New description";

    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token, Calendar, Name, Description);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "EditCalendarMetadata", , Name, Description);

EndProcedure

Procedure GoogleCalendar_GetCalendarMetadata(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetCalendarMetadata(Token, Calendar);

    // END

    Name        = "New name";
    Description = "New description";

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "GetCalendarMetadata", , Name, Description);

EndProcedure

Procedure GoogleCalendar_AddCalendarToList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.AddCalendarToList(Token, Calendar);

    // END

    Name        = "New name";
    Description = "New description";

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "AddCalendarToList", , Name, Description);

EndProcedure

Procedure GoogleCalendar_EditListCalendar(FunctionParameters)

    Token          = FunctionParameters["Google_Token"];
    Calendar       = FunctionParameters["Google_NewCalendarID"];
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Result = OPI_GoogleCalendar.EditListCalendar(Token, Calendar, PrimaryColor, SecondaryColor, Hidden);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "EditListCalendar", , PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_GetListCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetListCalendar(Token, Calendar);

    // END

    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "GetListCalendar", , PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_ClearMainCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "ClearMainCalendar");

EndProcedure

Procedure GoogleCalendar_DeleteCalendarFromList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "DeleteCalendarFromList");

EndProcedure

Procedure GoogleCalendar_DeleteCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.DeleteCalendar(Token, Calendar);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "DeleteCalendar");

EndProcedure

Procedure GoogleCalendar_CreateEvent(FunctionParameters)

    CurrentDate = OPI_Tools.GetCurrentDate();
    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New event";
    Description = "TestEventDescription";
    Hour        = 3600;

    Image1      = FunctionParameters["Picture"]; // URL, Binary or File path
    Image2      = FunctionParameters["Picture2"]; // URL, Binary or File path
    Attachments = New Map;

    Attachments.Insert("Image1", Image1);
    Attachments.Insert("Image2", Image2);

    EventDescription = New Map;
    EventDescription.Insert("Description"          , Description);
    EventDescription.Insert("Title"                , Name);
    EventDescription.Insert("Venue"                , "InOffice");
    EventDescription.Insert("StartDate"            , CurrentDate);
    EventDescription.Insert("EndDate"              , EventDescription["StartDate"] + Hour);
    EventDescription.Insert("ArrayOfAttachmentURLs", Attachments);
    EventDescription.Insert("SendNotifications"    , True);

    Result = OPI_GoogleCalendar.CreateEvent(Token, Calendar, EventDescription);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "CreateEvent", , FunctionParameters, Name, Description);

EndProcedure

Procedure GoogleCalendar_EditEvent(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Event       = FunctionParameters["Google_EventID"];
    Description = "New event description";

    EventDescription = New Map;
    EventDescription.Insert("Description", Description);

    Result = OPI_GoogleCalendar.EditEvent(Token, Calendar, EventDescription, Event);

    // END

    Name = "New event";

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "EditEvent", , Name, Description);

EndProcedure

Procedure GoogleCalendar_GetEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Result = OPI_GoogleCalendar.GetEvent(Token, Calendar, Event);

    // END

    Name        = "New event";
    Description = "New event description";

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "GetEvent", , Name, Description);

EndProcedure

Procedure GoogleCalendar_MoveEvent(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Event = FunctionParameters["Google_EventID"];

    SourceCalendar = FunctionParameters["Google_NewCalendarID"];
    TargetCalendar = FunctionParameters["Google_CalendarID"];

    Result = OPI_GoogleCalendar.MoveEvent(Token, SourceCalendar, TargetCalendar, Event);

    // END

    Name        = "New event";
    Description = "New event description";

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "MoveEvent", , Name, Description);

    OPI_GoogleCalendar.MoveEvent(Token, TargetCalendar, SourceCalendar, Event);

EndProcedure

Procedure GoogleCalendar_DeleteEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "DeleteEvent");

EndProcedure

Procedure GoogleCalendar_GetEventList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetEventList(Token, Calendar);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "GetEventList");

EndProcedure

Procedure GoogleCalendar_GetEventDescription(FunctionParameters)

    Clear  = False;
    Result = OPI_GoogleCalendar.GetEventDescription(Clear);

    // END

    OPI_TestDataRetrieval.Process(Result, "GoogleCalendar", "GetEventDescription");

EndProcedure

#EndRegion // GoogleCalendar

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure ГК_Авторизация() Export
    GC_Authorization();
EndProcedure

Procedure ГК_ПолучитьСписокКалендарей() Export
    GC_GetCalendarList();
EndProcedure

Procedure ГК_СоздатьУдалитьКалендарь() Export
    GC_CreateDeleteCalendar();
EndProcedure

Procedure ГК_СоздатьУдалитьСобытие() Export
    GC_CreateDeleteEvent();
EndProcedure

#EndRegion