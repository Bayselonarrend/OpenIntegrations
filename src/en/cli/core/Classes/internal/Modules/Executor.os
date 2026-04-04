#Use "../../../../../oint/tools/main"
#Use "../../../../../oint/tools/http"

Function GetLastBuildHashSum() Export
	Return OPI_Tools.GetLastBuildHashSum();
EndFunction

Procedure ExecuteScript(Val Script, Response, Val Configuration = Undefined) Export

	OPI_AdvancedCall.SetSettings(Configuration);
	Execute(Script);
	OPI_AdvancedCall.DeleteSettings();

EndProcedure
