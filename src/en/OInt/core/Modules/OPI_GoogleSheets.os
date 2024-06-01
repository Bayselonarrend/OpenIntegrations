// OneScript: ./OInt/core/Modules/OPI_GoogleSheets.os
// Lib: Google Sheets
// CLI: gsheets

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
#Use "../../tools"

#Region Public

#Region BookWork

// CreateBook
// Creates a new book
// 
// Parameters:
// Token - String - Token - token
// Name - String - Name - title
// ArrayOfSheetNames - Array of String - Array of names to add new sheets to the book - sheets
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function CreateBook(Val Token, Val Name, Val ArrayOfSheetNames) Export
    
    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetCollection(ArrayOfSheetNames);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets";
   
    Properties = New Structure("title" , Name);
    Sheets = New Array;
    
    FillSheetArray(ArrayOfSheetNames, Sheets);
    
    Parameters = New Structure;
    OPI_Tools.AddField("properties", Properties, "Collection", Parameters);
    OPI_Tools.AddField("sheets" , Sheets , "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;

EndFunction

// GetBook
// Gets information about the book by ID
// 
// Parameters:
// Token - String - Token - token
// Identifier - String - BookIdentifier - spreadsheet
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function GetBook(Val Token, Val Identifier) Export

    OPI_TypeConversion.GetLine(Identifier); 
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets/" + Identifier;
    
    Response = OPI_Tools.Get(URL, , Headers);
    
    Return Response;

EndFunction

// ChangeBookName
// Changes the name of the existing book
// 
// Parameters:
// Token - String - Token - token
// Book - String - BookID - spreadsheet
// Name - String - New name - title
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function EditBookTitle(Val Token, Val Book, Val Name) Export
    
    OPI_TypeConversion.GetLine(Book);
    OPI_TypeConversion.GetLine(Name);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + ":batchUpdate";
    
    Change = New Structure("title", Name);
    ChangeRequest = New Structure("properties,fields", Change, "title");
    Request = New Structure("updateSpreadsheetProperties", ChangeRequest);
    
    ArrayOfRequests = New Array;
    ArrayOfRequests.Add(Request);
    
    Parameters = New Structure("requests", ArrayOfRequests);
        
    Response = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;
    
EndFunction

#EndRegion

#Region SheetWork

// AddSheet
// Adds a new sheet to the book
// 
// 
// Parameters:
// Token - String - Token - token
// Book - String - BookIdentifier - spreadsheet
// Name - String - NewSheetName - title
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function AddSheet(Val Token, Val Book, Val Name) Export
    
    OPI_TypeConversion.GetLine(Book);
        
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + ":batchUpdate";
    Sheet = CreateSheet(Name);
    
    Requests = New Array;
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
// Token - String - Token - token
// Book - String - BookIdentifier - spreadsheet
// Sheet - String - IdentifierOfSheetToDelete - sheet
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function DeleteSheet(Val Token, Val Book, Val Sheet) Export
    
    OPI_TypeConversion.GetLine(Book);
    OPI_TypeConversion.GetLine(Sheet);
        
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + ":batchUpdate";
    
    Requests = New Array;
    Sheet = New Structure("sheetId" , Sheet);
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
// Token - String - Token - token
// From - String - SourceBookID - from
// Target - String - DestinationBookID - to
// Sheet - String - CopiedSheetID - sheet
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function CopySheet(Val Token, Val From, Val Target, Val Sheet) Export
    
    OPI_TypeConversion.GetLine(From);
    OPI_TypeConversion.GetLine(Target);
    OPI_TypeConversion.GetLine(Sheet);
        
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets/"
        + From
        + "/sheets/"
        + Sheet
        + ":copyTo";
    
    Parameters = New Structure("destinationSpreadsheetId", Target);  
    Response = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;
   
EndFunction

#EndRegion

#Region DataWork

// SetCellValues
// Sets sheet cell values
// 
// Parameters:
// Token - String - Token - token
// Book - String - BookID - spreadsheet 
// ValueMapping - Key-Value Pair - Fill data where the key is the cell name like A1 - data
// Sheet - String - Sheet name (first sheet by default) - sheetname
// MajorDimension - String - Main dimension when filling the array range - dim
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function SetCellValues(Val Token
    , Val Book
    , Val ValueMapping
    , Val Sheet = ""
    , Val MajorDimension = "COLUMNS") Export
    
    OPI_TypeConversion.GetLine(Book);
    OPI_TypeConversion.GetCollection(ValueMapping);
    
    If Not TypeOf(ValueMapping) = Type("Structure")
        And Not TypeOf(ValueMapping) = Type("Map") Then
        Return "Failed to convert the structure of values to a collection";
    EndIf;
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + "/values:batchUpdate";
    DataArray = FormCellDataArray(ValueMapping, MajorDimension, Sheet);

    Parameters = New Structure("data,valueInputOption", DataArray, "USER_ENTERED");
    Response = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;
    
EndFunction

// Clear cells
// Clears the value in cells
// 
// Parameters:
// Token - String - Token - token
// Book - String - BookID - spreadsheet
// CellsArray - Array of String - Array of cells like A1 to be cleared - cells
// Sheet - String - Sheet name (first sheet by default) - sheetname
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function ClearCells(Val Token, Val Book, Val CellsArray, Val Sheet = "") Export
    
    OPI_TypeConversion.GetLine(Book);
    OPI_TypeConversion.GetCollection(CellsArray);
    
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + "/values:batchClear";
    
    FormCellNameArray(CellsArray, Sheet);
        
    Parameters = New Structure("ranges", CellsArray);
    Response = OPI_Tools.Post(URL, Parameters, Headers);
    
    Return Response;
    
EndFunction

// Get cell values
// Gets cell values of the table
// 
// Parameters:
// Token - String - Token - token
// Book - String - BookID - spreadsheet
// CellsArray - Array of String - Array of A1-type cells to get (whole sheet if not filled) - cells
// Sheet - String - Sheet name (first sheet by default) - sheetname
// 
// Returns:
// Key-Value Pair - serialized JSON response from Google
Function GetCellValues(Val Token, Val Book, Val CellsArray = "", Val Sheet = "") Export
    
    OPI_TypeConversion.GetLine(Book);
      
    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL = "https://sheets.googleapis.com/v4/spreadsheets/" + Book + "/values:batchGet";
  
    If ValueIsFilled(CellsArray) Then
        OPI_TypeConversion.GetCollection(CellsArray);  
        FormCellNameArray(CellsArray, Sheet);
        
        First = True;
        For Each Cell In CellsArray Do
            Delimiter = ?(First, "?", "&");
            URL = URL + Delimiter + "ranges=" + Cell;
            First = False;
        EndDo;
    Else
        URL = URL + "?ranges='" + Sheet + "'";
    EndIf;
    
    Response = OPI_Tools.Get(URL, , Headers);
    
    Return Response;
    
EndFunction

#EndRegion

#EndRegion

#Region Private

Procedure FillSheetArray(Val ArrayOfNames, SheetArray)
    
    For Each SheetName In ArrayOfNames Do
        
        Sheet = CreateSheet(SheetName);
        SheetArray.Add(Sheet);
        
    EndDo;

EndProcedure

Procedure AddSheetName(Cell, Val Sheet)
    
    If ValueIsFilled(Sheet) Then
		Cell = "'" + Sheet + "'!" + Cell;
    EndIf;
    
EndProcedure

Function CreateSheet(Val Name)
    
    OPI_TypeConversion.GetLine(Name);
    
    SheetProperties = New Structure("title" , Name);
    Sheet = New Structure("properties", SheetProperties);

    Return Sheet;
    
EndFunction

Function FormCellDataArray(Val ValueStructure, Val MajorDimension, Val Sheet)
    
    OPI_TypeConversion.GetLine(Sheet);
    
    DataArray = New Array;
    
    For Each CellData In ValueStructure Do
        
        CurrentValue = CellData.Value;
        CurrentKey = CellData.TheKey;
        
        AddSheetName(CurrentKey, Sheet);
        
        OPI_TypeConversion.GetArray(CurrentValue);
        
        CurrentData = New Map;
        CurrentArray = New Array;
        
        CurrentArray.Add(CurrentValue);
        
        OPI_Tools.AddField("range" , CurrentKey , "String", CurrentData);
        OPI_Tools.AddField("values" , CurrentArray , "Array", CurrentData);
        OPI_Tools.AddField("majorDimension", MajorDimension, "String", CurrentData);
        
        DataArray.Add(CurrentData);
        
    EndDo;
    
    Return DataArray;
    
EndFunction

Procedure FormCellNameArray(Val ArrayOfNames, Val Sheet)

   OPI_TypeConversion.GetLine(Sheet); 
   
   For N = 0 To ArrayOfNames.WithinBoundary() Do       
       AddSheetName(ArrayOfNames[N], Sheet);
   EndDo;
       
EndProcedure

#EndRegion
