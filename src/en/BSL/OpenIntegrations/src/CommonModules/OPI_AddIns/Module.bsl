// OneScript: ./OInt/tools/main/Modules/OPI_AddIns.os

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
// BSLLS:UsingHardcodePath-off
// BSLLS:Typo-off
// BSLLS:DeprecatedMessage-off
// BSLLS:UsingServiceTag-off
// BSLLS:ExecuteExternalCodeInCommonModule-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:MagicNumber-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check server-execution-safe-mode

// #Use "./internal"

#If Not WebClient Then // !OPI

#Region Internal

#Region Main

Function GetAddIn(Val AddInName, Val Class = "Main", Val Reattach = False) Export

    AddIn     = Undefined;
    Error     = "";
    AddInName = ?(StrStartWith(AddInName, "OPI_")
        , AddInName
        , StrTemplate("OPI_%1", AddInName));

    CallSettings   = OPI_AdvancedCall.GetCurrentSettings();
    ConnectionMode = OPI_Tools.GetOr(CallSettings, "addin_mode", Undefined);

    If Not InitializeAddIn(AddInName, Class, AddIn)
        Or ValueIsFilled(ConnectionMode)
        Or Reattach Then

        Error = Undefined;
        AddIn = AttachNewAddIn(AddInName, Class, Error, ConnectionMode);

        If Error <> Undefined Then

            If Error.Description = "AddInInstallation" Then
                FormInstallException();
            Else
                FormAddInException(DetailErrorDescription(Error));
            EndIf;

        EndIf;

    EndIf;

    Return AddIn;

EndFunction

Function IsAddIn(Val Value) Export

    ValeType = String(TypeOf(Value));
    Return StrStartWith(ValeType, "AddIn.");

EndFunction

Function FileTransferRequired() Export

    // BSLLS:CommentedCode-off

    // Components in 1C on Linux cannot reliably send and receive data larger than 30 KB
    // https://github.com/Bayselonarrend/OpenIntegrations/issues/72

    // UPD: NotIsolated works

    // Return Not OPI_Tools.IsWindows() And Not OPI_Tools.IsOneScript();

    // BSLLS:CommentedCode-on

    Return False;

EndFunction

Function NotAddinParameterError() Export

    Result = New Map;
    Result.Insert("result", False);
    Result.Insert("error" , "The passed value is not an AddIn object");

    Return Result;

EndFunction

#EndRegion

#Region TCP

Function SetTls(Val AddIn, Val Tls) Export

    Result = New Structure("result", True);

    If ValueIsFilled(Tls) Then

        ErrorText = "Incorrect Tls settings!!";
        OPI_TypeConversion.GetKeyValueCollection(Tls, ErrorText);

        UseTls            = OPI_Tools.GetOr(Tls, "use_tls" , False);
        DisableValidation = OPI_Tools.GetOr(Tls, "accept_invalid_certs", False);
        CertFilepath      = OPI_Tools.GetOr(Tls, "ca_cert_path" , "");

        OPI_TypeConversion.GetBoolean(UseTls);
        OPI_TypeConversion.GetBoolean(DisableValidation);
        OPI_TypeConversion.GetLine(CertFilepath);

        Result = AddIn.SetTLS(UseTls, DisableValidation, CertFilepath);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    Return Result;

EndFunction

Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export

    CertStructure = New Structure;
    OPI_Tools.AddField("use_tls"             , True                   , "Boolean", CertStructure);
    OPI_Tools.AddField("accept_invalid_certs", DisableCertVerification, "Boolean", CertStructure);
    OPI_Tools.AddField("ca_cert_path"        , CertFilepath           , "String" , CertStructure);

    Return CertStructure;

EndFunction

Function GetProxySettings(Val Address
    , Val Port
    , Val View     = "socks5"
    , Val Login    = Undefined
    , Val Password = Undefined) Export

    SettingsStructure = New Structure;
    OPI_Tools.AddField("server"    , Address, "String" , SettingsStructure);
    OPI_Tools.AddField("port"      , Port   , "Number" , SettingsStructure);
    OPI_Tools.AddField("proxy_type", View   , "String" , SettingsStructure);

    If Not Login = Undefined Then
        OPI_TypeConversion.GetLine(Login);
        SettingsStructure.Insert("login", Login);
    EndIf;

    If Not Password = Undefined Then
        OPI_TypeConversion.GetLine(Password);
        SettingsStructure.Insert("password", Password);
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction

