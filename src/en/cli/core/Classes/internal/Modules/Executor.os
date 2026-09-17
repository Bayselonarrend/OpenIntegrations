#Use "../../../../../oint/tools/main"
#Use "../../../../../oint/tools/http"

Var ExecutionContext;

Function GetLastBuildHashSum() Export
	Return OPI_Tools.GetLastBuildHashSum();
EndFunction

Procedure ExecuteScript(Val Script, Response, Val Configuration = Undefined, Val Context = Undefined) Export
	
	If ExecutionContext = Undefined Then
		ExecutionContext = New Map;
	EndIf;
	
	NormalizedSettings = OPI_AdvancedCall.NormalizeSettings(Configuration);
	HasContext = Context <> Undefined;
	
	If HasContext Then
		ContextUUID = ApplyContext(Script, Context);
	EndIf;
	
	OPI_AdvancedCall.SetSettings(NormalizedSettings);
	Execute(Script);
	OPI_AdvancedCall.DeleteSettings();
	
	If HasContext Then
		ExecutionContext.Delete(ContextUUID);
	EndIf;

EndProcedure

Function ApplyContext(Script, Val Context)
	
	UUID = String(New UUID);
	ExecutionContext.Insert(UUID, Context);

	VariableTemplate = StrTemplate("ExecutionContext[""%1""][""%%1""]", UUID);
	IdentifierTemplate = """%1""";
	
	For Each ContextVariable In Context Do
		
		Script = StrReplace(Script
			, StrTemplate(IdentifierTemplate, ContextVariable.Key)
			, StrTemplate(VariableTemplate, ContextVariable.Key));
			
	EndDo;
		
	Return UUID;

EndFunction
