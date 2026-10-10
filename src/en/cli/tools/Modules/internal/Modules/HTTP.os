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

#Use "../../../../../oint/tools/main"
#Use "../../../../../oint/formats/janx"
#Use "../../../../core/Classes/internal"
#Use "../../../../data"

Var OPIObject;
Var SessionVariables;
Var AuthorizationHeader;
Var ServerHeader;
Var GetAllowed;
Var PostAllowed;
Var UseJanx;


#Region Internal

Function StartServer(Val Port, Val Post = True, Val Get = False, Val Janx = False, Val Authorization = "") Export

	OPIObject = New LibraryComposition;
	SessionVariables = New Map;
	
	OPI_TypeConversion.GetNumber(Port);
	OPI_TypeConversion.GetBoolean(Post);
	OPI_TypeConversion.GetBoolean(Get);
	OPI_TypeConversion.GetBoolean(Janx);
	OPI_TypeConversion.GetLine(Authorization);
	
	AuthorizationHeader = Authorization;
	ServerHeader = StrTemplate("OInt/%1 (Kestrel)", OPIObject.GetVersion());
	GetAllowed = Get;
	PostAllowed = Post;
	UseJanx = Janx;
	
	While True Do
		
		Try
			
			WebServer = New WebServer(Port);
			WebServer.AddRequestsHandler(ЭтотОбъект, "MainHandler");
			WebServer.Start();
			
		Except
			Message(ErrorDescription());
		EndTry;

		Sleep(5000);

	EndDo;
	
EndFunction

#EndRegion

#Region Private

Procedure MainHandler(Context, NextHandler) Export
    
	Try
		
		Context.Response.Headers["Server"] = ServerHeader;
		
		If ValueIsFilled(AuthorizationHeader) Then
			CurrentAuthorization = Context.Request.Headers["Authorization"];
			
			If Not String(CurrentAuthorization) = AuthorizationHeader Then
				Context.Response.StatusCode = 401;	
				Raise "Invalid authorization header!"
			EndIf;

		EndIf;
		
		Method = Upper(Context.Request.Method);
		
		If Method = "GET" And GetAllowed
			Or Method = "POST" And PostAllowed Then
			
			Result = ProcessRequest(Context, Method);
			
		Else
			Result = Error(Context, 405, "Use of the specified HTTP method is not allowed!");
		EndIf;
        
    Except
        
        Result = BriefErrorDescription(ErrorInfo());
        
        If Context.Response.StatusCode = 200 Then
            Context.Response.StatusCode = 500;
        EndIf;
        
    EndTry;
    
    RunGarbageCollection();
    
	If Result <> Undefined Then
		
		If OPI_Tools.ThisIsCollection(Result) Then
			
			If UseJanx Then
				ContentType = "application/x-janx";
				Result = OPI_Janx.SerializeData(Result);
			Else
				ContentType = "application/json;charset=utf-8";
				Result = NormalizeJSON(Result);
			EndIf;

		ElsIf TypeOf(Result) = Type("String") Then
			ContentType = "text/plain;charset=utf-8";
		Else
			ContentType = "application/octet-stream";
		EndIf;
		
		Context.Response.Headers["Content-Type"] = ContentType;
        
        OPI_TypeConversion.GetBinaryData(Result, True, False);
        
        DataWriter = New DataWriter(Context.Response.Body);
        DataWriter.Write(Result);
        DataWriter.Close();
         
    EndIf;
    
EndProcedure

Function ProcessRequest(Context, Val HTTPMethod)
	
	Try
		
		Path = Context.Request.Path;
		
		PathParts = StrSplit(Path, "/", False);
		
		If PathParts.Count() < 2 Then
			Return Error(Context, 400, "Missing method and/or command name!");
		EndIf;
		
		Method = PathParts[PathParts.UBound()];
		Command = PathParts[PathParts.UBound() - 1];

		ExecutionContext = New Map;

		ProcessedOptions = GenerateOptions(Context, ExecutionContext, HTTPMethod);
		CallStructure = OPIObject.FormMethodCallString(ProcessedOptions, Command, Method, , True);
		
		If CallStructure["Error"] Then
			Return Error(Context, 400, StrTemplate("Check the order and escaping when entering the command! Command: %1, Method: %2", Command, Method));
		EndIf;
		
		ExecutionText = CallStructure["Result"];
		
		Result = Undefined;
	
		Executor.ExecuteScript(ExecutionText, Result, , ExecutionContext);
		NormalizeResult(Result);

	Except
		Result = Error(Context, 400, BriefErrorDescription(ErrorInfo()));
	EndTry;
	
	Return Result;

EndFunction

Function Error(Context, Val Code, Val Text) 
	
	Context.Response.StatusCode = Code;
	Return New Structure("result,error", False, Text);

EndFunction

