Var mParams;
Var mPositionParams;

Var mCommands;

Var mTokenListPosition;
Var mPositionParamsPosition;
Var mEntryParamsArray;

Procedure OnObjectCreate()

	mParams = NewParamsTable();
	mPositionParams = NewParamsTable();
	mCommands   = New Map;
	
EndProcedure

Function AddParameter(Val ParameterName, Val Explanation = "") Export
	
	Return AddPramToTable(mPositionParams, ParameterName, Explanation, False, False);
	
EndFunction

Function AddNamedParam(Val ParameterName, Val Explanation = "", Val Global = False) Export
	
	Return AddPramToTable(mParams, ParameterName, Explanation, False, Global);
	
EndFunction

Function AddFlagParam(Val ParameterName, Val Explanation = "", Val Global = False) Export
	
	Return AddPramToTable(mParams, ParameterName, Explanation, True, Global);
	
EndFunction

Function AddCollectionParam(Val ParameterName, Val Explanation = "") Export
	
	Return AddCollectionParamToTable(mPositionParams, ParameterName, Explanation);
	
EndFunction

Function CommandDescription(Val CommandName, Val Explanation = "") Export
	
	NewDescription = New Structure;
	NewDescription.Insert("Command", CommandName);
	NewDescription.Insert("Explanation", Explanation);
	NewDescription.Insert("PositionParams", NewParamsTable());
	NewDescription.Insert("NamedParams", NewParamsTable());
	
	Return NewDescription;
	
EndFunction

Procedure AddCommand(Val CommandDescription) Export
	
	CommandName = CommandDescription.Command;
	If mCommands.Get(CommandName) <> Undefined Then
		Raise StrTemplate("Command <%1> has already been added before, adding it again is an error!", CommandName);
	EndIf;

	mCommands.Insert(CommandName, CommandDescription);
	
EndProcedure

Function GetCommand(Val CommandName) Export
	
	Return mCommands[CommandName];
	
EndFunction

Function AddPositionalCommandParameter(Val CommandDescription, Val ParameterName, Val Explanation = "") Export
	Return AddPramToTable(CommandDescription.PositionParams, ParameterName, Explanation, False);
EndFunction

Function AddNamedCommandParameter(Val CommandDescription, Val ParameterName, Val Explanation = "") Export
	Return AddPramToTable(CommandDescription.NamedParams, ParameterName, Explanation, False);
EndFunction

Function AddCommandFlagParameter(Val CommandDescription, Val ParameterName, Val Explanation = "") Export
	Return AddPramToTable(CommandDescription.NamedParams, ParameterName, Explanation, True);
EndFunction

Function AddCommandCollectionParam(Val CommandDescription, Val ParameterName, Val Explanation = "") Export
	Return AddCollectionParamToTable(CommandDescription.PositionParams, ParameterName, Explanation);
EndFunction

Function AddNamedCommandCollectionParam(Val CommandDescription, Val ParameterName, Val Explanation = "") Export
	Return AddCollectionParamToTable(CommandDescription.NamedParams, ParameterName, Explanation);
EndFunction

Function ParseCommand(Val ParameterArray) Export
	
	If ParameterArray.Count() = 0 Then
		Return Undefined;
	EndIf;
	
	CommandDescription = mCommands[ParameterArray[0]];
	If CommandDescription = Undefined Then
		Raise "Unknown command: " + ParameterArray[0];
	EndIf;
	
	GlobalParams = mParams.FindRows(New Structure("IsGlobalParam", True));
	For Each StrGlobalParam In GlobalParams Do
		StrExists = CommandDescription.NamedParams.Find(StrGlobalParam.Name,"Name");
		If StrExists = Undefined Then
			FillPropertyValues(CommandDescription.NamedParams.Add(), StrGlobalParam,, "IsGlobalParam");
		EndIf;
	EndDo;
	
	CommandResult = New Structure;
	CommandResult.Insert("Command", CommandDescription.Command);
	CommandResult.Insert("ParameterValues", New Map);
	
	mEntryParamsArray = ParameterArray;
	mTokenListPosition = 1;
	mPositionParamsPosition = 0;
	
	CommandResult.ParameterValues = ParseArgs(CommandDescription.NamedParams, CommandDescription.PositionParams);
	
	Return CommandResult;
	
EndFunction

