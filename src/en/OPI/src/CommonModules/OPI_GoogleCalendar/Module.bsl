// OneScript: ./OInt/core/Modules/OPI_GoogleCalendar.os
// Lib: Google Calendar
// CLI: gcalendar

// MIT License

// Copyright (c) 2023 Anton Tsitavets

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
// BSLLS:UsingServiceTag-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
// #Use "../../tools"

#Region Public

#Region CalendarMetadataManagement

// Create calendar
// Creates an empty calendar
//
// Parameters:
// Token - String - Token - token
// Name - String - Name of the created calendar - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function CreateCalendar(Val Token, Val Name) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Name);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://www.googleapis.com/calendar/v3/calendars";

    Parameters = New Structure;
    Parameters.Insert("summary" , Name);
    Parameters.Insert("timeZone", "Europe/Moscow");

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get calendar
// Gets calendar information by ID
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetCalendarMetadata(Val Token, Val Calendar) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);

    Headers  = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL      = "https://www.googleapis.com/calendar/v3/calendars/" + Calendar;
    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

// Edit calendar
// Edits properties of an existing calendar
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
// Name - String - New name - title
// Description - String - New calendar description - description
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function EditCalendarMetadata(Val Token
    , Val Calendar
    , Val Name = ""
    , Val Description = "") Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);
    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Description);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://www.googleapis.com/calendar/v3/calendars/" + Calendar;

    Parameters = New Structure;

    If ValueIsFilled(Name) Then
        Parameters.Insert("summary", Name);
    EndIf;

    If ValueIsFilled(Description) Then
        Parameters.Insert("description", Description);
    EndIf;

    Response = OPI_Tools.Patch(URL, Parameters, Headers, True);

    Return Response;

EndFunction

// Clear primary calendar
// Clears the event list of the primary calendar
//
// Parameters:
// Token - String - Token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function ClearMainCalendar(Val Token) Export

    OPI_TypeConversion.GetLine(Token);

    Headers  = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL      = "https://www.googleapis.com/calendar/v3/calendars/primary/clear";
    Response = OPI_Tools.Post(URL, , Headers, False);

    Return Response;

EndFunction

// Delete calendar
// Deletes a calendar by ID
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function DeleteCalendar(Val Token, Val Calendar) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);

    Headers  = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL      = "https://www.googleapis.com/calendar/v3/calendars/" + Calendar;
    Response = OPI_Tools.Delete(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#Region CalendarListManagement

// Get list of calendars
// Gets an array of account calendars
//
// Parameters:
// Token - String - Token - token
//
// Returns:
// Map Of KeyAndValue - Array of calendar data mappings
Function GetCalendarList(Val Token) Export

    OPI_TypeConversion.GetLine(Token);

    Headers          = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    ArrayOfCalendars = New Array;

    GetCalendarsListRecursively(Headers, ArrayOfCalendars);

    Return ArrayOfCalendars;

EndFunction

// Add calendar to list
// Adds an existing calendar to the user's list
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function AddCalendarToList(Val Token, Val Calendar) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://www.googleapis.com/calendar/v3/users/me/calendarList";

    Parameters = New Structure;
    Parameters.Insert("id", Calendar);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get list calendar
// Gets a calendar from the user's list by ID
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetListCalendar(Val Token, Val Calendar) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);

    Headers  = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL      = "https://www.googleapis.com/calendar/v3/users/me/calendarList/" + Calendar;
    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

// Remove calendar from list
// Removes a calendar from the user's list
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function DeleteCalendarFromList(Val Token, Val Calendar) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);

    Headers  = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL      = "https://www.googleapis.com/calendar/v3/users/me/calendarList/" + Calendar;
    Response = OPI_Tools.Delete(URL, , Headers);

    Return Response;

EndFunction

