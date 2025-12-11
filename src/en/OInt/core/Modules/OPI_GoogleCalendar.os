// OneScript: ./OInt/core/Modules/OPI_GoogleCalendar.os
// Lib: Google Calendar
// CLI: gcalendar
// Keywords: google calendar, googlecalendar, gcalendar
// Depends: OPI_GoogleWorkspace

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region Authorization

// Generate code retrieval link
// Returns URL for browser authorization
//
// Parameters:
// ClientID - String - Client ID - id
// Calendar - Boolean - Calendar methods permission - calendar
// Drive - Boolean - Drive methods permission - drive
// Sheets - Boolean - Sheets methods permission - sheets
//
// Returns:
// String - Code retrieval link
Function FormCodeRetrievalLink(Val ClientID
    , Val Calendar = True
    , Val Drive = True
    , Val Sheets = True) Export

    Result = OPI_GoogleWorkspace.FormCodeRetrievalLink(ClientID, Calendar, Drive, Sheets);
    Return Result;

EndFunction

// Get token by code
// Gets token by code from browser authorization
//
// Parameters:
// ClientID - String - Client ID - id
// ClientSecret - String - Client secret - secret
// Code - String - Code from browser - code
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetTokenByCode(Val ClientID, Val ClientSecret, Val Code) Export

    Result = OPI_GoogleWorkspace.GetTokenByCode(ClientID, ClientSecret, Code);
    Return Result;

EndFunction

// Refresh token
// Updates token by Refresh token
//
// Parameters:
// ClientID - String - Client ID - id
// ClientSecret - String - Client secret - secret
// RefreshToken - String - Refresh token - refresh
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function RefreshToken(Val ClientID, Val ClientSecret, Val RefreshToken) Export

    Result = OPI_GoogleWorkspace.RefreshToken(ClientID, ClientSecret, RefreshToken);
    Return Result;

EndFunction

// Get service account token
// Gets authorization token by service account data
//
// Note:
// List of available scopes: [developers.google.com](https://developers.google.com/identity/protocols/oauth2/scopes)
//
// Parameters:
// Data - Arbitrary - JSON authorization data as a file, collection or binary data - auth
// Scope - Array Of String - Scope or array of scopes - scope
// Expire - Number - Token lifetime in seconds - exp
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetServiceAccountToken(Val Data, Val Scope, Val Expire = 3600) Export

    Result = OPI_GoogleWorkspace.GetServiceAccountToken(Data, Scope, Expire);
    Return Result;

EndFunction

#EndRegion

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

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

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
    Response = OPI_HTTPRequests.Get(URL, , Headers);

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

    Response = OPI_HTTPRequests.PatchWithBody(URL, Parameters, Headers, True);

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
    Response = OPI_HTTPRequests.PostWithBody(URL, , Headers, False);

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
    Response = OPI_HTTPRequests.Delete(URL, , Headers);

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

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

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
    Response = OPI_HTTPRequests.Get(URL, , Headers);

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
    Response = OPI_HTTPRequests.Delete(URL, , Headers);

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
    URL = "https://www.googleapis.com/calendar/v3/users/me/calendarList/" + Calendar + "?colorRgbFormat=true";

    Parameters = New Map;
    Parameters.Insert("hidden"         , Hidden);
    Parameters.Insert("foregroundColor", PrimaryColor);
    Parameters.Insert("backgroundColor", SecondaryColor);

    Response = OPI_HTTPRequests.PutWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region EventManagement

