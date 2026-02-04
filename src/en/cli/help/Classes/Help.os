Var ColorOutput;
Var ConsoleWidth;
Var UseAdaptiveOutput;
Var OPIObject;

#Region Internal

Procedure OnObjectCreate(AccessTemplate_, OPIObject_)

	ColorOutput = LoadScript(StrTemplate(AccessTemplate_, "env/Modules/ColorOutput.os"));
	OPIObject = OPIObject_;

	Try
		ConsoleWidth = Console.Width;
		UseAdaptiveOutput = True;
	Except
		UseAdaptiveOutput = False;
	EndTry;

EndProcedure

Procedure DisplayStartPage() Export

	Version = OPIObject.GetVersion();
	ModuleCommandMapping = OPIObject.GetCommandModuleMapping();
	
	CommandList = "";

	For Each Command In ModuleCommandMapping Do
		CommandList = CommandList + Command.Key + ", ";
	EndDo;

	ExtraCharacters = 2;
	CommandList = Left(CommandList, StrLen(CommandList) - ExtraCharacters);

	Console.TextColor = ConsoleColor.Green;
	Console.WriteLine("");

	Console.TextColor = ConsoleColor.Yellow;
	ColorOutput.Write("
		| _______ _____________ ___ _______
		| __ __ ___/__ _/_ / | / /___ __/
		| _ / / / __ / __ / __ /   
		| / /_/ / __/ / _ /| / _ /    
		| \____/ /___/ /_/ |_/ /_/     
		|                          
		|
		| Welcome in (OInt|#color=White) v (" + Version + "|#color=Green)!
		|
		| Structure call:
	    | 
		| "
		+ "(oint|#color=White) "
		+ "(<library>|#color=Cyan) "
		+ "(<method>|#color=Cyan) " 
		+ "(--option1|#color=Gray) "
		+ "(""|#color=Green)"
		+ "(Value|#color=White)"
		+ "(""|#color=Green) "
		+ "(...|#color=White) "
		+ "(--optionN|#color=Gray) "
		+ "(""|#color=Green)"
		+ "(Value|#color=White)"
		+ "(""|#color=Green) ");

	Console.Write("
		|
		| Call libraries without method or method without parameters returns help
		| List available libraries: "); 
		
	Console.TextColor = ConsoleColor.White;
	Console.Write(CommandList); 

	Console.TextColor = ConsoleColor.White;
	OffsetLength = 11;
	NewLineTab = " ";

	StandardOptionsDescription = StrTemplate("
		|
		| (Standard options:|#color=Yellow)
		|
		| (--help|#color=Green) -%1
		| (--debug|#color=Green) -%2
		| (--out|#color=Green) -%3
		|"
		, GetWidthSplittedDescription("displays help on the current command or method. Similar to calling a command without options", NewLineTab, OffsetLength)
		, GetWidthSplittedDescription("a flag responsible for providing more detailed information during program operation", NewLineTab, OffsetLength)
		, GetWidthSplittedDescription("the path to the result saving file (particularly binary data)", NewLineTab, OffsetLength));

	ColorOutput.WriteLine(StandardOptionsDescription);
	
	Console.TextColor = ConsoleColor.Yellow;
	ColorOutput.WriteLine(" Full documentation can be found at: (https://openintegrations.dev|#color=Cyan)" + Chars.LF);

	Console.WriteLine("");
	Console.TextColor = ConsoleColor.White;

	Exit(0);
	
EndProcedure

Procedure DisplayMethodHelp(Val Command) Export

	CommandData = OPIObject.GetIndexData(Command);
	RegionsData = CommandData["regions"];

	Console.TextColor = ConsoleColor.White;
	ColorOutput.WriteLine(Chars.LF + " (##|#color=Green) Library - (" + Command + "|#color=Cyan)");

	ColorOutput.WriteLine(" (##|#color=Green) Available methods: " + Chars.LF);
	Console.TextColor = ConsoleColor.White;

	For each RegionLine In RegionsData Do

		CurrentRegion = RegionLine["name"];
		RegionMethods = RegionLine["methods"];

		ColorOutput.WriteLine(" (o|#color=Yellow) (" + CurrentRegion + "|#color=Cyan)");
		First = True;

		Counter = 0;
		For Each RegionMethod In RegionMethods Do

			Last = Counter = RegionMethods.UBound();

			If First And Last Then
				Label = "└───";
			ElsIf First Then
				Label = "└─┬─";
			ElsIf Last Then
				Label = " └─";
			Else
				Label = " ├─";
			EndIf;
			
			ColorOutput.WriteLine(" (" + Label + "|#color=Yellow) " + RegionMethod);

			Counter = Counter + 1;
			First = False;

		EndDo;

	EndDo;

	Message(Chars.LF);
	Console.TextColor = ConsoleColor.White;

	Exit(0);

EndProcedure

Procedure DisplayParameterHelp(Val Command, Val Method) Export 

	MethodData = OPIObject.GetMethodData(Command, Method);

	If Not ValueIsFilled(MethodData) Then
		DisplayExceptionMessage("Method");
	EndIf;

	MethodName = MethodData["name"];
	MethodDescription = MethodData["description"];
	
	FullParamsDescription = GetFullParamsDescription(MethodData);

	HelpText = StrTemplate("
	| (##|#color=Green) Method (%1|#color=Cyan)
	| (##|#color=Green) %2
	|
	|%3
	|", MethodName, MethodDescription, FullParamsDescription); 

	ColorOutput.WriteLine(HelpText);

	Exit(0);
	
EndProcedure

Procedure DisplayExceptionMessage(Val Reason, Val OutputFile = "") Export

	OutputFile = String(OutputFile);

	If Reason = "Command" Then
		Text = "Incorrect command! Check input correctness";
		Code = 1;

	ElsIf Reason = "Method" Then
		Text = "Incorrect method! Check input correctness";
		Code = 2;
		
	Else
		Text = "Unexpected Error!: " + Reason;
		Code = 99;
	EndIf;

	Text = Chars.LF + Text + Chars.LF;
	
	Message(Text, MessageStatus.VeryImportant);

	If ValueIsFilled(OutputFile) Then

		TextBD = GetBinaryDataFromString(Text);

		Try
			TextBD.Write(OutputFile);
			Message("The error message has been saved to a file: " + OutputFile, MessageStatus.Attention);
		Except
			Message("Failed to save the error to the output file: " + ErrorDescription(), MessageStatus.Attention);
		EndTry;

	EndIf;

	Exit(Code);

EndProcedure

#EndRegion

#Region Private

Function GetFullParamsDescription(MethodData)

	MaximumLength 	 = 0;
	OptionListsMap = New Map();
	FullDescriptionsArray = New Array;
	ParameterDescriptionTemplate = " (%1|#color=Yellow) -%2";
	DefaultValueTemplate = " (optional, def. val. - %1)";
	MethodParameters = MethodData["params"];

	For Each MethodParameter In MethodParameters Do

		OptionFull = MethodParameter["name"];

		If OptionFull = "--out" Then
			Continue;
		EndIf;

		SplittedOption = MethodParameter["short"];
		DefaultValue = MethodParameter["default"];

		CurrentOptionList = ?(ValueIsFilled(SplittedOption)
			, StrTemplate("%1, %2", SplittedOption, OptionFull)
			, StrTemplate(" %1", OptionFull));

		CurrentLength = StrLen(CurrentOptionList);

		If MaximumLength < CurrentLength Then
			MaximumLength = CurrentLength;
		EndIf;

		OptionListsMap.Insert(OptionFull, CurrentOptionList);
		
	EndDo;

	NewLineTabLength = MaximumLength + 5;
	NewLineTab = "";
	
	For N = 0 To NewLineTabLength Do
		NewLineTab = NewLineTab + " ";
	EndDo;

	For Each MethodParameter In MethodParameters Do
			
		CurrentOptionList = OptionListsMap.Get(MethodParameter["name"]);
		CurrentDescription = MethodParameter["description"];
		CurrentDefaultValue = MethodParameter["default"];

		If CurrentDefaultValue <> Undefined Then
			DefaultValueDescription = StrTemplate(DefaultValueTemplate, CurrentDefaultValue);
		Else
			DefaultValueDescription = "";
		EndIf;

		While StrLen(CurrentOptionList) < MaximumLength Do
			CurrentOptionList = CurrentOptionList + " ";
		EndDo;

		DescriptionText = StrTemplate("%1%2", MethodParameter["description"], DefaultValueDescription);
		DescriptionArray = StrSplit(DescriptionText, Chars.LF);
		CurrentDescription = Undefined;
		
		If UseAdaptiveOutput Then
			CurrentDescription = GetWidthSplittedDescription(DescriptionArray, NewLineTab, NewLineTabLength);
		EndIf;

		If CurrentDescription = Undefined Then

			If DescriptionArray.Count() = 1 Then
				CurrentDescription = DescriptionArray[0];
			Else
				CurrentDescription = StrConcat(DescriptionArray, Chars.LF + NewLineTab);
			EndIf;

		EndIf;

		CurrentFullDescription = StrTemplate(ParameterDescriptionTemplate, CurrentOptionList, CurrentDescription);
		FullDescriptionsArray.Add(CurrentFullDescription);

	EndDo;

	FullParamsDescription = StrConcat(FullDescriptionsArray, Chars.LF);

	Return FullParamsDescription;

EndFunction

Function GetWidthSplittedDescription(DescriptionLinesArray, NewLineTab, OffsetLength)

	If Not TypeOf(DescriptionLinesArray) = Type("Array") Then
		DescriptionLinesArray_ = New Array;
		DescriptionLinesArray_.Add(DescriptionLinesArray);
		DescriptionLinesArray = DescriptionLinesArray_;
	EndIf;

	AvailableStringLength = ConsoleWidth - OffsetLength - 4;
	ThirdPartOfAvailble = Round(AvailableStringLength / 3);

	If AvailableStringLength < 0 Then
		Return Undefined;
	EndIf;

	SplitsArray = New Array;

	For Each DescriptionString In DescriptionLinesArray Do

		WordArray = StrSplit(TrimAll(DescriptionString), " ");
		CurrentRow = "";

		N = 0;

		While N <= WordArray.UBound() Do

			Word = WordArray[N];		
			NewLine = StrTemplate("%1 %2", CurrentRow, Word);

			If AvailableStringLength >= StrLen(NewLine) Then
				CurrentRow = NewLine;
			Else

				If CurrentRow = "" Or StrLen(Word) > ThirdPartOfAvailble Then

					SymbolCount = AvailableStringLength - StrLen(CurrentRow) - 1;
					LeftPart = Left(Word, SymbolCount);
					CurrentRow = CurrentRow + LeftPart + "-";
					WordArray[N] = Right(Word, StrLen(Word) - StrLen(LeftPart));
				
				EndIf;

				SplitsArray.Add(CurrentRow);
				CurrentRow = "";
				Continue;

			EndIf;

			N = N + 1;

		EndDo;		

		If CurrentRow <> "" Then
			SplitsArray.Add(CurrentRow);
		EndIf;
		
	EndDo;

	FullDescription = StrConcat(SplitsArray, Chars.LF + NewLineTab);

	Return FullDescription;

EndFunction

#EndRegion
