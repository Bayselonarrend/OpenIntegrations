// OneScript: ./OInt/core/Modules/OPI_Notion.os
// Lib: Notion
// CLI: notion
// Keywords: notion

// DocsCategory: Calendar
// DocsNameRU: Notion
// DocsNameEN: Notion

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region PageManagement

// Create page
// Creates a child page above another parent page
//
// Parameters:
// Token - String - Token - token
// Parent - String - Parent ID - page
// Title - String - Page title - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function CreatePage(Val Token, Val Parent, Val Title) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Parent);
    OPI_TypeConversion.GetLine(Title);

    Headers    = CreateRequestHeaders(Token);
    Properties = New Structure;
    Parameters = New Structure;

    AddPageHeader(Title, Properties);
    AddPageParent(Parent, False, Parameters);

    Parameters.Insert("properties", Properties);

    Response = OPI_HTTPRequests.PostWithBody("https://api.notion.com/v1/pages", Parameters, Headers);

    Return Response;

EndFunction

// Create page in database
// Creates a page in the parent database
//
// Parameters:
// Token - String - Token - token
// Parent - String - Parent database ID - base
// Data - Map Of KeyAndValue - Properties map - data
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function CreatePageInDatabase(Val Token, Val Parent, Val Data) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Parent);
    OPI_TypeConversion.GetCollection(Data);

    Headers    = CreateRequestHeaders(Token);
    Parameters = New Structure;

    AddPageParent(Parent, True, Parameters);

    Properties = FillDataBySchema(Parent, Data, Token);
    Parameters.Insert("properties", Properties);

    Response = OPI_HTTPRequests.PostWithBody("https://api.notion.com/v1/pages", Parameters, Headers);

    Return Response;

EndFunction

// Get page
// Gets information about the page by ID
//
// Parameters:
// Token - String - Token - token
// Page - String - Page ID - page
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function GetPage(Val Token, Val Page) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Page);

    Headers = CreateRequestHeaders(Token);
    ConvertID(Page);

    Response = OPI_HTTPRequests.Get("https://api.notion.com/v1/pages/" + Page, , Headers);

    Return Response;

EndFunction

// Edit page properties
// Changes the properties of an existing page
//
// Parameters:
// Token - String - Token - token
// Page - String - ID of the page being modified - page
// Data - Map Of KeyAndValue - Map of editable parameters - data
// Icon - String - URL of the page icon image - icon
// Cover - String - URL of the page cover image - cover
// Archived - Boolean - Archive page or not (boolean) - archive
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function EditPageProperties(Val Token
    , Val Page
    , Val Data = ""
    , Val Icon = ""
    , Val Cover = ""
    , Val Archived = False) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Page);
    OPI_TypeConversion.GetLine(Icon);
    OPI_TypeConversion.GetLine(Cover);
    OPI_TypeConversion.GetBoolean(Archived);
    OPI_TypeConversion.GetCollection(Data);

    Headers    = CreateRequestHeaders(Token);
    Parameters = New Structure;
    Files      = "files";

    If ValueIsFilled(Data)
        And (TypeOf(Data) = Type("Map") Or TypeOf(Data) = Type("Structure")) Then
        Properties        = FillDataBySchema(Page, Data, Token, False);
    Else
        Properties        = New Map;
    EndIf;

    If ValueIsFilled(Icon) Then
        IconMap = New Map;
        IconMap.Insert("Icon", Icon);

        IconObject = ConvertValueByType(Files, IconMap);
        IconObject = IconObject[Files][0];
        IconObject.Delete("name");

        Parameters.Insert("icon", IconObject);
    EndIf;

    If ValueIsFilled(Cover) Then
        CoverMap = New Map;
        CoverMap.Insert("Cover", Cover);

        CoverObject = ConvertValueByType(Files, CoverMap);
        CoverObject = CoverObject[Files][0];
        CoverObject.Delete("name");

        Parameters.Insert("cover", CoverObject);
    EndIf;

    Parameters.Insert("properties", Properties);
    Parameters.Insert("archived"  , Archived);

    ConvertID(Page);

    Response = OPI_HTTPRequests.PatchWithBody("https://api.notion.com/v1/pages/" + Page, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region DatabaseManagement

// Create database
// Creates a database
//
// Parameters:
// Token - String - Token - token
// Parent - String - Parent page ID - page
// Title - String - Database title - title
// Properties - Structure Of String - Database properties - props
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function CreateDatabase(Val Token, Val Parent, Val Title, Val Properties = "") Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Parent);
    OPI_TypeConversion.GetLine(Title);
    OPI_TypeConversion.GetCollection(Properties);

    // Example structure/property map

    // Name : title
    // Description : rich_text
    // InProgress : checkbox
    // Count    : number
    // Date : date
    // Status : Map
    // Active : green
    // Inactive    : red
    // Archive : yellow

    // All pages created as children must have parent base properties

    If Not TypeOf(Properties) = Type("Structure") And Not TypeOf(Properties) = Type("Map") Then
        Properties            = New Structure("Name", "title");
    EndIf;

    Headers    = CreateRequestHeaders(Token);
    Parameters = New Structure;

    AddDatabaseParent(Parent, False, Parameters);
    AddDatabaseHeader(Title, Parameters);
    AddDatabaseProperties(Properties, Parameters);

    Response = OPI_HTTPRequests.PostWithBody("https://api.notion.com/v1/databases", Parameters, Headers);

    Return Response;

