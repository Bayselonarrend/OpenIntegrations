// CLI: server
// Tool: true

#Use "../../../oint/tools/main"
#Use "../../core/Classes/internal"
#Use "../../data"

Var OPIObject;
Var SessionVariables;

#Region Public

#Region ServerMethods

// stdio
// Starts a server for exchange via standard input/output streams
// 
// Parameters:
// MessageSeparator - String - tring appended to the end of the server response - sprt
// SeparateStart - Boolean - Additionally inserts a separator at the beginning of the message - bsprt
// StreamsEncoding - String - Use a specific encoding regardless of the shell - enc
//
// Returns:
// String - empty string
Function stdio(Val MessageSeparator = "", Val SeparateStart = False, Val StreamsEncoding = "") Export
	
	SessionVariables = New Map;

	OPI_TypeConversion.GetLine(StreamsEncoding);
	OPI_TypeConversion.GetLine(MessageSeparator);
	OPI_TypeConversion.GetLine(SeparateStart);
	
	OPIObject = New LibraryComposition;
	
	If ValueIsFilled(StreamsEncoding) Then
		Console.InputEncoding = StreamsEncoding;
		Console.OutputEncoding = StreamsEncoding;
	EndIf;

	While True Do
		
		Data = "";

		InputString(Data);
		
		If Not ValueIsFilled(Data) Then
			Sleep(100);
			Continue;
		EndIf;
		
		Try
			
			Response = ProcessRequest(Data);
			
		Except
			
			Response = ErrorDescription();

		EndTry;
		
		If Response = Undefined Then
			Continue;
		EndIf;
		
		OPI_TypeConversion.GetLine(Response);		
		
		If SeparateStart Then
			ResponseTemplate = "%2%1%2";
		Else
			ResponseTemplate = "%1%2";
		EndIf;

		Console.Write(StrTemplate(ResponseTemplate, TrimAll(Response), MessageSeparator));
		
	EndDo;
	
EndFunction

#EndRegion

#EndRegion

#Region Private

Function ProcessRequest(Val DataString)
	
	If Not ValueIsFilled(DataString) Then
		Return Undefined;
	EndIf;
	
	StringParts = StrSplit(DataString, " ", True);
	
	If StringParts.Count() < 2 Then
		Return ProcessServiceCommand(StringParts[0]);
	EndIf;
	
	Command = StringParts[0];
	StringParts.Delete(0);

	Method = StringParts[0];
	StringParts.Delete(0);

	MethodData = OPIObject.GetMethodData(Command, Method);
    
	If MethodData = Undefined Then
		Raise "Error in method or command name!"	
	EndIf;
	
	ParameterDescriptionList = MethodData["params"];
	ParameterSearchList = New ValueList;
	ProcessedOptions = New Map;
	
	For Each ParametersDescription In ParameterDescriptionList Do
		ParameterSearchList.Add(ParametersDescription["name"]);
		ParameterSearchList.Add(ParametersDescription["short"]);
	EndDo;
	
	CurrentOption = Undefined;
	CurrentSplicing = Undefined;
	Context = New Map;

	For Each StringPart In StringParts Do
		
		If ParameterSearchList.FindByValue(StringPart) = Undefined Then
			
			If CurrentSplicing = Undefined Then
				Raise "Check the order and escaping when entering a command!"
			EndIf;

			CurrentSplicing.Add(StringPart);
			
		Else
			
			If ValueIsFilled(CurrentSplicing) Then
				
				CurrentValue = StrConcat(CurrentSplicing, " ");
				AdditionalContext(Context, CurrentValue);
				ProcessedOptions.Insert(CurrentOption, CurrentValue);
				
			EndIf;
			
			CurrentOption = StringPart;
			CurrentSplicing = New Array;
			
		EndIf;
		
	EndDo;
	
	If ValueIsFilled(CurrentSplicing) Then
		
		CurrentValue = StrConcat(CurrentSplicing, " ");
		AdditionalContext(Context, CurrentValue);
		ProcessedOptions.Insert(CurrentOption, CurrentValue);
		
	EndIf;
	
	CallStructure = OPIObject.FormMethodCallString(ProcessedOptions, Command, Method, , True);
	
	If CallStructure["Error"] Then
		
		Raise "Check the order and escaping when entering a command!"
		
	EndIf;
	
	ExecutionText = CallStructure["Result"];
	
	Result = Undefined;
	
	Try
		Executor.ExecuteScript(ExecutionText, Result, , Context);
		NormalizeResult(Result);
	Except
		Result = DetailErrorDescription(ErrorInfo());
	EndTry;
	
	Return Result;

EndFunction

Function ProcessServiceCommand(Val Command)
	
	Command = TrimAll(Command);
	
	If Command = "help" Then
		
		Return "Service commands:
		|
		|exit  - server shutdown
		|vars  - list process variables
		|clear - clear process variable list";
		
	ElsIf Command = "exit" Then
		
		Exit(0);
		
	ElsIf Command = "vars" Then
		
		If Not ValueIsFilled(SessionVariables) Then
			Return "";
		EndIf;
		
		VariableTemplate = "%1 %2";
		OutputArray = New Array;

		For Each Variable In SessionVariables Do
			OutputArray.Add(StrTemplate(VariableTemplate, Variable.Key, String(TypeOf(Variable.Value))));
		EndDo;
		
		Return StrConcat(OutputArray, Chars.LF);
		
	ElsIf Command = "clear" Then
		
		SessionVariables.Clear();
		Return "OK"
		
	Else
		Raise "Missing method or command name!";
	EndIf;

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
	
	If ResultType = Type("BinaryData") Then

		Result = GetBase64StringFromBinaryData(Result);
		
	ElsIf StrStartsWith(String(ResultType), "AddIn.") Then
		
		VariableKey = GenerateVariableKey();
		SessionVariables.Insert(VariableKey, Result);	
		Result = VariableKey;
		
	Else
		OPI_TypeConversion.GetLine(Result);
	EndIf;

EndProcedure

Procedure AdditionalContext(Context, Val CurrentValue)
	
	OPI_TypeConversion.GetLine(CurrentValue);
	
	VariableValue = SessionVariables.Get(CurrentValue);
	
	If VariableValue <> Undefined Then
		Context.Insert(CurrentValue, VariableValue);
	EndIf;

EndProcedure

#EndRegion
