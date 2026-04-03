// CLI: mcp
// Tool: true

#Use "../../../oint/tools/main"
#Use "../../core/Classes/internal"
#Use "../../data"


Var ConfigurationVariables;
Var SupportedVersionsArray;
Var LogWrite;
Var OPIObject;

Var CachedServicesList;

#Region Public

#Region MCPMethods

// Start
// Starts the MCP server
// 
// Parameters:
// Configuration - String - Path to the configuration file. Pass default to use the standard configuration - config
// LogFile - String - Log file path, if needed - log
//
// Returns:
// String - empty string
Function start(Val Configuration = "default", Val LogFile = "") Export
	
	OPI_TypeConversion.GetLine(Configuration);
	OPI_TypeConversion.GetLine(LogFile);

	Console.OutputEncoding = "UTF-8";
	Console.InputEncoding = "UTF-8";
	
	OPIObject = New LibraryComposition;
	
	Error = InitializeConfiguration(Configuration);
	
	If Not Error = Undefined Then
		Return Error;
	EndIf;
	
	Error = InitializeLog(LogFile);
	
	If Not Error = Undefined Then
		Return Error;
	EndIf;
	
	LogData("--SERVER START--");
	
	While True Do
		
		Data = "";
		
		LogData("Wait input...");
		
		InputString(Data);
		
		If Not ValueIsFilled(Data) Then
			Sleep(100);
			Continue;
		EndIf;
		
		Try
			
			LogData(StrTemplate("Request: %1", Data));
			
			LogData("Processing start");
			ResponseStructure = ProcessRequest(Data);
			LogData("Processing complete");
			
		Except
			
			ErrorDescription = ErrorDescription();
			LogData(StrTemplate("Processing error: %1", ErrorDescription));
			ResponseStructure = ServerErrorResponse(Data["id"], ErrorDescription);
			
		EndTry;
		
		If ResponseStructure = Undefined Then
			LogData("Empty response. Skip");
			Continue;
		EndIf;
		
		ResponseString = OPI_Tools.JSONString(ResponseStructure, , False);
		LogData(StrTemplate("Response: %1", ResponseString));
		
		Console.WriteLine(ResponseString);
		
	EndDo;
	
EndFunction

// Get configuration template
// Returns a configuration template with or without examples
// 
// Parameters:
// Empty - Boolean - True > returns an empty JSON configuration, False > with field descriptions - empty
//
// Returns:
// Structure Of KeyAndValue - configuration template
Function config(Val Empty = True) Export

	OPI_TypeConversion.GetBoolean(Empty);

	ConfigurationStructure = New Structure;
	ConfigurationStructure.Insert("vars", New Structure);

	If Not Empty Then
		ConfigurationStructure["vars"].Insert("TextKey", "Any string value of the variable. It can be used by key with the addition of @@ to specify parameter values when calling execute_method");
	EndIf;

	Return ConfigurationStructure;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function ProcessRequest(Val DataString)
	
	If Not ValueIsFilled(DataString) Then
		Return Undefined;
	EndIf;
	
	Try
		DataString_ = DataString;
		OPI_TypeConversion.GetKeyValueCollection(DataString_);
		Data = DataString_;
	Except
		LogData(StrTemplate("Request parse error: %1", ErrorDescription()));
		Return ErrorJSONResponse();
	EndTry;
	
	Method = OPI_Tools.GetOr(Data, "method", "");
	
	If StrStartsWith(Method, "notifications") Then
		LogData("Notification found. Skip");
		Return Undefined;
	EndIf;
	
	LogData("Input data validation");
	Error = ValidateRequest(Data);
	
	If Error <> Undefined Then
		LogData("Validation failed");
		Return Error;
	EndIf;
	
	LogData("Validation complete");
	
	Method = Data["method"];
	
	LogData(StrTemplate("Method found: %1", Method));
	
	If Method = "initialize" Then
		
		Result = ProcessInitialize(Data);
		
	ElsIf Method = "tools/list" Then
		
		Result = ProcessToolsList(Data);
		
	ElsIf Method = "tools/call" Then
		
		Result = ProcessToolsCall(Data);
		
	ElsIf StrEndsWith(Method, "list") And StrSplit(Method, "/").Count() > 1 Then
		
		RequestID = Data["id"];
		RequestParts = StrSplit(Method, "/");
		Result = EmptyListResponse(RequestID, RequestParts[RequestParts.UBound() - 1]);
		
	Else
		
		RequestID = Data["id"];
		Result = ParametersErrorResponse(RequestID, "Not implemented");
		
	EndIf;
	
	Return Result;
	
