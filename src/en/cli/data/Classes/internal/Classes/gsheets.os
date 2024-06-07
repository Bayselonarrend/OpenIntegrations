Function GetComposition() Export

    TableСоwithтаinа = New ValueTable();
    TableСоwithтаinа.Columns.Add("Library");
    TableСоwithтаinа.Columns.Add("Module");
    TableСоwithтаinа.Columns.Add("Method");
    TableСоwithтаinа.Columns.Add("SearchMethod");
    TableСоwithтаinа.Columns.Add("Parameter");
    TableСоwithтаinа.Columns.Add("Description");
    TableСоwithтаinа.Columns.Add("MethodDescription");
    TableСоwithтаinа.Columns.Add("Region");

    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CreateBook";
    NewLine.SearchMethod = "CREATEBOOK";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Books managment";
    NewLine.MethodDescription   = "Creates a new book";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CreateBook";
    NewLine.SearchMethod = "CREATEBOOK";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Name";
    NewLine.Region     = "Books managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CreateBook";
    NewLine.SearchMethod = "CREATEBOOK";
    NewLine.Parameter    = "--sheets";
    NewLine.Description    = "Array of names to add new sheets to the book";
    NewLine.Region     = "Books managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetBook";
    NewLine.SearchMethod = "GETBOOK";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Books managment";
    NewLine.MethodDescription   = "Gets information about the book by ID";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetBook";
    NewLine.SearchMethod = "GETBOOK";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "BookIdentifier";
    NewLine.Region     = "Books managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "EditBookTitle";
    NewLine.SearchMethod = "EDITBOOKTITLE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Books managment";
    NewLine.MethodDescription   = "Changes the name of the existing book";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "EditBookTitle";
    NewLine.SearchMethod = "EDITBOOKTITLE";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "BookID";
    NewLine.Region     = "Books managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "EditBookTitle";
    NewLine.SearchMethod = "EDITBOOKTITLE";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "New name";
    NewLine.Region     = "Books managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "AddSheet";
    NewLine.SearchMethod = "ADDSHEET";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Working with sheets";
    NewLine.MethodDescription   = "Adds a new sheet to the book";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "AddSheet";
    NewLine.SearchMethod = "ADDSHEET";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "BookIdentifier";
    NewLine.Region     = "Working with sheets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "AddSheet";
    NewLine.SearchMethod = "ADDSHEET";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "NewSheetName";
    NewLine.Region     = "Working with sheets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "DeleteSheet";
    NewLine.SearchMethod = "DELETESHEET";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Working with sheets";
    NewLine.MethodDescription   = "Deletes a sheet from the book";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "DeleteSheet";
    NewLine.SearchMethod = "DELETESHEET";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "BookIdentifier";
    NewLine.Region     = "Working with sheets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "DeleteSheet";
    NewLine.SearchMethod = "DELETESHEET";
    NewLine.Parameter    = "--sheet";
    NewLine.Description    = "IdentifierOfSheetToDelete";
    NewLine.Region     = "Working with sheets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CopySheet";
    NewLine.SearchMethod = "COPYSHEET";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Working with sheets";
    NewLine.MethodDescription   = "Copies a sheet from one book to another";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CopySheet";
    NewLine.SearchMethod = "COPYSHEET";
    NewLine.Parameter    = "--from";
    NewLine.Description    = "SourceBookID";
    NewLine.Region     = "Working with sheets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CopySheet";
    NewLine.SearchMethod = "COPYSHEET";
    NewLine.Parameter    = "--to";
    NewLine.Description    = "DestinationBookID";
    NewLine.Region     = "Working with sheets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CopySheet";
    NewLine.SearchMethod = "COPYSHEET";
    NewLine.Parameter    = "--sheet";
    NewLine.Description    = "CopiedSheetID";
    NewLine.Region     = "Working with sheets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Data managment";
    NewLine.MethodDescription   = "Sets sheet cell values
    |
    |    The structure of the JSON cells data (parameter --data):
    |    {
    |     ""A1"": ""These are cell data of A1"",
    |     ""B2"": ""These are cell data of B2"",
    |     ...
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "BookID";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--data";
    NewLine.Description    = "Fill data where the key is the cell name like A1";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--sheetname";
    NewLine.Description    = "Sheet name (first sheet by default) (optional, def. val. - Empty)";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--dim";
    NewLine.Description    = "Main dimension when filling the array range (optional, def. val. - COLUMNS)";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "ClearCells";
    NewLine.SearchMethod = "CLEARCELLS";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Data managment";
    NewLine.MethodDescription   = "Clears the value in cells";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "ClearCells";
    NewLine.SearchMethod = "CLEARCELLS";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "BookID";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "ClearCells";
    NewLine.SearchMethod = "CLEARCELLS";
    NewLine.Parameter    = "--cells";
    NewLine.Description    = "Array of cells like A1 to be cleared";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "ClearCells";
    NewLine.SearchMethod = "CLEARCELLS";
    NewLine.Parameter    = "--sheetname";
    NewLine.Description    = "Sheet name (first sheet by default) (optional, def. val. - Empty)";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetCellValues";
    NewLine.SearchMethod = "GETCELLVALUES";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Data managment";
    NewLine.MethodDescription   = "Gets cell values of the table";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetCellValues";
    NewLine.SearchMethod = "GETCELLVALUES";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "BookID";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetCellValues";
    NewLine.SearchMethod = "GETCELLVALUES";
    NewLine.Parameter    = "--type cells to get (whole sheet if not filled)";
    NewLine.Description    = "cells (optional, def. val. - Empty)";
    NewLine.Region     = "Data managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetCellValues";
    NewLine.SearchMethod = "GETCELLVALUES";
    NewLine.Parameter    = "--sheetname";
    NewLine.Description    = "Sheet name (first sheet by default) (optional, def. val. - Empty)";
    NewLine.Region     = "Data managment";

    Return TableСоwithтаinа;
EndFunction

