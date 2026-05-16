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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:CognitiveComplexity-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

#Region FormEventHandlers

&AtClient
Procedure OnOpen(Cancel)

    #If Not WebClient Then

        OPI_ExtensionManagement.AttachAllAddIns();

    #Else

        Items.GroupAddInsClient.Enabled   = False;
        Items.GroupMainButtons.Visibility = False;
        Items.GroupMainGit.Visibility     = False;

    #EndIf

EndProcedure

&AtClient
Procedure NotificationProcessing(EventName, Parameter, Source)

    If EventName = "OPI_InstallationFinish" Then

        AddInName = Parameter["AddInName"];

        AddInsFilter = New Structure("AddInName", AddInName);
        AddInString  = AddInsVersions.FindRows(AddInsFilter);

        If AddInString.Count() > 0 Then
            RequiredLine = AddInString[0];
        Else
            RequiredLine = AddInsVersions.Add();
        EndIf;

        FillPropertyValues(RequiredLine, Parameter);

    EndIf;

EndProcedure

#EndRegion

#Region FormTableItemsEventHandlersAddInsVersions

&AtClient
Procedure AddInsVersionsBeforeAddRow(Element, Cancel, Copying, Parent, Group, Parameter)
    Cancel = True;
EndProcedure

&AtClient
Procedure AddInsVersionsBeforeDeleteRow(Element, Cancel)
    Cancel = True;
EndProcedure

#EndRegion

#Region FormCommandsEventHandlers

#If Not WebClient Then

&AtClient
Procedure OpenSourceCraft(Command)
    RunApp("https://sourcecraft.dev/bayselonarrend/openintegrations");
EndProcedure

&AtClient
Procedure OpenGitHub(Command)
    RunApp("https://github.com/Bayselonarrend/OpenIntegrations");
EndProcedure

&AtClient
Procedure OpenSite(Command)
    RunApp("https://openintegrations.dev");
EndProcedure

&AtClient
Procedure OpenLicenseEn(Command)
    LicenseText = OPI_Tools.GetTextTemplate("OPI_Text_LicenseEN");
    ShowValue( , LicenseText);
EndProcedure

&AtClient
Procedure OpenLicenseRu(Command)
    LicenseText = OPI_Tools.GetTextTemplate("OPI_Text_LicenseRU");
    ShowValue( , LicenseText);
EndProcedure

&AtClient
Procedure AddInsClientEnableAll(Command)

    For Each TableRow In AddInsVersions Do
        TableRow.Timestamp = True;
    EndDo;

EndProcedure

&AtClient
Procedure AddInsClientDisableAll(Command)

    For Each TableRow In AddInsVersions Do
        TableRow.Timestamp = False;
    EndDo;

EndProcedure

&AtClient
Procedure UpdateAddInsOnClient(Command)

    ArrayOfNames = New Array;

    For Each TableRow In AddInsVersions Do
        If TableRow.Timestamp Then
            ArrayOfNames.Add(TableRow.AddInName);
        EndIf;
    EndDo;

    #If Not WebClient Then

        OPI_ExtensionManagement.UpdateAddInsOnClient(ArrayOfNames);

    #EndIf

EndProcedure

&AtClient
Procedure OpenCacheFolder(Command)

    CachePath = ?(OPI_Tools.IsWindows()
        , "%APPDATA%\1C\1Cv8\ExtCompT"
        , "~/.1cv8/1C/1Cv8/ExtCompT/");

    RunApp(CachePath);

EndProcedure

&AtClient
Procedure UpdateAddInList(Command)

    UpdateAddInVersionsList();

EndProcedure

#EndIf

#EndRegion

#Region Private

#If Not WebClient Then

&AtClient
Procedure UpdateAddInVersionsList()

    AddInsVersions.Clear();

    AddInList = OPI_ExtensionManagement.GetAddInVersionsList();

    For Each AddInData In AddInList Do

        NewLine = AddInsVersions.Add();
        FillPropertyValues(NewLine, AddInData);

    EndDo;

EndProcedure

#EndIf // !OPI

#EndRegion
