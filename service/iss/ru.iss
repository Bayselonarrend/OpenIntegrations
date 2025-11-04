#define MyAppName "OInt"
#define MyAppVersion "1.30.0"
#define MyAppPublisher "bayselonarrend"
#define MyAppURL "https://github.com/Bayselonarrend/OpenIntegrations"
#define MyAppExeName "oint.bat"
#define Repo "C:\ProgramData\Jenkins\.jenkins\workspace\OpiBuild\OpiRelease"
#define Engine "C:\engine"
#define Melezh "C:\ProgramData\Jenkins\.jenkins\workspace\OpiBuild\OpiRelease\Melezh"

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
Source: "{#Engine}\windows\*"; DestDir: "{app}\share\oint\bin"; Flags: recursesubdirs
Source: "{#Repo}\src\ru\cli\start.bat"; DestDir: "{app}"
Source: "{#Repo}\Media\logo.bmp"; Flags: dontcopy
Source: "{#Repo}\Media\icons\ex.ico"; DestDir: "{app}\share\oint\icons"
Source: "{#Repo}\Media\icons\wizard.ico"; DestDir: "{app}\share\oint\icons"
Source: "{#Repo}\Media\icons\doc.ico"; DestDir: "{app}\share\oint\icons"

; Файлы Melezh (устанавливаются только если выбран чекбокс)
Source: "{#Melezh}\src\ru\*"; DestDir: "{app}\share\oint\lib\melezh"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Melezh}\src\ru\extensions\*"; DestDir: "{app}\share\oint\lib\melezh\extensions"; Flags: recursesubdirs uninsneveruninstall; Check: ShouldInstallAddon
Source: "{#Melezh}\service\melezh_start.bat"; DestDir: "{app}"; DestName: "melezh_start.bat"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Melezh}\service\melezh.bat"; DestDir: "{app}\bin"; DestName: "melezh.bat"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Melezh}\service\melezh"; DestDir: "{app}\bin"; DestName: "melezh"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Melezh}\media\icons\m_ex.ico"; DestDir: "{app}\share\oint\icons"; DestName: "m_ex.ico"; Flags: recursesubdirs; Check: ShouldInstallAddon
Source: "{#Repo}\Media\melezh.bmp"; DestDir: "{tmp}"; DestName: "melezh.bmp"; Flags: deleteafterinstall; Check: ShouldInstallAddon


[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{app}\share\oint\icons\ex.ico"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\start.bat"; IconFilename: "{app}\share\oint\icons\ex.ico"; Tasks: desktopicon
Name: "{group}\Удалить OInt"; Filename: "{uninstallexe}"; IconFilename: "{app}\share\oint\icons\wizard.ico"
Name: "{group}\Web-документация"; Filename: "https://www.openintegrations.dev/"; IconFilename: "{app}\share\oint\icons\doc.ico"  

Name: "{group}\Melezh"; Filename: "{app}\melezh_start.bat"; IconFilename: "{app}\share\oint\icons\m_ex.ico"; Check: ShouldInstallAddon
Name: "{userdesktop}\Melezh"; Filename: "{app}\melezh_start.bat"; IconFilename: "{app}\share\oint\icons\m_ex.ico"; Tasks: desktopicon; Check: ShouldInstallAddon 

[Tasks]
Name: desktopicon; Description: "Создать ярлык на рабочем столе"; GroupDescription: "Параметры рабочего стола"

[InstallDelete]
Type: filesandordirs; Name: "{app}"

[Run]
Filename: "{cmd}"; Parameters: "/k ""cd ""{app}/bin"" && {#MyAppExeName}"""; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent unchecked
Filename: "{cmd}"; Parameters: "/k ""cd ""{app}/bin"" && melezh.bat"""; Description: "{cm:LaunchProgram,{#StringChange("Melezh", '&', '&&')}}"; Flags: nowait postinstall skipifsilent unchecked; Check: ShouldInstallAddon 
Filename: "https://openintegrations.dev/docs/Start/CLI_version"; Flags: shellexec runasoriginaluser postinstall unchecked; Description: "Посетить страницу документации openintegrations.dev"

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

var

  AddonTaskPage: TWizardPage;

  AddonCheckBox: TNewCheckBox;
  
  AddonDescription: TNewStaticText;

procedure InitializeWizard();
begin

  // --- Страница для аддона ---
  AddonTaskPage := CreateCustomPage(wpLicense,
    'Установить Melezh', 'Установка серверной версии OInt');

  // Картинка справа

  ExtractTemporaryFile('melezh.bmp');

  with TBitmapImage.Create(WizardForm) do
  begin
    Parent := AddonTaskPage.Surface;
    Left := WizardForm.Width - 165;  // Прижимаем к правому краю
    Top := 35;
    Width := 175;
    Height := 200;
    Stretch := True;
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\melezh.bmp'));  // Убедись, что это .bmp или замени на LoadFromBitmapFile
  end;

  AddonDescription := TNewStaticText.Create(WizardForm);
  AddonDescription.Parent := AddonTaskPage.Surface;
  AddonDescription.Caption := 'Melezh - это небольшой (~ 6 MB) серверный аддон для OInt, позволяющий запускать настраиваемый gateway для любых его методов. Melezh может прослушивать выбранный вами порт и интерпретировать приходящие туда HTTP-запросы в команды OInt для дальнейшего выплнения. Имеется встроенное логирование и Web UI для удобной настройки';
  AddonDescription.WordWrap := True;
  AddonDescription.Width := 350;
  AddonDescription.Height := 300;
  AddonDescription.Top := 85;
  AddonDescription.AutoSize := False;
    
  // Флажок слева от картинки
  AddonCheckBox := TNewCheckBox.Create(WizardForm);
  AddonCheckBox.Parent := AddonTaskPage.Surface;
  AddonCheckBox.Left := 2;
  AddonCheckBox.Top := 185;
  AddonCheckBox.Width := 300;
  AddonCheckBox.Caption := 'Установить Melezh';
  AddonCheckBox.Checked := True;
    
end;

function ShouldInstallAddon(): Boolean;
begin
  Result := AddonCheckBox.Checked;
end;
