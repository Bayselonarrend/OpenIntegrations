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
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreatePage";
    NewLine.МетодПоиска = "CREATEPAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Page management";
    NewLine.ОписаниеМетода   = "Creates a child page above another parent page";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreatePage";
    NewLine.МетодПоиска = "CREATEPAGE";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "Parent ID";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreatePage";
    NewLine.МетодПоиска = "CREATEPAGE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Page title";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreatePageInDatabase";
    NewLine.МетодПоиска = "CREATEPAGEINDATABASE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Page management";
    NewLine.ОписаниеМетода   = "Creates a page in the parent database
    |
    |    The structure of the JSON page data (parameter --data):
    |    {
    |     ""DB field name 1""  : ""Value1"",
    |     ""DB field name 2""  : ""Value2"",
    |     ...
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreatePageInDatabase";
    NewLine.МетодПоиска = "CREATEPAGEINDATABASE";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Parent database ID";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreatePageInDatabase";
    NewLine.МетодПоиска = "CREATEPAGEINDATABASE";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Properties map";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "GetPage";
    NewLine.МетодПоиска = "GETPAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Page management";
    NewLine.ОписаниеМетода   = "Gets information about the page by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "GetPage";
    NewLine.МетодПоиска = "GETPAGE";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "Page ID";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditPageProperties";
    NewLine.МетодПоиска = "EDITPAGEPROPERTIES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Page management";
    NewLine.ОписаниеМетода   = "Changes the properties of an existing page
    |
    |    The structure of the JSON page data (parameter --data):
    |    {
    |     ""DB field name 1""  : ""Value1"",
    |     ""DB field name 2""  : ""Value2"",
    |     ...
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditPageProperties";
    NewLine.МетодПоиска = "EDITPAGEPROPERTIES";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "ID of the page being modified";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditPageProperties";
    NewLine.МетодПоиска = "EDITPAGEPROPERTIES";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Map of editable parameters (optional, def. val. - Empty)";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditPageProperties";
    NewLine.МетодПоиска = "EDITPAGEPROPERTIES";
    NewLine.Параметр    = "--icon";
    NewLine.Описание    = "URL of the page icon image (optional, def. val. - Empty)";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditPageProperties";
    NewLine.МетодПоиска = "EDITPAGEPROPERTIES";
    NewLine.Параметр    = "--cover";
    NewLine.Описание    = "URL of the page cover image (optional, def. val. - Empty)";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditPageProperties";
    NewLine.МетодПоиска = "EDITPAGEPROPERTIES";
    NewLine.Параметр    = "--archive";
    NewLine.Описание    = "Archive page or not (boolean) (optional, def. val. - False)";
    NewLine.Область     = "Page management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Database management";
    NewLine.ОписаниеМетода   = "Creates a database
    |
    |    The structure of the JSON database fields (parameter --props):
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
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "Parent page ID";
    NewLine.Область     = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Database title";
    NewLine.Область     = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--props";
    NewLine.Описание    = "Database properties (optional, def. val. - Empty)";
    NewLine.Область     = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "GetDatabase";
    NewLine.МетодПоиска = "GETDATABASE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Database management";
    NewLine.ОписаниеМетода   = "Get database information";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "GetDatabase";
    NewLine.МетодПоиска = "GETDATABASE";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database ID";
    NewLine.Область     = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditDatabaseProperties";
    NewLine.МетодПоиска = "EDITDATABASEPROPERTIES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Database management";
    NewLine.ОписаниеМетода   = "Edits properties of an existing database
    |
    |    The structure of the JSON database fields (parameter --props):
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
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditDatabaseProperties";
    NewLine.МетодПоиска = "EDITDATABASEPROPERTIES";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Target database ID";
    NewLine.Область     = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditDatabaseProperties";
    NewLine.МетодПоиска = "EDITDATABASEPROPERTIES";
    NewLine.Параметр    = "--props";
    NewLine.Описание    = "New or modified database properties (optional, def. val. - Empty)";
    NewLine.Область     = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditDatabaseProperties";
    NewLine.МетодПоиска = "EDITDATABASEPROPERTIES";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New database title (optional, def. val. - Empty)";
    NewLine.Область     = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "EditDatabaseProperties";
    NewLine.МетодПоиска = "EDITDATABASEPROPERTIES";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "New database description (optional, def. val. - Empty)";
    NewLine.Область     = "Database management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreateBlock";
    NewLine.МетодПоиска = "CREATEBLOCK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Blocks managment";
    NewLine.ОписаниеМетода   = "Creates a new block based on an existing block";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreateBlock";
    NewLine.МетодПоиска = "CREATEBLOCK";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "Parent block or page ID";
    NewLine.Область     = "Blocks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreateBlock";
    NewLine.МетодПоиска = "CREATEBLOCK";
    NewLine.Параметр    = "--block";
    NewLine.Описание    = "Block ID or block sample itself";
    NewLine.Область     = "Blocks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "CreateBlock";
    NewLine.МетодПоиска = "CREATEBLOCK";
    NewLine.Параметр    = "--prev";
    NewLine.Описание    = "Block ID after which to insert the new one (optional, def. val. - Empty)";
    NewLine.Область     = "Blocks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "ReturnBlock";
    NewLine.МетодПоиска = "RETURNBLOCK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Blocks managment";
    NewLine.ОписаниеМетода   = "Returns the block structure by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "ReturnBlock";
    NewLine.МетодПоиска = "RETURNBLOCK";
    NewLine.Параметр    = "--block";
    NewLine.Описание    = "Block ID";
    NewLine.Область     = "Blocks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "ReturnBlock";
    NewLine.МетодПоиска = "RETURNBLOCK";
    NewLine.Параметр    = "--core";
    NewLine.Описание    = "True > service fields are deleted, only the block itself remains (optional, def. val. - True)";
    NewLine.Область     = "Blocks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "ReturnChildBlocks";
    NewLine.МетодПоиска = "RETURNCHILDBLOCKS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Blocks managment";
    NewLine.ОписаниеМетода   = "Returns list of child blocks of parent block";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "ReturnChildBlocks";
    NewLine.МетодПоиска = "RETURNCHILDBLOCKS";
    NewLine.Параметр    = "--block";
    NewLine.Описание    = "Parent block ID";
    NewLine.Область     = "Blocks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "DeleteBlock";
    NewLine.МетодПоиска = "DELETEBLOCK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Blocks managment";
    NewLine.ОписаниеМетода   = "Deletes block by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "DeleteBlock";
    NewLine.МетодПоиска = "DELETEBLOCK";
    NewLine.Параметр    = "--block";
    NewLine.Описание    = "Block ID";
    NewLine.Область     = "Blocks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "UserList";
    NewLine.МетодПоиска = "USERLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Users";
    NewLine.ОписаниеМетода   = "Returns a list of workspace users";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "GetUserData";
    NewLine.МетодПоиска = "GETUSERDATA";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Users";
    NewLine.ОписаниеМетода   = "Gets user data by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "notion";
    NewLine.Модуль      = "OPI_Notion";
    NewLine.Метод       = "GetUserData";
    NewLine.МетодПоиска = "GETUSERDATA";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "Target user ID";
    NewLine.Область     = "Users";

    Return CompositionTable;
EndFunction

