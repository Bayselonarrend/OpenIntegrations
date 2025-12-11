#Use "../../../oint/tools"

Var Debugging;           // Flag output debug information
Var Testing;      // Flag disconnection of sending data after processing

Var Parser;            // Object parser incoming data 
Var OPIObject;         // Object work with methods OPI
Var Help;           // Object output reference information

Var OutputFile;        // Path redirection output in file

Var ParametersTable; // Table parameters current libraries
Var CurrentCommand;    // Name current commands

#Region Private

#Region Main

Procedure MainHandler()
	
	Debugging        = False;
	Testing   = False;

	SetEnvironmentVariable("OINT_CLI", "YES");

	CurrentDirectory = CurrentScript().Path;
	CurrentDirectory = StrReplace(CurrentDirectory, "\", "/");

	PathParts      = StrSplit(CurrentDirectory, "/");
	PathParts.Delete(PathParts.UBound());
	PathParts.Delete(PathParts.UBound());

	AccessTemplate = StrConcat(PathParts, "/") + "/%1";

	Parser         = LoadScript(StrTemplate(AccessTemplate, "env/Classes/CommandLineArgumentParser.os"));
	OPIObject      = LoadScript(StrTemplate(AccessTemplate, "data/Classes/LibraryComposition.os"));

	AttachScript(StrTemplate(AccessTemplate, "help/Classes/Help.os"), "Help");
	Help = New Help(AccessTemplate);
	
	DetermineCurrentCommand();
	FormCommand();

	Result = Parser.Parse(CommandLineArguments);
	ExecuteCommandProcessing(Result);

EndProcedure

Procedure DetermineCurrentCommand()

	If CommandLineArguments.Count() > 0 Then
		CurrentCommand = CommandLineArguments[0];
	Else
		CurrentCommand = Undefined;
	EndIf;
	
EndProcedure

Procedure FormCommand()

	If CurrentCommand = Undefined Then

		AllCommands = OPIObject.GetCommandModuleMapping();
		Version     = OPIObject.GetVersion();

		Help.DisplayStartPage(AllCommands, Version);

		Return;

	EndIf;
	
	Command           = Parser.CommandDescription(CurrentCommand);
	CurrentIndex     = OPIObject.GetIndexData(CurrentCommand);
	ParametersTable = CurrentIndex["Composition"];

	If Not ParametersTable = Undefined Then

		Parser.AddPositionalCommandParameter(Command, "Method");
		
		AddCommandParameters(Parser, Command);
		Parser.AddCommandFlagParameter(Command, "--help");
		Parser.AddCommandFlagParameter(Command, "--debug");
		Parser.AddCommandFlagParameter(Command, "--test");

		Parser.AddNamedCommandParameter(Command, "--out");
		
		Parser.AddCommand(Command);

	Else
		Help.DisplayExceptionMessage("Command", OutputFile);
	EndIf;
	
EndProcedure

Procedure ExecuteCommandProcessing(Val Data)
	
	CurrentCommand = Data["Command"];
	Parameters      = Data["ParameterValues"];
	Output		   = "";

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
		Return OPI_Tools.GetLastBuildHashSum();
	EndIf;

	Method     = TrimAll(Parameters["Method"]);
	Response     = "Function Returned Empty Value";

	NumberOfStandardParameters = 4;

	If Not ValueIsFilled(Method) Or Method = "--help" Then
		Help.DisplayMethodHelp(Command, ParametersTable);
	EndIf;

	If Parameters.Count() = NumberOfStandardParameters Or Parameters["--help"] Then

		CommandSelection      = New Structure("SearchMethod", Upper(Method));
		MethodParameters   = ParametersTable.FindRows(CommandSelection);
	
		If Not ValueIsFilled(MethodParameters) Then
			Help.DisplayExceptionMessage("Method", OutputFile);
		EndIf;

		Help.DisplayParameterHelp(MethodParameters);
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
		Execute(ExecutionText);
	EndIf;

	Return Response;
	
EndFunction

#EndRegion

#Region Auxiliary

Procedure AddCommandParameters(Parser, Command);
	
	Fields = "Parameter,ParameterTrim";

	TableForUse = ParametersTable.Copy(, Fields);
	TableForUse.GroupBy(Fields);

	ParameterArray     = TableForUse.UnloadColumn("Parameter");
	ParameterArrayTrim = TableForUse.UnloadColumn("ParameterTrim");
	
	For Each Parameter In ParameterArray Do
		Parser.AddNamedCommandParameter(Command, Parameter);
	EndDo;

	For Each Parameter In ParameterArrayTrim Do
		Parser.AddNamedCommandParameter(Command, Parameter);
	EndDo;
	
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
		Debugging         = True;
		EnvironmentVariable = "YES";
	Else
		Debugging         = False;
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

Function WriteValueToFile(Val Value, Val Path)
	
	StandardUnit = 1024;
	DataUnit      = StandardUnit * StandardUnit;
	Value           = ?(TypeOf(Value) = Type("BinaryData"), Value, String(Value));

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
		Information = ErrorDescription();
	Else
		Information = BriefErrorDescription(ErrorInfo());
	EndIf;

	Help.DisplayExceptionMessage(Information, OutputFile);

EndTry;
