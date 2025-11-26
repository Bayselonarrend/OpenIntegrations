// OneScript: ./OInt/core/Modules/OPI_GoogleSheets.os
// Lib: Google Sheets
// CLI: gsheets
// Keywords: googlesheets, google sheets, spreadsheets
// Depends: OPI_GoogleWorkspace

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region Authorization

// Generate code retrieval link
// Returns URL for browser authorization
//
// Parameters:
// ClientID - String - Client ID - id
// Calendar - Boolean - Calendar methods permission - calendar
// Drive - Boolean - Drive methods permission - drive
// Sheets - Boolean - Sheets methods permission - sheets
//
// Returns:
// String - Code retrieval link
Function FormCodeRetrievalLink(Val ClientID
    , Val Calendar = True
    , Val Drive = True
    , Val Sheets = True) Export

    Result = OPI_GoogleWorkspace.FormCodeRetrievalLink(ClientID, Calendar, Drive, Sheets);
    Return Result;

EndFunction

// Get token by code
// Gets token by code from browser authorization
//
// Parameters:
// ClientID - String - Client ID - id
// ClientSecret - String - Client secret - secret
// Code - String - Code from browser - code
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetTokenByCode(Val ClientID, Val ClientSecret, Val Code) Export

    Result = OPI_GoogleWorkspace.GetTokenByCode(ClientID, ClientSecret, Code);
    Return Result;

EndFunction

// Refresh token
// Updates token by Refresh token
//
// Parameters:
// ClientID - String - Client ID - id
// ClientSecret - String - Client secret - secret
// RefreshToken - String - Refresh token - refresh
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function RefreshToken(Val ClientID, Val ClientSecret, Val RefreshToken) Export

    Result = OPI_GoogleWorkspace.RefreshToken(ClientID, ClientSecret, RefreshToken);
    Return Result;

EndFunction

// Get service account token
// Gets authorization token by service account data
//
// Note
// List of available scopes: [developers.google.com](https://developers.google.com/identity/protocols/oauth2/scopes)
//
// Parameters:
// Data - Arbitrary - JSON authorization data as a file, collection or binary data - auth
// Scope - Array Of String - Scope or array of scopes - scope
// Expire - Number - Token lifetime in seconds - exp
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetServiceAccountToken(Val Data, Val Scope, Val Expire = 3600) Export

    Result = OPI_GoogleWorkspace.GetServiceAccountToken(Data, Scope, Expire);
    Return Result;

EndFunction

#EndRegion

#Region SpreadsheetsManagement

