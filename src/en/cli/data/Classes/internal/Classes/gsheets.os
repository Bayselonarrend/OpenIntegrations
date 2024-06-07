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
    NewLine.Метод       = "CreateBook";
    NewLine.МетодПоиска = "CREATEBOOK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Books managment";
    NewLine.ОписаниеМетода   = "Creates a new book";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CreateBook";
    NewLine.МетодПоиска = "CREATEBOOK";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Name";
    NewLine.Область     = "Books managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CreateBook";
    NewLine.МетодПоиска = "CREATEBOOK";
    NewLine.Параметр    = "--sheets";
    NewLine.Описание    = "Array of names to add new sheets to the book";
    NewLine.Область     = "Books managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetBook";
    NewLine.МетодПоиска = "GETBOOK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Books managment";
    NewLine.ОписаниеМетода   = "Gets information about the book by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetBook";
    NewLine.МетодПоиска = "GETBOOK";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "BookIdentifier";
    NewLine.Область     = "Books managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "EditBookTitle";
    NewLine.МетодПоиска = "EDITBOOKTITLE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Books managment";
    NewLine.ОписаниеМетода   = "Changes the name of the existing book";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "EditBookTitle";
    NewLine.МетодПоиска = "EDITBOOKTITLE";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "BookID";
    NewLine.Область     = "Books managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "EditBookTitle";
    NewLine.МетодПоиска = "EDITBOOKTITLE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New name";
    NewLine.Область     = "Books managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "AddSheet";
    NewLine.МетодПоиска = "ADDSHEET";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with sheets";
    NewLine.ОписаниеМетода   = "Adds a new sheet to the book";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "AddSheet";
    NewLine.МетодПоиска = "ADDSHEET";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "BookIdentifier";
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
    NewLine.ОписаниеМетода   = "Deletes a sheet from the book";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "DeleteSheet";
    NewLine.МетодПоиска = "DELETESHEET";
    NewLine.Параметр    = "--spreadsheet";
    NewLine.Описание    = "BookIdentifier";
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
    NewLine.ОписаниеМетода   = "Copies a sheet from one book to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CopySheet";
    NewLine.МетодПоиска = "COPYSHEET";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "SourceBookID";
    NewLine.Область     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "CopySheet";
    NewLine.МетодПоиска = "COPYSHEET";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "DestinationBookID";
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
    NewLine.Описание    = "BookID";
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
    NewLine.Описание    = "Sheet name (first sheet by default) (optional, def. val. - Empty)";
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
    NewLine.Описание    = "BookID";
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
    NewLine.Описание    = "Sheet name (first sheet by default) (optional, def. val. - Empty)";
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
    NewLine.Описание    = "BookID";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetCellValues";
    NewLine.МетодПоиска = "GETCELLVALUES";
    NewLine.Параметр    = "--type cells to get (whole sheet if not filled)";
    NewLine.Описание    = "cells (optional, def. val. - Empty)";
    NewLine.Область     = "Data managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gsheets";
    NewLine.Модуль      = "OPI_GoogleSheets";
    NewLine.Метод       = "GetCellValues";
    NewLine.МетодПоиска = "GETCELLVALUES";
    NewLine.Параметр    = "--sheetname";
    NewLine.Описание    = "Sheet name (first sheet by default) (optional, def. val. - Empty)";
    NewLine.Область     = "Data managment";

    Return CompositionTable;
EndFunction