// Get event description
// Gets an empty layout to create the event
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Map Of KeyAndValue - Empty event template
Function GetEventDescription(Val Clear = False) Export

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

    If Clear Then

        Event_ = New Map;

        For Each Field In Event Do
            Event_.Insert(Field.Key, "");
        EndDo;

        Event = Event_;

    EndIf;

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

    Response = OPI_HTTPRequests.Get(URL, , Headers);

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

    Response = OPI_HTTPRequests.PostWithBody(URL, , Headers);

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

    Response = OPI_HTTPRequests.Delete(URL, , Headers);

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

    If Date   = BegOfDay(Date) Then
        DateFormat = "DF=yyyy-MM-dd";
        Field = "date";
    Else
        DateFormat = "DF=yyyy-MM-ddTHH:mm:ssZ";
        Field = "dateTime";
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
        Response = OPI_HTTPRequests.PatchWithBody(URL, Parameters, Headers, True);
    Else
        Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers, True);
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

    Result = OPI_HTTPRequests.Get("https://www.googleapis.com/calendar/v3/users/me/calendarList"
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

    Result = OPI_HTTPRequests.Get("https://www.googleapis.com/calendar/v3/calendars/" + Calendar + "/events"
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

#Region Alternate

Function СформироватьСсылкуПолученияКода(Val ClientID, Val Calendar = True, Val Drive = True, Val Sheets = True) Export
	Return FormCodeRetrievalLink(ClientID, Calendar, Drive, Sheets);
EndFunction

Function ПолучитьТокенПоКоду(Val ClientID, Val ClientSecret, Val Code) Export
	Return GetTokenByCode(ClientID, ClientSecret, Code);
EndFunction

Function ОбновитьТокен(Val ClientID, Val ClientSecret, Val RefreshToken) Export
	Return RefreshToken(ClientID, ClientSecret, RefreshToken);
EndFunction

Function ПолучитьТокенServiceАккаунта(Val Данные, Val ОбластиДействия, Val ВремяЖизни = 3600) Export
	Return GetServiceAccountToken(Данные, ОбластиДействия, ВремяЖизни);
EndFunction

Function СоздатьКалендарь(Val Токен, Val Наименование) Export
	Return CreateCalendar(Токен, Наименование);
EndFunction

Function ПолучитьМетаданныеКалендаря(Val Токен, Val Календарь) Export
	Return GetCalendarMetadata(Токен, Календарь);
EndFunction

Function ИзменитьМетаданныеКалендаря(Val Токен, Val Календарь, Val Наименование = "", Val Описание = "") Export
	Return EditCalendarMetadata(Токен, Календарь, Наименование, Описание);
EndFunction

Function ОчиститьОсновнойКалендарь(Val Токен) Export
	Return ClearMainCalendar(Токен);
EndFunction

Function УдалитьКалендарь(Val Токен, Val Календарь) Export
	Return DeleteCalendar(Токен, Календарь);
EndFunction

Function ПолучитьСписокКалендарей(Val Токен) Export
	Return GetCalendarList(Токен);
EndFunction

Function ДобавитьКалендарьВСписок(Val Токен, Val Календарь) Export
	Return AddCalendarToList(Токен, Календарь);
EndFunction

Function ПолучитьКалендарьСписка(Val Токен, Val Календарь) Export
	Return GetListCalendar(Токен, Календарь);
EndFunction

Function УдалитьКалендарьИзСписка(Val Токен, Val Календарь) Export
	Return DeleteCalendarFromList(Токен, Календарь);
EndFunction

Function ИзменитьКалендарьСписка(Val Токен, Val Календарь, Val ОсновнойЦвет, Val ДополнительныйЦвет, Val Скрытый = False) Export
	Return EditListCalendar(Токен, Календарь, ОсновнойЦвет, ДополнительныйЦвет, Скрытый);
EndFunction

Function ПолучитьОписаниеСобытия(Val Пустая = False) Export
	Return GetEventDescription(Пустая);
EndFunction

Function ПолучитьСписокСобытий(Val Токен, Val Календарь) Export
	Return GetEventList(Токен, Календарь);
EndFunction

Function ПолучитьСобытие(Val Токен, Val Календарь, Val Событие) Export
	Return GetEvent(Токен, Календарь, Событие);
EndFunction

Function СоздатьСобытие(Val Токен, Val Календарь, Val ОписаниеСобытия) Export
	Return CreateEvent(Токен, Календарь, ОписаниеСобытия);
EndFunction

Function ПереместитьСобытие(Val Токен, Val КалендарьИсточник, Val КалендарьПриемник, Val Событие) Export
	Return MoveEvent(Токен, КалендарьИсточник, КалендарьПриемник, Событие);
EndFunction

Function ИзменитьСобытие(Val Токен, Val Календарь, Val ОписаниеСобытия, Val Событие) Export
	Return EditEvent(Токен, Календарь, ОписаниеСобытия, Событие);
EndFunction

Function УдалитьСобытие(Val Токен, Val Календарь, Val Событие) Export
	Return DeleteEvent(Токен, Календарь, Событие);
EndFunction

#EndRegion