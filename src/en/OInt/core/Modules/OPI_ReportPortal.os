// OneScript: ./OInt/core/Modules/OPI_ReportPortal.os
// Lib: ReportPortal
// CLI: rportal
// Keywords: reportportal

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UnreachableCode-off
// BSLLS:CommentedCode-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfParams-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region Authorization

// Get temporary token
// Gets a temporary token based on login and password
//
// Parameters:
// URL - String - ReportPortal server URL - url
// Login - String - Users login - login
// Password - String - Users password - pass
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ReportPortal
Function GetTemporaryToken(Val URL, Val Login, Val Password) Export

    OPI_TypeConversion.GetLine(Login);
    OPI_TypeConversion.GetLine(Password);

    CompleteURL(URL, "uat/sso/oauth/token");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBasicAuthorization("ui", "uiman")
        .SetFormBody(New Structure("grant_type,username,password", "password", Login, Password))
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    Return Result;

EndFunction

// Get permanent token
// Creates a permanent ReportPortal user token
//
// Parameters:
// URL - String - ReportPortal server URL - url
// Token - String - Access token - token
// UserID - String - User ID - user
// KeyName - String - Token name - name
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ReportPortal
Function GetPermanentToken(Val URL, Val Token, Val UserID, Val KeyName) Export

    OPI_TypeConversion.GetLine(UserID);

    CompleteURL(URL, StrTemplate("api/users/%1/api-keys", UserID));

    Parameters = New Structure;
    OPI_Tools.AddField("name", KeyName, "String", Parameters);

    Headers = GetAuthorizationHeader(Token);
    Result  = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Result;

EndFunction

// Delete permanent token
// Deletes a previously created user token
//
// Parameters:
// URL - String - ReportPortal server URL - url
// Token - String - Access token - token
// UserID - String - User ID - user
// KeyID - String - Token ID - id
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ReportPortal
Function DeletePermanentToken(Val URL, Val Token, Val UserID, Val KeyID) Export

    OPI_TypeConversion.GetLine(UserID);
    OPI_TypeConversion.GetLine(KeyID);

    CompleteURL(URL, StrTemplate("api/users/%1/api-keys/%2", UserID, KeyID));

    Headers = GetAuthorizationHeader(Token);

    Result = OPI_HTTPRequests.Delete(URL, , Headers);

    Return Result;

EndFunction

#EndRegion

#Region ResultsManagement

// Create launch
// Starts a new test execution session
//
// Parameters:
// URL - String - ReportPortal server URL - url
// Token - String - Access token - token
// Project - String - Project ID - proj
// LaunchStructure - Structure Of KeyAndValue - Launch parameters. See GetLaunchStructure - params
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ReportPortal
Function CreateLaunch(Val URL, Val Token, Val Project, Val LaunchStructure) Export

    ErrorText = "Launch structure is not a valid KeyValue collection";

    OPI_TypeConversion.GetKeyValueCollection(LaunchStructure, ErrorText);
    OPI_TypeConversion.GetLine(Project);

    CompleteURL(URL, StrTemplate("api/v1/%1/launch", Project));

    Headers = GetAuthorizationHeader(Token);

    Result = OPI_HTTPRequests.PostWithBody(URL, LaunchStructure, Headers);

    Return Result;

EndFunction

// Create item
// Creates a new test item
//
// Parameters:
// URL - String - ReportPortal server URL - url
// Token - String - Access token - token
// Project - String - Project ID - proj
// ElementStructure - Structure Of KeyAndValue - Item parameters. See GetItemStructure - params
// Parent - String - ID of the parent item, if necessary - parent
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ReportPortal
Function CreateItem(Val URL, Val Token, Val Project, Val ElementStructure, Val Parent = "") Export

    ErrorText = "Element structure is not a valid KeyValue collection";

    OPI_TypeConversion.GetKeyValueCollection(ElementStructure, ErrorText);
    OPI_TypeConversion.GetLine(Project);
    OPI_TypeConversion.GetLine(Parent);

    Parent = ?(ValueIsFilled(Parent), "/" + Parent, "");

    CompleteURL(URL, StrTemplate("api/v1/%1/item%2", Project, Parent));

    Headers = GetAuthorizationHeader(Token);

    Result = OPI_HTTPRequests.PostWithBody(URL, ElementStructure, Headers);

    Return Result;