Function Parse(Val InputParamsArray) Export
		
	CommandDescription = Undefined;
	If InputParamsArray.Count() > 0 Then 
		CommandDescription = mCommands[InputParamsArray[0]];
	EndIf;
	If CommandDescription <> Undefined Then
		Return ParseCommand(InputParamsArray);
	Else
		mEntryParamsArray = New Array;
		For Each Element In InputParamsArray Do
			mEntryParamsArray.Add(Element);
		EndDo;
		
		mPositionParamsPosition = 0;
		mTokenListPosition        = 0;
		
		ParseResult = ParseArgs(mParams, mPositionParams);
		
		Return ParseResult;
	EndIf;
	
EndFunction

Function ParameterString(Val InputParamsArray)
	String = "";
	For Each Parameter In InputParamsArray Do
		String = String + Parameter + " ";
	EndDo;
	Return String;
EndFunction // ParameterString()

Function ParamsHelp() Export
	Return ParamsHelpTable(mParams, mPositionParams, False);
EndFunction

Procedure DisplayParameterHelp() Export
	Message("Parameters:");
	For Each StrParam In ParamsHelp() Do
		If Not StrParam.IsNamedParam Then
			Message(StrTemplate(" <%1> - %2", StrParam.Name, StrParam.Explanation));
		Else
			Message(StrTemplate(" %1 - %2", StrParam.Name, StrParam.Explanation));
		EndIf;
	EndDo;
EndProcedure

Function CommandHelp(Val CommandName) Export
	
	CommandsHelpTable = HelpAvailableCommand();
	Return CommandsHelpTable.Find(CommandName, "Command");
	
EndFunction

Function HelpAvailableCommand() Export
	
	HelpTable = New ValueTable;
	HelpTable.Columns.Add("Command");
	HelpTable.Columns.Add("Explanation");
	HelpTable.Columns.Add("Parameters");
	
	For Each KeyAndValue In mCommands Do
		StrHelp      = HelpTable.Add();
		CommandDescription = KeyAndValue.Value;
		
		StrHelp.Command   = CommandDescription.Command;
		StrHelp.Explanation = CommandDescription.Explanation;
		ParamsHelp  = ParamsHelpTable(CommandDescription.NamedParams,
			CommandDescription.PositionParams, True);
		StrHelp.Parameters = ParamsHelp;
		
	EndDo;
	
	Return HelpTable;
	
EndFunction

Procedure ShowCommandsHelp() Export
	
	Message("Available commands:");

	AvailableCommands = HelpAvailableCommand();
	
	MaxWidth = 0;
	Field = "               ";
	For Each Command In AvailableCommands Do
		CurrentWidth = StrLen(Command.Command);
		If CurrentWidth > MaxWidth Then
			MaxWidth = CurrentWidth;
		EndIf;
	EndDo;

	For Each Command In AvailableCommands Do
		Message(" " + Left(Command.Command + Field, MaxWidth + 2) + "- " + Command.Explanation);
	EndDo;
	
EndProcedure

Procedure ShowCommandHelp(Val CommandName) Export

	AvailableCommands = HelpAvailableCommand();
	CommandDescription = AvailableCommands.Find(CommandName, "Command");
	If CommandDescription = Undefined Then
		Message("The command is not available: " + CommandName);
		Return;
	EndIf;

	Message("" + CommandDescription.Command + " - " + CommandDescription.Explanation);
	Message("Parameters:");
	For Each StrParam In CommandDescription.Parameters Do
		If Not StrParam.IsNamedParam Then
			Message(StrTemplate(" <%1> - %2", StrParam.Name, StrParam.Explanation));
		Else
			Message(StrTemplate(" %1 - %2", StrParam.Name, StrParam.Explanation));
		EndIf;
	EndDo;

EndProcedure

Function ParamsHelpTable(Val NamedParams, Val PositionParams, Val AddGlobalParams)
	
	TableResult = NewParamsTable();
	TableResult.Columns.Add("IsNamedParam");
	
	For Each Str In PositionParams.FindRows(New Structure("ThisIsCollection", False)) Do
		StrResult = TableResult.Add();
		FillPropertyValues(StrResult, Str);
		StrResult.IsNamedParam = False;
	EndDo;
	
	For Each Str In NamedParams Do
		StrResult = TableResult.Add();
		FillPropertyValues(StrResult, Str);
		StrResult.IsNamedParam = True;
	EndDo;

	If AddGlobalParams Then
		
		GlobalParams = mParams.FindRows(New Structure("IsGlobalParam", True));
		For Each StrGlobalParam In GlobalParams Do
			StrExists = NamedParams.Find(StrGlobalParam.Name,"Name");
			If StrExists = Undefined Then
				StrResult = TableResult.Add();
				FillPropertyValues(StrResult, StrGlobalParam,, "IsGlobalParam");
				StrResult.IsNamedParam = True;
			EndIf;
		EndDo;

	EndIf;

	For Each Str In PositionParams.FindRows(New Structure("ThisIsCollection", True)) Do
		StrResult = TableResult.Add();
		FillPropertyValues(StrResult, Str);
		StrResult.IsNamedParam = False;
	EndDo;
	
	Return TableResult;
	
