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
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check bsl-legacy-check-string-length
//@skip-check undefined-function-or-procedure
//@skip-check ExternalAppStarting
//@skip-check bsl-legacy-check-string-literal

#Region Variables

&AtClient
Var ExpectedComponent;

&AtClient
Var ExpectedLoadingCompletion;

#EndRegion

#Region FormEventHandlers

&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)

    BuildPanelHTMLOnServer(True);

EndProcedure

&AtClient
Procedure OnOpen(Cancel)

    #If Not WebClient Then

        ExpectedComponent         = GetNumberOfComponentsOnServer();
        ExpectedLoadingCompletion = ExpectedComponent > 0;

        OPI_ExtensionManagement.AttachAllAddIns();

        If ExpectedComponent = 0 Then
            BuildPanelHTMLOnServer();
        EndIf;

    #Else

        BuildPanelHTMLOnServer();

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

        UpdateComponentRowInDocument(Parameter);

        ExpectedComponent = ExpectedComponent - 1;

        If ExpectedComponent          = 0 And ExpectedLoadingCompletion Then
            ExpectedLoadingCompletion = False;
            BuildPanelHTMLOnServer();
        EndIf;

    EndIf;

EndProcedure

#EndRegion

#Region EventHandlersForFormHeaderItems

&AtClient
Procedure HTMLOnClick(Element, callbackData, StandardProcessing)

    Try

        ObjectID  = callbackData["Element"]["id"];
        EventType = callbackData["Event"]["type"];

        If EventType <> "click" Then
            Return;
        EndIf;

        If ObjectID    = "opi-btn-docs" Then
            OpenSite();
        ElsIf ObjectID = "opi-btn-github" Then
            OpenGitHub();
        ElsIf ObjectID = "opi-btn-sourcecraft" Then
            OpenSourceCraft();
        ElsIf ObjectID = "opi-btn-boosty" Then
            OpenBoosty();
        ElsIf ObjectID = "opi-btn-refresh-list" Then
            UpdateAddInVersionsList();
        ElsIf ObjectID = "opi-btn-open-cache" Then
            OpenCacheFolder();
        ElsIf ObjectID = "opi-btn-install-addins" Then

            ComponentsArray = GetSelectedComponentsFromDocument(callbackData["Document"]);

            If ComponentsArray.Count() > 0 Then
                ExpectedComponent = ComponentsArray.Count();
                InstallAddInsOnClient(ComponentsArray);
            EndIf;

        ElsIf ObjectID = "opi-btn-download-cf" Then
            DownloadReleaseArtifact("cf" , callbackData["Document"]);
        ElsIf ObjectID = "opi-btn-download-cfe" Then
            DownloadReleaseArtifact("cfe", callbackData["Document"]);
        ElsIf ObjectID = "opi-btn-install-cfe" Then
            InstallCFE(callbackData["Document"]);
        ElsIf ObjectID = "opi-btn-releases" Then
            OpenReleasesArchive(callbackData["Document"]);
        ElsIf ObjectID = "opi-btn-retry-archive" Then
            RepeatReleaseArchiveDownload();

        Else
            Return;
        EndIf;

    Except
        Return;
    EndTry;

EndProcedure

#EndRegion

#Region Private

#Region EventProcessing

&AtClient
Procedure RepeatReleaseArchiveDownload()

    BuildPanelHTMLOnServer();

EndProcedure

&AtClient
Procedure DownloadReleaseArtifact(Val ArtifactID, Document = Undefined)

    #If WebClient Then
        Raise "File operations are not available in the web client!";
    #Else

        VersionNumber = GetSelectedReleaseVersionFromDocument(Document);

        If Not ValueIsFilled(VersionNumber) Then
            ShowMessageBox(, "No release version selected.");
            Return;
        EndIf;

        MirrorID = GetSelectedMirrorFromDocument(Document);
        FileName = GetArtifactFileNameOnServer(VersionNumber, ArtifactID, MirrorID);

        If Not ValueIsFilled(FileName) Then
            ShowMessageBox(, "Unable to determine the filename for downloading.");
            Return;
        EndIf;

        AdditionalParameters  = New Structure("VersionNumber, ArtifactID, MirrorID", VersionNumber, ArtifactID, MirrorID);
        ErrInfo               = New CallbackDescription("AfterPathSelectionForArtifactDownload", ThisObject, AdditionalParameters);
        Dialog                = New FileDialog(FileDialogMode.Save);
        Dialog.FullFileName   = FileName;
        Dialog.MultipleSelect = False;
        Dialog.Show(ErrInfo);

    #EndIf

