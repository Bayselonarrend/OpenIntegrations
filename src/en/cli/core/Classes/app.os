Var Debugging; // Flag output debug information
Var Testing; // Flag disconnection of sending data after processing

Var Parser; // Object parser incoming data 
Var OPIObject; // Object work with methods OPI
Var Help; // Object output reference information

Var OutputFile; // Path redirection output in file
Var CurrentCommand; // Name current commands
Var CurrentMethod;
Var CurrentIndex;

Var OintTemplate;     
Var PackagesDirectory;
Var AccessTemplate;
Var Responsible;       

#Region Private

#Region Main

Procedure MainHandler()
	
	Debugging = True;
	Testing = False;

	SetEnvironmentVariable("OINT_CLI", "YES");

	DefinePathsTemplates();
	
	Parser = LoadScript(StrTemplate(AccessTemplate, "env/Classes/CommandLineArgumentParser.os"));
	OPIObject = LoadScript(StrTemplate(AccessTemplate, "data/Classes/LibraryComposition.os"));
	OPIObject.SetPackagesDirectory(PackagesDirectory);

	AttachScript(StrTemplate(AccessTemplate, "help/Classes/Help.os"), "Help");
	Help = New Help(AccessTemplate, OPIObject);
	
	DetermineCurrentCommandMethod();
	FormParameterSet();

	Result = Parser.Parse(CommandLineArguments);
	ExecuteCommandProcessing(Result);

EndProcedure

Procedure DetermineCurrentCommandMethod()

	ArgsCount = CommandLineArguments.Count();

	If ArgsCount > 0 Then
		CurrentCommand = CommandLineArguments[0];
	Else
		CurrentCommand = Undefined;
	EndIf;

	If ArgsCount > 1 Then
		CurrentMethod = CommandLineArguments[1];
	Else
		CurrentMethod = Undefined;
	EndIf;
	
EndProcedure

Procedure FormParameterSet()

	If CurrentCommand = Undefined Then
		Help.DisplayStartPage();
		Return;
	EndIf;
	
	Command = Parser.CommandDescription(CurrentCommand);

	Parser.AddPositionalCommandParameter(Command, "Method");
	
	AddMethodParams(Command, Parser);

	Parser.AddCommandFlagParameter(Command, "--help");
	Parser.AddCommandFlagParameter(Command, "--debug");
	Parser.AddCommandFlagParameter(Command, "--test");
	Parser.AddNamedCommandParameter(Command, "--out");

	Parser.AddCommand(Command);

EndProcedure

Procedure ExecuteCommandProcessing(Val Data)
	
	CurrentCommand = Data["Command"];
	Parameters = Data["ParameterValues"];
	Output		 = "";

	SetDebugMode(Parameters);
	SetTestMode(Parameters);
	SetOutputFile(Parameters);
	DisplayAdditionalInformation(Parameters);

	Try
			
		Output = GetProcessingResult(CurrentCommand, Parameters);

		ProcessJSONOutput(Output);
		ReportResult(Output, MessageStatus.Attention);

	Except
		HandleErrorOutput(Output, ErrorInfo());
	EndTry;
	
EndProcedure

Function GetProcessingResult(Val Command, Val Parameters)

	If CurrentCommand = "hashsum" Then

		AttachExecutor();
		Return Responsible.GetLastBuildHashSum();

	EndIf;

	Method = TrimAll(Parameters["Method"]);
	Response = "Function Returned Empty Value";

	NumberOfStandardParameters = 4;

	If Not ValueIsFilled(Method) Or Method = "--help" Then
		Help.DisplayMethodHelp(Command);
	EndIf;

	If Parameters.Count() = NumberOfStandardParameters Or Parameters["--help"] Then
		Help.DisplayParameterHelp(Command, Method);
	EndIf;

	ExecutionStructure = OPIObject.FormMethodCallString(Parameters, Command, Method);

	If ExecutionStructure["Error"] Then
		Help.DisplayExceptionMessage(ExecutionStructure["Result"], OutputFile);
	Else
		ExecutionText = ExecutionStructure["Result"];
	EndIf;

	If Debugging Or Testing Then
		Message(ExecutionText, MessageStatus.Attention);
	EndIf;

	If Not Testing Then
		AttachExecutor();
		Responsible.ExecuteScript(ExecutionText, Response);
	EndIf;

	Return Response;
	
EndFunction

#EndRegion

#Region Auxiliary

Procedure AddMethodParams(Command, Parser)
	
	If Not ValueIsFilled(CurrentMethod) Then
		Return	
	EndIf;

	MethodData = OPIObject.GetMethodData(CurrentCommand, CurrentMethod);
	
	If Not ValueIsFilled(MethodData) Then
		Help.DisplayExceptionMessage("Method", OutputFile);
	EndIf;

	MethodParameters = MethodData["params"];

	For Each Parameter In MethodParameters Do

		FullName = Parameter["name"];

		If FullName = "--out" Then
			Continue;
		EndIf;

		ShortName = Parameter["short"];

		Parser.AddNamedCommandParameter(Command, FullName);
		Parser.AddNamedCommandParameter(Command, ShortName);

	EndDo;

EndProcedure