// Create spreadsheet
// Creates a new spreadsheet
//
// Parameters:
// Token - String - Token - token
// Name - String - Name - title
// ArrayOfSheetNames - Array of String - Array of names to add new sheets to the spreadsheet - sheets
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function CreateSpreadsheet(Val Token, Val Name, Val ArrayOfSheetNames) Export

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetCollection(ArrayOfSheetNames);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://sheets.googleapis.com/v4/spreadsheets";

    Properties = New Structure("title" , Name);
    Sheets     = New Array;

    FillSheetArray(ArrayOfSheetNames, Sheets);

    Parameters = New Structure;
    OPI_Tools.AddField("properties", Properties, "Collection", Parameters);
    OPI_Tools.AddField("sheets"    , Sheets    , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get spreadsheet
// Gets information about the spreadsheet by ID
//
// Parameters:
// Token - String - Token - token
// Identifier - String - Spreadsheet identifier - spreadsheet
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetSpreadsheet(Val Token, Val Identifier) Export

    OPI_TypeConversion.GetLine(Identifier);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://sheets.googleapis.com/v4/spreadsheets/" + Identifier;

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Change spreadsheet name
// Changes the name of the existing spreadsheet
//
// Parameters:
// Token - String - Token - token
// Spreadsheet - String - SpreadsheetID - spreadsheet
// Name - String - New name - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function EditSpreadsheetTitle(Val Token, Val Spreadsheet, Val Name) Export

    OPI_TypeConversion.GetLine(Spreadsheet);
    OPI_TypeConversion.GetLine(Name);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://sheets.googleapis.com/v4/spreadsheets/" + Spreadsheet + ":batchUpdate";

    Change        = New Structure("title", Name);
    ChangeRequest = New Structure("properties,fields", Change, "title");
    Request       = New Structure("updateSpreadsheetProperties", ChangeRequest);

    ArrayOfRequests = New Array;
    ArrayOfRequests.Add(Request);

    Parameters = New Structure("requests", ArrayOfRequests);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region WorkingWithSheets

// Add sheet
// Adds a new sheet to the spreadsheet
//
//
// Parameters:
// Token - String - Token - token
// Spreadsheet - String - Spreadsheet identifier - spreadsheet
// Name - String - NewSheetName - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function AddSheet(Val Token, Val Spreadsheet, Val Name) Export

    OPI_TypeConversion.GetLine(Spreadsheet);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://sheets.googleapis.com/v4/spreadsheets/" + Spreadsheet + ":batchUpdate";
    Sheet   = CreateSheet(Name);

    Requests = New Array;
    Change   = New Structure("addSheet", Sheet);
    Requests.Add(Change);

    Parameters = New Structure("requests", Requests);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Delete sheet
// Deletes a sheet from the spreadsheet
//
// Parameters:
// Token - String - Token - token
// Spreadsheet - String - Spreadsheet identifier - spreadsheet
// Sheet - String - IdentifierOfSheetToDelete - sheet
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function DeleteSheet(Val Token, Val Spreadsheet, Val Sheet) Export

    OPI_TypeConversion.GetLine(Spreadsheet);
    OPI_TypeConversion.GetLine(Sheet);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://sheets.googleapis.com/v4/spreadsheets/" + Spreadsheet + ":batchUpdate";

    Requests = New Array;
    Sheet    = New Structure("sheetId" , Sheet);
    Change   = New Structure("deleteSheet", Sheet);
    Requests.Add(Change);

    Parameters = New Structure("requests", Requests);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Copy sheet
// Copies a sheet from one spreadsheet to another
//
// Parameters:
// Token - String - Token - token
// From - String - Source spreadsheet ID - from
// Target - String - Destination spreadsheet ID - to
// Sheet - String - CopiedSheetID - sheet
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function CopySheet(Val Token, Val From, Val Target, Val Sheet) Export

    OPI_TypeConversion.GetLine(From);
    OPI_TypeConversion.GetLine(Target);
    OPI_TypeConversion.GetLine(Sheet);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://sheets.googleapis.com/v4/spreadsheets/"
        + From
        + "/sheets/"
        + Sheet
        + ":copyTo";

    Parameters = New Structure("destinationSpreadsheetId", Target);
    Response   = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region DataManagement

// Set cell values
// Sets sheet cell values
//
// Parameters:
// Token - String - Token - token
// Spreadsheet - String - SpreadsheetID - spreadsheet
// ValueMapping - Map Of KeyAndValue - Fill data where the key is the cell name like A1 - data
// Sheet - String - Sheet name (first sheet by default) - sheetname
// MajorDimension - String - Main dimension when filling the array range - dim
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function SetCellValues(Val Token
    , Val Spreadsheet
    , Val ValueMapping
    , Val Sheet = ""
    , Val MajorDimension = "COLUMNS") Export

    OPI_TypeConversion.GetLine(Spreadsheet);
    OPI_TypeConversion.GetCollection(ValueMapping);

    If Not TypeOf(ValueMapping)      = Type("Structure")
        And Not TypeOf(ValueMapping) = Type("Map") Then
        Return "Failed to convert the structure of values to a collection";
    EndIf;

    Headers   = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Spreadsheet + "/values:batchUpdate";
    DataArray = FormCellDataArray(ValueMapping, MajorDimension, Sheet);

    Parameters = New Structure("data,valueInputOption", DataArray, "USER_ENTERED");
    Response   = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Clear cells
// Clears the value in cells
//
// Parameters:
// Token - String - Token - token
// Spreadsheet - String - SpreadsheetID - spreadsheet
// CellsArray - Array of String - Array of cells like A1 to be cleared - cells
// Sheet - String - Sheet name (first sheet by default) - sheetname
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function ClearCells(Val Token, Val Spreadsheet, Val CellsArray, Val Sheet = "") Export

    OPI_TypeConversion.GetLine(Spreadsheet);
    OPI_TypeConversion.GetCollection(CellsArray);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://sheets.googleapis.com/v4/spreadsheets/" + Spreadsheet + "/values:batchClear";

    FormCellNameArray(CellsArray, Sheet);

    Parameters = New Structure("ranges", CellsArray);
    Response   = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get cell values
// Gets cell values of the table
//
// Parameters:
// Token - String - Token - token
// Spreadsheet - String - SpreadsheetID - spreadsheet
// CellsArray - Array of String - Array of A1 type cells to get (whole sheet if not filled) - cells
// Sheet - String - Sheet name (first sheet by default) - sheetname
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetCellValues(Val Token, Val Spreadsheet, Val CellsArray = "", Val Sheet = "") Export

    OPI_TypeConversion.GetLine(Spreadsheet);

    Headers = OPI_GoogleWorkspace.GetAuthorizationHeader(Token);
    URL     = "https://sheets.googleapis.com/v4/spreadsheets/" + Spreadsheet + "/values:batchGet";

    If ValueIsFilled(CellsArray) Then

        OPI_TypeConversion.GetCollection(CellsArray);
        FormCellNameArray(CellsArray, Sheet);
        First = True;

        For Each Cell In CellsArray Do

            Delimiter = ?(First, "?", "&");
            URL = URL + Delimiter + "ranges=" + Cell;
            First     = False;

        EndDo;

    Else

        URL = URL + "?ranges='" + Sheet + "'";

    EndIf;

    Response = OPI_HTTPRequests.Get(URL, , Headers);

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
    Sheet           = New Structure("properties", SheetProperties);

    Return Sheet;

EndFunction

Function FormCellDataArray(Val ValueStructure, Val MajorDimension, Val Sheet)

    OPI_TypeConversion.GetLine(Sheet);

    DataArray = New Array;

    For Each CellData In ValueStructure Do

        CurrentValue = CellData.Value;
        CurrentKey   = CellData.Key;

        AddSheetName(CurrentKey, Sheet);

        OPI_TypeConversion.GetArray(CurrentValue);

        CurrentData  = New Map;
        CurrentArray = New Array;

        CurrentArray.Add(CurrentValue);

        OPI_Tools.AddField("range"         , CurrentKey    , "String", CurrentData);
        OPI_Tools.AddField("values"        , CurrentArray  , "Array" , CurrentData);
        OPI_Tools.AddField("majorDimension", MajorDimension, "String", CurrentData);

        DataArray.Add(CurrentData);

    EndDo;

    Return DataArray;

EndFunction

Procedure FormCellNameArray(Val ArrayOfNames, Val Sheet)

   OPI_TypeConversion.GetLine(Sheet);

   For N = 0 To ArrayOfNames.UBound() Do
       AddSheetName(ArrayOfNames[N], Sheet);
   EndDo;

EndProcedure

#EndRegion

#Region Alternate

Function СформироватьСсылкуПолученияКода(Val ClientID, Val Calendar = True, Val Drive = True, Val Sheets = True) Export
	Return FormCodeRetrievalLink(ClientID, Calendar, Drive, Sheets);
EndFunction

Function ПолучитьТокенПоКоду(Val ClientID, Val ClientSecret, Val Code) Export
	Return GetTokenByCode(ClientID, ClientSecret, Code);
EndFunction

Function ОбновитьТокен(Val ClientID, Val ClientSecret, Val RefreshToken) Export
	Return RefreshToken(ClientID, ClientSecret, RefreshToken);
EndFunction

Function ПолучитьТокенServiceАккаунта(Val Данные, Val ОбластиДействия, Val ВремяЖизни = 3600) Export
	Return GetServiceAccountToken(Данные, ОбластиДействия, ВремяЖизни);
EndFunction

Function СоздатьКнигу(Val Токен, Val Наименование, Val МассивИменЛистов) Export
	Return CreateSpreadsheet(Токен, Наименование, МассивИменЛистов);
EndFunction

Function ПолучитьКнигу(Val Токен, Val Идентификатор) Export
	Return GetSpreadsheet(Токен, Идентификатор);
EndFunction

Function ИзменитьНаименованиеКниги(Val Токен, Val Книга, Val Наименование) Export
	Return EditSpreadsheetTitle(Токен, Книга, Наименование);
EndFunction

Function ДобавитьЛист(Val Токен, Val Книга, Val Наименование) Export
	Return AddSheet(Токен, Книга, Наименование);
EndFunction

Function УдалитьЛист(Val Токен, Val Книга, Val Лист) Export
	Return DeleteSheet(Токен, Книга, Лист);
EndFunction

Function КопироватьЛист(Val Токен, Val Откуда, Val Куда, Val Лист) Export
	Return CopySheet(Токен, Откуда, Куда, Лист);
EndFunction

Function УстановитьЗначенияЯчеек(Val Токен, Val Книга, Val СоответствиеЗначений, Val Лист = "", Val ОсновноеИзмерение = "COLUMNS") Export
	Return SetCellValues(Токен, Книга, СоответствиеЗначений, Лист, ОсновноеИзмерение);
EndFunction

Function ОчиститьЯчейки(Val Токен, Val Книга, Val МассивЯчеек, Val Лист = "") Export
	Return ClearCells(Токен, Книга, МассивЯчеек, Лист);
EndFunction

Function ПолучитьЗначенияЯчеек(Val Токен, Val Книга, Val МассивЯчеек = "", Val Лист = "") Export
	Return GetCellValues(Токен, Книга, МассивЯчеек, Лист);
EndFunction

#EndRegion