EndProcedure

&AtClient
Procedure AfterPathSelectionForArtifactDownload(Result, AdditionalParameters) Export

    #If Not WebClient Then

        If Result = Undefined Then
            Return;
        EndIf;

        Try

            //@skip-check bsl-legacy-check-expression-type
            ReleasesArchive = UploadReleasesArchive();

            Message = OPI_ExtensionManagement.DownloadReleaseArtifact(ReleasesArchive
                , AdditionalParameters.VersionNumber
                , AdditionalParameters.ArtifactID
                , AdditionalParameters.MirrorID
                , Result[0]);

            ShowMessageBox(, Message);

        Except
            ShowMessageBox(, "Error downloading file: " + ErrorDescription());
        EndTry;

    #EndIf

EndProcedure

&AtClient
Procedure InstallCFE(Document = Undefined)

    #If WebClient Then
        ShowMessageBox(, "Extension installation is not available in the web client.");
        Return;
    #Else

        VersionNumber = GetSelectedReleaseVersionFromDocument(Document);

        If Not ValueIsFilled(VersionNumber) Then
            ShowMessageBox(, "No release version selected.");
            Return;
        EndIf;

        MirrorID             = GetSelectedMirrorFromDocument(Document);
        AdditionalParameters = New Structure("VersionNumber, MirrorID", VersionNumber, MirrorID);
        QuestionText         = StrTemplate("Install OpenIntegrations version %1?", VersionNumber);
        ErrInfo              = New CallbackDescription("AfterConfirmationOfCFEInstallation", ThisObject, AdditionalParameters);

        ShowQuestion(ErrInfo, QuestionText, QuestionDialogMode.YesNo, , , "Extension installation");

    #EndIf

EndProcedure

&AtClient
Procedure AfterConfirmationOfCFEInstallation(Result, AdditionalParameters) Export

    #If Not WebClient Then

        If Result <> DialogReturnCode.Yes Then
            Return;
        EndIf;

        Try

            InstallationResult = InstallCFEOnServer(AdditionalParameters.VersionNumber, AdditionalParameters.MirrorID);

            If InstallationResult.RequiresRestart Then
                SuggestRestartAfterCFEInstallation(InstallationResult.Message);
            Else
                ShowMessageBox(, InstallationResult.Message);
            EndIf;

        Except
            ShowMessageBox(, "Extension installation error: " + ErrorDescription());
        EndTry;

    #EndIf

EndProcedure

&AtClient
Procedure SuggestRestartAfterCFEInstallation(Val MessageText)

    QuestionText = MessageText
        + Chars.LF
        + Chars.LF
        + "Restart 1C now?";

    ListOfButtons = New ValueList;
    ListOfButtons.Add("Restart" , "Restart");
    ListOfButtons.Add("Closing" , "Later");

    ErrInfo = New CallbackDescription("AfterRequestRestartAfterCFEInstallation", ThisObject);
    ShowQuestion(ErrInfo, QuestionText, ListOfButtons, , , "Restart required");

EndProcedure

&AtClient
Procedure AfterRequestRestartAfterCFEInstallation(Result, AdditionalParameters) Export

    If Result = "Restart" Then
        Exit(, True);
    EndIf;

EndProcedure

&AtClient
Procedure UpdateAddInVersionsList()

    #If Not WebClient Then

        AddInsVersions.Clear();

        AddInList = OPI_ExtensionManagement.GetAddInVersionsList();

        For Each AddInData In AddInList Do

            NewLine = AddInsVersions.Add();
            FillPropertyValues(NewLine, AddInData);

        EndDo;

        BuildPanelHTMLOnServer();

    #EndIf

EndProcedure

&AtClient
Procedure InstallAddInsOnClient(ArrayOfNames)

    #If Not WebClient Then
        OPI_ExtensionManagement.UpdateAddInsOnClient(ArrayOfNames);
    #EndIf

EndProcedure

&AtClient
Procedure OpenSourceCraft()
    RunApp("https://sourcecraft.dev/bayselonarrend/openintegrations");
EndProcedure

&AtClient
Procedure OpenBoosty()
    RunApp("https://boosty.to/bayselonarrend");
EndProcedure

&AtClient
Procedure OpenGitHub()
    RunApp("https://github.com/Bayselonarrend/OpenIntegrations");
EndProcedure

