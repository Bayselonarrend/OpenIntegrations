Var ColorOutput;

#Region Internal

Procedure OnObjectCreate(AccessTemplate)
	ColorOutput = LoadScript(StrTemplate(AccessTemplate, "env/Modules/ColorOutput.os"));
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
	ColorOutput.WriteLine("
		|
		| (Standard options:|#color=Yellow)
		|
		|  (--help|#color=Green)  - displays help on the current command or method. Similar to calling a command without options
		|  (--debug|#color=Green) - a flag responsible for providing more detailed information during program operation
		|  (--out|#color=Green)   - the path to the result saving file (particularly binary data)
		|");
	
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

	MethodName    = ParametersTable[0].Method;
	HelpText = "
	| (##|#color=Green) Method (" + MethodName + "|#color=Cyan)
	| (##|#color=Green) "       + ParametersTable[0].MethodDescription; 
	
	ColorOutput.WriteLine(HelpText);
	HelpText = "";

	HandleHelpTabulation(ParametersTable);

	For Each MethodParameter In ParametersTable Do

		HelpText = HelpText 
			+ Chars.LF
			+ "    ("
			+ MethodParameter["Parameter"]
			+ "|#color=Yellow) - "
			+ MethodParameter["Description"];

	EndDo;

	ColorOutput.WriteLine(HelpText + Chars.LF);

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
		Text = "Unexpected Error! " + Reason;
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

Procedure HandleHelpTabulation(ParametersTable)

	Parameter_			= "Parameter";
	MaximumLength 	= 0;

	For Each MethodParameter In ParametersTable Do

		CurrentLength = StrLen(MethodParameter[Parameter_]);

		If MaximumLength < CurrentLength Then
			MaximumLength = CurrentLength;
		EndIf;
		
	EndDo;

	For Each MethodParameter In ParametersTable Do
			
		While StrLen(MethodParameter[Parameter_]) < MaximumLength Do
			MethodParameter[Parameter_] = MethodParameter[Parameter_] + " ";
		EndDo;

		If ValueIsFilled(MethodParameter["ParameterTrim"]) Then
			MethodParameter[Parameter_] = MethodParameter[Parameter_] + ", " + MethodParameter["ParameterTrim"];
		Else
			MethodParameter[Parameter_] = MethodParameter[Parameter_] + "    ";
		EndIf;

		CurrentDescription    = MethodParameter["Description"];
		DescriptionArray     = StrSplit(CurrentDescription, Chars.LF);
		InitialTab = 4;

		If DescriptionArray.Count() = 1 Then
			Continue;
		Else

			For N = 1 To DescriptionArray.UBound() Do

				CurrentElement = DescriptionArray[N];
				RequiredLength = StrLen(CurrentElement) + StrLen(MethodParameter[Parameter_] + " - ") + InitialTab;

				While StrLen(DescriptionArray[N]) < RequiredLength Do
					DescriptionArray[N] = " " + DescriptionArray[N];
				EndDo;

			EndDo;

			MethodParameter["Description"] = StrConcat(DescriptionArray, Chars.LF);	
			
		EndIf;

	EndDo;

EndProcedure

#EndRegion