EndFunction

Function ProcessInitialize(Val Data)
	
	RequestID = Data["id"];
	Response = ResponseTemplate(RequestID);
	
	Result = New Structure;
	Result.Insert("protocolVersion", Data["params"]["protocolVersion"]);
	Result.Insert("capabilities" , New Structure("tools", New Structure));
	Result.Insert("serverInfo" , New Structure("name,version", "oint-mcp-server", "2.0.0"));
	
	Response.Insert("result", Result);
	
	Return Response;
	
EndFunction

Function ProcessToolsList(Val Data)
	
	RequestID = Data["id"];
	Response = ResponseTemplate(RequestID);
	
	ToolsFile = CombinePath(CurrentScript().Path, "tools.json");
	ToolsData = OPI_Tools.ReadJSONFile(ToolsFile);
	
	Response.Insert("result", ToolsData);
	
	Return Response;
	
EndFunction

Function ProcessToolsCall(Val Data)
	
	RequestID = Data["id"];
	Parameters = Data["params"];
	ToolName = Parameters["name"];
	Arguments = Parameters["arguments"];
	
	LogData(StrTemplate("Tool: %1", ToolName));
	
	If ToolName = "get_services" Then
		
		Result = GetServicesTool(RequestID);
		
	ElsIf ToolName = "get_service_methods" Then
		
		Result = GetServiceMethodsTool(RequestID, Arguments);
		
	ElsIf ToolName = "get_method_parameters" Then
		
		Result = GetMethodParametersTool(RequestID, Arguments);
		
	ElsIf ToolName = "execute_method" Then
		
		Result = ExecuteMethodTool(RequestID, Arguments);

	ElsIf ToolName = "get_variables" Then

		Result = GetVariablesTool(RequestID);
		
	Else
		
		LogData("Unknown tool!");
		Result = ParametersErrorResponse(RequestID, "Unknown tool name");
		
	EndIf;
	
	Return Result;
	
EndFunction

Function GetServicesTool(Val RequestID)
	
	If Not ValueIsFilled(CachedServicesList) Then
		
		LogData("Cache not found. Generating...");
		
		CommandList = OPIObject.GetCommandModuleMapping();
		ArrayOfDescriptions = New Array;
		
		For Each Command In CommandList Do
			
			DescriptionStructure = New Structure("name,title", Command.Key, StrReplace(Command.Value, "OPI_", ""));
			ArrayOfDescriptions.Add(DescriptionStructure);
			
		EndDo;
		
		ServicesStructure = New Structure("services", ArrayOfDescriptions);
		CachedServicesList = OPI_Tools.JSONString(ServicesStructure, , False);
		
		LogData(StrTemplate("Ready: %1", CachedServicesList));
		
	EndIf;
	
	Response = ResponseResult(RequestID, CachedServicesList);
	
	Return Response;
	
EndFunction

Function GetVariablesTool(Val RequestID)

	KeyArray = New Array;

	For Each Variable In ConfigurationVariables Do
		KeyArray.Add(StrTemplate("@@%1", Variable.Key));
	EndDo;

	VariablesStructure = New Structure("vars", KeyArray);
	VariablesString = OPI_Tools.JSONString(VariablesStructure, , False);

	Response = ResponseResult(RequestID, VariablesString);
	
	Return Response;

EndFunction

Function GetServiceMethodsTool(Val RequestID, Val Arguments)
	
	Command = Arguments["service"];
	
	Try
		Index = OPIObject.GetIndexData(Command);
	Except
		Index = New Structure("methods", New Array);
	EndTry;
	
	MethodsArray = New Array;
	
	For Each Method In Index["methods"] Do
		
		CurrentDescription = New Structure("name,description"
		, Method["name"]
		, Method["description"]);
		
		MethodsArray.Add(CurrentDescription);
		
	EndDo;
	
	MethodsStructure = New Structure("methods", MethodsArray);
	MethodsStructure = OPI_Tools.JSONString(MethodsStructure, , False);
	
	Response = ResponseResult(RequestID, MethodsStructure);
	
	Return Response;
	