// Edit list calendar
// Edits the properties of a calendar from the user's list
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
// PrimaryColor - String - HEX primary color (#ffffff) - primary
// SecondaryColor - String - HEX secondary color (#ffffff) - secondary
// Hidden - Boolean - Hidden calendar - hidden
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function EditListCalendar(Val Token
    , Val Calendar
    , Val PrimaryColor
    , Val SecondaryColor
    , Val Hidden = False) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);
    OPI_TypeConversion.GetLine(PrimaryColor);
    OPI_TypeConversion.GetLine(SecondaryColor);
    OPI_TypeConversion.GetBoolean(Hidden);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://www.googleapis.com/calendar/v3/users/me/calendarList/" + Calendar + "?colorRgbFormat    =true";

    Parameters = New Map;
    Parameters.Insert("hidden"         , Hidden);
    Parameters.Insert("foregroundColor", PrimaryColor);
    Parameters.Insert("backgroundColor", SecondaryColor);

    Response = OPI_Tools.Put(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region EventManagement

// Get event description !NOCLI
//
// Returns:
// Map Of KeyAndValue - Empty event template
Function GetEventDescription() Export

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Event       = New Map;

    Event.Insert("Description"          , ""); // Event description
    Event.Insert("Title"                , "New event"); // Title events
    Event.Insert("Venue"                , ""); // String description of the venue of the event
    Event.Insert("StartDate"            , CurrentDate); // Date of start events
    Event.Insert("EndDate"              , CurrentDate + Hour); // Date of end events
    Event.Insert("ArrayOfAttachmentURLs", New Map); // Key - name, Value - URL to file
    Event.Insert("SendNotifications"    , True); // Indication of sending notifications to participants

    Return Event;

EndFunction

// Get list of events
// Gets the list of all calendar events
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
//
// Returns:
// Map Of KeyAndValue - Array of event maps
Function GetEventList(Val Token, Val Calendar) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);

    Headers       = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    ArrayOfEvents = New Array;

    GetEventsListRecursively(Headers, Calendar, ArrayOfEvents);

    Return ArrayOfEvents;

EndFunction

// Get event
// Gets an event by ID
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
// Event - String - Event ID - event
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetEvent(Val Token, Val Calendar, Val Event) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);
    OPI_TypeConversion.GetLine(Event);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://www.googleapis.com/calendar/v3/calendars/"
        + Calendar
        + "/events/"
        + Event;

    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

// Create event
// Creates a new event
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
// EventDescription - Map Of KeyAndValue - Event description - props
//
// Returns:
// String, Arbitrary, HTTPResponse, BinaryData, Undefined - Google server response
Function CreateEvent(Val Token, Val Calendar, Val EventDescription) Export

    Return EventManagement(Token, Calendar, EventDescription);

EndFunction

// Move event
// Moves an event to another calendar
//
// Parameters:
// Token - String - Token - token
// SourceCalendar - String - ID of the source calendar - from
// TargetCalendar - String - ID of the target calendar - to
// Event - String - ID of the source calendar event - event
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function MoveEvent(Val Token, Val SourceCalendar, Val TargetCalendar, Val Event) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(SourceCalendar);
    OPI_TypeConversion.GetLine(TargetCalendar);
    OPI_TypeConversion.GetLine(Event);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://www.googleapis.com/calendar/v3/calendars/"
        + SourceCalendar
        + "/events/"
        + Event
        + "/move?destination="
        + TargetCalendar;

    Response = OPI_Tools.Post(URL, , Headers);

    Return Response;

EndFunction

// Edit event
// Edits an existing event
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
// EventDescription - String - New event description - props
// Event - String - Event ID - event
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function EditEvent(Val Token, Val Calendar, Val EventDescription, Val Event) Export

    Return EventManagement(Token, Calendar, EventDescription, Event);

EndFunction

