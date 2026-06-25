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

        #If Client Then
            NotifyAboutComponentConnection(AddInName, AddIn);
        #EndIf

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

Procedure UpdateAddInsOnClient(Val AddInsNames) Export

    #If Client Then
        For Each AddInName In AddInsNames Do

            ErrInfo = New CallbackDescription("ConnectComponent", ThisObject, AddInName);
            BeginInstallAddIn(ErrInfo, StrTemplate("CommonTemplate.%1", AddInName));

        EndDo;
    #EndIf

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

Function GetAddInsCachePath() Export

    // BSLLS:UsingHardcodePath-off

    Return ?(OPI_Tools.IsWindows()
        , "%APPDATA%\1C\1Cv8\ExtCompT"
        , "~/.1cv8/1C/1Cv8/ExtCompT/");

    // BSLLS:UsingHardcodePath-on

EndFunction

#If Client Then // !OPI

Procedure AfterAddInAttach(Val Connected, Val AddInName) Export

    AddIn = Undefined;

    If Connected Then

        ComponentType = StrTemplate("AddIn.%1.Main", AddInName);
        AddIn         = New (ComponentType);

    EndIf;

    NotifyAboutComponentConnection(AddInName, AddIn);

EndProcedure

Procedure NotifyAboutComponentConnection(Val AddInName, Val AddIn = Undefined)

    If AddIn <> Undefined Then

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

#EndIf // !OPI

#Region Releases

Function GetExtensionName() Export

    Return "OpenIntegrations";

EndFunction

Function GetArtifactLanguage() Export

    Return OPI_Tools.OPILanguage();

EndFunction

Function GetArtifactFileName(ReleasesArchive, Val VersionNumber, Val ArtifactID, Val MirrorID, Val Lang = "") Export

    If Not ValueIsFilled(Lang) Then
        Lang = GetArtifactLanguage();
    EndIf;

    Try
        Artifact = GetReleaseArtifact(ReleasesArchive, VersionNumber, ArtifactID, Lang);
    Except
        Raise "Error getting release artifact. Please try again later!"
    EndTry;

    If Artifact = Undefined Then
        Return "";
    EndIf;

    Return Artifact["filename"];

EndFunction

Function DownloadReleaseArtifact(ReleasesArchive
    , Val VersionNumber
    , Val ArtifactID
    , Val MirrorID
    , Val SavePath
    , Val Lang = "") Export

    // !IRPSkip
    DownloadURL = GetArtifactDownloadURL(ReleasesArchive, VersionNumber, ArtifactID, MirrorID, Lang);

    DownloadFileByURL(DownloadURL, SavePath);

    Return "File successfully uploaded";

EndFunction

Function GetArtifactDownloadURL(ReleasesArchive
    , Val VersionNumber
    , Val ArtifactID
    , Val MirrorID
    , Val Lang = "") Export

    If Not ValueIsFilled(Lang) Then
        Lang = GetArtifactLanguage();
    EndIf;

    Artifact = GetReleaseArtifact(ReleasesArchive, VersionNumber, ArtifactID, Lang);

    If Artifact = Undefined Then
        Raise StrTemplate("Artifact %1 (%2) not found for version %3", ArtifactID, Lang, VersionNumber);
    EndIf;

    If MirrorID = "s3" Then

        URL = Artifact["s3Url"];

        If Not ValueIsFilled(URL) Then
            URL = StrTemplate("%1/versions/%2/%3", ReleasesArchive["s3BaseUrl"], VersionNumber, Artifact["filename"]);
        EndIf;

        Return URL;

    ElsIf MirrorID = "yandex" Then

        Return GetYandexDiskDownloadURL(ReleasesArchive, VersionNumber, Artifact["filename"]);

    Else

        URL = Artifact["githubUrl"];

        If Not ValueIsFilled(URL) Then
            URL = StrTemplate("%1/%2/%3", ReleasesArchive["githubDownloadBase"], VersionNumber, Artifact["filename"]);
        EndIf;

        Return URL;

    EndIf;

EndFunction

#EndRegion

#Region InstallationCfe

#If Host Then // !OPI

Function InstallExtensionFromArchive(ReleasesArchive, Val VersionNumber, Val MirrorID, Val Lang = "") Export

    // !IRPSkip
    DownloadURL = GetArtifactDownloadURL(ReleasesArchive, VersionNumber, "cfe", MirrorID, Lang);
    Binary = GetBinaryDataByURL(DownloadURL);

    Return ApplyBinaryExtensionData(Binary);

EndFunction

#EndIf

#EndRegion

#EndRegion

#Region Private