&AtClient
Procedure OpenSite()
    RunApp("https://openintegrations.dev");
EndProcedure

&AtClient
Procedure OpenReleasesArchive(Document = Undefined)

    ReleaseVersion = GetSelectedReleaseVersionFromDocument(Document);
    PageAddress    = "https://openintegrations.dev/releases";

    If ValueIsFilled(ReleaseVersion) Then
        PageAddress = PageAddress + "/" + ReleaseVersion;
    EndIf;

    RunApp(PageAddress);

EndProcedure

&AtClient
Procedure OpenCacheFolder()

    #If Not WebClient Then
        CachePath = OPI_ExtensionManagement.GetAddInsCachePath();
        RunApp(CachePath);
    #Else
        Raise "File operations are not available in the web client!";
    #EndIf

EndProcedure

#EndRegion

#Region Auxiliary

&AtClient
Function GetSelectedMirrorFromDocument(Document)

    If Document  = Undefined Then
        Document = Items.HTML.Document;
    EndIf;

    If Document = Undefined Then
        Return "github";
    EndIf;

    Try

        InputItems = Document.getItemsByTagName("input");

        For Index = 0 To InputItems.length - 1 Do

            InputElement = InputItems[Index];

            If InputElement = Undefined Then
                Break;
            EndIf;

            If InputElement.name = "opi-mirror" And InputElement.checked Then
                Return InputElement.value;
            EndIf;

        EndDo;

    Except
        Return "github";
    EndTry;

    Return "github";

EndFunction

&AtServer
Function InstallCFEOnServer(Val VersionNumber, Val MirrorID)

    ReleasesArchive = UploadReleasesArchive();

    Return OPI_ExtensionManagement.InstallExtensionFromArchive(ReleasesArchive, VersionNumber, MirrorID);

EndFunction

&AtClient
Function GetArtifactFileNameOnServer(Val VersionNumber, Val ArtifactID, Val MirrorID)

    #If Not WebClient Then

        //@skip-check bsl-legacy-check-expression-type
        ReleasesArchive = UploadReleasesArchive();

        Return OPI_ExtensionManagement.GetArtifactFileName(ReleasesArchive, VersionNumber, ArtifactID, MirrorID);

    #Else
        Raise "File operations are not available in the web client!";
    #EndIf

EndFunction

&AtServer
Function GetNumberOfComponentsOnServer()

    Return OPI_ToolsServerCall.GetAddInList().Count();

EndFunction

&AtClient
Function GetSelectedReleaseVersionFromDocument(Document)

    If Document  = Undefined Then
        Document = Items.HTML.Document;
    EndIf;

    If Document = Undefined Then
        Return "";
    EndIf;

    Try

        SelectVersion = Document.getElementById("opi-release-version");

        If SelectVersion = Undefined Then
            Return "";
        EndIf;

        Return SelectVersion.value;

    Except
        Return "";
    EndTry;

EndFunction

&AtClient
Function GetSelectedComponentsFromDocument(Document)

    Result       = New Array;
    PrefixID     = "opi-addin-";
    PrefixLength = StrLen(PrefixID);

    If Document = Undefined Then
        Return Result;
    EndIf;

    Try
        TableBody = GetTableBodyComponents(Document);
    Except
        Return Result;
    EndTry;

    If TableBody = Undefined Then
        Return Result;
    EndIf;

    Try
        Checkboxes = TableBody.getItemsByTagName("input");
    Except
        Return Result;
    EndTry;

    For Index = 0 To Checkboxes.length - 1 Do

        Try

            Checkbox = Checkboxes[Index];

            If Checkbox = Undefined Then
                Break;
            EndIf;

            If Not Checkbox.checked Then
                Continue;
            EndIf;

            CheckboxID = Checkbox.id;

            If StrStartWith(CheckboxID, PrefixID) Then
                Result.Add(Mid(CheckboxID, PrefixLength + 1));
            EndIf;

        Except
            Continue;
        EndTry;

    EndDo;

    Return Result;

EndFunction

&AtClient
Procedure UpdateComponentRowInDocument(Val AddInData)

    AddInName    = AddInData["AddInName"];
    StringPrefix = "addin-row-" + AddInName;

    Document = Items.HTML.Document;

    If Document = Undefined Then
        Return;
    EndIf;

    SetHTMLNodeText(Document.getElementById(StringPrefix + "-cfg"), AddInData["ConfigVersion"]);

    SetHTMLNodeText(Document.getElementById(StringPrefix + "-client")
        , ClientVersionComponentsViewOnClient(AddInData["ClientVersion"]
            , AddInData["ConfigVersion"]));