#EndRegion

#Region InternalStorage

Function PutData(Val AddIn, Val Value) Export

    Processed = False;

    If TypeOf(Value) = Type("String") Then

        DataFile = New File(Value);

        If DataFile.Exists() Then
            Result    = AddIn.LoadFileToVault(DataFile.FullName);
            Result    = OPI_Tools.JsonToStructure(Result);
            Processed = True;
        Else
            Result    = AddIn.LoadBase64ToVault(Value);
            Result    = OPI_Tools.JsonToStructure(Result);
            Processed = Result["result"];
        EndIf;

    EndIf;

    If Not Processed Then

        OPI_TypeConversion.GetBinaryData(Value, True, True);
        Result = AddIn.LoadBinaryToVault(Value);
        Result = OPI_Tools.JsonToStructure(Result);

    EndIf;

    Return Result;

EndFunction

Function ReceiveData(Val AddIn, Val DataKey) Export

    If Not TypeOf(DataKey) = Type("String") Then
        Return DataKey;
    EndIf;

    Result = AddIn.RetrieveBinaryFromVault(DataKey);

    If TypeOf(Result) = Type("String") Then

        Try
            Result = OPI_Tools.JsonToStructure(Result);
        Except
            Return Result;
        EndTry;

    EndIf;

    Return Result;

EndFunction

#EndRegion

#Region Logging

Function GetLoggingSettings(Val WriteToMemory = True
    , Val MaxEvents                           = 300
    , Val FilePath                            = "") Export

    OPI_TypeConversion.GetBoolean(WriteToMemory);
    OPI_TypeConversion.GetLine(FilePath);
    OPI_TypeConversion.GetNumber(MaxEvents);

    SettingsStructure = New Structure;
    WriteToFile       = ValueIsFilled(FilePath);

    If WriteToMemory Then
        SettingsStructure.Insert("mode"       , "memory");
        SettingsStructure.Insert("max_entries", MaxEvents);
    EndIf;

    If WriteToFile Then
        SettingsStructure.Insert("mode"     , "file");
        SettingsStructure.Insert("file_path", FilePath);
    EndIf;

    If WriteToFile And WriteToMemory Then
        SettingsStructure.Insert("mode", "both");
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction

Function GetLog(Val ServerObject, Val AsString = False, Val EventCount = 100) Export

    If Not IsAddIn(ServerObject) Then
        Return NotAddinParameterError();
    EndIf;

    OPI_TypeConversion.GetNumber(EventCount);
    OPI_TypeConversion.GetBoolean(AsString);

    Result = ServerObject.GetLogs(EventCount);
    Result = OPI_Tools.JsonToStructure(Result);

    If AsString And Result["result"] Then
        Result = StrConcat(Result["logs"], Chars.LF);
    EndIf;

    Return Result;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function InitializeAddIn(Val AddInName, Val Class, AddIn)

    Try
        AddIn = New(StrTemplate("AddIn.%1.%2", AddInName, Class));
        Return True;
    Except
        Return False;
    EndTry;

EndFunction

Function AttachNewAddIn(Val AddInName, Val Class, Error, ConnectionMode)

    If OPI_Tools.IsOneScript() Then
        TemplateName = StrTemplate("%1%2.zip"         , AddInsFolderOS(), AddInName);
    Else
        TemplateName = StrTemplate("CommonTemplate.%1", AddInName);
    EndIf;

    Try

        AttachAddInWithMode(TemplateName, AddInName, ConnectionMode);

        AddIn = New(StrTemplate("AddIn.%1.%2", AddInName, Class));

        Error = Undefined;
        Return AddIn;

    Except
        Error = ErrorInfo();
        Return Undefined;
    EndTry;

EndFunction