EndFunction

// Get database
// Get database information
//
// Parameters:
// Token - String - Token - token
// Base - String - Database ID - base
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function GetDatabase(Val Token, Val Base) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Base);

    Headers = CreateRequestHeaders(Token);
    ConvertID(Base);

    Response = OPI_HTTPRequests.Get("https://api.notion.com/v1/databases/" + Base, , Headers);

    Return Response;

EndFunction

// Edit database properties
// Edits properties of an existing database
//
// Parameters:
// Token - String - Token - token
// Base - String - Target database ID - base
// Properties - Map of KeyAndValue - New or modified database properties - props
// Title - String - New database title - title
// Description - String - New database description - description
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function EditDatabaseProperties(Val Token, Val Base, Val Properties = "", Val Title = "", Val Description = "") Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Title);
    OPI_TypeConversion.GetLine(Description);
    OPI_TypeConversion.GetCollection(Properties);

    Parameters = New Structure;
    Headers    = CreateRequestHeaders(Token);
    ConvertID(Base);

    If ValueIsFilled(Title) Then
        AddDatabaseHeader(Title, Parameters);
    EndIf;

    If ValueIsFilled(Description) Then
        AddDatabaseDescription(Description, Parameters);
    EndIf;

    If TypeOf(Properties) = Type("Structure") Or TypeOf(Properties) = Type("Map") Then
        AddDatabaseProperties(Properties, Parameters);
    EndIf;

    Response = OPI_HTTPRequests.PatchWithBody("https://api.notion.com/v1/databases/" + Base, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region BlocksManagement

// Create block
// Creates a new block based on an existing block
//
// Parameters:
// Token - String - Token - token
// Parent - String - Parent block or page ID - page
// Block - String, Map Of KeyAndValue - Block ID or block sample itself - block
// InsertAfter - String - Block ID after which to insert the new one - prev
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function CreateBlock(Val Token, Val Parent, Val Block, Val InsertAfter = "") Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Parent);
    OPI_TypeConversion.GetLine(InsertAfter);
    OPI_TypeConversion.GetCollection(Block);

    If TypeOf(Block) = Type("Array") Then
        Block        = Block[0];
    EndIf;

    Headers = CreateRequestHeaders(Token);
    ConvertID(Parent);

    If TypeOf(Block) = Type("String") Then
        ConvertID(Block);
        Block        = ReturnBlock(Token, Block);
    EndIf;

    BlockArray = New Array;
    BlockArray.Add(Block);

    Parameters = New Map;
    Parameters.Insert("children", BlockArray);

    If ValueIsFilled(InsertAfter) Then
        Parameters.Insert("after", InsertAfter);
    EndIf;

    URL      = "https://api.notion.com/v1/blocks/" + Parent + "/children";
    Response = OPI_HTTPRequests.PatchWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Return block
// Returns the block structure by ID
//
// Parameters:
// Token - String - Token - token
// BlockID - String - Block ID - block
// OnlyBase - Boolean - True > service fields are deleted, only the block itself remains - core
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function ReturnBlock(Val Token, Val BlockID, Val OnlyBase = True) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(BlockID);
    OPI_TypeConversion.GetBoolean(OnlyBase);

    ConvertID(BlockID);

    Headers  = CreateRequestHeaders(Token);
    Response = OPI_HTTPRequests.Get("https://api.notion.com/v1/blocks/" + BlockID, , Headers);

    If OnlyBase Then
        RemoveExtraBlockFields(Response);
    EndIf;

    Return Response;

EndFunction

// Return child blocks
// Returns list of child blocks of parent block
//
// Parameters:
// Token - String - Token - token
// BlockID - String - Parent block ID - block
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function ReturnChildBlocks(Val Token, Val BlockID) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(BlockID);

    ConvertID(BlockID);

    Headers  = CreateRequestHeaders(Token);
    Response = OPI_HTTPRequests.Get("https://api.notion.com/v1/blocks/" + BlockID + "/children", , Headers);

    Return Response;