EndProcedure

&AtClient
Function AddInsVersionsDifferOnClient(Val ClientVersion, Val ConfigVersion)

    Return String(ClientVersion)
        <> String(ConfigVersion);

EndFunction

&AtClient
Function ClientVersionComponentsViewOnClient(Val ClientVersion, Val ConfigVersion)

    TextVersion = String(ClientVersion);

    If Not AddInsVersionsDifferOnClient(ClientVersion, ConfigVersion) Then
        Return TextVersion;
    EndIf;

    If ValueIsFilled(TextVersion) Then
        Return TextVersion + " ⚠️";
    EndIf;

    Return "";

EndFunction

&AtServer
Function ComponentValueView(Val Value)

    If Value = Undefined Then
        Return "";
    EndIf;

    Return String(Value);

EndFunction

&AtServer
Function AddInsVersionsDiffer(Val ClientVersion, Val ConfigVersion)

    Return ComponentValueView(ClientVersion) <> ComponentValueView(ConfigVersion);

EndFunction

&AtServer
Function ClientVersionComponentsView(Val ClientVersion, Val ConfigVersion)

    TextVersion = ComponentValueView(ClientVersion);

    If Not AddInsVersionsDiffer(ClientVersion, ConfigVersion) Then
        Return TextVersion;
    EndIf;

    If ValueIsFilled(TextVersion) Then
        Return TextVersion + " ⚠️";
    EndIf;

    Return "";

EndFunction

#EndRegion

#Region Updates

&AtServer
Function GetReleasesArchiveURL()

    Return "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/docs/docusaurus/archive/releases-archive.json";
    //"https://openintegrations.dev/archive/releases-archive.json";

EndFunction

&AtServer
Function UploadReleasesArchive()

    Try

        URL = GetReleasesArchiveURL();

        Response = OPI_HTTPRequests.NewRequest()
            .Initialize()
            .SetURL(URL)
            .SetTimeout(35)
            .ProcessRequest("GET")
            .ReturnResponseAsJSONObject();

        If ReleasesArchiveLoaded(Response) Then
            Return Response;
        EndIf;

        ResponseData = Undefined;

        If TypeOf(Response) = Type("Structure") Or TypeOf(Response) = Type("Map") Then

            If Response["result"] = True Then
                ResponseData      = Response["data"];
            Else
                ResponseData      = Response;
            EndIf;

        EndIf;

        If ReleasesArchiveLoaded(ResponseData) Then
            Return ResponseData;
        EndIf;

        If TypeOf(ResponseData) = Type("String") And ValueIsFilled(ResponseData) Then
            Return OPI_Tools.JsonToStructure(ResponseData, True);
        EndIf;

    Except
        Return Undefined;
    EndTry;

    Return Undefined;

EndFunction

&AtServer
Function ReleasesArchiveLoaded(Val Archive)

    If Archive = Undefined Then
        Return False;
    EndIf;

    Versions = Archive["versions"];

    Return TypeOf(Versions) = Type("Array") And Versions.Count() > 0;

EndFunction

&AtServer
Function ReleasesArchiveScriptText(ReleasesArchive)

    If Not ReleasesArchiveLoaded(ReleasesArchive) Then
        Return "window.OPI_RELEASES_ARCHIVE = null;";
    EndIf;

    TextJSON = OPI_Tools.JSONString(ReleasesArchive, "None", False, True);
    TextJSON = StrReplace(TextJSON, "</", "<\/");

    Return "window.OPI_RELEASES_ARCHIVE = " + TextJSON + ";";

EndFunction

&AtServer
Function CompareReleaseVersions(Val Version1, Val Version2)

    Parts1   = StrSplit(TrimAll(Version1), ".", False);
    Parts2   = StrSplit(TrimAll(Version2), ".", False);
    MaxIndex = Max(Parts1.Count(), Parts2.Count()) - 1;

    For Index = 0 To MaxIndex Do

        Number1 = 0;
        Number2 = 0;

        If Index < Parts1.Count() Then
            Number1 = Number(Parts1[Index]);
        EndIf;

        If Index < Parts2.Count() Then
            Number2 = Number(Parts2[Index]);
        EndIf;

        If Number1 > Number2 Then
            Return 1;
        ElsIf Number1 < Number2 Then
            Return -1;
        EndIf;

    EndDo;

    Return 0;

