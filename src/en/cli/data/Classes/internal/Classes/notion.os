
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
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreatePage";
    NewLine.SearchMethod  = "CREATEPAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Page management";
    NewLine.MethodDescription   = "Creates a child page above another parent page";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreatePage";
    NewLine.SearchMethod  = "CREATEPAGE";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Parent ID";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreatePage";
    NewLine.SearchMethod  = "CREATEPAGE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Page title";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreatePageInDatabase";
    NewLine.SearchMethod  = "CREATEPAGEINDATABASE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Page management";
    NewLine.MethodDescription   = "Creates a page in the parent database
    |    Data structure for option --data:
    |    {
    |     ""DB field name 1""  : ""Value1"",
    |     ""DB field name 2""  : ""Value2"",
    |     ...
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreatePageInDatabase";
    NewLine.SearchMethod  = "CREATEPAGEINDATABASE";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Parent database ID";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreatePageInDatabase";
    NewLine.SearchMethod  = "CREATEPAGEINDATABASE";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Properties map";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "GetPage";
    NewLine.SearchMethod  = "GETPAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Page management";
    NewLine.MethodDescription   = "Gets information about the page by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "GetPage";
    NewLine.SearchMethod  = "GETPAGE";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Page ID";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditPageProperties";
    NewLine.SearchMethod  = "EDITPAGEPROPERTIES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Page management";
    NewLine.MethodDescription   = "Changes the properties of an existing page
    |    Data structure for option --data:
    |    {
    |     ""DB field name 1""  : ""Value1"",
    |     ""DB field name 2""  : ""Value2"",
    |     ...
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditPageProperties";
    NewLine.SearchMethod  = "EDITPAGEPROPERTIES";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "ID of the page being modified";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditPageProperties";
    NewLine.SearchMethod  = "EDITPAGEPROPERTIES";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Map of editable parameters (optional, def. val. - Empty value)";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditPageProperties";
    NewLine.SearchMethod  = "EDITPAGEPROPERTIES";
    NewLine.Parameter     = "--icon";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "URL of the page icon image (optional, def. val. - Empty value)";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditPageProperties";
    NewLine.SearchMethod  = "EDITPAGEPROPERTIES";
    NewLine.Parameter     = "--cover";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "URL of the page cover image (optional, def. val. - Empty value)";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditPageProperties";
    NewLine.SearchMethod  = "EDITPAGEPROPERTIES";
    NewLine.Parameter     = "--archive";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Archive page or not (boolean) (optional, def. val. - False)";
    NewLine.Region      = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreateDatabase";
    NewLine.SearchMethod  = "CREATEDATABASE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Database management";
    NewLine.MethodDescription   = "Creates a database
    |    Data structure for option --props:
    |    {
    |     ""Name of field with regular type""     : ""Data type 1"",
    |     ""Name of field with a value selection""  : 
    |        {
    |         ""Option1""  : ""green"",
    |         ""Option2""  : ""red"",
    |         ...
    |        },
    |     ...
    |    }
    |    
    |    Available types: title(primary), rich_text, number, status,
    |    date, files, checkbox, url, email, phone_number, people
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreateDatabase";
    NewLine.SearchMethod  = "CREATEDATABASE";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Parent page ID";
    NewLine.Region      = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreateDatabase";
    NewLine.SearchMethod  = "CREATEDATABASE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database title";
    NewLine.Region      = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreateDatabase";
    NewLine.SearchMethod  = "CREATEDATABASE";
    NewLine.Parameter     = "--props";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database properties (optional, def. val. - Empty value)";
    NewLine.Region      = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "GetDatabase";
    NewLine.SearchMethod  = "GETDATABASE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Database management";
    NewLine.MethodDescription   = "Get database information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "GetDatabase";
    NewLine.SearchMethod  = "GETDATABASE";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database ID";
    NewLine.Region      = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditDatabaseProperties";
    NewLine.SearchMethod  = "EDITDATABASEPROPERTIES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Database management";
    NewLine.MethodDescription   = "Edits properties of an existing database
    |    Data structure for option --props:
    |    {
    |     ""Name of field with regular type""     : ""Data type 1"",
    |     ""Name of field with a value selection""  : 
    |        {
    |         ""Option1""  : ""green"",
    |         ""Option2""  : ""red"",
    |         ...
    |        },
    |     ...
    |    }
    |    
    |    Available types: title(primary), rich_text, number, status,
    |    date, files, checkbox, url, email, phone_number, people
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditDatabaseProperties";
    NewLine.SearchMethod  = "EDITDATABASEPROPERTIES";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Target database ID";
    NewLine.Region      = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditDatabaseProperties";
    NewLine.SearchMethod  = "EDITDATABASEPROPERTIES";
    NewLine.Parameter     = "--props";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "New or modified database properties (optional, def. val. - Empty value)";
    NewLine.Region      = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditDatabaseProperties";
    NewLine.SearchMethod  = "EDITDATABASEPROPERTIES";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New database title (optional, def. val. - Empty value)";
    NewLine.Region      = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "EditDatabaseProperties";
    NewLine.SearchMethod  = "EDITDATABASEPROPERTIES";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "New database description (optional, def. val. - Empty value)";
    NewLine.Region      = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreateBlock";
    NewLine.SearchMethod  = "CREATEBLOCK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Blocks management";
    NewLine.MethodDescription   = "Creates a new block based on an existing block";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreateBlock";
    NewLine.SearchMethod  = "CREATEBLOCK";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Parent block or page ID";
    NewLine.Region      = "Blocks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreateBlock";
    NewLine.SearchMethod  = "CREATEBLOCK";
    NewLine.Parameter     = "--block";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Block ID or block sample itself";
    NewLine.Region      = "Blocks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "CreateBlock";
    NewLine.SearchMethod  = "CREATEBLOCK";
    NewLine.Parameter     = "--prev";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Block ID after which to insert the new one (optional, def. val. - Empty value)";
    NewLine.Region      = "Blocks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "ReturnBlock";
    NewLine.SearchMethod  = "RETURNBLOCK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Blocks management";
    NewLine.MethodDescription   = "Returns the block structure by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "ReturnBlock";
    NewLine.SearchMethod  = "RETURNBLOCK";
    NewLine.Parameter     = "--block";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Block ID";
    NewLine.Region      = "Blocks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "ReturnBlock";
    NewLine.SearchMethod  = "RETURNBLOCK";
    NewLine.Parameter     = "--core";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "True > service fields are deleted, only the block itself remains (optional, def. val. - True)";
    NewLine.Region      = "Blocks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "ReturnChildBlocks";
    NewLine.SearchMethod  = "RETURNCHILDBLOCKS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Blocks management";
    NewLine.MethodDescription   = "Returns list of child blocks of parent block";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "ReturnChildBlocks";
    NewLine.SearchMethod  = "RETURNCHILDBLOCKS";
    NewLine.Parameter     = "--block";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Parent block ID";
    NewLine.Region      = "Blocks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "DeleteBlock";
    NewLine.SearchMethod  = "DELETEBLOCK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Blocks management";
    NewLine.MethodDescription   = "Deletes block by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "DeleteBlock";
    NewLine.SearchMethod  = "DELETEBLOCK";
    NewLine.Parameter     = "--block";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Block ID";
    NewLine.Region      = "Blocks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "UserList";
    NewLine.SearchMethod  = "USERLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Users";
    NewLine.MethodDescription   = "Returns a list of workspace users";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "GetUserData";
    NewLine.SearchMethod  = "GETUSERDATA";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Users";
    NewLine.MethodDescription   = "Gets user data by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "notion";
    NewLine.Module       = "OPI_Notion";
    NewLine.Method        = "GetUserData";
    NewLine.SearchMethod  = "GETUSERDATA";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Target user ID";
    NewLine.Region      = "Users";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Notion = LoadScript(""%1/oint/core/Modules/OPI_Notion.os"", Context);
        |" + Chars.LF;


EndFunction 
