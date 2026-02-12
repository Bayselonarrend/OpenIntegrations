#Use "../../../../../oint/tools/main"
#Use "../../../../../oint/tools/http"

Function GetLastBuildHashSum() Export
	Return OPI_Tools.GetLastBuildHashSum();
EndFunction

Procedure ExecuteScript(Val Script, Response) Export
	Execute(Script);
EndProcedure
