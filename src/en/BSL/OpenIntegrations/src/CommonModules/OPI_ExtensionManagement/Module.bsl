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

#If Not WebClient Then // !OPI

#Region Internal

Procedure AttachAllAddIns() Export

    AddInTemplateList = OPI_ToolsServerCall.GetAddInList();

    For Each AddInTemplate In AddInTemplateList Do
        ConnectComponent(AddInTemplate);
    EndDo;

    OPI_Tools.Pause(1);

EndProcedure

Procedure ConnectComponent(Val AddInName) Export

    Location = StrTemplate("CommonTemplate.%1", AddInName);

    Try

        ComponentType = StrTemplate("AddIn.%1.Main", AddInName);

        //@skip-check module-unused-local-variable
        AddIn = New (ComponentType);

    Except
        #If Client Then

            ErrInfo = New CallbackDescription("AfterAddInAttach", ThisObject, AddInName);

            BeginAttachingAddIn(ErrInfo
                , Location
                , AddInName
                , AddInType.Native);

        #Else
            AttachAddIn(Location, AddInName, AddInType.Native);
        #EndIf
    EndTry;

EndProcedure

Function GetAddInVersionsList() Export

    AddInTemplateList = OPI_ToolsServerCall.GetAddInList();
    AddInDataArray    = New Array;

    For Each AddInTemplate In AddInTemplateList Do

        ConfigVersion = OPI_ToolsServerCall.GetAddInVersion(AddInTemplate);
        ClientVersion = Undefined;

        #If Client Then

            AddIn = Undefined;

            Try
                ComponentType = StrTemplate("AddIn.%1.Main", AddInTemplate);
                AddIn         = New (ComponentType);
            Except
                ClientVersion = Undefined;
            EndTry;

            If AddIn <> Undefined Then

                Try
                    ClientVersion = AddIn.Version();
                Except
                    ClientVersion = ErrorDescription();
                EndTry;

            EndIf;

        #EndIf

        ComponentStructure = New Structure;
        ComponentStructure.Insert("AddInName"     , AddInTemplate);
        ComponentStructure.Insert("ConfigVersion" , ConfigVersion);
        ComponentStructure.Insert("ClientVersion" , ClientVersion);

        AddInDataArray.Add(ComponentStructure);

    EndDo;

    Return AddInDataArray;

EndFunction

Procedure UpdateAddInsOnClient(Val AddInsNames) Export

    #If Client Then
        For Each AddInName In AddInsNames Do

            ErrInfo = New CallbackDescription("ConnectComponent", ThisObject, AddInName);
            BeginInstallAddIn(ErrInfo, StrTemplate("CommonTemplate.%1", AddInName));

        EndDo;
    #EndIf

EndProcedure

Procedure AfterAddInAttach(Val Connected, Val AddInName) Export

    If Connected Then

        ComponentType = StrTemplate("AddIn.%1.Main", AddInName);
        AddIn         = New (ComponentType);

        Try
            ClientVersion = AddIn.Version();
        Except
            ClientVersion = ErrorDescription();
        EndTry;

    Else
        ClientVersion = Undefined;
    EndIf;

    ConfigVersion = OPI_ToolsServerCall.GetAddInVersion(AddInName);

    CallbackStructure = New Structure();
    CallbackStructure.Insert("AddInName"     , AddInName);
    CallbackStructure.Insert("ClientVersion" , ClientVersion);
    CallbackStructure.Insert("ConfigVersion" , ConfigVersion);

    Notify("OPI_InstallationFinish", CallbackStructure);

EndProcedure

#EndRegion

#EndIf // !OPI
