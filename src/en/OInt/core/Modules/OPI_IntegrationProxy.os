// OneScript: ./OInt/core/Modules/OPI_IntegrationProxy.os
// Lib: Integration proxy methods
// CLI: proxy

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

// Uncomment if OneScript is executed
#Use "../../tools"

#Region Public

#Region ProjectSetup

// Create project
// Creates a project file at the selected path
//
// Parameters:
// Path - String - Project filepath - path
//
// Returns:
// Structure Of KeyAndValue - Creation result
Function CreateProject(Val Path) Export

    Return NormalizeProject(Path);

EndFunction

// Add requests handler
// Adds a new handler to the project
//
// Parameters:
// Project - String - Project filepath - proj
// OintFunction - String - OpenIntegrations function name - func
// Method - String - HTTP method that will process the handler: GET, POST, MULTIPART - method
//
// Returns:
// Structure Of KeyAndValue - Result of handler creation
Function AddRequestsHandler(Val Project, Val OintFunction, Val Method = "GET") Export

    OPI_TypeConversion.GetLine(OintFunction);
    OPI_TypeConversion.GetLine(Method);

    Result = CheckProjectExistence(Project);

    If Not Result["result"] Then
        Return Result;
    Else
        Project = Result["path"];
    EndIf;

    SecretKey = GetHandlerUniqueKey(Project);

    If TypeOf(SecretKey) = Type("Structure") Then
        SecretKey.Insert("message", "Failed to generate a handler UID. Try again");
        Return SecretKey;
    EndIf;

    RecordStructure = New Structure;
    RecordStructure.Insert("function", OintFunction);
    RecordStructure.Insert("id"      , SecretKey);
    RecordStructure.Insert("method"  , Method);
    RecordStructure.Insert("active"  , True);

    HandlersTableName = ConstantValue("HandlersTable");
    Result            = OPI_SQLite.AddRecords(HandlersTableName, RecordStructure, False, Project);

    If Result["result"] Then

          Result = New Structure;
          Result.Insert("result"     , True);
          Result.Insert("key"        , SecretKey);
          Result.Insert("url_example", "localhost:port/" + SecretKey);

    EndIf;

    Return Result;

EndFunction

// Get the list of request handlers
// Gets the list of handlers in the project
//
// Parameters:
// Project - String - Project filepath - proj
//
// Returns:
// Structure Of KeyAndValue - Handlers list
Function GetRequestHandlersList(Val Project) Export

    OPI_TypeConversion.GetLine(Project);

    Table  = ConstantValue("HandlersTable");
    Result = OPI_SQLite.GetRecords(Table, , , , , Project);

    Return Result;

EndFunction

// Delete request handler
// Removes the request handler from the project
//
// Parameters:
// Project - String - Project filepath - proj
// HandlerKey - String - Handler key - handler
//
// Returns:
// Structure Of KeyAndValue - Deletion result
Function DeleteRequestHandler(Val Project, Val HandlerKey) Export

    OPI_TypeConversion.GetLine(HandlerKey);

    Table = ConstantValue("HandlersTable");

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "id");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", HandlerKey);
    FilterStructure.Insert("raw"  , False);

    Result = OPI_SQLite.DeletePosts(Table, FilterStructure, Project);

    Return Result;

EndFunction

// Start
// Launches integration proxy server
//
// Parameters:
// Port - Number - Servers port - port
// Project - String - Project filepath - proj
// Returns:
// Structure Of KeyAndValue - Result of server shutdown
Function Start(Val Port, Val Project) Export

    OPI_TypeConversion.GetNumber(Port);

    ServerType = Type("WebServer");

    ServerParams    = New Array(1);
    ServerParams[0] = Port;

    WebServer = New(ServerType, ServerParams);

    WebServer.AddRequestsHandler(OPI_IntegrationProxy, "MainHandler");
    WebServer.Start();

    Return FormResponse(True, "Stopped");

EndFunction

#EndRegion

#EndRegion

#Region Private

#Region Project

