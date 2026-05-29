# Legacy build for Windows 7 / Server 2008 R2

Этот каталог предназначен для самостоятельной сборки отдельных Rust-компонент ОПИ под старые Windows (Win7/2008 R2, x64 и x86).

## Что внутри

- `setup-win7-build-env.bat` - одноразовая подготовка окружения.
- `build-win7-package.bat` - сборка выбранной компоненты и упаковка в zip.

## Быстрый старт

1. Откройте `cmd` в каталоге `src\addins\legacy-win7`.
2. Один раз выполните:
   - `setup-win7-build-env.bat`
3. Для нужной компоненты выполните:
   - `build-win7-package.bat <component_dir> <cargo_name> <lib_name> [x64|x86|both]`

## Пример: OPI_SSH

```bat
build-win7-package.bat ssh opi_ssh OPI_SSH x64
```

Готовый архив появится в:

`src\addins\legacy-win7\artifacts\OPI_SSH\OPI_SSH_win7_x64.zip`

Пример для x86:

```bat
build-win7-package.bat ssh opi_ssh OPI_SSH x86
```

Пример для двух архитектур в одном zip:

```bat
build-win7-package.bat ssh opi_ssh OPI_SSH both
```

## Формат результата

Для `x64` формируется:

- `AddIn_<LIB_NAME>_x64_windows.dll`
- `MANIFEST.XML` (Windows x64)

Для `x86` формируется:

- `AddIn_<LIB_NAME>_x86_windows.dll`
- `MANIFEST.XML` (Windows i386)

Для `both` формируются обе DLL и единый `MANIFEST.XML` с двумя компонентами.

Пример для SSH:

- `AddIn_OPI_SSH_x64_windows.dll`
- `MANIFEST.XML`

## Установка

Используйте полученный zip как пакет внешней компоненты (или замените DLL в вашем релизном zip, если используете собственный процесс поставки).

## Важные замечания

- Если параметр архитектуры не указан, по умолчанию используется `x64`.
- Сборка использует `nightly` и `-Zbuild-std`, поэтому может занимать заметно больше времени.
- Проверяйте итоговую компоненту на целевой ОС (Windows Server 2008 R2) перед выдачей пользователю.