EndFunction

// Finish launch
// Ends a previously started test execution session
//
// Parameters:
// URL - String - ReportPortal server URL - url
// Token - String - Access token - token
// Project - String - Project ID - proj
// LaunchID - String - Launch ID - id
// FinishStructure - Structure Of KeyAndValue - Completion parameters. See GetLaunchCompletionStructure - params
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ReportPortal
Function FinishLaunch(Val URL, Val Token, Val Project, Val LaunchID, Val FinishStructure) Export

    ErrorText = "Completion structure is not a valid KeyValue collection";

    OPI_TypeConversion.GetKeyValueCollection(FinishStructure, ErrorText);
    OPI_TypeConversion.GetLine(Project);
    OPI_TypeConversion.GetLine(LaunchID);

    CompleteURL(URL, StrTemplate("api/v1/%1/launch/%2/finish", Project, LaunchID));

    Headers = GetAuthorizationHeader(Token);

    Result = OPI_HTTPRequests.PutWithBody(URL, FinishStructure, Headers);

    Return Result;

EndFunction

// Finish item
// Ends a previously created test item
//
// Parameters:
// URL - String - ReportPortal server URL - url
// Token - String - Access token - token
// Project - String - Project ID - proj
// ElementID - String - Element ID - id
// FinishStructure - Structure Of KeyAndValue - Completion parameters. See GetItemCompletionStructure - params
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ReportPortal
Function FinishItem(Val URL, Val Token, Val Project, Val ElementID, Val FinishStructure) Export

    ErrorText = "Completion structure is not a valid KeyValue collection";

    OPI_TypeConversion.GetKeyValueCollection(FinishStructure, ErrorText);
    OPI_TypeConversion.GetLine(Project);
    OPI_TypeConversion.GetLine(ElementID);

    CompleteURL(URL, StrTemplate("api/v1/%1/item/%2", Project, ElementID));

    Headers = GetAuthorizationHeader(Token);

    Result = OPI_HTTPRequests.PutWithBody(URL, FinishStructure, Headers);

    Return Result;

EndFunction