EndFunction

Function GetMethodParametersTool(Val RequestID, Val Arguments)
	
	Command = Arguments["service"];
	Method = Arguments["method"];
	
	Try
		Index = OPIObject.GetIndexData(Command);
	Except
		Index = New Structure("methods", New Array);
	EndTry;
	
	ParameterArray = New Array;
	
	For Each MethodDescription In Index["methods"] Do
		
		If MethodDescription["name"] = Method Then
			
			For Each Parameter In MethodDescription["params"] Do
				
				CurrentParameter = New Structure;
				CurrentParameter.Insert("name" , StrReplace(Parameter["name"], "--", ""));
				CurrentParameter.Insert("types" , Parameter["types"]);
				CurrentParameter.Insert("description" , Parameter["description"]);
				CurrentParameter.Insert("default_value", Parameter["default"]);
				
				ParameterArray.Add(CurrentParameter);
				
			EndDo;
			
		EndIf;
		
	EndDo;
	
	MethodsStructure = New Structure("parameters", ParameterArray);
	MethodsStructure = OPI_Tools.JSONString(MethodsStructure, , False);
	
	Response = ResponseResult(RequestID, MethodsStructure);
	
	Return Response;
	
EndFunction

Function ExecuteMethodTool(Val RequestID, Val Arguments)
	
	Command = Arguments["service"];
	Method = Arguments["method"];
	Options = Arguments["parameters"];
	
	ProcessedOptions = New Map;
	
	For Each Option In Options Do
		
		CurrentKey = Option.Key;
		CurrentValue = Option.Value;
		
		OPI_TypeConversion.GetLine(CurrentValue);
		
		CurrentValue = StrReplace(CurrentValue, Chars.LF, "\n");
	
		If StrStartsWith(CurrentValue, "@@") Then

			ParameterName = Right(CurrentValue, StrLen(CurrentValue) - 2);
			ParameterValue = ConfigurationVariables.Get(ParameterName);

			If ParameterValue <> Undefined Then
				CurrentValue = ParameterValue;
			EndIf;

		EndIf;
		
		
		ProcessedOptions.Insert(CurrentKey, CurrentValue);
		
	EndDo;
	
	CallStructure = OPIObject.FormMethodCallString(ProcessedOptions, Command, Method);
	
	If CallStructure["Error"] Then
		
		MethodCommand = StrTemplate("%1 %2", Command, Method);

		LogData(StrTemplate("Execution string generation error: %1", MethodCommand));
		Return ParametersErrorResponse(RequestID, MethodCommand);
		
	EndIf;
	
	ExecutionText = CallStructure["Result"];
	LogData(StrTemplate("Execution string ready: %1", ExecutionText));
	
	Result = Undefined;
	
	Try
		Executor.ExecuteScript(ExecutionText, Result);
	Except
		Result = DetailErrorDescription(ErrorInfo());
	EndTry;
	
	OPI_TypeConversion.GetLine(Result);
	
	LogData(StrTemplate("Execution complete: %1", Result));
	
	ResultStructure = New Structure("execution_result", Result);
	ResultStructure = OPI_Tools.JSONString(ResultStructure, , False);
	
	Response = ResponseResult(RequestID, ResultStructure);
	
	Return Response;	
	
EndFunction

Function ValidateRequest(Val Data)
	
	RequiredFieldsArray = New Array;
	RequiredFieldsArray.Add("jsonrpc");
	RequiredFieldsArray.Add("id");
	RequiredFieldsArray.Add("method");
	
	MissingFields = OPI_Tools.FindMissingCollectionFields(Data, RequiredFieldsArray);
	RequestID = OPI_Tools.GetOr(Data, "id", Undefined);
	
	If MissingFields.Count() > 0 Then
		
		ErrorText = StrTemplate("Params not found: %1", StrConcat(MissingFields));
		Return ParametersErrorResponse(RequestID, ErrorText);
		
	EndIf;
	
	Method = Data["method"];
	
	If Method = "initialize" Then
		
		ClientParams = Undefined;
		ClientProtocol = Undefined;
		
		If Not OPI_Tools.CollectionFieldExists(Data, "params", ClientParams) Then
			Return ParametersErrorResponse(RequestID, "Method params not found");
		EndIf;
		
		If Not OPI_Tools.CollectionFieldExists(ClientParams, "protocolVersion", ClientProtocol) Then
			Return ParametersErrorResponse(RequestID, "Protocol version not found");
		EndIf;
		
	EndIf;
	
	Return Undefined;
	
