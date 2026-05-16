// OneScript: ./OInt/tests/Modules/OPItc_GoogleCalendar.os

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

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("GoogleCalendar");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("GoogleCalendar");

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
    Options = New Structure;
    Options.Insert("id", ClientID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "FormCodeRetrievalLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleCalendar_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Options = New Structure;
    Options.Insert("id", ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("code", Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetTokenByCode", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "GetTokenByCode");

EndProcedure

Procedure GoogleCalendar_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Options = New Structure;
    Options.Insert("id", ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("refresh", RefreshToken);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "RefreshToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "RefreshToken");

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

    Options = New Structure;
    Options.Insert("auth", Data);
    Options.Insert("scope", Scope);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetServiceAccountToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "GetServiceAccountToken");

EndProcedure

Procedure GoogleCalendar_GetCalendarList(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetCalendarList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "GetCalendarList");

EndProcedure

Procedure GoogleCalendar_CreateCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestCalendar";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "CreateCalendar", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "CreateCalendar", , FunctionParameters, Name);

EndProcedure

Procedure GoogleCalendar_EditCalendarMetadata(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New name";
    Description = "New description";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("title", Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditCalendarMetadata", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "EditCalendarMetadata", , Name, Description);

EndProcedure

Procedure GoogleCalendar_GetCalendarMetadata(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetCalendarMetadata", Options);

    // END

    Name        = "New name";
    Description = "New description";

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "GetCalendarMetadata", , Name, Description);

EndProcedure

Procedure GoogleCalendar_AddCalendarToList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "AddCalendarToList", Options);

    // END

    Name        = "New name";
    Description = "New description";

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "AddCalendarToList", , Name, Description);

EndProcedure

Procedure GoogleCalendar_EditListCalendar(FunctionParameters)

    Token          = FunctionParameters["Google_Token"];
    Calendar       = FunctionParameters["Google_NewCalendarID"];
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("primary", PrimaryColor);
    Options.Insert("secondary", SecondaryColor);
    Options.Insert("hidden", Hidden);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditListCalendar", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "EditListCalendar", , PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_GetListCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetListCalendar", Options);

    // END

    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "GetListCalendar", , PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_ClearMainCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "ClearMainCalendar", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "ClearMainCalendar");

EndProcedure

Procedure GoogleCalendar_DeleteCalendarFromList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteCalendarFromList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "DeleteCalendarFromList");

EndProcedure

Procedure GoogleCalendar_DeleteCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteCalendar", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "DeleteCalendar");

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

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("props", EventDescription);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "CreateEvent", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "CreateEvent", , FunctionParameters, Name, Description);

EndProcedure

Procedure GoogleCalendar_EditEvent(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Event       = FunctionParameters["Google_EventID"];
    Description = "New event description";

    EventDescription = New Map;
    EventDescription.Insert("Description", Description);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("props", EventDescription);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditEvent", Options);

    // END

    Name = "New event";

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "EditEvent", , Name, Description);

EndProcedure

Procedure GoogleCalendar_GetEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEvent", Options);

    // END

    Name        = "New event";
    Description = "New event description";

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "GetEvent", , Name, Description);

EndProcedure

Procedure GoogleCalendar_MoveEvent(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Event = FunctionParameters["Google_EventID"];

    SourceCalendar = FunctionParameters["Google_NewCalendarID"];
    TargetCalendar = FunctionParameters["Google_CalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", SourceCalendar);
    Options.Insert("to", TargetCalendar);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "MoveEvent", Options);

    // END

    Name        = "New event";
    Description = "New event description";

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "MoveEvent", , Name, Description);

    OPI_GoogleCalendar.MoveEvent(Token, TargetCalendar, SourceCalendar, Event);

EndProcedure

Procedure GoogleCalendar_DeleteEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteEvent", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "DeleteEvent");

EndProcedure

Procedure GoogleCalendar_GetEventList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEventList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "GetEventList");

EndProcedure

Procedure GoogleCalendar_GetEventDescription(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEventDescription", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleCalendar", "GetEventDescription");

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