// Get launch structure
// Gets the launch parameters structure
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// AsMap - Boolean - True > returns the filter fields as a map - map
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetLaunchStructure(Val Clear = False, Val AsMap = False) Export

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(AsMap);

    If AsMap Then
        LaunchStructure = New Map;
    Else
        LaunchStructure = New Structure;
    EndIf;

    LaunchStructure.Insert("name"       , "<launch name>");
    LaunchStructure.Insert("startTime"  , "<launch start time>");
    LaunchStructure.Insert("description", "<launch description>");
    LaunchStructure.Insert("uuid"       , "<UUID of the launch. Will be generated automatically if not filled>");
    LaunchStructure.Insert("attributes" , "<launch attributes in the form key1:value1, key2:value2>");
    LaunchStructure.Insert("mode"       , "<mode: default or debug>");
    LaunchStructure.Insert("rerun"      , "<rerun flag>");
    LaunchStructure.Insert("rerunOf"    , "<UUID of an existing launch if rerun = True>");

    If Clear Then
        LaunchStructure = OPI_Tools.ClearCollectionRecursively(LaunchStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return LaunchStructure;

EndFunction

// Get item structure
// Gets the test item parameter structure
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// AsMap - Boolean - True > returns the filter fields as a map - map
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetItemStructure(Val Clear = False, Val AsMap = False) Export

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(AsMap);

    If AsMap Then
        ElementStructure = New Map;
    Else
        ElementStructure = New Structure;
    EndIf;

    ElementStructure.Insert("name"       , "<element name>");
    ElementStructure.Insert("startTime"  , "<start time>");
    ElementStructure.Insert("type"       , "<type of element: suite, story, test, scenario, step, before_class, before_groups, before_method, before_suite, before_test, after_class, after_groups, after_method, after_suite, after_test>");
    ElementStructure.Insert("launchUuid" , "<Launch UUID>");
    ElementStructure.Insert("description", "<element description>");
    ElementStructure.Insert("attributes" , "<element attributes in the form key1:value1, key2:value2>");
    ElementStructure.Insert("uuid"       , "<UUID of the element. Will be generated automatically if not filled>");
    ElementStructure.Insert("codeRef"    , "<physical location of tests>");
    ElementStructure.Insert("parameters" , "<parameters for parameterized tests>");
    ElementStructure.Insert("retry"      , "<is a rerun>");

    If Clear Then
        ElementStructure = OPI_Tools.ClearCollectionRecursively(ElementStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return ElementStructure;

EndFunction

// Get item completion structure
// Gets the parameter structure for completing the test item execution
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// AsMap - Boolean - True > returns the filter fields as a map - map
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetItemCompletionStructure(Val Clear = False, Val AsMap = False) Export

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(AsMap);

    If AsMap Then
        ElementStructure = New Map;
    Else
        ElementStructure = New Structure;
    EndIf;

    ElementStructure.Insert("endTime"    , "<end time>");
    ElementStructure.Insert("launchUuid" , "<Launch UUID>");
    ElementStructure.Insert("status"     , "<status of completion: passed, failed, stopped, skipped, interrupted, cancelled>");
    ElementStructure.Insert("description", "<element description. Overwrites the one specified during creation>");
    ElementStructure.Insert("attributes" , "<attributes of the element. Overwrites the one specified during creation>");
    ElementStructure.Insert("retry"      , "<retry finish flag>");
    ElementStructure.Insert("issue"      , "<problem information>");

    If Clear Then
        ElementStructure = OPI_Tools.ClearCollectionRecursively(ElementStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return ElementStructure;

EndFunction

// Get launch completion structure
// Gets the parameter structure for completing a test session
//
// Parameters:
// Time - Date - Launch end date and time - end
// Status - String - Completion status: passed, failed, stopped, skipped, interrupted, cancelled - status
// Description - String - Launch description. Overwrites the one specified during creation - descr
// Attributes - String - Launch attributes. Overwrites the one specified during creation - attr
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetLaunchCompletionStructure(Val Time, Val Status = "", Val Description = "", Val Attributes = "") Export

    String_ = "String";

    FinishStructure = New Structure;
    OPI_Tools.AddField("endTime"    , Time       , "DateISO", FinishStructure);
    OPI_Tools.AddField("status"     , Status     , String_  , FinishStructure);
    OPI_Tools.AddField("description", Description, String_  , FinishStructure);
    OPI_Tools.AddField("attributes" , Attributes , String_  , FinishStructure);

    Return FinishStructure;

EndFunction

#EndRegion

#Region LogRecording

// Write log
// Adds execution information for the test item
//
// Parameters:
// URL - String - ReportPortal server URL - url
// Token - String - Access token - token
// Project - String - Project ID - proj
// LogStructure - Structure Of KeyAndValue - Execution information. See GetLogStructure - params
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ReportPortal
Function WriteLog(Val URL, Val Token, Val Project, Val LogStructure) Export

    ErrorText = "Log structure is not a valid KeyValue collection";

    OPI_TypeConversion.GetKeyValueCollection(LogStructure, ErrorText);
    OPI_TypeConversion.GetLine(Project);

    CompleteURL(URL, StrTemplate("api/v1/%1/log", Project));

    Headers = GetAuthorizationHeader(Token);

    Result = OPI_HTTPRequests.PostWithBody(URL, LogStructure, Headers);

    Return Result;

EndFunction

// Get log structure
// Gets the parameter structure for log entry
//
// Parameters:
// LaunchID - String - Launch ID to which the test item belongs - launch
// ElementID - String - Test item ID - id
// Time - Date - Log entry date and time - time
// Text - String - Log text information - text
// Level - String - Information level: error, warn, info, debug, trace, fatal, unknown - level
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetLogStructure(Val LaunchID, Val ElementID, Val Time, Val Text = "", Val Level = "info") Export

    String_ = "String";

    LogStructure = New Structure;
    OPI_Tools.AddField("launchUuid", LaunchID , String_ , LogStructure);
    OPI_Tools.AddField("itemUuid"  , ElementID, String_ , LogStructure);
    OPI_Tools.AddField("time"      , Time     , "Date"  , LogStructure);
    OPI_Tools.AddField("message"   , Text     , String_ , LogStructure);
    OPI_Tools.AddField("level"     , Level    , String_ , LogStructure);

    Return LogStructure;

EndFunction

#EndRegion

#EndRegion

#Region Private

Procedure CompleteURL(URL, Val Path)

    OPI_TypeConversion.GetLine(URL);

    URL = ?(StrEndsWith(URL, "/"), URL, URL + "/");
    URL = URL + Path;

EndProcedure

Function GetAuthorizationHeader(Val Token)

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    OPI_Tools.AddField("Authorization", StrTemplate("Bearer %1", Token), "String", Headers);

    Return Headers;

EndFunction

#EndRegion

#Region Alternate

Function ПолучитьВременныйТокен(Val URL, Val Логин, Val Пароль) Export
	Return GetTemporaryToken(URL, Логин, Пароль);
EndFunction

Function ПолучитьПостоянныйТокен(Val URL, Val Токен, Val IDПользователя, Val ИмяКлюча) Export
	Return GetPermanentToken(URL, Токен, IDПользователя, ИмяКлюча);
EndFunction

Function УдалитьПостоянныйТокен(Val URL, Val Токен, Val IDПользователя, Val IDКлюча) Export
	Return DeletePermanentToken(URL, Токен, IDПользователя, IDКлюча);
EndFunction

Function СоздатьЗапуск(Val URL, Val Токен, Val Проект, Val СтруктураЗапуска) Export
	Return CreateLaunch(URL, Токен, Проект, СтруктураЗапуска);
EndFunction

Function СоздатьЭлемент(Val URL, Val Токен, Val Проект, Val СтруктураЭлемента, Val Родитель = "") Export
	Return CreateItem(URL, Токен, Проект, СтруктураЭлемента, Родитель);
EndFunction

Function ЗавершитьЗапуск(Val URL, Val Токен, Val Проект, Val IDЗапуска, Val СтруктураЗавершения) Export
	Return FinishLaunch(URL, Токен, Проект, IDЗапуска, СтруктураЗавершения);
EndFunction

Function ЗавершитьЭлемент(Val URL, Val Токен, Val Проект, Val IDЭлемента, Val СтруктураЗавершения) Export
	Return FinishItem(URL, Токен, Проект, IDЭлемента, СтруктураЗавершения);
EndFunction

Function ПолучитьСтруктуруЗапуска(Val Пустая = False, Val КакСоответствие = False) Export
	Return GetLaunchStructure(Пустая, КакСоответствие);
EndFunction

Function ПолучитьСтруктуруЭлемента(Val Пустая = False, Val КакСоответствие = False) Export
	Return GetItemStructure(Пустая, КакСоответствие);
EndFunction

Function ПолучитьСтруктуруЗавершенияЭлемента(Val Пустая = False, Val КакСоответствие = False) Export
	Return GetItemCompletionStructure(Пустая, КакСоответствие);
EndFunction

Function ПолучитьСтруктуруЗавершенияЗапуска(Val Время, Val Статус = "", Val Описание = "", Val Атрибуты = "") Export
	Return GetLaunchCompletionStructure(Время, Статус, Описание, Атрибуты);
EndFunction

Function ЗаписатьЛог(Val URL, Val Токен, Val Проект, Val СтруктураЛога) Export
	Return WriteLog(URL, Токен, Проект, СтруктураЛога);
EndFunction

Function ПолучитьСтруктуруЛога(Val IDЗапуска, Val IDЭлемента, Val Время, Val Текст = "", Val Уровень = "info") Export
	Return GetLogStructure(IDЗапуска, IDЭлемента, Время, Текст, Уровень);
EndFunction

#EndRegion