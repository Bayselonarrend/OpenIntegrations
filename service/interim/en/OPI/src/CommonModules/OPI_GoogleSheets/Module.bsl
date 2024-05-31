// Location OS: ./OInt/core/Modules/OPI_GoogleSheets.os
// Library: Google Sheets
// CLI Command: gsheets

// MIT License

// Copyright (c) 2023 Anton Tsitavets

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

// Uncomment if OneScript is executed
// #Use "../../tools"

#Region ProgrammingInterface

#Region BookWork

// CreateBook
// Creates a new book
// 
// Parameters:
//  Token            - String           - Token                                           - token
//  Name     - String           - Name                                    - title
//  ArrayOfSheetNames - Array of Strings - Array of names to add new sheets to the book - sheets
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function CreateBook(Val Token, Val Name, Val ArrayOfSheetNames) Export
    
    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetCollection(ArrayOfSheetNames);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets";
   
    Properties  = New Structure("title" , Name);
    Sheets     = New Array;
    
    FillSheetArray(ArrayOfSheetNames, Sheets);
    
    Parameters = New Structure;
    OPI_Tools.AddField("properties", Properties, "Collection", Parameters);
    OPI_Tools.AddField("sheets"    , Sheets   , "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;

EndFunction

// GetBook
// Gets information about the book by ID
// 
// Parameters:
//  Token         - String - Token               - token
//  Identifier - String - BookIdentifier - spreadsheet
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function GetBook(Val Token, Val Identifier) Export

    OPI_TypeConversion.GetLine(Identifier); 
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Identifier;
    
    Response = OPI_Tools.Get(URL, , Headers);
    
    Return Response;

EndFunction

// ChangeBookName
// Changes the name of the existing book
// 
// Parameters:
//  Token        - String - Token              - token
//  Book        - String - BookID           - spreadsheet
//  Name - String - New name - title
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function EditBookTitle(Val Token, Val Book, Val Name) Export
    
    OPI_TypeConversion.GetLine(Book);
    OPI_TypeConversion.GetLine(Name);
    
    Headers    = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL          = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + ":batchUpdate";
    
    Change       = New Structure("title", Name);
    ChangeRequest = New Structure("properties,fields", Change, "title");
    Request          = New Structure("updateSpreadsheetProperties", ChangeRequest);
    
    ArrayOfRequests  = New Array;
    ArrayOfRequests.Add(Request);
    
    Parameters = New Structure("requests", ArrayOfRequests);
        
    Response     = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;
    
EndFunction

#EndRegion

#Region SheetWork

// AddSheet
// Adds a new sheet to the book
// 
// 
// Parameters:
//  Token        - String - Token                     - token
//  Book        - String - BookIdentifier       - spreadsheet
//  Name - String - NewSheetName - title
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function AddSheet(Val Token, Val Book, Val Name) Export
    
    OPI_TypeConversion.GetLine(Book);
        
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + ":batchUpdate";
    Sheet      = CreateSheet(Name);
    
    Requests   = New Array;
    Change = New Structure("addSheet", Sheet);
    Requests.Add(Change);
    
    Parameters = New Structure("requests", Requests);
    
    Response = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;

EndFunction

// DeleteSheet
// Deletes a sheet from the book
// 
// Parameters:
//  Token   - String - Token                          - token
//  Book   - String - BookIdentifier            - spreadsheet
//  Sheet    - String - IdentifierOfSheetToDelete - sheet
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function DeleteSheet(Val Token, Val Book, Val Sheet) Export
    
    OPI_TypeConversion.GetLine(Book);
    OPI_TypeConversion.GetLine(Sheet);
        
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + ":batchUpdate";
    
    Requests   = New Array;
    Sheet      = New Structure("sheetId"    , Sheet);
    Change = New Structure("deleteSheet", Sheet);
    Requests.Add(Change);
    
    Parameters = New Structure("requests", Requests);
    
    Response = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;

EndFunction

// CopySheet
// Copies a sheet from one book to another
// 
// Parameters:
//  Token  - String - Token - token
//  From - String - SourceBookID   - from
//  To   - String - DestinationBookID   - to
//  Sheet   - String - CopiedSheetID - sheet
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function CopySheet(Val Token, Val From, Val To, Val Sheet) Export
    
    OPI_TypeConversion.GetLine(From);
    OPI_TypeConversion.GetLine(To);
    OPI_TypeConversion.GetLine(Sheet);
        
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/"
        + From
        + "/sheets/"
        + Sheet
        + ":copyTo";
    
    Parameters = New Structure("destinationSpreadsheetId", To);  
    Response     = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;
   
EndFunction

#EndRegion

#Region DataWork

// SetCellValues
// Sets sheet cell values
// 
// Parameters:
//  Token                - String                        - Token    - token
//  Book                - String                        - BookID - spreadsheet 
//  ValueMapping - Key-Value Pair - Fill data where the key is the cell name like A1   - data
//  Sheet                 - String                        - Name лиwithта (перinый лиwithт по умолчанию) - sheetname
//  MajorDimension    - String                        - Main dimension when filling the array range - dim
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function SetCellValues(Val Token
    , Val Book
    , Val ValueMapping
    , Val Sheet = ""
    , Val MajorDimension = "COLUMNS") Export
    
    OPI_TypeConversion.GetLine(Book);
    OPI_TypeConversion.GetCollection(ValueMapping);
    
    If Not TypeValue(ValueMapping) = Type("Structure")
        And Not TypeValue(ValueMapping) = Type("Match") Then
        Return "Failed to convert the structure of values to a collection";
    EndIf;
    
    Headers    = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL          = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + "/values:batchUpdate";
    Data array = FormCellDataArray(ValueMapping, MajorDimension, Sheet);

    Parameters = New Structure("data,valueInputOption", Data array, "USER_ENTERED");
    Response     = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;
    
EndFunction

// Clear cells
// Clears the value in cells
// 
// Parameters:
//  Token       - String           - Token                                - token
//  Book       - String           - BookID                             - spreadsheet
//  Cell array - Array of Strings - Array of cells like A1 to be cleared     - cells
//  Sheet        - String           - Name лиwithта (перinый лиwithт по умолчанию) - sheetname
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function ClearCells(Val Token, Val Book, Val Cell array, Val Sheet = "") Export
    
    OPI_TypeConversion.GetLine(Book);
    OPI_TypeConversion.GetCollection(Cell array);
    
    Headers    = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL          = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + "/values:batchClear";
    
    FormCellNameArray(Cell array, Sheet);
        
    Parameters = New Structure("ranges", Cell array);
    Response     = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;
    
EndFunction

// Get cell values
// Gets cell values of the table
// 
// Parameters:
//  Token       - String           - Token                                                              - token
//  Book       - String           - BookID                                                           - spreadsheet
//  Cell array - Array of Strings - Array ячееto inиdа А1 for получения (inеwithь лиwithт, еwithли не заполнено)  - cells
//  Sheet        - String           - Name лиwithта (перinый лиwithт по умолчанию)                               - sheetname
// 
// Return value:
//  Key-Value Pair - serialized JSON response from Google
Function GetCellValues(Val Token, Val Book, Val Cell array = "", Val Sheet = "") Export
    
    OPI_TypeConversion.GetLine(Book);
      
    Headers    = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL          = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + "/values:batchGet";
  
    If ValueFilled(Cell array) Then
        OPI_TypeConversion.GetCollection(Cell array);  
        FormCellNameArray(Cell array, Sheet);
        
        First = True;
        For Each Cell In Cell array Do
            Delimiter = ?(First, "?", "&");
            URL         = URL + Delimiter + "ranges=" + Cell;
            First      = False;
        EndDo;
    Else
        URL = URL + "?ranges='" + Sheet + "'";
    EndIf;
    
    Response = OPI_Tools.Get(URL, , Headers);
    
    Return Response;
    
EndFunction

#EndRegion

#EndRegion

#Region ServiceProceduresAndFunctions

Procedure FillSheetArray(Val ArrayOfNames, SheetArray)
    
    For Each SheetName In ArrayOfNames Do
        
        Sheet = CreateSheet(SheetName);
        SheetArray.Add(Sheet);
        
    EndDo;

EndProcedure

Procedure AddSheetName(Cell, Val Sheet)
    
    If ValueFilled(Sheet) Then
		Cell     = "'" + Sheet + "'!" + Cell;
    EndIf;
    
EndProcedure

Function CreateSheet(Val Name)
    
    OPI_TypeConversion.GetLine(Name);
    
    Sheet properties = New Structure("title"     , Name);
    Sheet          = New Structure("properties", Sheet properties);

    Return Sheet;
    
EndFunction

Function FormCellDataArray(Val ValueStructure, Val MajorDimension, Val Sheet)
    
    OPI_TypeConversion.GetLine(Sheet);
    
    Data array = New Array;
    
    For Each CellData In ValueStructure Do
        
        CurrentValue = CellData.Value;
        Current key     = CellData.Key;
        
        AddSheetName(Current key, Sheet);
        
        OPI_TypeConversion.GetArray(CurrentValue);
        
        Current data   = New Match;
        Current array   = New Array;
        
        Current array.Add(CurrentValue);
        
        OPI_Tools.AddField("range"         , Current key      , "String", Current data);
        OPI_Tools.AddField("values"        , Current array    , "Array", Current data);
        OPI_Tools.AddField("majorDimension", MajorDimension, "String", Current data);
        
        Data array.Add(Current data);
        
    EndDo;
    
    Return Data array;
    
EndFunction

Procedure FormCellNameArray(Val ArrayOfNames, Val Sheet)

   OPI_TypeConversion.GetLine(Sheet); 
   
   For N = 0 For ArrayOfNames.WithinBoundary() Do       
       AddSheetName(ArrayOfNames[N], Sheet);
   EndDo;
       
EndProcedure

#EndRegion
