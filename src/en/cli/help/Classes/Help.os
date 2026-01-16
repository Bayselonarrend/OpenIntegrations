Var ColorOutput;
Var ConsoleWidth;
Var UseAdaptiveOutput;

#Region Internal

Procedure OnObjectCreate(AccessTemplate)

	ColorOutput  = LoadScript(StrTemplate(AccessTemplate, "env/Modules/ColorOutput.os"));

	Try
		ConsoleWidth = Консоль.Width;
		UseAdaptiveOutput = True;
	Except
		UseAdaptiveOutput = False;
	EndTry;

EndProcedure

Procedure DisplayStartPage(Val ModuleCommandMapping, Val Version) Export
	
	CommandList = "";

	For Each Command In ModuleCommandMapping Do
		CommandList = CommandList + Command.Key + ", ";
	EndDo;

	ExtraCharacters = 2;
	CommandList  = Left(CommandList, StrLen(CommandList) - ExtraCharacters);

	Консоль.TextColor = ConsoleColor.Green;
	Консоль.WriteLine("");

	Консоль.TextColor = ConsoleColor.Yellow;
	ColorOutput.Write("
		|    _______ _____________  ___  _______
		|    __  __ ___/__  _/_ /  |  / /___  __/
		|    _  / / / __  /  __      / __  /   
		|    / /_/ / __/ /   _  /|  /  _  /    
		|    \____/  /___/   /_/ |_/   /_/     
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

	Консоль.Write("
		|
		| Call libraries without method or method without parameters returns help
		| List available libraries: "); 
		
	Консоль.TextColor = ConsoleColor.White;
	Консоль.Write(CommandList); 

	Консоль.TextColor = ConsoleColor.White;
	OffsetLength       = 11;
	NewLineTab  = "           ";

	StandardOptionsDescription = StrTemplate("
		|
		| (Standard options:|#color=Yellow)
		|
		|  (--help|#color=Green)  -%1
		|  (--debug|#color=Green) -%2
		|  (--out|#color=Green)   -%3
		|"
		, GetWidthSplittedDescription("displays help on the current command or method. Similar to calling a command without options", NewLineTab, OffsetLength)
		, GetWidthSplittedDescription("a flag responsible for providing more detailed information during program operation", NewLineTab, OffsetLength)
		, GetWidthSplittedDescription("the path to the result saving file (particularly binary data)", NewLineTab, OffsetLength));

	ColorOutput.WriteLine(StandardOptionsDescription);
	
	Консоль.TextColor = ConsoleColor.Yellow;
	ColorOutput.WriteLine(" Full documentation can be found at: (https://openintegrations.dev|#color=Cyan)" + Chars.LF);

	Консоль.WriteLine("");
	Консоль.TextColor = ConsoleColor.White;

	Exit(0);
	
EndProcedure

Procedure DisplayMethodHelp(Val Command, Val ParametersTable) Export

	Консоль.TextColor = ConsoleColor.White;
	ColorOutput.WriteLine(Chars.LF + " (##|#color=Green) Library - (" + Command + "|#color=Cyan)");

	ParametersTable.GroupBy("Method,Region");
	
	ColorOutput.WriteLine(" (##|#color=Green) Available methods: " + Chars.LF);
	Консоль.TextColor = ConsoleColor.White;

	CurrentRegion       = "";
	Counter              = 0;
	NumberOfParameters = ParametersTable.Count();

	For each MethodLine In ParametersTable Do

		First    = False;
		Last = False;

		If CurrentRegion <> MethodLine.Region Then
			CurrentRegion = MethodLine.Region;
			ColorOutput.WriteLine("    (o|#color=Yellow) (" + CurrentRegion + "|#color=Cyan)");
			First = True;
		EndIf;

		If Counter >= NumberOfParameters - 1 Then
			Last = True;
		Else
			Last = ParametersTable[Counter + 1].Region <> CurrentRegion;
		EndIf;

		If First And Last Then
			Label = "└───";
		ElsIf First Then
			Label = "└─┬─";
		ElsIf Last Then
			Label = "  └─";
		Else
			Label = "  ├─";
		EndIf;
		
		ColorOutput.WriteLine("    (" + Label + "|#color=Yellow) " + MethodLine.Method);

		Counter = Counter + 1;
	EndDo;

	Message(Chars.LF);
	Консоль.TextColor = ConsoleColor.White;

	Exit(0);

EndProcedure

Procedure DisplayParameterHelp(Val ParametersTable) Export 

	If ParametersTable.Count() = 0 Then
		DisplayExceptionMessage("Method");
	EndIf;

	MethodName      = ParametersTable[0].Method;
	MethodDescription = ParametersTable[0].MethodDescription;
	
	FullParamsDescription = GetFullParamsDescription(ParametersTable);

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
		Code   = 1;

	ElsIf Reason = "Method" Then
		Text = "Incorrect method! Check input correctness";
		Code   = 2;
		
	Else
		Text = "Unexpected Error!: " + Reason;
		Code   = 99;
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

Function GetFullParamsDescription(ParametersTable)

	MaximumLength 	     = 0;
	OptionListsMap = New Map();
	FullDescriptionsArray     = New Array;
	ParameterDescriptionTemplate  = "    (%1|#color=Yellow) -%2";

	For Each MethodParameter In ParametersTable Do

		OptionFull      = MethodParameter["Parameter"];
		SplittedOption = MethodParameter["ParameterTrim"];

		CurrentOptionList = ?(ValueIsFilled(SplittedOption)
			, StrTemplate("%1, %2", SplittedOption, OptionFull)
			, OptionFull);

		CurrentLength = StrLen(CurrentOptionList);

		If MaximumLength < CurrentLength Then
			MaximumLength = CurrentLength;
		EndIf;

		OptionListsMap.Insert(OptionFull, CurrentOptionList);
		
	EndDo;

	NewLineTabLength = MaximumLength + 5;
	NewLineTab       = "";
	
	For N = 0 To NewLineTabLength Do
		NewLineTab = NewLineTab + " ";
	EndDo;

	For Each MethodParameter In ParametersTable Do
			
		CurrentOptionList = OptionListsMap.Get(MethodParameter["Parameter"]);

		While StrLen(CurrentOptionList) < MaximumLength Do
			CurrentOptionList = CurrentOptionList + " ";
		EndDo;

		DescriptionArray  = StrSplit(MethodParameter["Description"], Chars.LF);
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

		EndIf;;

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
	ThirdPartOfAvailble       = Round(AvailableStringLength / 3);

	If AvailableStringLength < 0 Then
		Return Undefined;
	EndIf;

	SplitsArray = New Array;

	For Each DescriptionString In DescriptionLinesArray Do

		WordArray    = StrSplit(TrimAll(DescriptionString), " ");
		CurrentRow = "";

		N = 0;

		While N <= WordArray.UBound() Do

			Word       = WordArray[N];		
			NewLine = StrTemplate("%1 %2", CurrentRow, Word);

			If AvailableStringLength >= StrLen(NewLine) Then
				CurrentRow = NewLine;
			Else

				If CurrentRow = "" Or StrLen(Word) > ThirdPartOfAvailble Then

					SymbolCount = AvailableStringLength - StrLen(CurrentRow) - 1;
					LeftPart    = Left(Word, SymbolCount);
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