// Delete event
// Deletes an event by ID
//
// Parameters:
// Token - String - Token - token
// Calendar - String - Calendar ID - calendar
// Event - String - Event ID - event
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function DeleteEvent(Val Token, Val Calendar, Val Event) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);
    OPI_TypeConversion.GetLine(Event);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://www.googleapis.com/calendar/v3/calendars/"
        + Calendar
        + "/events/"
        + Event;

    Response = OPI_Tools.Delete(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function ConvertDate(Val Date)

    OPI_TypeConversion.GetDate(Date);

    DateStructure = New Structure;

    If Not TypeOf(Date) = Type("Date") Then
        Return Undefined;
    EndIf;

    If Date        = BegOfDay(Date) Then
        DateFormat = "DF=yyyy-MM-dd";
        Field      = "date";
    Else
        DateFormat = "DF=yyyy-MM-ddTHH:mm:ssZ";
        Field      = "dateTime";
    EndIf;

    Date = Format(Date, DateFormat);
    DateStructure.Insert(Field     , Date);
    DateStructure.Insert("timeZone", "Europe/Moscow");

    Return DateStructure;

EndFunction

Function ConvertAttachments(Val Attachments)

    OPI_TypeConversion.GetCollection(Attachments);

    AttachmentsArray = New Array;

    If TypeOf(Attachments) = Type("Map") Or TypeOf(Attachments) = Type("Structure") Then

        For Each Attachment In Attachments Do

            CurrentAttachment = New Structure;
            CurrentAttachment.Insert("title"  , Attachment.Key);
            CurrentAttachment.Insert("fileUrl", Attachment.Value);

            AttachmentsArray.Add(CurrentAttachment);

        EndDo;

    EndIf;

    If AttachmentsArray.Count() > 0 Then
        Return AttachmentsArray;
    Else
        Return Undefined;
    EndIf;

EndFunction

Function EventManagement(Val Token, Val Calendar, Val EventDescription, Val Event = "")

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Calendar);
    OPI_TypeConversion.GetLine(Event);
    OPI_TypeConversion.GetCollection(EventDescription);

    Headers  = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    Existing = ValueIsFilled(Event);
    URL      = "https://www.googleapis.com/calendar/v3/calendars/"
        + Calendar
        + "/events"
        + ?(Existing, "/" + Event, "");

    Date0         = EventDescription["StartDate"];
    Date1         = EventDescription["EndDate"];
    Attachments   = EventDescription["ArrayOfAttachmentURLs"];
    Attachments   = ConvertAttachments(Attachments);
    Notifications = ?(EventDescription["SendNotifications"] = Undefined
        , False
        , EventDescription["SendNotifications"]);

    Parameters = New Structure;
    Parameters.Insert("summary"    , EventDescription["Title"]);
    Parameters.Insert("description", EventDescription["Description"]);
    Parameters.Insert("location"   , EventDescription["Venue"]);
    Parameters.Insert("start"      , ConvertDate(Date0));
    Parameters.Insert("end"        , ConvertDate(Date1));
    Parameters.Insert("attachments", Attachments);

    URLParameters = New Structure;
    URLParameters.Insert("sendUpdates"         , ?(Notifications             , "all" , "none"));
    URLParameters.Insert("supportsAttachments" , ?(ValueIsFilled(Attachments), "true", "false"));

    URL = URL + OPI_Tools.RequestParametersToString(URLParameters);

    OPI_Tools.RemoveEmptyCollectionFields(Parameters);

    If Existing Then
        Response = OPI_Tools.Patch(URL, Parameters, Headers, True);
    Else
        Response = OPI_Tools.Post(URL, Parameters, Headers, True);
    EndIf;

    Return Response;

EndFunction

Procedure GetCalendarsListRecursively(Val Headers, ArrayOfCalendars, Page = "")

    Items      = "items";
    NPT        = "nextPageToken";
    Parameters = New Structure;

    If ValueIsFilled(Page) Then
        Parameters.Insert("pageToken", Page);
    EndIf;

    Result = OPI_Tools.Get("https://www.googleapis.com/calendar/v3/users/me/calendarList"
        , Parameters
        , Headers);

    Calendars = Result[Items];
    Page      = Result[NPT];

    For Each Calendar In Calendars Do
        ArrayOfCalendars.Add(Calendar);
    EndDo;

    If Calendars.Count() > 0 And ValueIsFilled(Page) Then
        GetCalendarsListRecursively(Headers, ArrayOfCalendars, Page);
    EndIf;

EndProcedure

Procedure GetEventsListRecursively(Val Headers, Val Calendar, ArrayOfEvents, Page = "")

    Items      = "items";
    NPT        = "nextPageToken";
    Parameters = New Structure;

    If ValueIsFilled(Page) Then
        Parameters.Insert("pageToken", Page);
    EndIf;

    Result = OPI_Tools.Get("https://www.googleapis.com/calendar/v3/calendars/" + Calendar + "/events"
        , Parameters
        , Headers);

    Events = Result[Items];
    Page   = Result[NPT];

    For Each Event In Events Do
        ArrayOfEvents.Add(Event);
    EndDo;

    If Events.Count() > 0 And ValueIsFilled(Page) Then
        GetEventsListRecursively(Headers, ArrayOfEvents, Page);
    EndIf;

EndProcedure

#EndRegion
