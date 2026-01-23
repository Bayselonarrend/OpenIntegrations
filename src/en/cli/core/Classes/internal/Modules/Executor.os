#Use "../../../../../oint/tools"

Function GetLastBuildHashSum() Export
	Return OPI_Tools.GetLastBuildHashSum();
EndFunction

Procedure ExecuteScript(Val Script, Response) Export
	Execute(Script);
EndProcedure
