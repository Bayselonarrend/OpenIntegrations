
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
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CreateSpreadsheet";
    NewLine.SearchMethod = "CREATESPREADSHEET";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Spreadsheets management";
    NewLine.MethodDescription   = "Creates a new spreadsheet";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CreateSpreadsheet";
    NewLine.SearchMethod = "CREATESPREADSHEET";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Name";
    NewLine.Region     = "Spreadsheets management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CreateSpreadsheet";
    NewLine.SearchMethod = "CREATESPREADSHEET";
    NewLine.Parameter    = "--sheets";
    NewLine.Description    = "Array of names to add new sheets to the spreadsheet";
    NewLine.Region     = "Spreadsheets management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetSpreadsheet";
    NewLine.SearchMethod = "GETSPREADSHEET";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Spreadsheets management";
    NewLine.MethodDescription   = "Gets information about the spreadsheet by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetSpreadsheet";
    NewLine.SearchMethod = "GETSPREADSHEET";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "Spreadsheet identifier";
    NewLine.Region     = "Spreadsheets management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "EditSpreadsheetTitle";
    NewLine.SearchMethod = "EDITSPREADSHEETTITLE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Spreadsheets management";
    NewLine.MethodDescription   = "Changes the name of the existing spreadsheet";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "EditSpreadsheetTitle";
    NewLine.SearchMethod = "EDITSPREADSHEETTITLE";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "SpreadsheetID";
    NewLine.Region     = "Spreadsheets management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "EditSpreadsheetTitle";
    NewLine.SearchMethod = "EDITSPREADSHEETTITLE";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "New name";
    NewLine.Region     = "Spreadsheets management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "AddSheet";
    NewLine.SearchMethod = "ADDSHEET";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Working with sheets";
    NewLine.MethodDescription   = "Adds a new sheet to the spreadsheet";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "AddSheet";
    NewLine.SearchMethod = "ADDSHEET";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "Spreadsheet identifier";
    NewLine.Region     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "AddSheet";
    NewLine.SearchMethod = "ADDSHEET";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "NewSheetName";
    NewLine.Region     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "DeleteSheet";
    NewLine.SearchMethod = "DELETESHEET";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Working with sheets";
    NewLine.MethodDescription   = "Deletes a sheet from the spreadsheet";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "DeleteSheet";
    NewLine.SearchMethod = "DELETESHEET";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "Spreadsheet identifier";
    NewLine.Region     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "DeleteSheet";
    NewLine.SearchMethod = "DELETESHEET";
    NewLine.Parameter    = "--sheet";
    NewLine.Description    = "IdentifierOfSheetToDelete";
    NewLine.Region     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CopySheet";
    NewLine.SearchMethod = "COPYSHEET";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Working with sheets";
    NewLine.MethodDescription   = "Copies a sheet from one spreadsheet to another";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CopySheet";
    NewLine.SearchMethod = "COPYSHEET";
    NewLine.Parameter    = "--from";
    NewLine.Description    = "Source spreadsheet ID";
    NewLine.Region     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CopySheet";
    NewLine.SearchMethod = "COPYSHEET";
    NewLine.Parameter    = "--to";
    NewLine.Description    = "Destination spreadsheet ID";
    NewLine.Region     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "CopySheet";
    NewLine.SearchMethod = "COPYSHEET";
    NewLine.Parameter    = "--sheet";
    NewLine.Description    = "CopiedSheetID";
    NewLine.Region     = "Working with sheets";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Data management";
    NewLine.MethodDescription   = "Sets sheet cell values
    |    Data structure for option --data:
    |    {
    |     ""A1"": ""These are cell data of A1"",
    |     ""B2"": ""These are cell data of B2"",
    |     ...
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "SpreadsheetID";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--data";
    NewLine.Description    = "Fill data where the key is the cell name like A1";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--sheetname";
    NewLine.Description    = "Sheet name (first sheet by default) (optional, def. val. - Empty value)";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "SetCellValues";
    NewLine.SearchMethod = "SETCELLVALUES";
    NewLine.Parameter    = "--dim";
    NewLine.Description    = "Main dimension when filling the array range (optional, def. val. - COLUMNS)";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "ClearCells";
    NewLine.SearchMethod = "CLEARCELLS";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Data management";
    NewLine.MethodDescription   = "Clears the value in cells";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "ClearCells";
    NewLine.SearchMethod = "CLEARCELLS";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "SpreadsheetID";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "ClearCells";
    NewLine.SearchMethod = "CLEARCELLS";
    NewLine.Parameter    = "--cells";
    NewLine.Description    = "Array of cells like A1 to be cleared";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "ClearCells";
    NewLine.SearchMethod = "CLEARCELLS";
    NewLine.Parameter    = "--sheetname";
    NewLine.Description    = "Sheet name (first sheet by default) (optional, def. val. - Empty value)";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetCellValues";
    NewLine.SearchMethod = "GETCELLVALUES";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Data management";
    NewLine.MethodDescription   = "Gets cell values of the table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetCellValues";
    NewLine.SearchMethod = "GETCELLVALUES";
    NewLine.Parameter    = "--spreadsheet";
    NewLine.Description    = "SpreadsheetID";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetCellValues";
    NewLine.SearchMethod = "GETCELLVALUES";
    NewLine.Parameter    = "--cells";
    NewLine.Description    = "Array of A1 type cells to get (whole sheet if not filled) (optional, def. val. - Empty value)";
    NewLine.Region     = "Data management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gsheets";
    NewLine.Module      = "OPI_GoogleSheets";
    NewLine.Method       = "GetCellValues";
    NewLine.SearchMethod = "GETCELLVALUES";
    NewLine.Parameter    = "--sheetname";
    NewLine.Description    = "Sheet name (first sheet by default) (optional, def. val. - Empty value)";
    NewLine.Region     = "Data management";

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
        |OPI_GoogleSheets = LoadScript(""%1/oint/core/Modules/OPI_GoogleSheets.os"", Context);
        |" + Chars.LF;


EndFunction 