Function CheckProjectExistence(Path)

    OPI_TypeConversion.GetLine(Path);
    OPI_Tools.RestoreEscapeSequences(Path);

    ProjectFile = New File(Path);
    Text        = "The project file already exists!";
    Result      = True;

    If Not ProjectFile.Exist() Then
        Text   = "Project file not found at the specified path!";
        Result = False;
    EndIf;

    If ProjectFile.IsDirectory() Then
        Text   = "The directory path is passed, not the project file!";
        Result = False;
    EndIf;

    ResponseStructure = FormResponse(Result, Text, ProjectFile.FullName);

    Return ResponseStructure;

EndFunction

Function NormalizeProject(Path)

    OPI_TypeConversion.GetLine(Path);
    OPI_Tools.RestoreEscapeSequences(Path);

    DBFile = New File(Path);

    If DBFile.Exist() And DBFile.IsDirectory() Then

        Counter = 0;

        While DBFile.Exist() Do

            NewPath = Path + "/new_project_" + String(Counter) + ".oint";
            DBFile  = New File(NewPath);

            Counter = Counter + 1;

        EndDo;

    EndIf;

    FullPath = DBFile.FullName;

    If Not DBFile.Exist() Then

        Result = CreateNewProject(FullPath);

        If Result["result"] Then
            Text     = "The project file has been successfully created!";
            Response = FormResponse(True, Text, FullPath);
        Else
            Response = Result;
        EndIf;

    Else

        Text     = "The project file at the given path already exists!";
        Response = FormResponse(False, Text, FullPath);

    EndIf;

    Return Response;

EndFunction

Function FormResponse(Val Result, Val Text, Val Path = "")

    Response = New Structure("result,message", Result, Text);

    If ValueIsFilled(Path) Then
        Response.Insert("path", Path);
    EndIf;

    Return Response;

EndFunction

Function ConstantValue(Val Key)

    If Key = "HandlersTable" Then Return "handlers"
    Else Return "" EndIf;

EndFunction

Function CreateNewProject(Path)

    EmptyFile = ПолучитьДвоичныеДанныеИзСтроки("");
    EmptyFile.Write(Path);

    Result = CreateHandlersTable(Path);

    If Not Result["result"] Then
        DeleteFiles(Path);
        Return Result;
    EndIf;

    Return Result;

EndFunction

Function CreateHandlersTable(Path)

    TableStructure = New Structure();
    TableStructure.Insert("id"      , "TEXT PRIMARY KEY NOT NULL UNIQUE");
    TableStructure.Insert("function", "TEXT");
    TableStructure.Insert("method"  , "TEXT");
    TableStructure.Insert("active"  , "BOOLEAN");

    HandlersTableName = ConstantValue("HandlersTable");
    Result            = OPI_SQLite.CreateTable(HandlersTableName, TableStructure, Path);

    Return Result;

EndFunction

Function GetHandlerUniqueKey(Path)

    SecretKey = GetUUID(9);
    Table     = ConstantValue("HandlersTable");

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "id");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", SecretKey);
    FilterStructure.Insert("raw"  , False);

    Result = OPI_SQLite.GetRecords(Table, , FilterStructure, , , Path);

    If Not Result["result"] Then
        Return Result;
    EndIf;

    While Result["data"].Count() > 0 Do

        SecretKey                = GetUUID(9);
        FilterStructure["value"] = SecretKey;

        Result = OPI_SQLite.GetRecords(Table, , FilterStructure, , , Path);

        If Not Result["result"] Then
            Return Result;
        EndIf;

    EndDo;

    Return SecretKey;

EndFunction

Function GetUUID(Val Length)
    Return Left(StrReplace(String(New UUID), "-", ""), Length);
EndFunction

#EndRegion

#Region Handlers

Procedure MainHandler(Context, NexHandler) Export

    Try
        ProcessRequest(Context);
    Except

        Error = ErrorDescription();

        Context.Response.StatusCode = 500;
        Context.Response.Write(Error);

    EndTry

EndProcedure

Procedure ProcessRequest(Context)

    // Path = Context.Request.Path;

    Context.Response.StatusCode = 200;
    Context.Response.Write("Hello world!");

EndProcedure

#EndRegion

#EndRegion
