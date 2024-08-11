Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "CreateCalendar";
    NewLine.МетодПоиска = "CREATECALENDAR";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar metadata management";
    NewLine.ОписаниеМетода   = "Creates an empty calendar";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "CreateCalendar";
    NewLine.МетодПоиска = "CREATECALENDAR";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Name of the created calendar";
    NewLine.Область     = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetCalendarMetadata";
    NewLine.МетодПоиска = "GETCALENDARMETADATA";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar metadata management";
    NewLine.ОписаниеМетода   = "Gets calendar information by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetCalendarMetadata";
    NewLine.МетодПоиска = "GETCALENDARMETADATA";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditCalendarMetadata";
    NewLine.МетодПоиска = "EDITCALENDARMETADATA";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar metadata management";
    NewLine.ОписаниеМетода   = "Edits properties of an existing calendar";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditCalendarMetadata";
    NewLine.МетодПоиска = "EDITCALENDARMETADATA";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditCalendarMetadata";
    NewLine.МетодПоиска = "EDITCALENDARMETADATA";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New name (optional, def. val. - Empty value)";
    NewLine.Область     = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditCalendarMetadata";
    NewLine.МетодПоиска = "EDITCALENDARMETADATA";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "New calendar description (optional, def. val. - Empty value)";
    NewLine.Область     = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "ClearMainCalendar";
    NewLine.МетодПоиска = "CLEARMAINCALENDAR";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar metadata management";
    NewLine.ОписаниеМетода   = "Clears the event list of the primary calendar";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "DeleteCalendar";
    NewLine.МетодПоиска = "DELETECALENDAR";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar metadata management";
    NewLine.ОписаниеМетода   = "Deletes a calendar by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "DeleteCalendar";
    NewLine.МетодПоиска = "DELETECALENDAR";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetCalendarList";
    NewLine.МетодПоиска = "GETCALENDARLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar list management";
    NewLine.ОписаниеМетода   = "Gets an array of account calendars";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "AddCalendarToList";
    NewLine.МетодПоиска = "ADDCALENDARTOLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar list management";
    NewLine.ОписаниеМетода   = "Adds an existing calendar to the user's list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "AddCalendarToList";
    NewLine.МетодПоиска = "ADDCALENDARTOLIST";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetListCalendar";
    NewLine.МетодПоиска = "GETLISTCALENDAR";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar list management";
    NewLine.ОписаниеМетода   = "Gets a calendar from the user's list by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetListCalendar";
    NewLine.МетодПоиска = "GETLISTCALENDAR";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "DeleteCalendarFromList";
    NewLine.МетодПоиска = "DELETECALENDARFROMLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar list management";
    NewLine.ОписаниеМетода   = "Removes a calendar from the user's list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "DeleteCalendarFromList";
    NewLine.МетодПоиска = "DELETECALENDARFROMLIST";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditListCalendar";
    NewLine.МетодПоиска = "EDITLISTCALENDAR";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Calendar list management";
    NewLine.ОписаниеМетода   = "Edits the properties of a calendar from the user's list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditListCalendar";
    NewLine.МетодПоиска = "EDITLISTCALENDAR";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditListCalendar";
    NewLine.МетодПоиска = "EDITLISTCALENDAR";
    NewLine.Параметр    = "--primary";
    NewLine.Описание    = "HEX primary color (#ffffff)";
    NewLine.Область     = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditListCalendar";
    NewLine.МетодПоиска = "EDITLISTCALENDAR";
    NewLine.Параметр    = "--secondary";
    NewLine.Описание    = "HEX secondary color (#ffffff)";
    NewLine.Область     = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditListCalendar";
    NewLine.МетодПоиска = "EDITLISTCALENDAR";
    NewLine.Параметр    = "--hidden";
    NewLine.Описание    = "Hidden calendar (optional, def. val. - No)";
    NewLine.Область     = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetEventList";
    NewLine.МетодПоиска = "GETEVENTLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Event management";
    NewLine.ОписаниеМетода   = "Gets the list of all calendar events";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetEventList";
    NewLine.МетодПоиска = "GETEVENTLIST";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetEvent";
    NewLine.МетодПоиска = "GETEVENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Event management";
    NewLine.ОписаниеМетода   = "Gets an event by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetEvent";
    NewLine.МетодПоиска = "GETEVENT";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "GetEvent";
    NewLine.МетодПоиска = "GETEVENT";
    NewLine.Параметр    = "--event";
    NewLine.Описание    = "Event ID";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "CreateEvent";
    NewLine.МетодПоиска = "CREATEEVENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Event management";
    NewLine.ОписаниеМетода   = "Creates a new event
    |
    |    The structure of the JSON event data (parameter --props):
    |    {
    |     ""Description"": """", 
    |     ""Title"": """", 
    |     ""Venue"": """", 
    |     ""StartDate"": """",
    |     ""EndDate"": """",      
    |     ""ArrayOfAttachmentURLs"":           
    |         {
    |          ""NameFile1"": ""FileURL1"",
    |          ""NameFile2"": ""FileURL2"",
    |          ...
    |         },
    |     ""SendNotifications"": true       
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "CreateEvent";
    NewLine.МетодПоиска = "CREATEEVENT";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "CreateEvent";
    NewLine.МетодПоиска = "CREATEEVENT";
    NewLine.Параметр    = "--props";
    NewLine.Описание    = "Event description";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "MoveEvent";
    NewLine.МетодПоиска = "MOVEEVENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Event management";
    NewLine.ОписаниеМетода   = "Moves an event to another calendar";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "MoveEvent";
    NewLine.МетодПоиска = "MOVEEVENT";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "ID of the source calendar";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "MoveEvent";
    NewLine.МетодПоиска = "MOVEEVENT";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "ID of the target calendar";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "MoveEvent";
    NewLine.МетодПоиска = "MOVEEVENT";
    NewLine.Параметр    = "--event";
    NewLine.Описание    = "ID of the source calendar event";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditEvent";
    NewLine.МетодПоиска = "EDITEVENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Event management";
    NewLine.ОписаниеМетода   = "Edits an existing event
    |
    |    The structure of the JSON event data (parameter --props):
    |    {
    |     ""Description"": """", 
    |     ""Title"": """", 
    |     ""Venue"": """", 
    |     ""StartDate"": """",
    |     ""EndDate"": """",      
    |     ""ArrayOfAttachmentURLs"":           
    |         {
    |          ""NameFile1"": ""FileURL1"",
    |          ""NameFile2"": ""FileURL2"",
    |          ...
    |         },
    |     ""SendNotifications"": true       
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditEvent";
    NewLine.МетодПоиска = "EDITEVENT";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditEvent";
    NewLine.МетодПоиска = "EDITEVENT";
    NewLine.Параметр    = "--props";
    NewLine.Описание    = "New event description";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "EditEvent";
    NewLine.МетодПоиска = "EDITEVENT";
    NewLine.Параметр    = "--event";
    NewLine.Описание    = "Event ID";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "DeleteEvent";
    NewLine.МетодПоиска = "DELETEEVENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Event management";
    NewLine.ОписаниеМетода   = "Deletes an event by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "DeleteEvent";
    NewLine.МетодПоиска = "DELETEEVENT";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar ID";
    NewLine.Область     = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gcalendar";
    NewLine.Модуль      = "OPI_GoogleCalendar";
    NewLine.Метод       = "DeleteEvent";
    NewLine.МетодПоиска = "DELETEEVENT";
    NewLine.Параметр    = "--event";
    NewLine.Описание    = "Event ID";
    NewLine.Область     = "Event management";

    Return CompositionTable;
EndFunction