Function AttachAddInWithMode(TemplateName, AddInName, ConnectionMode)

    IsOneScript       = OPI_Tools.IsOneScript();
    TypeRequieredByVM = Not IsOneScript;

    If Not TypeRequieredByVM Then

        TypeRequieredByVersion = False;

    Else

        SystemInfo = New SystemInfo();

        Version1C = SystemInfo.AppVersion;
        Version1C = StrSplit(Version1C, ".");

        Part1 = Number(Version1C[0]);
        Part2 = Number(Version1C[1]);
        Part3 = Number(Version1C[2]);

        TypeRequieredByVersion = Part1 > 8 Or Part2 > 3 Or Part3 > 20;

    EndIf;

    TypeRequiered = TypeRequieredByVM And TypeRequieredByVersion;

    #If Client Then
        Result = AttachAddInOnClient(TemplateName, AddInName, ConnectionMode, TypeRequiered);
    #Else
        Result = AttachAddInOnServer(TemplateName, AddInName, ConnectionMode, TypeRequiered);
    #EndIf

    Return Result;

EndFunction

#If Not Client Then

Function AttachAddInOnServer(Val TemplateName, Val AddInName, Val ConnectionMode, Val TypeRequiered)

    Result = ConnectComponent(TemplateName, AddInName, ConnectionMode, TypeRequiered);
    Return Result;

EndFunction

#EndIf

#If Client Then

Function AttachAddInOnClient(Val TemplateName
    , Val AddInName
    , Val ConnectionMode
    , Val TypeRequiered)

    Result = ConnectComponent(TemplateName, AddInName, ConnectionMode, TypeRequiered);

    If Result Then
        Return True;
    EndIf;

    If OPI_ToolsServerCall.ModalityDisabled() Then

        BeginInstallAddIn(Undefined, TemplateName);
        Raise "AddInInstallation";

    Else
        InstallAddIn(TemplateName);
    EndIf;

    Result = ConnectComponent(TemplateName, AddInName, ConnectionMode, TypeRequiered);

    Return Result;

EndFunction

#EndIf

Function ConnectComponent(Val TemplateName, Val AddInName, Val ConnectionMode, Val TypeRequiered)

    If Not TypeRequiered Then

        Result = AttachAddIn(TemplateName, AddInName, AddInType.Native);

    Else

        // BSLLS:UnusedLocalVariable-off

        //@skip-check module-unused-local-variable
        AttachIsolated = AttachIsolated(ConnectionMode);
        //@skip-check server-execution-safe-mode

        // BSLLS:UnusedLocalVariable-on

        // BSLLS:LineLength-off
        Result = Undefined;

        If AttachIsolated Then
            Result = AttachAddIn(TemplateName, AddInName, AddInType.Native);
        Else
            ExecutionText = "Result = AttachAddIn(TemplateName, AddInName, AddInType.Native, AddInConnectionType.NotIsolated)";
            Execute(ExecutionText);
        EndIf;

        // BSLLS:LineLength-on

    EndIf;

    Return Result;

EndFunction

Function AddInsFolderOS()

    LibraryDirectory = OPI_Tools.GetLibraryDirectory();

    // BSLLS:UsingHardcodePath-off

    AddInsFolder = StrTemplate("%1/%2/", LibraryDirectory, "addins");

    // BSLLS:UsingHardcodePath-on

    Return AddInsFolder;

EndFunction

Function AttachIsolated(Val ConnectionMode)

    AttachIsolated = Undefined;

    If ValueIsFilled(ConnectionMode) Then

        ModeLower = Lower(String(ConnectionMode));

        If ModeLower = "isolated" Then

            AttachIsolated = True;

        ElsIf ModeLower = "notisolated" Then

            AttachIsolated = False;

        Else
            AttachIsolated = Undefined;
        EndIf;

    EndIf;

    If AttachIsolated = Undefined Then

        NotIsolatedBySystem = Not OPI_Tools.IsWindows();
        AttachIsolated      = Not NotIsolatedBySystem;

    EndIf;

    Return AttachIsolated;

EndFunction

Procedure FormAddInException(Val Error)

    Text = "Failed to initialize an external component. It may not be compatible with your operating system.";

    If Not OPI_Tools.IsWindows() Then

        Text                                      = StrTemplate("%1
        |
        |Important: The component requires GLIBC >=2.18 and OpenSSL version 3.x
        |Check that these dependencies are resolved on your system!", Text);

    EndIf;

    Text = StrTemplate("%1
    |
    |Read more: https://en.openintegrations.dev/docs/Start/Component-requirements
    |
    |System info:
    |%2", Text, Error);

    Raise Text;

EndProcedure

Procedure FormInstallException()

    Raise "Initial external component installation has been started. If there are no other error messages, run the function again";

EndProcedure

#EndRegion

#EndIf // !OPI
