// OneScript: ./OInt/api/airtable/Modules/OPI_Airtable.os
// Lib: Airtable
// CLI: airtable
// Keywords: airtable

// DocsCategory: Database
// DocsNameRU: Airtable
// DocsNameEN: Airtable

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

// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

//#Use "../../../tools/main"
//#Use "../../../tools/http"

#Region Public

#Region WorkingWithDatabases

// Get list of bases
// Gets the list of available bases
//
// Parameters:
// Token  - String - Token                                                           - token
// Indent - String - Next page identifier of the base list from the previous request - offset
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function GetListOfBases(Val Token, Val Indent = "") Export

    OPI_TypeConversion.GetLine(Indent);

    URL        = "https://api.airtable.com/v0/meta/bases";
    Headers    = GetAuthorizationHeader(Token);
    Parameters = New Structure;

    OPI_Tools.AddField("offset", Indent, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get base tables
// Gets the schema of base tables
//
// Parameters:
// Token - String - Token           - token
// Base  - String - Base identifier - base
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function GetDatabaseTables(Val Token, Val Base) Export

    OPI_TypeConversion.GetLine(Base);

    URL     = "https://api.airtable.com/v0/meta/bases/" + Base + "/tables";
    Headers = GetAuthorizationHeader(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Create base
// Creates a new database
//
// Parameters:
// Token           - String             - Token                                                  - token
// Workspace       - String             - Workspace identifier                                   - ws
// Name            - String             - New base name                                          - title
// TableCollection - Map Of KeyAndValue - Table description: Key > name, Value > array of fields - tablesdata
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function CreateDatabase(Val Token, Val Workspace, Val Name, Val TableCollection) Export

    OPI_TypeConversion.GetCollection(TableCollection);

    If Not TypeOf(TableCollection)      = Type("Structure")
        And Not TypeOf(TableCollection) = Type("Map") Then

        Raise "Error in table collection data";

    EndIf;

    URL        = "https://api.airtable.com/v0/meta/bases";
    Headers    = GetAuthorizationHeader(Token);
    TableArray = New Array;

    For Each Table In TableCollection Do

        Description = GenerateTableDescription(Table.Key, Table.Value);
        TableArray.Add(Description);

    EndDo;

    Parameters = New Structure;
    OPI_Tools.AddField("name"       , Name       , "String", Parameters);
    OPI_Tools.AddField("tables"     , TableArray , "Array" , Parameters);
    OPI_Tools.AddField("workspaceId", Workspace  , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region TableManagement

// Create table
// Creates a new table in the base
//
// Parameters:
// Token       - String             - Token                       - token
// Base        - String             - Base identifier             - base
// Name        - String             - New table name              - title
// FieldArray  - Array of Structure - Array of field descriptions - fieldsdata
// Description - String             - Table description           - description
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function CreateTable(Val Token, Val Base, Val Name, Val FieldArray, Val Description = "") Export

    OPI_TypeConversion.GetLine(Base);

    URL        = "https://api.airtable.com/v0/meta/bases/" + Base + "/tables";
    Headers    = GetAuthorizationHeader(Token);
    Parameters = GenerateTableDescription(Name, FieldArray, Description);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Modify table
// Changes the name and/or description of the base
//
// Parameters:
// Token       - String - Token            - token
// Base        - String - Base identifier  - base
// Table       - String - Table identifier - table
// Name        - String - New name         - title
// Description - String - New description  - description
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function ModifyTable(Val Token, Val Base, Val Table, Val Name = "", Val Description = "") Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);

    URL        = "https://api.airtable.com/v0/meta/bases/" + Base + "/tables/" + Table;
    Headers    = GetAuthorizationHeader(Token);
    Parameters = New Structure;

    OPI_Tools.AddField("name"       , Name        , "String", Parameters);
    OPI_Tools.AddField("description", Description , "String", Parameters);

    Response = OPI_HTTPRequests.PatchWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region WorkingWithFields

// Create field
// Creates a new field in the table
//
// Parameters:
// Token          - String                   - Token                        - token
// Base           - String                   - Base identifier              - base
// Table          - String                   - Table identifier             - table
// FieldStructure - Structure Of KeyAndValue - Description of the new field - fielddata
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function CreateField(Val Token, Val Base, Val Table, Val FieldStructure) Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetCollection(FieldStructure);

    If Not TypeOf(FieldStructure)      = Type("Structure")
        And Not TypeOf(FieldStructure) = Type("Map") Then

        Raise "Error in field description data";

    EndIf;

    URL     = "https://api.airtable.com/v0/meta/bases/" + Base + "/tables/" + Table + "/fields";
    Headers = GetAuthorizationHeader(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, FieldStructure, Headers);

    Return Response;

EndFunction

// Modify field
// Changes the name and/or description of an existing table field
//
// Parameters:
// Token       - String - Token                - token
// Base        - String - Base identifier Base - base
// Table       - String - Table identifier     - table
// Field       - String - Field identifier     - field
// Name        - String - New name             - title
// Description - String - New description      - description
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function ModifyField(Val Token, Val Base, Val Table, Val Field, Val Name = "", Val Description = "") Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetLine(Field);

    URL = "https://api.airtable.com/v0/meta/bases/"
        + Base
        + "/tables/"
        + Table
        + "/fields/"
        + Field;

    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure();
    OPI_Tools.AddField("name"       , Name        , "String", Parameters);
    OPI_Tools.AddField("description", Description , "String", Parameters);

    Response = OPI_HTTPRequests.PatchWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get field (string)
// Gets the description of a string field
//
// Parameters:
// Name - String - New field name - title
//
// Returns:
// Structure - Field description
Function GetStringField(Val Name) Export

    Return PrimitiveFieldDescription(Name, "richText");

EndFunction

// Get field (numeric)
// Gets the description of a numeric field
//
// Parameters:
// Name      - String         - New field name           - title
// Precision - Number, String - Number of decimal places - precision
//
// Returns:
// Structure - Field description
Function GetNumberField(Val Name, Val Precision = 0) Export

    OPI_TypeConversion.GetNumber(Precision);

    OptionsStructure = New Structure("precision", Precision);
    Return PrimitiveFieldDescription(Name, "number", OptionsStructure);

EndFunction

// Get field (file)
// Gets the description of a file field
//
// Parameters:
// Name - String - Field name - title
//
// Returns:
// Structure - Field description
Function GetAttachmentField(Val Name) Export

    Return PrimitiveFieldDescription(Name, "multipleAttachments");

EndFunction

// Get field (checkbox)
// Gets the description of a boolean field
//
// Parameters:
// Name - String - Field name - title
//
// Returns:
// Structure - Field description
Function GetCheckboxField(Val Name) Export

    OptionsStructure = New Structure("icon,color", "check", "yellowBright");
    Return PrimitiveFieldDescription(Name, "checkbox", OptionsStructure);

EndFunction

// Get field (date)
// Gets the description of a date field
//
// Parameters:
// Name - String - Field name - title
//
// Returns:
// Structure - Field description
Function GetDateField(Val Name) Export

    FormatStructure  = New Structure("format,name", "YYYY-MM-DD", "iso");
    OptionsStructure = New Structure("dateFormat", FormatStructure);

    Return PrimitiveFieldDescription(Name, "date", OptionsStructure);

EndFunction

// Get field (email)
// Gets the description of an email field
//
// Parameters:
// Name - String - Field name - title
//
// Returns:
// Structure - Field description
Function GetEmailField(Val Name) Export

    Return PrimitiveFieldDescription(Name, "email");

EndFunction

// Get field (phone)
// Gets the description of a phone number field
//
// Parameters:
// Name - String - Field name - title
//
// Returns:
// Structure - Field description
Function GetPhoneField(Val Name) Export

    Return PrimitiveFieldDescription(Name, "phoneNumber");

EndFunction

// Get field (url)
// Gets the description of a URL field
//
// Parameters:
// Name - String - Field name - title
//
// Returns:
// Structure - Field description
Function GetLinkField(Val Name) Export

    Return PrimitiveFieldDescription(Name, "url");

EndFunction

#EndRegion

#Region RecordManagement

// Get list of records
// Gets the list of records of the selected table
//
// Parameters:
// Token  - String - Token                                                  - token
// Base   - String - Database identifier                                    - base
// Table  - String - Table identifier                                       - table
// Indent - String - Next page identifier of data from the previous request - offset
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function GetListOfRecords(Val Token, Val Base, Val Table, Val Indent = "") Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);

    URL     = "https://api.airtable.com/v0/" + Base + "/" + Table;
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure();
    OPI_Tools.AddField("offset", Indent, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get record
// Gets row data of the table by identifier
//
// Parameters:
// Token  - String - Token                          - token
// Base   - String - Database identifier            - base
// Table  - String - Table identifier               - table
// Record - String - Record identifier in the table - record
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function GetRecord(Val Token, Val Base, Val Table, Val Record) Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetLine(Record);

    URL     = "https://api.airtable.com/v0/" + Base + "/" + Table + "/" + Record;
    Headers = GetAuthorizationHeader(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Create records
// Creates one or an array of records by description or an array of field value descriptions
//
// Parameters:
// Token - String                        - Token                                                          - token
// Base  - String                        - Database identifier                                            - base
// Table - String                        - Table identifier                                               - table
// Data  - Structure, Array of Structure - Set or array of sets of pairs Key : Value > Field : FieldValue - data
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function CreatePosts(Val Token, Val Base, Val Table, Val Data) Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetCollection(Data);

    Parameters = New Structure();
    AddDataDescription(Data, Parameters);

    URL     = "https://api.airtable.com/v0/" + Base + "/" + Table;
    Headers = GetAuthorizationHeader(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Delete records
// Deletes one or an array of records by identifiers
//
// Parameters:
// Token   - String                  - Token                                     - token
// Base    - String                  - Database identifier                       - base
// Table   - String                  - Table identifier                          - table
// Records - String, Array of String - Identifier or array of record identifiers - records
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function DeleteRecords(Val Token, Val Base, Val Table, Val Records) Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetArray(Records);

    RecordString = "";

    For Each Record In Records Do
        RecordString = RecordString
            + ?(ValueIsFilled(RecordString), "&", "?")
            + "records[]="
            + OPI_Tools.NumberToString(Record);
    EndDo;

    URL     = "https://api.airtable.com/v0/" + Base + "/" + Table + RecordString;
    Headers = GetAuthorizationHeader(Token);

    Response = OPI_HTTPRequests.Delete(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#Region CommentManagement

// Get comments
// Gets the list of comments for a record in the table
//
// Parameters:
// Token  - String - Token                                                  - token
// Base   - String - Database identifier                                    - base
// Table  - String - Table identifier                                       - table
// Record - String - Record identifier in the table                         - record
// Indent - String - Next page identifier of data from the previous request - offset
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function GetComments(Val Token, Val Base, Val Table, Val Record, Val Indent = "") Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetLine(Record);

    URL     = "https://api.airtable.com/v0/" + Base + "/" + Table + "/" + Record + "/comments";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure();
    OPI_Tools.AddField("offset", Indent, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Create comment
// Creates a comment for a record in the table
//
// Parameters:
// Token  - String - Token                          - token
// Base   - String - Database identifier            - base
// Table  - String - Table identifier               - table
// Record - String - Record identifier in the table - record
// Text   - String - Comment text                   - text
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function CreateComment(Val Token, Val Base, Val Table, Val Record, Val Text) Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetLine(Record);

    URL     = "https://api.airtable.com/v0/" + Base + "/" + Table + "/" + Record + "/comments";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure();
    OPI_Tools.AddField("text", Text, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Modify comment
// Changes the text of an existing comment
//
// Parameters:
// Token   - String - Token                          - token
// Base    - String - Database identifier            - base
// Table   - String - Table identifier               - table
// Record  - String - Record identifier in the table - record
// Comment - String - Comment identifier             - comment
// Text    - String - New comment text               - text
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function EditComment(Val Token, Val Base, Val Table, Val Record, Val Comment, Val Text) Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetLine(Record);
    OPI_TypeConversion.GetLine(Comment);

    URL     = "https://api.airtable.com/v0/" + Base + "/" + Table + "/" + Record + "/comments/" + Comment;
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure();
    OPI_Tools.AddField("text", Text, "String", Parameters);

    Response = OPI_HTTPRequests.PatchWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Delete comment
// Deletes a comment for a table record
//
// Parameters:
// Token   - String - Token                          - token
// Base    - String - Database identifier            - base
// Table   - String - Table identifier               - table
// Record  - String - Record identifier in the table - record
// Comment - String - Comment identifier             - comment
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Airtable
Function DeleteComment(Val Token, Val Base, Val Table, Val Record, Val Comment) Export

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Table);
    OPI_TypeConversion.GetLine(Record);
    OPI_TypeConversion.GetLine(Comment);

    URL     = "https://api.airtable.com/v0/" + Base + "/" + Table + "/" + Record + "/comments/" + Comment;
    Headers = GetAuthorizationHeader(Token);

    Response = OPI_HTTPRequests.Delete(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function GetAuthorizationHeader(Val Token)

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Authorization", "Bearer " + Token);

    Return Headers;

EndFunction

Function GenerateTableDescription(Val Name, Val FieldArray, Val Description = "")

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetCollection(FieldArray);

    TableDescription = New Structure("name,fields", Name, FieldArray);

    OPI_Tools.AddField("description", Description, "String", TableDescription);

    Return TableDescription;

EndFunction

Function PrimitiveFieldDescription(Val Name, Val Type, Val Options = "")

    FieldStructure = New Structure();
    OPI_Tools.AddField("name"   , Name    , "String"    , FieldStructure);
    OPI_Tools.AddField("type"   , Type    , "String"    , FieldStructure);
    OPI_Tools.AddField("options", Options , "Collection", FieldStructure);

    Return FieldStructure;

EndFunction

Procedure AddDataDescription(Val Data, Parameters)

    If TypeOf(Data) = Type("Array") Then

        SendArray = New Array;

        For Each RecordDescription In Data Do
            SendArray.Add(New Structure("fields", RecordDescription));
        EndDo;

        OPI_Tools.AddField("records", SendArray, "Array", Parameters);

    Else

       OPI_Tools.AddField("fields", Data, "Collection", Parameters);

    EndIf;

EndProcedure

#EndRegion
