#define MyAppName "OInt"
#define MyAppVersion "1.23.0"
#define MyAppPublisher "bayselonarrend"
#define MyAppURL "https://github.com/Bayselonarrend/OpenIntegrations"
#define MyAppExeName "oint.bat"
#define Repo "C:\ProgramData\Jenkins\.jenkins\workspace\Release"
#define Engine "C:\engine"

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
Source: "{#Engine}\windows\*"; DestDir: "{app}\share\oint\bin"; Flags: recursesubdirs
Source: "{#Repo}\src\ru\cli\start.bat"; DestDir: "{app}"
Source: "{#Repo}\Media\logo.bmp"; Flags: dontcopy
Source: "{#Repo}\Media\icons\ex.ico"; DestDir: "{app}\share\oint\icons"
Source: "{#Repo}\Media\icons\wizard.ico"; DestDir: "{app}\share\oint\icons"
Source: "{#Repo}\Media\icons\doc.ico"; DestDir: "{app}\share\oint\icons"


[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{app}\share\oint\icons\ex.ico"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{app}\share\oint\icons\ex.ico"; Tasks: desktopicon
Name: "{group}\Uninstall OInt"; Filename: "{uninstallexe}"; IconFilename: "{app}\share\oint\icons\wizard.ico"
Name: "{group}\Web-documentation"; Filename: "https://www.en.openintegrations.dev/"; IconFilename: "{app}\share\oint\icons\doc.ico"  

[Tasks]
Name: desktopicon; Description: "Create a desktop shortcut"; 

[InstallDelete]
Type: filesandordirs; Name: "{app}\*"

[Run]
Filename: "{cmd}"; Parameters: "/k ""cd ""{app}/bin"" && {#MyAppExeName}"""; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
Filename: "https://en.openintegrations.dev/docs/Start/CLI_version"; Flags: shellexec runasoriginaluser postinstall; Description: "Visit documentation en.openintegrations.dev"

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\bin"; \
    Check: NeedsAddPath(ExpandConstant('{app}\bin'))

[Code]

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