EndFunction

&AtServer
Function GetDefaultReleaseVersion(ReleasesArchive)

    Versions = ReleasesArchive["versions"];

    If Versions.Count() = 0 Then
        Return "";
    EndIf;

    Return Versions[0]["version"];

EndFunction

&AtServer
Function FindReleaseData(ReleasesArchive, Val VersionNumber)

    For Each Release In ReleasesArchive["versions"] Do

        If Release["version"] = VersionNumber Then
            Return Release;
        EndIf;

    EndDo;

    Return Undefined;

EndFunction

&AtServer
Function MirrorAvailableForVersion(ReleasesArchive, Val MirrorID, Val VersionNumber)

    For Each Mirror In ReleasesArchive["mirrors"] Do

        If Mirror["id"] <> MirrorID Then
            Continue;
        EndIf;

        MinimumVersion = Mirror["minVersion"];

        If Not ValueIsFilled(MinimumVersion) Then
            Return True;
        EndIf;

        Return CompareReleaseVersions(VersionNumber, MinimumVersion) >= 0;

    EndDo;

    Return False;

EndFunction

&AtServer
Function MirrorDisplayedInPanel(Val MirrorID)

    Return MirrorID <> "sourcecraft";

EndFunction

&AtServer
Function GetLastArchiveVersion(ReleasesArchive)

    Versions = ReleasesArchive["versions"];

    If Versions.Count() = 0 Then
        Return "";
    EndIf;

    Return Versions[0]["version"];

EndFunction

&AtServer
Function HasUpdateAvailable(ReleasesArchive, Val CurrentVersion)

    If Not ReleasesArchiveLoaded(ReleasesArchive) Then
        Return False;
    EndIf;

    LastVersion = GetLastArchiveVersion(ReleasesArchive);

    If Not ValueIsFilled(LastVersion) Then
        Return False;
    EndIf;

    Return CompareReleaseVersions(CurrentVersion, LastVersion) < 0;

EndFunction

&AtServer
Function GetUpdateTabText(ReleasesArchive, Val CurrentVersion)

    TabCaption = "Updating";

    If HasUpdateAvailable(ReleasesArchive, CurrentVersion) Then
        TabCaption = "⚠️ " + TabCaption;
    EndIf;

    Return TabCaption;

EndFunction

&AtServer
Function GetMirrorName(Val MirrorID)

    If MirrorID    = "github" Then
        Return "GitHub";
    ElsIf MirrorID = "yandex" Then
        Return "Yandex.Disk";
    ElsIf MirrorID = "s3" Then
        Return "Archive (S3)";
    EndIf;

    Return MirrorID;

EndFunction

&AtServer
Function ReleaseChangeIconURL(ReleasesArchive, Change)

    IconURL = Change["iconUrl"];

    If ValueIsFilled(IconURL) Then
        Return IconURL;
    EndIf;

    IconPath = Change["icon"];

    If Not ValueIsFilled(IconPath) Then
        Return "";
    EndIf;

    Return ReleasesArchive["githubContentBase"] + IconPath;

EndFunction

&AtServer
Function ChangeLogTextWithLinksView(Text)

    If Not ValueIsFilled(Text) Then
        Return "";
    EndIf;

    Result  = "";
    Residue = Text;

    While True Do

        StartLink = StrFind(Residue, "[");

        If StartLink = 0 Then
            Result   = Result + OPI_HTMLTemplateProcessor.EscapeHTML(Residue);
            Break;
        EndIf;

        Result  = Result + OPI_HTMLTemplateProcessor.EscapeHTML(Left(Residue, StartLink - 1));
        Residue = Mid(Residue, StartLink + 1);

        EndSignature = StrFind(Residue, "]");

        If EndSignature = 0 Then
            Result      = Result + OPI_HTMLTemplateProcessor.EscapeHTML("[" + Residue);
            Break;
        EndIf;

        Signature = Left(Residue, EndSignature - 1);
        Residue   = Mid(Residue, EndSignature + 1);

        If Left(Residue, 1) <> "(" Then
            Result = Result + OPI_HTMLTemplateProcessor.EscapeHTML("[" + Signature + "]" + Residue);
            Break;
        EndIf;

        Residue = Mid(Residue, 2);
        EndURL  = StrFind(Residue, ")");

        If EndURL  = 0 Then
            Result = Result + OPI_HTMLTemplateProcessor.EscapeHTML("[" + Signature + "](" + Residue);
            Break;
        EndIf;

        URL     = Left(Residue, EndURL - 1);
        Residue = Mid(Residue, EndURL + 1);

        Result = Result + StrTemplate(
            "<a href=""%1"" target=""_blank"" rel=""noopener noreferrer"">%2</a>"
            , OPI_HTMLTemplateProcessor.EscapeHTML(URL)
            , OPI_HTMLTemplateProcessor.EscapeHTML(Signature));

    EndDo;

    Return Result;

