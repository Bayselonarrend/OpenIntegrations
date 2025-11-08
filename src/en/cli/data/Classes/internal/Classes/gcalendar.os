
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("ParameterTrim");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "FormCodeRetrievalLink";
    NewLine.SearchMethod  = "FORMCODERETRIEVALLINK";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client ID";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Returns URL for browser authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "FormCodeRetrievalLink";
    NewLine.SearchMethod  = "FORMCODERETRIEVALLINK";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar methods permission (optional, def. val. - True)";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "FormCodeRetrievalLink";
    NewLine.SearchMethod  = "FORMCODERETRIEVALLINK";
    NewLine.Parameter     = "--drive";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Drive methods permission (optional, def. val. - True)";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "FormCodeRetrievalLink";
    NewLine.SearchMethod  = "FORMCODERETRIEVALLINK";
    NewLine.Parameter     = "--sheets";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Sheets methods permission (optional, def. val. - True)";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetTokenByCode";
    NewLine.SearchMethod  = "GETTOKENBYCODE";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client ID";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Gets token by code from browser authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetTokenByCode";
    NewLine.SearchMethod  = "GETTOKENBYCODE";
    NewLine.Parameter     = "--secret";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Client secret";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetTokenByCode";
    NewLine.SearchMethod  = "GETTOKENBYCODE";
    NewLine.Parameter     = "--code";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Code from browser";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client ID";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Updates token by Refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--secret";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Client secret";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--refresh";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Refresh token";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetServiceAccountToken";
    NewLine.SearchMethod  = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "JSON authorization data as a file, collection or binary data";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Gets authorization token by service account data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetServiceAccountToken";
    NewLine.SearchMethod  = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter     = "--scope";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Scope or array of scopes";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetServiceAccountToken";
    NewLine.SearchMethod  = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter     = "--exp";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Token lifetime in seconds (optional, def. val. - 3600)";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "CreateCalendar";
    NewLine.SearchMethod  = "CREATECALENDAR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar metadata management";
    NewLine.MethodDescription   = "Creates an empty calendar";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "CreateCalendar";
    NewLine.SearchMethod  = "CREATECALENDAR";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Name of the created calendar";
    NewLine.Region      = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetCalendarMetadata";
    NewLine.SearchMethod  = "GETCALENDARMETADATA";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar metadata management";
    NewLine.MethodDescription   = "Gets calendar information by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetCalendarMetadata";
    NewLine.SearchMethod  = "GETCALENDARMETADATA";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditCalendarMetadata";
    NewLine.SearchMethod  = "EDITCALENDARMETADATA";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar metadata management";
    NewLine.MethodDescription   = "Edits properties of an existing calendar";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditCalendarMetadata";
    NewLine.SearchMethod  = "EDITCALENDARMETADATA";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditCalendarMetadata";
    NewLine.SearchMethod  = "EDITCALENDARMETADATA";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New name (optional, def. val. - Empty value)";
    NewLine.Region      = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditCalendarMetadata";
    NewLine.SearchMethod  = "EDITCALENDARMETADATA";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "New calendar description (optional, def. val. - Empty value)";
    NewLine.Region      = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "ClearMainCalendar";
    NewLine.SearchMethod  = "CLEARMAINCALENDAR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar metadata management";
    NewLine.MethodDescription   = "Clears the event list of the primary calendar";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "DeleteCalendar";
    NewLine.SearchMethod  = "DELETECALENDAR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar metadata management";
    NewLine.MethodDescription   = "Deletes a calendar by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "DeleteCalendar";
    NewLine.SearchMethod  = "DELETECALENDAR";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendar metadata management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetCalendarList";
    NewLine.SearchMethod  = "GETCALENDARLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar list management";
    NewLine.MethodDescription   = "Gets an array of account calendars";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "AddCalendarToList";
    NewLine.SearchMethod  = "ADDCALENDARTOLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar list management";
    NewLine.MethodDescription   = "Adds an existing calendar to the user's list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "AddCalendarToList";
    NewLine.SearchMethod  = "ADDCALENDARTOLIST";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetListCalendar";
    NewLine.SearchMethod  = "GETLISTCALENDAR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar list management";
    NewLine.MethodDescription   = "Gets a calendar from the user's list by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetListCalendar";
    NewLine.SearchMethod  = "GETLISTCALENDAR";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "DeleteCalendarFromList";
    NewLine.SearchMethod  = "DELETECALENDARFROMLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar list management";
    NewLine.MethodDescription   = "Removes a calendar from the user's list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "DeleteCalendarFromList";
    NewLine.SearchMethod  = "DELETECALENDARFROMLIST";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditListCalendar";
    NewLine.SearchMethod  = "EDITLISTCALENDAR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Calendar list management";
    NewLine.MethodDescription   = "Edits the properties of a calendar from the user's list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditListCalendar";
    NewLine.SearchMethod  = "EDITLISTCALENDAR";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditListCalendar";
    NewLine.SearchMethod  = "EDITLISTCALENDAR";
    NewLine.Parameter     = "--primary";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "HEX primary color (#ffffff)";
    NewLine.Region      = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditListCalendar";
    NewLine.SearchMethod  = "EDITLISTCALENDAR";
    NewLine.Parameter     = "--secondary";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "HEX secondary color (#ffffff)";
    NewLine.Region      = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditListCalendar";
    NewLine.SearchMethod  = "EDITLISTCALENDAR";
    NewLine.Parameter     = "--hidden";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Hidden calendar (optional, def. val. - False)";
    NewLine.Region      = "Calendar list management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetEventDescription";
    NewLine.SearchMethod  = "GETEVENTDESCRIPTION";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region      = "Event management";
    NewLine.MethodDescription   = "Gets an empty layout to create the event";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetEventList";
    NewLine.SearchMethod  = "GETEVENTLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Event management";
    NewLine.MethodDescription   = "Gets the list of all calendar events";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetEventList";
    NewLine.SearchMethod  = "GETEVENTLIST";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetEvent";
    NewLine.SearchMethod  = "GETEVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Event management";
    NewLine.MethodDescription   = "Gets an event by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetEvent";
    NewLine.SearchMethod  = "GETEVENT";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "GetEvent";
    NewLine.SearchMethod  = "GETEVENT";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Event ID";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "CreateEvent";
    NewLine.SearchMethod  = "CREATEEVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Event management";
    NewLine.MethodDescription   = "Creates a new event
    |    Data structure for option --props:
    |    {
    |     ""Description""                : """", 
    |     ""Title""               : """", 
    |     ""Venue""         : """", 
    |     ""StartDate""              : """",
    |     ""EndDate""           : """",      
    |     ""ArrayOfAttachmentURLs"" :           
    |         {
    |          ""NameFile1"" : ""FileURL1"",
    |          ""NameFile2"" : ""FileURL2"",
    |          ...
    |         },
    |     ""SendNotifications""   : true       
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "CreateEvent";
    NewLine.SearchMethod  = "CREATEEVENT";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "CreateEvent";
    NewLine.SearchMethod  = "CREATEEVENT";
    NewLine.Parameter     = "--props";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Event description";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "MoveEvent";
    NewLine.SearchMethod  = "MOVEEVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Event management";
    NewLine.MethodDescription   = "Moves an event to another calendar";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "MoveEvent";
    NewLine.SearchMethod  = "MOVEEVENT";
    NewLine.Parameter     = "--from";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of the source calendar";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "MoveEvent";
    NewLine.SearchMethod  = "MOVEEVENT";
    NewLine.Parameter     = "--to";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "ID of the target calendar";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "MoveEvent";
    NewLine.SearchMethod  = "MOVEEVENT";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "ID of the source calendar event";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditEvent";
    NewLine.SearchMethod  = "EDITEVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Event management";
    NewLine.MethodDescription   = "Edits an existing event
    |    Data structure for option --props:
    |    {
    |     ""Description""                : """", 
    |     ""Title""               : """", 
    |     ""Venue""         : """", 
    |     ""StartDate""              : """",
    |     ""EndDate""           : """",      
    |     ""ArrayOfAttachmentURLs"" :           
    |         {
    |          ""NameFile1"" : ""FileURL1"",
    |          ""NameFile2"" : ""FileURL2"",
    |          ...
    |         },
    |     ""SendNotifications""   : true       
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditEvent";
    NewLine.SearchMethod  = "EDITEVENT";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditEvent";
    NewLine.SearchMethod  = "EDITEVENT";
    NewLine.Parameter     = "--props";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "New event description";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "EditEvent";
    NewLine.SearchMethod  = "EDITEVENT";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Event ID";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "DeleteEvent";
    NewLine.SearchMethod  = "DELETEEVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Event management";
    NewLine.MethodDescription   = "Deletes an event by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "DeleteEvent";
    NewLine.SearchMethod  = "DELETEEVENT";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Event management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "gcalendar";
    NewLine.Module       = "OPI_GoogleCalendar";
    NewLine.Method        = "DeleteEvent";
    NewLine.SearchMethod  = "DELETEEVENT";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Event ID";
    NewLine.Region      = "Event management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_GoogleWorkspace"", Undefined);
        |
        |OPI_GoogleWorkspace = LoadScript(""%1/oint/core/Modules/OPI_GoogleWorkspace.os"", Context);
        |Context.Insert(""OPI_GoogleWorkspace"", OPI_GoogleWorkspace);
        |
        |OPI_GoogleCalendar = LoadScript(""%1/oint/core/Modules/OPI_GoogleCalendar.os"", Context);
        |" + Chars.LF;


EndFunction 
