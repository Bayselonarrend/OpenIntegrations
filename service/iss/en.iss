#define MyAppName "OInt"
#define MyAppVersion "2.0.0"
#define MyAppPublisher "bayselonarrend"
#define MyAppURL "https://github.com/Bayselonarrend/OpenIntegrations"
#define MyAppExeName "oint.bat"
#define Repo "C:\Users\bayselonarrend\AppData\Local\Jenkins\.jenkins\workspace\OpiBuild\OpiRelease"
#define Engine "C:\engine"
#define Melezh "C:\Users\bayselonarrend\AppData\Local\Jenkins\.jenkins\workspace\OpiBuild\OpiRelease\Melezh"

[Setup]
DisableWelcomePage      = no
WizardImageFile         = {#Repo}\Media\WizardImage.bmp

AppId                   = {{E1D44D44-2C84-4112-80AA-2DC406D85A11}
AppName                 = {#MyAppName}
AppVersion              = {#MyAppVersion}
AppPublisher            = {#MyAppPublisher}
AppPublisherURL         = {#MyAppURL}
AppSupportURL           = {#MyAppURL}
AppUpdatesURL           = {#MyAppURL}
DefaultDirName          = {autopf}\{#MyAppName}
DefaultGroupName        = {#MyAppName}
DisableProgramGroupPage = yes
LicenseFile             = {#Repo}\LICENSE
OutputDir               = "{#Repo}\{#MyAppVersion}"
Compression             = lzma
SolidCompression        = yes
WizardStyle             = modern
OutputBaseFilename      = oint_{#MyAppVersion}_installer_en

[Files]
Source: "{#Repo}\ci\installer_set\*"; DestDir: "{app}"; Flags: recursesubdirs
Source: "{#Engine}\windows\*"; DestDir: "{app}\lib\oint\bin"; Flags: recursesubdirs
Source: "{#Repo}\src\ru\cli\start.bat"; DestDir: "{app}"
Source: "{#Repo}\Media\logo.bmp"; Flags: dontcopy
Source: "{#Repo}\service\oscript-lic.txt"; Flags: dontcopy
Source: "{#Repo}\Media\icons\ex.ico"; DestDir: "{app}\share\oint\icons"
Source: "{#Repo}\Media\icons\wizard.ico"; DestDir: "{app}\share\oint\icons"
Source: "{#Repo}\Media\icons\doc.ico"; DestDir: "{app}\share\oint\icons"

; Файлы Melezh (устанавливаются только если выбран чекбокс)
Source: "{#Melezh}\src\en\*"; DestDir: "{app}\share\oint\lib\melezh"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Melezh}\src\en\extensions\*"; DestDir: "{app}\share\oint\lib\melezh\extensions"; Flags: recursesubdirs uninsneveruninstall; Check: ShouldInstallAddon
Source: "{#Melezh}\service\melezh_start.bat"; DestDir: "{app}"; DestName: "melezh_start.bat"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Melezh}\service\melezh.bat"; DestDir: "{app}\bin"; DestName: "melezh.bat"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Melezh}\service\melezh"; DestDir: "{app}\bin"; DestName: "melezh"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Melezh}\media\icons\m_ex.ico"; DestDir: "{app}\share\oint\icons"; DestName: "m_ex.ico"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Repo}\Media\melezh.bmp"; DestDir: "{tmp}"; DestName: "melezh.bmp"; Flags: deleteafterinstall; Check: ShouldInstallAddon



[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{app}\share\oint\icons\ex.ico"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{app}\share\oint\icons\ex.ico"; Tasks: desktopicon
Name: "{group}\Uninstall OInt"; Filename: "{uninstallexe}"; IconFilename: "{app}\share\oint\icons\wizard.ico"
Name: "{group}\Web-documentation"; Filename: "https://www.en.openintegrations.dev/"; IconFilename: "{app}\share\oint\icons\doc.ico"  

Name: "{group}\Melezh"; Filename: "{app}\melezh_start.bat"; IconFilename: "{app}\share\oint\icons\m_ex.ico"; Check: ShouldInstallAddon
Name: "{userdesktop}\Melezh"; Filename: "{app}\melezh_start.bat"; IconFilename: "{app}\share\oint\icons\m_ex.ico"; Tasks: desktopicon; Check: ShouldInstallAddon 

[Tasks]
Name: desktopicon; Description: "Create a desktop shortcut"; 

[InstallDelete]
Type: filesandordirs; Name: "{app}"

[Run]
Filename: "{cmd}"; Parameters: "/k ""cd ""{app}/bin"" && {#MyAppExeName}"""; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent unchecked
Filename: "{cmd}"; Parameters: "/k ""cd ""{app}/bin"" && melezh.bat"""; Description: "{cm:LaunchProgram,{#StringChange("Melezh", '&', '&&')}}"; Flags: nowait postinstall skipifsilent unchecked; Check: ShouldInstallAddon 
Filename: "https://en.openintegrations.dev/docs/Start/CLI_version"; Flags: shellexec runasoriginaluser postinstall unchecked; Description: "Visit documentation en.openintegrations.dev"

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\bin"; \
    Check: NeedsAddPath(ExpandConstant('{app}\bin'))

[Code]

var

  InterpreterLicensePage: TOutputMsgMemoWizardPage;
  InterpreterLicenseAcceptedRadio: TNewRadioButton;
  InterpreterLicenseRejectedRadio: TNewRadioButton;
  AddonTaskPage: TWizardPage;
  AddonCheckBox: TNewCheckBox;
  AddonDescription: TNewStaticText;

function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
  Element: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  Element:= ';' + Param + ';';
  Result := Pos(Element, ';' + OrigPath + ';') = 0;
end;    

procedure UpdateInterpreterLicenseNextButton();
begin
  if WizardForm.CurPageID = InterpreterLicensePage.ID then
    WizardForm.NextButton.Enabled := InterpreterLicenseAcceptedRadio.Checked;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = InterpreterLicensePage.ID then
    UpdateInterpreterLicenseNextButton()
  else
    WizardForm.NextButton.Enabled := True;
end;

procedure InterpreterLicenseOptionClick(Sender: TObject);
begin
  UpdateInterpreterLicenseNextButton();
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if (CurPageID = InterpreterLicensePage.ID) and (not InterpreterLicenseAcceptedRadio.Checked) then
  begin
    MsgBox('You must accept the OneScript interpreter license to continue installation.', mbError, MB_OK);
    Result := False;
  end;
end;

procedure InitializeWizard();
var
  OscriptLicenseText: AnsiString;
begin

  ExtractTemporaryFile('oscript-lic.txt');
  OscriptLicenseText := '';
  if not LoadStringFromFile(ExpandConstant('{tmp}\oscript-lic.txt'), OscriptLicenseText) then
    RaiseException('Failed to load OneScript interpreter license file.');

  InterpreterLicensePage := CreateOutputMsgMemoPage(
    wpLicense,
    'OneScript interpreter license',
    'Please review the OneScript interpreter license.',
    'Please read the following License Agreement. You must accept the terms of this agreement before continuing with the installation.',
    OscriptLicenseText);
    
  InterpreterLicensePage.RichEditViewer.Height := ScaleY(216);

  InterpreterLicenseAcceptedRadio := TNewRadioButton.Create(WizardForm);
  InterpreterLicenseAcceptedRadio.Parent := InterpreterLicensePage.Surface;
  InterpreterLicenseAcceptedRadio.Left := 0;
  InterpreterLicenseAcceptedRadio.Top := InterpreterLicensePage.SurfaceHeight - ScaleY(41);
  InterpreterLicenseAcceptedRadio.Width := InterpreterLicensePage.SurfaceWidth;
  InterpreterLicenseAcceptedRadio.Caption := 'I accept the agreement';
  InterpreterLicenseAcceptedRadio.Checked := True;
  InterpreterLicenseAcceptedRadio.OnClick := @InterpreterLicenseOptionClick;

  InterpreterLicenseRejectedRadio := TNewRadioButton.Create(WizardForm);
  InterpreterLicenseRejectedRadio.Parent := InterpreterLicensePage.Surface;
  InterpreterLicenseRejectedRadio.Left := 0;
  InterpreterLicenseRejectedRadio.Top := InterpreterLicensePage.SurfaceHeight - ScaleY(21);
  InterpreterLicenseRejectedRadio.Width := InterpreterLicensePage.SurfaceWidth;
  InterpreterLicenseRejectedRadio.Caption := 'I do not accept the agreement';
  InterpreterLicenseRejectedRadio.Checked := False;
  InterpreterLicenseRejectedRadio.OnClick := @InterpreterLicenseOptionClick;

  AddonTaskPage := CreateCustomPage(InterpreterLicensePage.ID,
    'Install Melezh', 'Installing the OInt Server Version');
    
  ExtractTemporaryFile('melezh.bmp');

  with TBitmapImage.Create(WizardForm) do
  begin
    Parent := AddonTaskPage.Surface;
    Left := WizardForm.Width - 260;
    Top := 35;
    Width := 175;
    Height := 200;
    Stretch := True;
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\melezh.bmp'));
  end;

  AddonDescription := TNewStaticText.Create(WizardForm);
  AddonDescription.Parent := AddonTaskPage.Surface;
  AddonDescription.Caption := 'Melezh is a small (~6 MB) server-side add-on for OInt that allows you to run a customizable gateway for any of its methods. Melezh can listen on a port of your choice and interpret incoming HTTP requests as OInt commands for further execution. It features built-in logging and a Web UI for convenient configuration';
  AddonDescription.WordWrap := True;
  AddonDescription.Width := 350;
  AddonDescription.Height := 120; 
  AddonDescription.Top := 85;
  AddonDescription.AutoSize := True;
    
  AddonCheckBox := TNewCheckBox.Create(WizardForm);
  AddonCheckBox.Parent := AddonTaskPage.Surface;
  AddonCheckBox.Left := 2;
  AddonCheckBox.Top := AddonDescription.Top + AddonDescription.Height + 5; 
  AddonCheckBox.Width := 300;
  AddonCheckBox.Caption := 'Install Melezh';
  AddonCheckBox.Checked := True;
    
end;

function ShouldInstallAddon(): Boolean;
begin
  Result := AddonCheckBox.Checked;
end;
