// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

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