EndFunction

Procedure ParseNamedParam(Val Token, Value, Val NamedParams, Val ParseResult)
	Var TokenValue;

	StrParam = NamedParams.Find(Token, "Name");
	TokenValue = ?(Value = Undefined, NextRequiredToken(Token), Value);
	If StrParam.ThisIsCollection Then

		CurrentCollection = ParseResult[Token];
		If CurrentCollection = Undefined Then
			CurrentCollection = New Array;
			ParseResult[Token] = CurrentCollection;
		EndIf;
		CurrentCollection.Add(TokenValue);
	Else
		ParseResult[Token] = TokenValue;
	EndIf;

EndProcedure

Function ParseArgs(Val NamedParams, Val PositionParams)
	
	ParseResult = New Map;
	
	For Each StrParam In NamedParams.FindRows(New Structure("IsFlag",True)) Do
		ParseResult[StrParam.Name] = False;
	EndDo;

	If mEntryParamsArray.Count() = 0 Then 
		Return ParseResult;
	EndIf;

	CurrentCollectionParam = Undefined;
	While True Do
		
		Token = NextToken();
		If Token = Undefined Then
			Break;
		EndIf;
		
		If CurrentCollectionParam <> Undefined Then
			CurrentCollectionParam.Add(Token);
			Continue;
		EndIf;
		
		If IsNamedParam(Token, NamedParams) Then
			ParseNamedParam(Token, Undefined, NamedParams, ParseResult);
		ElsIf IsFlagParam(Token, NamedParams) Then
			ParseResult[Token] = True;
		ElsIf StrFind(Token, "=") > 0 And Left(Token, 2) = "--" Then
			Index = StrFind(Token, "=");
			TokenKey = Left(Token, Index-1);
			TokenValue = String(Mid(Token, Index + 1)); //For instructions empty values, may --param= 
			If IsNamedParam(TrimAll(TokenKey), NamedParams) Then
				ParseNamedParam(TokenKey, TokenValue, NamedParams, ParseResult);
			Else
				Raise "Expected named parameter " + TokenKey;
			EndIf;
		Else
			ParamDescription = NextPositionParam(PositionParams);
			If ParamDescription.ThisIsCollection Then
				CurrentCollectionParam = New Array;
				ParseResult[ParamDescription.Name] = CurrentCollectionParam;
				CurrentCollectionParam.Add(Token);
			Else
				ParseResult[ParamDescription.Name] = Token;
			EndIf;
		EndIf;
		
	EndDo;
	
	Return ParseResult;
	
EndFunction

Function NextToken()
	If mTokenListPosition = mEntryParamsArray.Count() Then
		Return Undefined;
	EndIf;
	
	Token = mEntryParamsArray[mTokenListPosition];
	mTokenListPosition = mTokenListPosition + 1;
	
	Return Token;
EndFunction

Function NextRequiredToken(Val DesiredParameter)
	Token = NextToken();
	If Token = Undefined Then
		Raise "Expected parameter value " + DesiredParameter;
	EndIf;
	Return Token;
EndFunction

Function IsNamedParam(Val Token, Val NamedParams)
	StrParam = NamedParams.Find(Token, "Name");
	Return StrParam <> Undefined and Not StrParam.IsFlag;
EndFunction

Function IsFlagParam(Val Token, Val NamedParams)
	StrParam = NamedParams.Find(Token, "Name");
	Return StrParam <> Undefined and StrParam.IsFlag;
EndFunction

Function PositionParamsEnded(PositionParams)
	Return mPositionParamsPosition = PositionParams.Count();
EndFunction

Function NextPositionParam(Val PositionParams)
	If mPositionParamsPosition = PositionParams.Count() Then
		Raise StrTemplate("Unknown parameter in position %1 parameter %2 %3%4", mTokenListPosition, mEntryParamsArray.Get(mTokenListPosition - 1), Chars.LF, ParameterString(mEntryParamsArray));
	EndIf;
	
	StrParam = PositionParams[mPositionParamsPosition];
	mPositionParamsPosition = mPositionParamsPosition + 1;
	Return StrParam;
EndFunction