Function GetReleaseArtifact(ReleasesArchive, Val VersionNumber, Val ArtifactID, Val Lang)

    Release = FindReleaseDataInArchive(ReleasesArchive, VersionNumber);

    If Release = Undefined Then
        Return Undefined;
    EndIf;

    Artifacts = Release["artifacts"];

    If TypeOf(Artifacts) <> Type("Array") Then
        Return Undefined;
    EndIf;

    For Each Artifact In Artifacts Do

        If Artifact["id"] = ArtifactID And Artifact["lang"] = Lang Then
            Return Artifact;
        EndIf;

    EndDo;

    Return Undefined;

EndFunction

Function FindReleaseDataInArchive(ReleasesArchive, Val VersionNumber)

    Versions = ReleasesArchive["versions"];

    If TypeOf(Versions) <> Type("Array") Then
        Return Undefined;
    EndIf;

    For Each Release In Versions Do

        If Release["version"] = VersionNumber Then
            Return Release;
        EndIf;

    EndDo;

    Return Undefined;

EndFunction

Function GetYandexDiskDownloadURL(ReleasesArchive, Val VersionNumber, Val FileName)

    PublicKey = ReleasesArchive["yandexDiskPublicKey"];

    If Not ValueIsFilled(PublicKey) Then
        Raise "The public key for Yandex.Disk is not specified in the releases archive";
    EndIf;

    Parameters = New Structure;
    Parameters.Insert("public_key", PublicKey);
    Parameters.Insert("path"      , StrTemplate("/%1/%2", VersionNumber, FileName));

    Response = OPI_HTTPRequests.NewRequest()
        .Initialize("https://cloud-api.yandex.net/v1/disk/public/resources/download")
        .SetURLParams(Parameters)
        .SetTimeout(60)
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject(True, True);

    Response = OPI_AdvancedCall.NormalizeIntermediateResult(Response);

    URL = Response["href"];

    If Not ValueIsFilled(URL) Then

        ResponseData = Response;

        If TypeOf(Response) = Type("Structure") Or TypeOf(Response) = Type("Map") Then

            If Response["result"] = True Then
                ResponseData      = Response["data"];
            EndIf;

        EndIf;

        If TypeOf(ResponseData) = Type("Structure") Or TypeOf(ResponseData) = Type("Map") Then
            URL                 = ResponseData["href"];
        EndIf;

    EndIf;

    If Not ValueIsFilled(URL) Then
        Raise "Unable to get the download link from Yandex.Disk";
    EndIf;

    Return URL;

EndFunction

Procedure DownloadFileByURL(Val URL, Val SavePath)

    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(SavePath);

    OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetTimeout(300)
        .SetResponseFile(SavePath)
        .ProcessRequest("GET")
        .ReturnResponse(, True);

EndProcedure

Function GetBinaryDataByURL(Val URL)

    OPI_TypeConversion.GetLine(URL);

    Return OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetTimeout(300)
        .ProcessRequest("GET")
        .ReturnResponseAsBinaryData(, True);

EndFunction

#If Host Then // !OPI

Function ApplyBinaryExtensionData(Val Binary)

    Result = New Structure;
    Result.Insert("Success"        , False);
    Result.Insert("Message"        , "");
    Result.Insert("RequiresRestart", False);

    ExtensionOPI = FindExtensionOPI();
    IsNew        = ExtensionOPI = Undefined;

    If IsNew Then
        ExtensionOPI = ConfigurationExtensions.Create();
    EndIf;

    CheckExtensionApplication(Binary, ExtensionOPI);

    ExtensionOPI.SafeMode = False;
    ExtensionOPI.Write(Binary);

    Result.Success         = True;
    Result.RequiresRestart = Not CheckExtensionMetadataAvailability();
    Result.Message         = ?(Result.RequiresRestart
        , "Extension installed. A restart of the session is required to apply the changes."
        , "Extension successfully installed");

    Return Result;

EndFunction

Function FindExtensionOPI()

    Found = ConfigurationExtensions.Get(New Structure("Name", GetExtensionName()));

    If Found.Count() = 0 Then
        Return Undefined;
    EndIf;

    Return Found[0];

EndFunction

Procedure CheckExtensionApplication(Val Data, Val Extension)

    InstallationProblems = Extension.CheckCanApply(Data);

    For Each Problem In InstallationProblems Do

        Description = Problem["Description"];

        If Problem.Importance = ImportanceOfExtensionConfigurationApplicationProblem.Critical Then
            Raise Description;
        EndIf;

    EndDo;

EndProcedure

Function CheckExtensionMetadataAvailability()

    Try
        OPI_Tools.GetTextTemplate("OPI_Text_LicenseRU");
        Return True;
    Except
        Return False;
    EndTry;

EndFunction

#EndIf

#EndRegion

#EndIf // !OPI