EndFunction

Function ErrorJSONResponse()
	
	Response = ErrorTemplate();
	Response["error"]["message"] = "Parse error";
	Response["error"]["code"] = -32700;
	
	Return Response;
	
EndFunction

Function UnsupportedVersionResponse(Val RequestID, Val Version)
	
	Response = ErrorTemplate();
	Response["error"]["message"] = "Unsupported protocol version";
	Response["error"]["code"] = -32602;
	
	Response["error"]["data"].Insert("requested", Version);
	Response["error"]["data"].Insert("supported", SupportedVersionsArray);
	
	Return Response;
	
EndFunction

Function ParametersErrorResponse(Val RequestID, Val ErrorText)
	
	Response = ErrorTemplate(RequestID);
	Response["error"]["message"] = "Invalid Request";
	Response["error"]["data"].Insert("details", ErrorText);
	
	Return Response;
	
EndFunction

Function ServerErrorResponse(Val RequestID, Val ErrorText)
	
	Response = ErrorTemplate(RequestID);
	Response["error"]["code"] = -32000;
	Response["error"]["message"] = "Server error";
	Response["error"]["data"].Insert("details", ErrorText);
	
	Return Response;
	
EndFunction

Function ResponseResult(Val RequestID, Val ReplyText)
	
	Response = ResponseTemplate(RequestID);
	
	ResultArray = New Array;
	ResultArray.Add(New Structure("type,text", "text", ReplyText));
	
	Response.Insert("result", New Structure("content", ResultArray));
	
	Return Response;
	
EndFunction

Function EmptyListResponse(Val RequestID, Val ListType)
	
	Response = ResponseTemplate(RequestID);
	
	Result = New Structure;
	Result.Insert(ListType, New Array);
	
	Response.Insert("result", Result);
	
	Return Response;
	
EndFunction

Function ErrorTemplate(Val RequestID = Undefined)
	
	ResponseStructure = ResponseTemplate(RequestID);
	
	Error = New Structure("code,message,data"
	, -32600
	, "Unexpected error"
	, New Structure);
	
	ResponseStructure.Insert("error", Error);
	
	Return ResponseStructure;
	
EndFunction

Function ResponseTemplate(Val RequestID = Undefined)
	
	ResponseStructure = New Structure;
	ResponseStructure.Insert("jsonrpc", "2.0");
	
	If ValueIsFilled(RequestID) Then
		OPI_TypeConversion.GetNumber(RequestID);
	EndIf;
	
	ResponseStructure.Insert("id", RequestID);
	
	Return ResponseStructure;
	
EndFunction

Function InitializeConfiguration(Val Configuration)
	
	If ValueIsFilled(Configuration) And Not Configuration = "default" Then

		ErrorText = "The configuration is not a valid collection of key and value";
		OPI_TypeConversion.GetKeyValueCollection(Configuration, ErrorText);

		ConfigurationParameters = Configuration;

	Else
		ConfigurationParameters = New Map;
	EndIf;

	ConfigurationVariables = OPI_Tools.GetOr(ConfigurationParameters, "vars", New Map); 

EndFunction

Function InitializeLog(Val LogFile)
	
	If ValueIsFilled(LogFile) Then
		
		For N = 1 To 5 Do
			
			Try
				
				LogStream = New FileStream(LogFile, FileOpenMode.Append, FileAccess.Record);
				LogWrite = New TextRecord(LogStream);
				
				Break;
				
			Except
				
				If N = 5 Then
					
					Error = BriefErrorDescription(ErrorInfo());
					
					ErrorStructure = ServerErrorResponse(0, Error);
					ErrorString = OPI_Tools.JSONString(ErrorStructure, , False);
					
					Return ErrorString;
					
				Else
					Sleep(500);
					Continue;
				EndIf;
				
			EndTry;
			
		EndDo;
		
	EndIf;
	
	Return Undefined;
	
EndFunction

Procedure LogData(Val Text) export
	If LogWrite = Undefined Then
		Return;
	EndIf;
	LogWrite.WriteLine(StrTemplate("[%1] %2", CurrentDate(), Text));
EndProcedure

#EndRegion