EndFunction

// Delete block
// Deletes block by ID
//
// Parameters:
// Token - String - Token - token
// BlockID - String - Block ID - block
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function DeleteBlock(Val Token, Val BlockID) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(BlockID);

    ConvertID(BlockID);

    Headers  = CreateRequestHeaders(Token);
    Response = OPI_HTTPRequests.Delete("https://api.notion.com/v1/blocks/" + BlockID, , Headers);

    Return Response;

EndFunction

#EndRegion

#Region Users

// User list
// Returns a list of workspace users
//
// Parameters:
// Token - String - Token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function UserList(Val Token) Export

    OPI_TypeConversion.GetLine(Token);

    Headers  = CreateRequestHeaders(Token);
    Response = OPI_HTTPRequests.Get("https://api.notion.com/v1/users", , Headers);

    Return Response;

EndFunction

// Get user data
// Gets user data by ID
//
// Parameters:
// Token - String - Token - token
// UserID - String - Target user ID - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Notion
Function GetUserData(Val Token, Val UserID) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(UserID);

    ConvertID(UserID);

    Headers  = CreateRequestHeaders(Token);
    Response = OPI_HTTPRequests.Get("https://api.notion.com/v1/users/" + UserID, , Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function CreateRequestHeaders(Val Token)

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Authorization" , "Bearer " + Token);
    Headers.Insert("Notion-Version", "2022-06-28");

    Return Headers;

EndFunction

Procedure ConvertID(Identifier)

    OPI_TypeConversion.GetLine(Identifier);

    Identifier = StrReplace(Identifier, "-", "");

EndProcedure

Procedure AddPageParent(Val Parent, Val ParentBase, MainStructure)

    OPI_TypeConversion.GetLine(ParentBase);

    ConvertID(Parent);

    IdentifierField = ?(ParentBase, "database_id", "page_id");
    ParentStructure = New Structure(IdentifierField, Parent);

    MainStructure.Insert("parent", ParentStructure);

EndProcedure

Procedure AddDatabaseParent(Val Parent, Val ParentBase, MainStructure)

    OPI_TypeConversion.GetLine(ParentBase);

    ConvertID(Parent);

    IdentifierField = ?(ParentBase, "database_id", "page_id");

    ParentStructure = New Structure();
    ParentStructure.Insert("type"         , IdentifierField);
    ParentStructure.Insert(IdentifierField, Parent);

    MainStructure.Insert("parent", ParentStructure);

EndProcedure

Procedure AddPageHeader(Val Title, MainStructure)

    OPI_TypeConversion.GetLine(Title);

    SubordinateStructure = New Structure;
    DataStructure        = New Structure;
    TextStructure        = New Structure;
    DataArray            = New Array;
    Title                = "title";

    TextStructure.Insert("content", Title);
    TextStructure.Insert("link"   , Undefined);

    DataStructure.Insert("text", TextStructure);
    DataStructure.Insert("type", "text");

    DataArray.Add(DataStructure);

    SubordinateStructure.Insert("id"   , Title);
    SubordinateStructure.Insert("type" , Title);
    SubordinateStructure.Insert(Title  , DataArray);

    MainStructure.Insert(Title, SubordinateStructure);

EndProcedure

Procedure AddDatabaseHeader(Val Title, MainStructure)

    OPI_TypeConversion.GetLine(Title);

    Title = ConvertHeader(Title);
    MainStructure.Insert("title", Title["title"]);

EndProcedure

Procedure AddDatabaseDescription(Val Description, MainStructure)

    OPI_TypeConversion.GetLine(Description);

    Title = ConvertHeader(Description);
    MainStructure.Insert("description", Title["title"]);

EndProcedure

Procedure AddDatabaseProperties(Val Properties, MainStructure)

    If Properties.Count() = 0 Then
       MainStructure.Insert("properties", New Structure);
       Return;
    EndIf;

    ParameterMap = New Map;

    For Each Property In Properties Do

        If TypeOf(Property.Value) = Type("String") Then

           ParameterMap.Insert(Property.Key, New Structure(Property.Value, New Structure));

        ElsIf TypeOf(Property.Value)  = Type("Structure")
            Or TypeOf(Property.Value) = Type("Map") Then

            ValueSelection = FormSelectionValues(Property.Value);
            ParameterMap.Insert(Property.Key, New Structure("select", ValueSelection));

        Else

            ParameterMap.Insert(Property.Key, Property.Value);

        EndIf;

    EndDo;

    MainStructure.Insert("properties", ParameterMap);

EndProcedure

Function FormSelectionValues(Val VariantStructure)

    OptionArray = New Array;

    For Each Option In VariantStructure Do

        OptionMap = New Map;
        OptionMap.Insert("name" , Option.Key);
        OptionMap.Insert("color", Option.Value);

        OptionArray.Add(OptionMap);

    EndDo;

    Return New Structure("options", OptionArray);

EndFunction

Function FillDataBySchema(Val Scheme, Val Data, Val Token, Val ThisIsBase = True)

    If ThisIsBase Then
        SchemaData = GetDatabase(Token, Scheme);
    Else
        SchemaData = GetPage(Token, Scheme);
    EndIf;

    BaseFields = SchemaData["properties"];
    Properties = New Map;

    If ValueIsFilled(BaseFields) Then

        For Each Field In BaseFields Do

            FieldData = Field.Value;
            FieldType = FieldData["type"];

            FillableData = Data.Get(Field.Key);

            If FillableData = Undefined Then
                Continue;
            EndIf;

            ConvertedData = ConvertValueByType(FieldType, FillableData);

            If ConvertedData = Undefined Then
                Continue;
            EndIf;

            Properties.Insert(FieldData["id"], ConvertedData);

        EndDo;

    EndIf;

    Return Properties;

EndFunction

Procedure RemoveExtraBlockFields(Val Block)

    ExtraArray = New Array;
    ExtraArray.Add("request_id");
    ExtraArray.Add("archived");
    ExtraArray.Add("created_by");
    ExtraArray.Add("last_edited_time");
    ExtraArray.Add("created_time");
    ExtraArray.Add("has_children");
    ExtraArray.Add("parent");
    ExtraArray.Add("last_edited_by");
    ExtraArray.Add("id");

    For Each Field In ExtraArray Do

        If Not Block.Get(Field) = Undefined Then
            Block.Delete(Field);
        EndIf;

    EndDo;

EndProcedure

#Region TypeConversion

Function ConvertValueByType(Val Type, Val Value)

    If Type    = "title" Then
        Return ConvertHeader(Value);
    ElsIf Type = "rich_text" Then
        Return ConvertText(Value);
    ElsIf Type = "number" Then
        Return ConvertNumber(Value);
    ElsIf Type = "select" Then
        Return ConvertSelectionOption(Value);
    ElsIf Type = "multi_select" Then
        Return ConvertMultipleChoice(Value);
    ElsIf Type = "status" Then
        Return ConvertStatus(Value);
    ElsIf Type = "date" Then
        Return ConvertDate(Value);
    ElsIf Type = "relation" Then
        Return ConvertLink(Value);
    ElsIf Type = "people" Then
        Return ConvertUsers(Value);
    ElsIf Type = "files" Then
        Return ConvertFiles(Value);
    ElsIf Type = "checkbox" Then
        Return ConvertBoolean(Value);
    ElsIf Type = "url" Then
        Return ConvertURL(Value);
    ElsIf Type = "email" Then
        Return ConvertEmail(Value);
    ElsIf Type = "phone_number" Then
        Return ConvertPhone(Value);
    Else
        Return Undefined;
    EndIf;

EndFunction

Function ConvertHeader(Val Title)

    DataStructure = New Structure;
    TextStructure = New Structure;
    DataArray     = New Array;

    TextStructure.Insert("content", Title);
    TextStructure.Insert("link"   , Undefined);

    DataStructure.Insert("type", "text");
    DataStructure.Insert("text", TextStructure);

    DataArray.Add(DataStructure);

    Return New Structure("title", DataArray);

EndFunction

Function ConvertText(Val Text)

    TextArray     = New Array;
    TextStructure = New Structure;

    TextStructure.Insert("type", "text");
    TextStructure.Insert("text", New Structure("content", Text));

    TextArray.Add(TextStructure);

    Return New Structure("rich_text", TextArray);

EndFunction

Function ConvertNumber(Val Number)
    Return New Structure("number", Number);
EndFunction

Function ConvertSelectionOption(Val Option)

    ChoiceStructure = New Structure;
    ChoiceStructure.Insert("select", New Structure("name", Option));

    Return ChoiceStructure;

EndFunction

Function ConvertStatus(Val Status)

    StatusStructure = New Structure;
    StatusStructure.Insert("status", New Structure("name", Status));

    Return StatusStructure;

EndFunction

Function ConvertMultipleChoice(Val OptionArray)

    ChoiceOptionArray = New Array;

    For Each Option In OptionArray Do
        ChoiceOptionArray.Add(New Structure("name", Option));
    EndDo;

    Return New Structure("multi_select", ChoiceOptionArray);

EndFunction

Function ConvertDate(Val Date)

    DateStructure = New Structure;

    If Date = BegOfDay(Date) Then
        DateFormat = "DF=yyyy-MM-dd";
    Else
        DateFormat = "DF=yyyy-MM-ddThh:mm:ssZ";
    EndIf;

    Date = Format(Date, DateFormat);
    DateStructure.Insert("start", Date);

    Return New Structure("date", DateStructure);

EndFunction

Function ConvertLink(Val Identifier)

    LinkArray = New Array;
    LinkArray.Add(New Structure("id", Identifier));

    Return New Structure("relation", LinkArray);

EndFunction

Function ConvertUsers(Val IDArray)

    If Not TypeOf(IDArray) = Type("Array") Then
        ArrayID_           = New Array;
        ArrayID_.Add(IDArray);
        IDArray            = ArrayID_;
    EndIf;

    ArrayOfUsers = New Array;

    For Each Identifier In IDArray Do

        UserStructure = New Structure;
        UserStructure.Insert("object", "user");
        UserStructure.Insert("id"    , Identifier);
        ArrayOfUsers.Add(UserStructure);

    EndDo;

    Return New Structure("people", ArrayOfUsers);

EndFunction

Function ConvertFiles(Val FileMapping)

    ArrayOfFiles = New Array;

    For Each File In FileMapping Do

        FileStructure = New Structure;
        FileStructure.Insert("type"    , "external");
        FileStructure.Insert("name"    , File.Key);
        FileStructure.Insert("external", New Structure("url", File.Value));

        ArrayOfFiles.Add(FileStructure);

    EndDo;

    Return New Structure("files", ArrayOfFiles);

EndFunction

Function ConvertBoolean(Val Boolean)
    Return New Structure("checkbox", Boolean);
EndFunction

Function ConvertURL(Val URL)
    Return New Structure("url", URL);
EndFunction

Function ConvertEmail(Val Email)
    Return New Structure("email", Email);
EndFunction

Function ConvertPhone(Val Phone)
    Return New Structure("phone_number", Phone);
EndFunction

#EndRegion

#EndRegion

#Region Alternate

Function СоздатьСтраницу(Val Токен, Val Родитель, Val Заголовок) Export
	Return CreatePage(Токен, Родитель, Заголовок);
EndFunction

Function СоздатьСтраницуВБазу(Val Токен, Val Родитель, Val Данные) Export
	Return CreatePageInDatabase(Токен, Родитель, Данные);
EndFunction

Function ПолучитьСтраницу(Val Токен, Val Страница) Export
	Return GetPage(Токен, Страница);
EndFunction

Function ИзменитьСвойстваСтраницы(Val Токен, Val Страница, Val Данные = "", Val Иконка = "", Val Обложка = "", Val Архивирована = False) Export
	Return EditPageProperties(Токен, Страница, Данные, Иконка, Обложка, Архивирована);
EndFunction

Function СоздатьБазуДанных(Val Токен, Val Родитель, Val Заголовок, Val Свойства = "") Export
	Return CreateDatabase(Токен, Родитель, Заголовок, Свойства);
EndFunction

Function ПолучитьБазуДанных(Val Токен, Val База) Export
	Return GetDatabase(Токен, База);
EndFunction

Function ИзменитьСвойстваБазы(Val Токен, Val База, Val Свойства = "", Val Заголовок = "", Val Описание = "") Export
	Return EditDatabaseProperties(Токен, База, Свойства, Заголовок, Описание);
EndFunction

Function СоздатьБлок(Val Токен, Val Родитель, Val Блок, Val ВставитьПосле = "") Export
	Return CreateBlock(Токен, Родитель, Блок, ВставитьПосле);
EndFunction

Function ВернутьБлок(Val Токен, Val ИДБлока, Val ТолькоОснова = True) Export
	Return ReturnBlock(Токен, ИДБлока, ТолькоОснова);
EndFunction

Function ВернутьДочерниеБлоки(Val Токен, Val ИДБлока) Export
	Return ReturnChildBlocks(Токен, ИДБлока);
EndFunction

Function УдалитьБлок(Val Токен, Val ИДБлока) Export
	Return DeleteBlock(Токен, ИДБлока);
EndFunction

Function СписокПользователей(Val Токен) Export
	Return UserList(Токен);
EndFunction

Function ПолучитьДанныеПользователя(Val Токен, Val ИДПользователя) Export
	Return GetUserData(Токен, ИДПользователя);
EndFunction

#EndRegion