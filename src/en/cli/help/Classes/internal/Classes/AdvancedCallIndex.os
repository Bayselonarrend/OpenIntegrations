#Use "../../../../../oint/tools/main"

Var IndexData;

Procedure OnObjectCreate()

	IndexData = OPI_AdvancedCall.GetFullSettingsIndex();

EndProcedure

#Region Internal

Function ReturnSettingsList(Val Module, Val Method) Export

	Settings = OPI_AdvancedCall.FindInIndex(IndexData, Module, Method);

	If Settings = Undefined Then

		Result = "There are no available settings for this function";

	Else

		Result = OPI_Tools.JSONString(Settings, , False);
		
	EndIf;

	Return Settings

EndFunction

#EndRegion