Procedure DefinePathsTemplates()

	CurrentDirectory = CurrentScript().Path;
	CurrentDirectory = StrReplace(CurrentDirectory, "\", "/");

	PathParts = StrSplit(CurrentDirectory, "/");
	PathParts.Delete(PathParts.UBound());
	PathParts.Delete(PathParts.UBound());

	AccessTemplate = StrConcat(PathParts, "/") + "/%1";

	PathParts.Delete(PathParts.UBound());

	PackagesDirectory = StrConcat(PathParts, "/");

EndProcedure

Procedure ProcessJSONOutput(Output)
	
	If EmptyOutput(Output) Then
		Output = New Structure;
	EndIf;

	If TypeOf(Output) = Type("Structure")
		Or TypeOf(Output) = Type("Map")
		Or TypeOf(Output) = Type("Array") Then
	
		Output = JSONString(Output);

	EndIf;

EndProcedure

Procedure SetDebugMode(Val Parameters)

	If Parameters["--debug"] Then
		Debugging = True;
		EnvironmentVariable = "YES";
	Else
		Debugging = False;
		EnvironmentVariable = "NO"
	EndIf;

	SetEnvironmentVariable("OINT_DEBUG", EnvironmentVariable);

EndProcedure

Procedure SetTestMode(Val Parameters)

	If Parameters["--test"] Then
		Testing = True;
	Else
		Testing = False;
	EndIf;

EndProcedure

Procedure SetOutputFile(Val Parameters)

	Output = Parameters["--out"];

	If ValueIsFilled(Output) Then
		OutputFile = Output;
	EndIf;

EndProcedure

Procedure DisplayAdditionalInformation(Parameters)

	If Debugging Or Testing Then

		For each IntroductoryParameter In Parameters Do
			Message(IntroductoryParameter.Key + " : " + IntroductoryParameter.Value);	
		EndDo;

    EndIf;
	
EndProcedure

Procedure HandleErrorOutput(Output, ErrorInfo)

	Information = "";
	If ValueIsFilled(Output) Then

		If Debugging Or Testing Then
			Information = DetailErrorDescription(ErrorInfo);
		EndIf;

		ReportResult(Output);
	Else

		If Debugging Or Testing Then
			Information = DetailErrorDescription(ErrorInfo);
		Else
			Information = BriefErrorDescription(ErrorInfo);
		EndIf;
	
	EndIf;
	
	Help.DisplayExceptionMessage(Information, OutputFile);
	
EndProcedure

Procedure ReportResult(Val Text, Val Status = "")

	If Not ValueIsFilled(Status) Then
		Status = MessageStatus.WithoutStatus;
	EndIf;

	If ValueIsFilled(OutputFile) Then
		Text = WriteValueToFile(Text, OutputFile);
	ElsIf TypeOf(Text) = Type("BinaryData") Then
		Text = "It Seems Binary Data Was Received in Response!! "
		    + "Next time, use the --out option to specify the path for saving";
		Status = MessageStatus.Information;
	Else 
		Text = String(Text);
	EndIf;

    Message(Text, Status);
	
EndProcedure

Procedure AttachExecutor()

	If Responsible = Undefined Then

		CurrentScriptFolder = StrReplace(CurrentScript().Path, "\", "/");

		ExecutorPath = StrTemplate("%1/%2"
			, CurrentScriptFolder
			, "internal/Modules/Executor.os");

		Responsible = LoadScript(ExecutorPath);

	EndIf;

EndProcedure

Function WriteValueToFile(Val Value, Val Path)
	
	StandardUnit = 1024;
	DataUnit = StandardUnit * StandardUnit;
	Value = ?(TypeOf(Value) = Type("BinaryData"), Value, String(Value));

	If TypeOf(Value) = Type("String") Then 

		PossibleFile = New File(Value);

		If PossibleFile.Exists() Then
			Path = Value;
		Else
			Value = GetBinaryDataFromString(Value);
	    EndIf;

	EndIf;

	If TypeOf(Value) = Type("BinaryData") Then
        Value.Write(Path);
	EndIf;

	RecordedFile = New File(Path);

	If RecordedFile.Exists() Then
		Return "File with size " 
		    + String(Round(RecordedFile.Size() / DataUnit, 3)) 
			+ " MB was recorded in " 
			+ RecordedFile.FullName;
	Else
		Raise "File was not saved! Use the --debug flag for more information";
	EndIf;

EndFunction

Function EmptyOutput(Output)

	If TypeOf(Output) = Type("BinaryData") Then
		Return Output.Size() = 0;
	Else
		Return Not ValueIsFilled(Output);
	EndIf;
	
EndFunction

Function JSONString(Val Data)

    LineBreak = JSONLineBreak.Windows;

    JSONParameters = New JSONWriterSettings(LineBreak
        , " "
        , False
        , JSONCharactersEscapeMode["None"]
        , False
        , False
        , False
        , False);

    Try

        JSONWriter = New JSONWriter;
        JSONWriter.SetString(JSONParameters);

        WriteJSON(JSONWriter, Data);
        Return JSONWriter.Close();

    Except
        Return "NOT JSON: " + String(Data);
    EndTry;

EndFunction

#EndRegion

#EndRegion

Try
	MainHandler();	
Except
	
	If Debugging Then
		Information = DetailErrorDescription(ErrorInfo());
	Else
		Information = ErrorInfo().Description;
	EndIf;

	Try
		Help.DisplayExceptionMessage(Information, OutputFile);	
	Except
		Raise Information
	EndTry;

EndTry;
