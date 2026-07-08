# Special add-in builds

Каталог для **альтернативных** сборок нативных компонент ОПИ — отдельно от стандартного `build.bat` / `release.bat` и ветки `addins`.

## Варианты сборки

| Вариант | Суффикс zip | Платформа | Назначение |
|---------|-------------|-----------|------------|
| **win7** | `_win7.zip` | Windows x64 + x86 | Windows 7 / Server 2008 R2 (`win7-windows-msvc`, nightly + build-std) |
| **static-openssl** | `_static-openssl.zip` | Linux x64 + x86 | Статически слинкованный OpenSSL 3.x внутри `.so` |

Готовые архивы складываются в `output/` (в `.gitignore` на `main`).

## Быстрый старт

1. Один раз подготовить окружение:
   - `setup-win7.bat` — nightly Rust, rust-src, MSVC
   - `setup-static-openssl.bat` — WSL OracleLinux_9_1, cargo-zigbuild
2. Собрать всё (режим `both` для обеих архитектур):
   - `build_all.bat`
3. Опубликовать в orphan-ветку `addins-special`:
   - `publish-special-addins.bat`

После клонирования `main` подтянуть уже опубликованные zip:

- `sync-special-addins.bat` / `sync-special-addins.sh`

## Сборка одной компоненты

```bat
build-win7.bat ssh opi_ssh OPI_SSH both
build-static-openssl.bat ssh opi_ssh OPI_SSH both
```

Для Lua дополнительно (второй пакет):

```bat
build-win7.bat lua lua OPI_LuaJIT both --no-default-features --features luajit
```

## static-openssl: какие компоненты

Только addins с OpenSSL на Linux: `tcp_client`, `mysql`, `postgres`, `ssh`. Остальные (rustls, Schannel и т.д.) в `build_all` для этого варианта не собираются.

## Формат zip

Аналог стандартного релиза, но только нужная платформа:

- **win7**: `AddIn_<LIB>_x64_windows.dll`, `AddIn_<LIB>_x86_windows.dll`, `MANIFEST.XML`
- **static-openssl**: `AddIn_<LIB>_x64_linux.so`, `AddIn_<LIB>_x86_linux.so`, `MANIFEST.XML`

Имена: `OPI_SSH_win7.zip`, `OPI_SSH_static-openssl.zip`.

## Публикация

`publish-special-addins.bat` создаёт orphan-ветку `addins-special` с содержимым `output/*.zip` и делает `git push --force origin addins-special`. Стандартная ветка `addins` не затрагивается.

## Скрипты

| Файл | Назначение |
|------|------------|
| `build_all.bat` | Все win7 + все static-openssl (both) |
| `build-win7.bat` | Одна компонента, win7 |
| `build-static-openssl.bat` | Одна компонента, vendored OpenSSL |
| `lib.bat` | Общие проверки, манифест, zip |
| `setup-win7.bat` | Подготовка окружения win7 |
| `setup-static-openssl.bat` | Подготовка WSL / zigbuild |
| `publish-special-addins.bat` | Публикация в `addins-special` |
| `sync-special-addins.bat` | Синхронизация с `origin/addins-special` |
