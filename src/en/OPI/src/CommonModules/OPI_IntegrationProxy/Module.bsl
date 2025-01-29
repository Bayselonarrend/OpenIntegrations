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
// #Use "../../tools"

#Region Public

#Region ProxySettings

// Create project
// Creates a project file at the selected path
//
// Parameters:
// Path - String - Project filepath - path
//
// Returns:
// Structure Of KeyAndValue - creation result
Function CreateProject(Val Path) Export

    Return NormalizeProject(Path);

EndFunction

// Add requests handler
// Adds a new handler to the project
//
// Parameters:
// Project - String - Project filepath - proj
// Name - String - Name of the new handler - name
// SecretKey - String - Secret key for URL handler - secret
// Method - String - HTTP method that will process the handler: GET, POST, MULTIPART - method
//
// Returns:
// Structure Of KeyAndValue - result of adding a handler
Function AddRequestsHandler(Val Project, Val Name, Val SecretKey, Val Method = "GET") Export

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(SecretKey);
    OPI_TypeConversion.GetLine(Method);

    Result = CheckProjectExistence(Project);

    If Not Result["result"] Then
        Return Result;
    Else
        Project = Result["path"];
    EndIf;

    DataArray = New Array;
    DataArray.Add(New Structure("name,secret,method", Name, SecretKey, Method));

    HandlersTableName = ConstantValue("HandlersTable");
    Result            = OPI_SQLite.AddRecords(HandlersTableName, DataArray, , Project);

    Return Result;

EndFunction

// Start
// Launches integration proxy server
//
// Parameters:
// Port - Number - Servers port - port
// Project - String - Project filepath - proj
// Returns:
// Structure Of KeyAndValue - server shutdown result
Function Start(Val Port, Val Project) Export

    OPI_TypeConversion.GetNumber(Port);

    ServerType = Type("WebServer");

    ServerParams    = New Array(1);
    ServerParams[0] = Port;

    WebServer = New(ServerType, ServerParams);

    WebServer.AddRequestsHandler(ThisObject, "MainHandler");
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

    If Not ProjectFile.Exists() Then
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

    If DBFile.Exists() And DBFile.IsDirectory() Then

        Counter = 0;

        While DBFile.Exists() Do

            NewPath = Path + "/new_project_" + String(Counter) + ".oint";
            DBFile  = New File(NewPath);

            Counter = Counter + 1;

        EndDo;

    EndIf;

    FullPath = DBFile.FullName;

    If Not DBFile.Exists() Then

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

    Response = New Structure("result,message", False, Text);

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

    EmptyFile = GetBinaryDataFromString("");
    EmptyFile.Write(Path);

    Result = CreateHandlersTable(Path);

    If Not Result["reuslt"] Then
        DeleteFiles(Path);
        Return Result;
    EndIf;

EndFunction

Function CreateHandlersTable(Path)

    TableStructure = New Structure();
    TableStructure.Insert("id"    , "INTEGER PRIMARY KEY");
    TableStructure.Insert("name"  , "TEXT");
    TableStructure.Insert("secret", "TEXT");
    TableStructure.Insert("method", "TEXT");

    HandlersTableName = ConstantValue("HandlersTable");
    Result            = OPI_SQLite.CreateTable(HandlersTableName, TableStructure, Path);

    Return Result;

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