Function NewParamsTable()
	
	Table = New ValueTable;
	Table.Columns.Add("Name");
	Table.Columns.Add("IsFlag");
	Table.Columns.Add("Explanation");
	Table.Columns.Add("IsGlobalParam");
	Table.Columns.Add("ThisIsCollection");
	
	Return Table;
	
EndFunction

Function AddPramToTable(Val Table, Val Name, Val Explanation, Val Flag, Val Global = False)
	StrParam = Table.Add();
	StrParam.Name       = String(Name);
	StrParam.IsFlag   = Flag;
	StrParam.Explanation = Explanation;
	StrParam.IsGlobalParam = Global;
	StrParam.ThisIsCollection = False;

	Return StrParam;
	
EndFunction

Function AddCollectionParamToTable(Val Table, Val Name, Val Explanation)

	StrParam = AddPramToTable(Table, Name, Explanation, False);
	StrParam.ThisIsCollection = True;

	Return StrParam;

EndFunction
#Region Alternate

Function ДобавитьПараметр(Val ИмяПараметра, Val Пояснение = "") Export
	Return AddParameter(ИмяПараметра, Пояснение);
EndFunction

Function ДобавитьИменованныйПараметр(Val ИмяПараметра, Val Пояснение = "", Val Глобальный = False) Export
	Return AddNamedParam(ИмяПараметра, Пояснение, Глобальный);
EndFunction

Function ДобавитьПараметрФлаг(Val ИмяПараметра, Val Пояснение = "", Val Глобальный = False) Export
	Return AddFlagParam(ИмяПараметра, Пояснение, Глобальный);
EndFunction

Function ДобавитьПараметрКоллекция(Val ИмяПараметра, Val Пояснение = "") Export
	Return AddCollectionParam(ИмяПараметра, Пояснение);
EndFunction

Function ОписаниеКоманды(Val ИмяКоманды, Val Пояснение = "") Export
	Return CommandDescription(ИмяКоманды, Пояснение);
EndFunction

Procedure ДобавитьКоманду(Val ОписаниеКоманды) Export
	AddCommand(ОписаниеКоманды);
EndProcedure

Function ПолучитьКоманду(Val ИмяКоманды) Export
	Return GetCommand(ИмяКоманды);
EndFunction

Function ДобавитьПозиционныйПараметрКоманды(Val ОписаниеКоманды, Val ИмяПараметра, Val Пояснение = "") Export
	Return AddPositionalCommandParameter(ОписаниеКоманды, ИмяПараметра, Пояснение);
EndFunction

Function ДобавитьИменованныйПараметрКоманды(Val ОписаниеКоманды, Val ИмяПараметра, Val Пояснение = "") Export
	Return AddNamedCommandParameter(ОписаниеКоманды, ИмяПараметра, Пояснение);
EndFunction

Function ДобавитьПараметрФлагКоманды(Val ОписаниеКоманды, Val ИмяПараметра, Val Пояснение = "") Export
	Return AddCommandFlagParameter(ОписаниеКоманды, ИмяПараметра, Пояснение);
EndFunction

Function ДобавитьПараметрКоллекцияКоманды(Val ОписаниеКоманды, Val ИмяПараметра, Val Пояснение = "") Export
	Return AddCommandCollectionParam(ОписаниеКоманды, ИмяПараметра, Пояснение);
EndFunction

Function ДобавитьИменованныйПараметрКоллекцияКоманды(Val ОписаниеКоманды, Val ИмяПараметра, Val Пояснение = "") Export
	Return AddNamedCommandCollectionParam(ОписаниеКоманды, ИмяПараметра, Пояснение);
EndFunction

Function РазобратьКоманду(Val МассивПараметров) Export
	Return ParseCommand(МассивПараметров);
EndFunction

Function Разобрать(Val ВходнойМассивПараметров) Export
	Return Parse(ВходнойМассивПараметров);
EndFunction

Function СправкаПоПараметрам() Export
	Return ParamsHelp();
EndFunction

Procedure ВывестиСправкуПоПараметрам() Export
	DisplayParameterHelp();
EndProcedure

Function СправкаПоКоманде(Val ИмяКоманды) Export
	Return CommandHelp(ИмяКоманды);
EndFunction

Function СправкаВозможныеКоманды() Export
	Return HelpAvailableCommand();
EndFunction

Procedure ВывестиСправкуПоКомандам() Export
	ShowCommandsHelp();
EndProcedure

Procedure ВывестиСправкуПоКоманде(Val ИмяКоманды) Export
	ShowCommandHelp(ИмяКоманды);
EndProcedure

#EndRegion