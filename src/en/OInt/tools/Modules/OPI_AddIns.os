// OneScript: ./OInt/tools/Modules/OPI_AddIns.os

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
#Use "./internal"

#Region Internal

Function GetAddIn(Val AddInName, Val Class = "Main") Export

    AddIn     = Undefined;
    Error     = "";
    AddInName = "OPI_" + AddInName;

    If Not InitializeAddIn(AddInName, Class, AddIn) Then

        Error = Undefined;
        AddIn = AttachAddInOnServer(AddInName, Class, Error);

        If ValueIsFilled(Error) Then
            FormAddInException();
        EndIf;

    EndIf;

    Return AddIn;

EndFunction

Function IsAddIn(Val Value) Export

    ValeType = String(TypeOf(Value));
    Return StrStartsWith(ValeType, "AddIn.");

EndFunction

Function SetTls(Val AddIn, Val Tls) Export

    Result = New Structure("result", True);

    If ValueIsFilled(Tls) Then

        ErrorText = "Incorrect Tls settings!";
        OPI_TypeConversion.GetKeyValueCollection(Tls, ErrorText);

        UseTls            = OPI_Tools.GetOr(Tls, "use_tls", False);
        DisableValidation = OPI_Tools.GetOr(Tls, "accept_invalid_certs", False);
        CertFilepath      = OPI_Tools.GetOr(Tls, "ca_cert_path", "");

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

#EndRegion

#Region Private

Function InitializeAddIn(Val AddInName, Val Class, AddIn)

    Try
        AddIn = New("AddIn." + AddInName + "." + Class);
        Return True;
    Except
        Return False;
    EndTry;

EndFunction

Function AttachAddInOnServer(Val AddInName, Val Class, Error)

    If OPI_Tools.IsOneScript() Then
        TemplateName = AddInsFolderOS() + AddInName + ".zip";
    Else
        TemplateName = "CommonTemplate." + AddInName;
    EndIf;

    Try
        AttachAddIn(TemplateName, AddInName, AddInType.Native);
        AddIn = New("AddIn." + AddInName + "." + Class);
        Error = Undefined;
        Return AddIn;
    Except
        Error = DetailErrorDescription(ErrorInfo());
        Return Undefined;
    EndTry;

EndFunction

Function AddInsFolderOS() Export

    ProgramDirectory = StrReplace(ProgramDirectory(), "\", "/");

    PathParts = StrSplit(ProgramDirectory, "/");
    PathParts.Delete(PathParts.UBound());

    // BSLLS:UsingHardcodePath-off

    AddInsFolder = StrConcat(PathParts, "/") + "/lib/oint/addins/";

    // BSLLS:UsingHardcodePath-on

    Return AddInsFolder;

EndFunction

Procedure FormAddInException()

    Text = "Failed to initialize an external component. It may not be compatible with your operating system.";

    If Not OPI_Tools.IsWindows() Then

        Text = Text
            + Chars.LF
            + Chars.LF
            + "Important: The component requires GLIBC >=2.18"
            + " and OpenSSL version 3.x"
            + Chars.LF
            + "Check that these dependencies are resolved on your system!";

    EndIf;

    Text = Text
        + Chars.LF
        + Chars.LF
        + "Read more: https://en.openintegrations.dev/docs/Start/Component-requirements";

    Raise Text;

EndProcedure

#EndRegion


#Region Alternate

Function ПолучитьКомпоненту(Val ИмяКомпоненты, Val Класс = "Main") Export
	Return GetAddIn(ИмяКомпоненты, Класс);
EndFunction

Function ЭтоКомпонента(Val Значение) Export
	Return IsAddIn(Значение);
EndFunction

Function УстановитьTls(Val Компонета, Val Tls) Export
	Return SetTls(Компонета, Tls);
EndFunction

Function ПолучитьНастройкиTls(Val ОтключитьПроверкуСертификатов, Val ПутьКСертификату = "") Export
	Return GetTlsSettings(ОтключитьПроверкуСертификатов, ПутьКСертификату);
EndFunction

Function КаталогКомпонентOS() Export
	Return AddInsFolderOS();
EndFunction

#EndRegion