Function GenerateOptions(Val Context, Val ExecutionContext, Val Method)
	
	Options = New Map;

	If Method = "GET" Then
		Options = GenerateGetOptions(Context);
	Else
		
		ContentType = TrimAll(Lower(String(Context.Request.Headers["Content-Type"])));
		
		If StrStartsWith(ContentType, "application/json") Then
			Options = GenerateJsonOptions(Context);
		ElsIf StrStartsWith(ContentType, "application/x-janx") Then
			Options = GenerateJanxOptions(Context);
		ElsIf StrStartsWith(ContentType, "application/x-www-form-urlencoded") Or StrStartsWith(ContentType, "multipart/form-data") Then
			Options = GenerateFormOptions(Context);
		Else
			Context.Response.StatusCode = 415;
			Raise "Unsupported Content-Type. Available values: application/json, application/x-janx, application/x-www-form-urlencoded, multipart/form-data";
		EndIf;
		
	EndIf;
	
	NormalizedOptions = New Map;

	For Each Option In Options Do
		NormalizedValue = AdditionalContext(ExecutionContext, Option.Value);
		NormalizedOptions.Insert(Option.Key, NormalizedValue);
	EndDo;

	Return NormalizedOptions;

EndFunction

Function GenerateGetOptions(Val Context)

    Request = Context.Request;
	Parameters = Request.Parameters;
	
	Return Parameters;
	
EndFunction

Function GenerateJsonOptions(Val Context)

	Request = Context.Request;
	
	Try
		DataReader = New DataReader(Request.Body);
		RequestBody = DataReader.Read().GetBinaryData();
		
		JSONReader = New JSONReader();
		JSONReader.SetString(GetStringFromBinaryData(RequestBody));
		
		Parameters = ReadJSON(JSONReader, True);
		JSONReader.Close();
	Except
		Context.Response.StatusCode = 400;
		Raise "Request body is not valid JSON!"
	EndTry;
	
	Return Parameters;
	
EndFunction

Function GenerateJanxOptions(Val Context)

	Request = Context.Request;
	
	Try
		DataReader = New DataReader(Request.Body);
		RequestBody = DataReader.Read().GetBinaryData();
		
		Parameters = OPI_Janx.DeserializeData(RequestBody);
	Except
		Raise "Request body is not valid Janx!"
	EndTry;
	
	Return Parameters;

EndFunction

Function GenerateFormOptions(Val Context)
	
	Request = Context.Request;
	Form = Request.Form;
	
	If Not ValueIsFilled(Form) Then
		Context.Response.StatusCode = 400;
        Raise "Form data not found in request body!";
	EndIf;
	
    Parameters = New Map;
    Files = Form.Files;
    
    For Each Field In Form Do
        
        Parameters.Insert(Field.Key, Field.Value);
        
    EndDo;
    
	For Each File In Files Do
		
        Parameters.Insert(File.Name, File);
        
    EndDo;
	
	Return Parameters;

EndFunction

Function GenerateVariableKey()
	
	VariableKey = "";
	KeyTemplate = "{oint-%1}";
	
	While VariableKey = "" Or SessionVariables.Get(VariableKey) <> Undefined Do
		
		VariableKey = StrTemplate(KeyTemplate, Left(String(New UUID), 6));
		
	EndDo;
	
	Return VariableKey;
	
EndFunction

Procedure NormalizeResult(Result)
	
	ResultType = TypeOf(Result);
	
	If StrStartsWith(String(ResultType), "AddIn.") Then
		
		VariableKey = GenerateVariableKey();
		SessionVariables.Insert(VariableKey, Result);	
		Result = VariableKey;

	EndIf;

EndProcedure

Function NormalizeJSON(Value)
	
    If OPI_Tools.ThisIsCollection(Value, True) Then

        ProcessedValue = New(TypeOf(Value));

        For Each CollectionItem In Value Do

            CurrentKey = CollectionItem.Key;
            CurrentValue = NormalizeJSON(CollectionItem.Value);

            ProcessedValue.Insert(CurrentKey, CurrentValue);

        EndDo;

    ElsIf OPI_Tools.ThisIsCollection(Value) Then

        ProcessedValue = New Array;

        For Each CollectionItem In Value Do

            CurrentValue = NormalizeJSON(CollectionItem);
            ProcessedValue.Add(CurrentValue);

		EndDo;
		
	ElsIf TypeOf(Value) = Type("BinaryData") Then

		ProcessedValue = StrTemplate("oint-base64:%1", Base64String(Value));
		
	Else

		ProcessedValue = Value;
		
	EndIf;
	
	Return ProcessedValue;

EndFunction

Function AdditionalContext(Context, Val CurrentValue)
	
	ValeType = TypeOf(CurrentValue);
	
	If ValeType = Type("BinaryData") Then
		
		VariableKey = GenerateVariableKey();
		Context.Insert(VariableKey, CurrentValue);
		Return VariableKey;

	ElsIf ValeType = Type("String") Then
		
		VariableValue = SessionVariables.Get(CurrentValue);

		If VariableValue <> Undefined Then
			Context.Insert(CurrentValue, VariableValue);
		EndIf;
		
	EndIf;
	
	Return CurrentValue;

EndFunction

#EndRegion
