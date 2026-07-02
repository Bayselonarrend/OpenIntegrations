# Static OpenSSL build for Linux

Этот каталог предназначен для самостоятельной сборки Rust-компонент ОПИ с **статически слинкованным OpenSSL 3.x** внутри `.so` (x64 и x86 Linux).

Релизные сборки по умолчанию линкуются к системным `libssl.so.3` / `libcrypto.so.3`. Скрипты из этого каталога собирают вариант без внешней зависимости от OpenSSL в ОС — удобно для старых дистрибутивов с OpenSSL 1.1 или при изолированной поставке.

## Какие компоненты поддерживаются

Не все addins используют OpenSSL. На Linux к системному OpenSSL 3.x сейчас линкуются только:

| Каталог | Библиотека | Откуда TLS |
|---------|------------|------------|
| `tcp_client` | `OPI_TCPClient` | `common-tcp` + `native-tls` |
| `mysql` | `OPI_MySQL` | `mysql` + `native-tls` |
| `postgres` | `OPI_PostgreSQL` | `postgres-native-tls` |
| `ssh` | `OPI_SSH` | `ssh2` + OpenSSL |

Компоненты на **rustls** (`mssql`, `ftp`, `grpc`, `ws_client` и др.) OpenSSL не требуют — для них этот каталог не нужен.

На **Windows** у большинства TLS-компонент используется Schannel (`native-tls`), а у SSH OpenSSL уже вшит через `ssh2` с `vendored-openssl`.

## Что внутри

- `setup-static-openssl-build-env.bat` — одноразовая проверка WSL и инструментов сборки.
- `build-static-openssl-package.bat` — сборка выбранной компоненты и упаковка в zip.

## Быстрый старт

1. Откройте `cmd` в каталоге `src\addins\static-openssl`.
2. Один раз выполните:
   - `setup-static-openssl-build-env.bat`
3. Для нужной компоненты выполните:
   - `build-static-openssl-package.bat <component_dir> <cargo_name> <lib_name> [x64|x86|both]`

## Пример: OPI_SSH

```bat
build-static-openssl-package.bat ssh opi_ssh OPI_SSH x64
```

Готовый архив появится в:

`src\addins\static-openssl\artifacts\OPI_SSH\OPI_SSH_static_openssl_x64.zip`

## Формат результата

Для `x64` формируется:

- `AddIn_<LIB_NAME>_x64_linux.so`
- `MANIFEST.XML` (Linux x64)

Для `x86` — аналогично с `_x86_linux.so` и `arch='i386'`.

Для `both` — оба `.so` и единый `MANIFEST.XML`.

## Feature-флаг в Cargo

Сборка включает `--features vendored-openssl`, который прокидывается в `common-tcp` и/или прямую зависимость `openssl` с фичей `vendored` (OpenSSL 3.x из `openssl-src`).

Затронутые `Cargo.toml`:

- `commons/common-tcp` — `vendored-openssl = ["openssl/vendored"]`
- `tcp_client`, `mysql`, `postgres`, `ssh` — реэкспорт `vendored-openssl`

## Установка

Используйте полученный zip как пакет внешней компоненты или замените только Linux `.so` в вашем релизном zip (Windows DLL и прочие платформы остаются из стандартной сборки).

## Важные замечания

- Сборка идёт через WSL (`OracleLinux_9_1`) и `cargo-zigbuild`, как в `src/addins/build.bat`.
- **Не** задавайте `OPENSSL_DIR` / `OPENSSL_LIB_DIR` при vendored-сборке — иначе Cargo может взять системный OpenSSL.
- Vendored-сборка дольше обычной и увеличивает размер `.so`.
- На одной машине одновременно несколько компонент со статическим OpenSSL обычно безопаснее, чем несколько копий динамически слинкованных к разным версиям libssl, но полностью избежать дублирования кода OpenSSL в каждой `.so` нельзя — это осознанный компромисс.
- Проверяйте итоговую компоненту на целевом дистрибутиве (`ldd` не должен показывать `libssl.so.3` / `libcrypto.so.3`).