EndFunction

&AtServer
Function ChangeLogDescriptionView(Description)

    If Not ValueIsFilled(Description) Then
        Return "";
    EndIf;

    Parts  = StrSplit(Description, "`");
    Result = "";

    For Index = 0 To Parts.UBound() Do

        If Index % 2 = 1 Then
            Result   = Result + "<code>" + OPI_HTMLTemplateProcessor.EscapeHTML(Parts[Index]) + "</code>";
        Else
            Result   = Result + ChangeLogTextWithLinksView(Parts[Index]);
        EndIf;

    EndDo;

    Return Result;

EndFunction

&AtServer
Function LibraryChangeLogCellText(ReleasesArchive, Change)

    IconURL     = ReleaseChangeIconURL(ReleasesArchive, Change);
    LibraryName = Change["lib"];

    If ValueIsFilled(IconURL) Then
        Return StrTemplate("<div class=""opi-lib-cell""><img src=""%1"" class=""opi-lib-icon"" width=""20"" height=""20"" alt=""""><span>%2</span></div>"
            , IconURL
            , LibraryName);
    EndIf;

    Return StrTemplate("<div class=""opi-lib-cell""><span>%1</span></div>", LibraryName);

EndFunction

#EndRegion

#Region Markup

&AtServer
Procedure BuildPanelHTMLOnServer(ShowLoading = False)

    ReleasesArchive = UploadReleasesArchive();
    HTML            = BuildPanelHTMLTemplate(ShowLoading, ReleasesArchive);

EndProcedure

&AtServer
Function BuildPanelHTMLTemplate(ShowLoading, ReleasesArchive)

    DocumentContext = New Structure;
    DocumentContext.Insert("bodyClass", ?(UsingDarkTheme(), "opi-panel opi-panel--dark", "opi-panel"));
    DocumentContext.Insert("styles"   , GetPanelCSS());
    DocumentContext.Insert("scripts"  , GetPanelScripts(ReleasesArchive));

    If ShowLoading Then

        LoadingContext = New Structure("loadingIcon", LoadingIconText());
        DocumentContext.Insert("body", OPI_HTMLTemplateProcessor.RenderTemplate("OPI_Text_PanelLoading", LoadingContext));

    Else

        DocumentContext.Insert("body", BuildPanelBodyTemplate(ReleasesArchive));

    EndIf;

    Return OPI_HTMLTemplateProcessor.RenderTemplate("OPI_Text_PanelDocument", DocumentContext);

EndFunction

&AtServer
Function BuildPanelBodyTemplate(ReleasesArchive)

    CurrentVersion = OPI_Tools.OPIVersion();
    Context        = New Structure;

    Context.Insert("tabUpdatesLabel", GetUpdateTabText(ReleasesArchive, CurrentVersion));
    Context.Insert("logoSvg"        , GetLogoSVG());
    Context.Insert("versionLabel"   , StrTemplate("Version %1"        , CurrentVersion));
    Context.Insert("licenseRu"      , OPI_Tools.GetTextTemplate("OPI_Text_LicenseRU"));
    Context.Insert("licenseEn"      , OPI_Tools.GetTextTemplate("OPI_Text_LicenseEN"));
    Context.Insert("addinRows"      , BuildComponentStringsForTemplate());

    UpdateContext = BuildUpdateContext(ReleasesArchive, CurrentVersion);

    For Each KeyAndValue In UpdateContext Do
        Context.Insert(KeyAndValue.Key, KeyAndValue.Value);
    EndDo;

    Return OPI_HTMLTemplateProcessor.RenderTemplate("OPI_Text_PanelShell", Context);

EndFunction

&AtServer
Function BuildComponentStringsForTemplate()

    Strings = New Array;

    For Each AddInString In AddInsVersions Do

        ContextString = New Structure;
        ContextString.Insert("componentId"  , AddInString.AddInName);
        ContextString.Insert("name"         , ComponentValueView(AddInString.AddInName));
        ContextString.Insert("cfgVersion"   , ComponentValueView(AddInString.ConfigVersion));
        ContextString.Insert("clientVersion", ClientVersionComponentsView(AddInString.ClientVersion, AddInString.ConfigVersion));

        If AddInString.Timestamp Then
            ContextString.Insert("checked", True);
        EndIf;

        Strings.Add(ContextString);

    EndDo;

    Return Strings;

EndFunction

&AtServer
Function BuildUpdateContext(ReleasesArchive, CurrentVersion)

    Context = New Structure;

    If Not ReleasesArchiveLoaded(ReleasesArchive) Then

        Context.Insert("archiveError", True);
        Context.Insert("errorIcon"   , ArchiveErrorIconText());
        Context.Insert("archiveUrl"  , GetReleasesArchiveURL());

        Return Context;

    EndIf;

    Context.Insert("archiveError", False);

    SelectedVersion = GetDefaultReleaseVersion(ReleasesArchive);
    Release         = FindReleaseData(ReleasesArchive, SelectedVersion);

    If Release = Undefined Then
        Return Context;
    EndIf;

    LastVersion = GetLastArchiveVersion(ReleasesArchive);
    HasUpdate   = HasUpdateAvailable(ReleasesArchive, CurrentVersion);

    If HasUpdate Then

        Context.Insert("statusClass", "opi-updates-status--available");
        Context.Insert("statusIcon" , UpdateStatusIconText());
        Context.Insert("statusTitle", "Update available");
        Context.Insert("statusHint" , StrTemplate("Installed version: %1. Last available version: %2", CurrentVersion, LastVersion));

    Else

        Context.Insert("statusClass", "opi-updates-status--current");
        Context.Insert("statusIcon" , ActualStatusIconText());
        Context.Insert("statusTitle", "You are using the latest version");
        Context.Insert("statusHint" , StrTemplate("Version %1 is actual", CurrentVersion));

    EndIf;

    Context.Insert("releaseSummary", Release["summary_ru"]);
    Context.Insert("releaseOptions", CollectReleaseVersionOptions(ReleasesArchive, SelectedVersion));
    Context.Insert("changelogRows" , CollectChangeLogStrings(ReleasesArchive     , Release));
    Context.Insert("mirrorOptions" , CollectMirrorOptions(ReleasesArchive        , SelectedVersion));

    Return Context;

EndFunction

&AtServer
Function CollectReleaseVersionOptions(ReleasesArchive, SelectedVersion)

    Options = New Array;

    For Each Release In ReleasesArchive["versions"] Do

        VersionNumber = Release["version"];
        Option        = New Structure;
        Option.Insert("version"  , VersionNumber);
        Option.Insert("versionId", StrReplace(VersionNumber, ".", "-"));

        If VersionNumber = SelectedVersion Then
            Option.Insert("selected", True);
        EndIf;

        Options.Add(Option);

    EndDo;

    Return Options;

EndFunction

&AtServer
Function CollectChangeLogStrings(ReleasesArchive, Release)

    Strings     = New Array;
    StringIndex = 0;

    For Each Change In Release["changes"] Do

        String      = New Structure;
        String.Insert("rowIndex"   , StringIndex);
        String.Insert("libCell"    , LibraryChangeLogCellText(ReleasesArchive, Change));
        String.Insert("description", ChangeLogDescriptionView(Change["description_ru"]));
        Strings.Add(String);
        StringIndex = StringIndex + 1;

    EndDo;

    Return Strings;

EndFunction

&AtServer
Function CollectMirrorOptions(ReleasesArchive, VersionNumber)

    Options     = New Array;
    FirstMirror = True;

    For Each Mirror In ReleasesArchive["mirrors"] Do

        MirrorID = Mirror["id"];

        If Not MirrorDisplayedInPanel(MirrorID) Then
            Continue;
        EndIf;

        Available = MirrorAvailableForVersion(ReleasesArchive, MirrorID, VersionNumber);

        Option = New Structure;
        Option.Insert("mirrorId"   , MirrorID);
        Option.Insert("mirrorLabel", GetMirrorName(MirrorID));

        If Not Available Then
            Option.Insert("hidden", True);
        EndIf;

        If FirstMirror And Available Then
            Option.Insert("checked", True);
            FirstMirror = False;
        EndIf;

        Options.Add(Option);

    EndDo;

    Return Options;

EndFunction

&AtServer
Function GetPanelCSS()

    Styles = OPI_Tools.GetTextTemplate("OPI_Text_PanelStyles");

    If UsingDarkTheme() Then
        Styles = Styles + Chars.LF + OPI_Tools.GetTextTemplate("OPI_Text_PanelThemeDark");
    EndIf;

    Return Styles;

EndFunction

&AtServer
Function GetPanelScripts(ReleasesArchive = Undefined)

    Scripts = "<script>" + OPI_Tools.GetTextTemplate("OPI_Text_PanelScript") + "</script>";
    Scripts = Scripts + "<script>" + ReleasesArchiveScriptText(ReleasesArchive) + "</script>";

    Return Scripts;

EndFunction

&AtClient
Procedure SetHTMLNodeText(Node, Val Text)

    If Node = Undefined Then
        Return;
    EndIf;

    Try
        Node.textContent   = String(Text);
    Except
        Try
            Node.innerText = String(Text);
        Except
            Return;
        EndTry;
    EndTry;

EndProcedure

&AtClient
Function GetTableBodyComponents(Document)

    Try
        Return Document.getElementById("opi-addins-body");
    Except
        Return Undefined;
    EndTry;

EndFunction

&AtServer
Function GetLogoSVG()

    BinaryLogo = PictureLib.OPI_Logo.GetBinaryData();

    Return GetStringFromBinaryData(BinaryLogo);

EndFunction

&AtServer
Function LoadingIconText()

    Return "<svg class=""opi-loading__icon"" xmlns=""http://www.w3.org/2000/svg"" viewBox=""0 0 23.612 23.612"" aria-hidden=""true""><g><path fill=""currentColor"" d=""M16.192,5.224V4.487h-8.77v0.737c0,0,1.334,3.713,3.838,5.428v1.785c0,0-2.761,2.686-3.838,5.775v0.842h8.77v-0.842c-1.399-3.41-3.837-5.775-3.837-5.775v-1.785C15.759,7.726,16.192,5.224,16.192,5.224z""/><path fill=""currentColor"" d=""M19.353,3.856V2.529h1.258V0H3.002v2.529h1.259v1.327c0,2.025,3.634,7.555,3.804,7.955c-0.167,0.397-3.804,5.929-3.804,7.946v1.325H3.002v2.53h17.609v-2.53h-1.258v-1.325c0-2.025-3.635-7.521-3.829-7.951C15.718,11.376,19.353,5.88,19.353,3.856z M18.096,19.757v1.325H5.519v-1.325c0-1.455,3.854-7.222,3.854-7.951s-3.854-6.495-3.854-7.95V2.529h12.578v1.327c0,1.455-3.886,7.221-3.886,7.95C14.21,12.535,18.096,18.302,18.096,19.757z""/></g></svg>";

EndFunction

&AtServer
Function ArchiveErrorIconText()

    Return "<svg class=""opi-updates-archive-error__icon"" xmlns=""http://www.w3.org/2000/svg"" fill=""none"" viewBox=""0 0 24 24"" stroke-width=""1.5"" stroke=""currentColor"" stroke-linecap=""round"" stroke-linejoin=""round"" aria-hidden=""true""><path d=""M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z""/></svg>";

EndFunction

&AtServer
Function ActualStatusIconText()

    Return "<svg class=""opi-updates-status__icon"" xmlns=""http://www.w3.org/2000/svg"" fill=""none"" viewBox=""0 0 24 24"" stroke-width=""1.5"" stroke=""currentColor"" stroke-linecap=""round"" stroke-linejoin=""round"" aria-hidden=""true""><path d=""M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z""/></svg>";

EndFunction

&AtServer
Function UpdateStatusIconText()

    Return "<svg class=""opi-updates-status__icon"" xmlns=""http://www.w3.org/2000/svg"" fill=""none"" viewBox=""0 0 24 24"" stroke-width=""1.5"" stroke=""currentColor"" stroke-linecap=""round"" stroke-linejoin=""round"" aria-hidden=""true""><path d=""M9.5 10.25 12 7.5 14.5 10.25M12 7.5V16.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z""/></svg>";

EndFunction

&AtServer
Function UsingDarkTheme()

    DarkTheme = False;

    Try

        SettingsKey = "Common/ClientApplicationSettings";
        Settings    = SystemSettingsStorage.Upload(SettingsKey);

        If Settings <> Undefined Then
            DarkTheme = String(Settings.ClientApplicationTheme) = "Dark";
        EndIf;

    Except
        DarkTheme = False;
    EndTry;

    Return DarkTheme;

EndFunction

#EndRegion

#EndRegion
