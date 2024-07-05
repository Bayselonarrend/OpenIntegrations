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
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CreateSpreadsheet";
    NewLine.МетодПоиска = "CREATESPREADSHEET";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Spreadsheets managment";
    NewLine.ОписаниеМетода   = "Creates a new spreadsheet";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CreateSpreadsheet";
    NewLine.МетодПоиска = "CREATESPREADSHEET";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Name";
    NewLine.Область     = "Spreadsheets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CreateSpreadsheet";
    NewLine.МетодПоиска = "CREATESPREADSHEET";
    NewLine.Параметр    = "--sheets";
    NewLine.Описание    = "Array of names to add new sheets to the spreadsheet";
    NewLine.Область     = "Spreadsheets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetSpreadsheet";
    NewLine.МетодПоиска = "GETSPREADSHEET";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Spreadsheets managment";
    NewLine.ОписаниеМетода   = "Gets information about the spreadsheet by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetSpreadsheet";
    NewLine.МетодПоиска = "GETSPREADSHEET";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "Spreadsheet identifier";
    NewLine.Область     = "Spreadsheets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "EditSpreadsheetTitle";
    NewLine.МетодПоиска = "EDITSPREADSHEETTITLE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Spreadsheets managment";
    NewLine.ОписаниеМетода   = "Changes the name of the existing spreadsheet";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "EditSpreadsheetTitle";
    NewLine.МетодПоиска = "EDITSPREADSHEETTITLE";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "SpreadsheetID";
    NewLine.Область     = "Spreadsheets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "EditSpreadsheetTitle";
    NewLine.МетодПоиска = "EDITSPREADSHEETTITLE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New name";
    NewLine.Область     = "Spreadsheets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "AddSheet";
    NewLine.МетодПоиска = "ADDSHEET";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with sheets";
    NewLine.ОписаниеМетода   = "Adds a new sheet to the spreadsheet";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "AddSheet";
    NewLine.МетодПоиска = "ADDSHEET";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "Spreadsheet identifier";
    NewLine.Область     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "AddSheet";
    NewLine.МетодПоиска = "ADDSHEET";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "NewSheetName";
    NewLine.Область     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "DeleteSheet";
    NewLine.МетодПоиска = "DELETESHEET";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with sheets";
    NewLine.ОписаниеМетода   = "Deletes a sheet from the spreadsheet";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "DeleteSheet";
    NewLine.МетодПоиска = "DELETESHEET";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "Spreadsheet identifier";
    NewLine.Область     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "DeleteSheet";
    NewLine.МетодПоиска = "DELETESHEET";
    NewLine.Параметр    = "--sheet";
    NewLine.Описание    = "IdentifierOfSheetToDelete";
    NewLine.Область     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CopySheet";
    NewLine.МетодПоиска = "COPYSHEET";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with sheets";
    NewLine.ОписаниеМетода   = "Copies a sheet from one spreadsheet to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CopySheet";
    NewLine.МетодПоиска = "COPYSHEET";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "Source spreadsheet ID";
    NewLine.Область     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CopySheet";
    NewLine.МетодПоиска = "COPYSHEET";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "Destination spreadsheet ID";
    NewLine.Область     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CopySheet";
    NewLine.МетодПоиска = "COPYSHEET";
    NewLine.Параметр    = "--sheet";
    NewLine.Описание    = "CopiedSheetID";
    NewLine.Область     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "SetCellValues";
    NewLine.МетодПоиска = "SETCELLVALUES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Data managment";
    NewLine.ОписаниеМетода   = "Sets sheet cell values
    |
    |    The structure of the JSON cells data (parameter --data):
    |    {
    |     ""A1"": ""These are cell data of A1"",
    |     ""B2"": ""These are cell data of B2"",
    |     ...
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "SetCellValues";
    NewLine.МетодПоиска = "SETCELLVALUES";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "SpreadsheetID";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "SetCellValues";
    NewLine.МетодПоиска = "SETCELLVALUES";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Fill data where the key is the cell name like A1";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "SetCellValues";
    NewLine.МетодПоиска = "SETCELLVALUES";
    NewLine.Параметр    = "--sheetname";
    NewLine.Описание    = "Sheet name (first sheet by default) (optional, def. val. - Empty value)";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "SetCellValues";
    NewLine.МетодПоиска = "SETCELLVALUES";
    NewLine.Параметр    = "--dim";
    NewLine.Описание    = "Main dimension when filling the array range (optional, def. val. - COLUMNS)";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "ClearCells";
    NewLine.МетодПоиска = "CLEARCELLS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Data managment";
    NewLine.ОписаниеМетода   = "Clears the value in cells";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "ClearCells";
    NewLine.МетодПоиска = "CLEARCELLS";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "SpreadsheetID";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "ClearCells";
    NewLine.МетодПоиска = "CLEARCELLS";
    NewLine.Параметр    = "--cells";
    NewLine.Описание    = "Array of cells like A1 to be cleared";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "ClearCells";
    NewLine.МетодПоиска = "CLEARCELLS";
    NewLine.Параметр    = "--sheetname";
    NewLine.Описание    = "Sheet name (first sheet by default) (optional, def. val. - Empty value)";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetCellValues";
    NewLine.МетодПоиска = "GETCELLVALUES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Data managment";
    NewLine.ОписаниеМетода   = "Gets cell values of the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetCellValues";
    NewLine.МетодПоиска = "GETCELLVALUES";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "SpreadsheetID";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetCellValues";
    NewLine.МетодПоиска = "GETCELLVALUES";
    NewLine.Параметр    = "--cells";
    NewLine.Описание    = "Array of A1 type cells to get (whole sheet if not filled) (optional, def. val. - Empty value)";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetCellValues";
    NewLine.МетодПоиска = "GETCELLVALUES";
    NewLine.Параметр    = "--sheetname";
    NewLine.Описание    = "Sheet name (first sheet by default) (optional, def. val. - Empty value)";
    NewLine.Область     = "Data managment";

    Return CompositionTable;
EndFunction

