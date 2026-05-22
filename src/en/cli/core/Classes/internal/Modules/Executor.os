#Use "../../../../../oint/tools/main"
#Use "../../../../../oint/tools/http"

Function GetLastBuildHashSum() Export
	Return OPI_Tools.GetLastBuildHashSum();
EndFunction

Procedure ExecuteScript(Val Script, Response, Val Configuration = Undefined) Export
	
	NormalizedSettings = OPI_AdvancedCall.NormalizeSettings(Configuration);
	
	OPI_AdvancedCall.SetSettings(NormalizedSettings);
	Execute(Script);
	OPI_AdvancedCall.DeleteSettings();

EndProcedure
