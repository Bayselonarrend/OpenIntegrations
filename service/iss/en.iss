﻿#define MyAppName "OInt"
#define MyAppVersion "1.15.1"
#define MyAppPublisher "bayselonarrend"
#define MyAppURL "https://github.com/Bayselonarrend/OpenIntegrations"
#define MyAppExeName "oint.bat"
#define Repo "C:\ProgramData\Jenkins\.jenkins\workspace\Release\"
#define OScript "C:\Program Files\OneScript\"

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

Source: "{#OScript}\lib\oint\*"; DestDir: "{app}\lib\oint"; Flags: recursesubdirs; Excludes: "tests"
Source: "{#OScript}\lib\oint-cli\*"; DestDir: "{app}\lib\oint-cli"; Flags: recursesubdirs

Source: "{#Repo}\Media\logo.bmp"; Flags: dontcopy

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{#Repo}\Media\ex.ico"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{#Repo}\Media\ex.ico"; Tasks: desktopicon
Name: "{group}\Uninstall OInt"; Filename: "{uninstallexe}"; IconFilename: "{#Repo}\Media\wizard.ico"
Name: "{group}\Web-documentation"; Filename: "https://www.en.openintegrations.dev/"  

[Tasks]
Name: desktopicon; Description: "Create a desktop shortcut"; 

[Run]
Filename: "{cmd}"; Parameters: "/k ""cd ""{app}"" && {#MyAppExeName}"""; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
Filename: "https://en.openintegrations.dev/docs/Start/CLI_version"; Flags: shellexec runasoriginaluser postinstall; Description: "Visit documentation en.openintegrations.dev"

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}"; \
    Check: NeedsAddPath(ExpandConstant('{app}'))

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

