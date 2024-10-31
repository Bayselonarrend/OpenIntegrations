#define MyAppName "OInt"
#define MyAppVersion "1.15.1"
#define MyAppPublisher "bayselonarrend"
#define MyAppURL "https://github.com/Bayselonarrend/OpenIntegrations"
#define MyAppExeName "oint.bat"
#define Repo "C:\ProgramData\Jenkins\.jenkins\workspace\Release"

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
OutputBaseFilename      = oint_{#MyAppVersion}_installer_ru

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "{#Repo}\ci\installer_set\*"; DestDir: "{app}"; Flags: recursesubdirs
Source: "{#Repo}\service\engine\windows\*"; DestDir: "{app}\share\oint\bin"; Flags: recursesubdirs
Source: "{#Repo}\src\ru\cli\start.bat"; DestDir: "{app}"
Source: "{#Repo}\Media\logo.bmp"; Flags: dontcopy

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{#Repo}\Media\ex.ico"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{#Repo}\Media\ex.ico"; Tasks: desktopicon
Name: "{group}\Удалить OInt"; Filename: "{uninstallexe}"; IconFilename: "{#Repo}\Media\wizard.ico"
Name: "{group}\Web-документация"; Filename: "https://www.openintegrations.dev/"  

[Tasks]
Name: desktopicon; Description: "Создать ярлык на рабочем столе"; 

[InstallDelete]
Type: filesandordirs; Name: "{app}\*"

[Run]
Filename: "{cmd}"; Parameters: "/k ""cd ""{app}/bin"" && {#MyAppExeName}"""; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
Filename: "https://openintegrations.dev/docs/Start/CLI_version"; Flags: shellexec runasoriginaluser postinstall; Description: "Посетить страницу документации openintegrations.dev"

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

