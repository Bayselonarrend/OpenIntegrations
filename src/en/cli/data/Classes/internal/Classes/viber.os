
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
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SetWebhook";
    NewLine.SearchMethod  = "SETWEBHOOK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Viber Token";
    NewLine.Region      = "Settings and information";
    NewLine.MethodDescription   = "IMPORTANT: Setting up Webhook is mandatory according to Viber rules. You need to have a free URL for this.,
    |    which will return 200 and a genuine SSL certificate. If there is a certificate and the database is published
    |    on the server - you can use an HTTP service. Information about new messages will also be sent there
    |    Viber periodically knocks on the Webhook address, so if it is inactive, everything will stop working";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SetWebhook";
    NewLine.SearchMethod  = "SETWEBHOOK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL for setting up Webhook";
    NewLine.Region      = "Settings and information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "GetChannelInformation";
    NewLine.SearchMethod  = "GETCHANNELINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Settings and information";
    NewLine.MethodDescription   = "Here you can get the channel's user IDs. Bot IDs need to be obtained from the Webhook arrivals
    |    The user ID from channel information is not suitable for sending messages through the bot - they are different";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "GetUserData";
    NewLine.SearchMethod  = "GETUSERDATA";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Settings and information";
    NewLine.MethodDescription   = "Gets user information by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "GetUserData";
    NewLine.SearchMethod  = "GETUSERDATA";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Viber User ID";
    NewLine.Region      = "Settings and information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "GetOnlineUsers";
    NewLine.SearchMethod  = "GETONLINEUSERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Viber Token";
    NewLine.Region      = "Settings and information";
    NewLine.MethodDescription   = "Gets the status of a user or multiple users by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "GetOnlineUsers";
    NewLine.SearchMethod  = "GETONLINEUSERS";
    NewLine.Parameter     = "--users";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Viber User(s) ID";
    NewLine.Region      = "Settings and information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a text message to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--ischannel";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Sending to channel or bot chat";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "See CreateKeyboardFromArrayButton (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends an image to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Image URL";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--ischannel";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Sending to channel or bot chat";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Image annotation (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a file (document) to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File URL";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--ischannel";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Sending to channel or bot chat";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--ext";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "File extension";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--size";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "File size. If not filled in > determined automatically by downloading the file (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a contact with a phone number to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Contact name";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--phone";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Phone number";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--ischannel";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Sending to channel or bot chat";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends geographic coordinates to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--lat";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Geographic latitude";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--long";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Geographic longitude";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--ischannel";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Sending to channel or bot chat";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLink";
    NewLine.SearchMethod  = "SENDLINK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a URL with a preview to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLink";
    NewLine.SearchMethod  = "SENDLINK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "SentLink";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLink";
    NewLine.SearchMethod  = "SENDLINK";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "SendLink";
    NewLine.SearchMethod  = "SENDLINK";
    NewLine.Parameter     = "--ischannel";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Sending to channel or bot chat";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "CreateKeyboardFromArrayButton";
    NewLine.SearchMethod  = "CREATEKEYBOARDFROMARRAYBUTTON";
    NewLine.Parameter     = "--buttons";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Array of buttons";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Returns a keyboard structure for messages";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "viber";
    NewLine.Module       = "OPI_Viber";
    NewLine.Method        = "CreateKeyboardFromArrayButton";
    NewLine.SearchMethod  = "CREATEKEYBOARDFROMARRAYBUTTON";
    NewLine.Parameter     = "--color";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "HEX color of buttons with # at the beginning (optional, def. val.. - #2db9b9)";
    NewLine.Region      = "Message sending";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Viber = LoadScript(""%1/oint/core/Modules/OPI_Viber.os"", Context);
        |" + Chars.LF;


EndFunction 
