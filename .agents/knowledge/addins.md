# Нативные компоненты

Справочник схемы add-in и чеклиста. Правила, которые действуют в каждом сеансе, остаются в `AGENTS.md`.

## Схема нативных компонент (Rust add-in)

**Обязательный шаблон** для любой новой нативной компоненты и для переработки существующих. Не создавать add-in «с нуля» в монолитном `lib.rs` с `Arc<Mutex<…>>` — сразу закладывать структуру ниже.

Каноничные примеры: `src/addins/postgres`, `mysql`, `sqlite`, `mssql`, `mongodb`, `ftp`, `zeromq`; серверы — `tcp_server`, `http_server`, `ws_server`.

### Два уровня защиты (не путать)

| Уровень | Где | Что ловит |
|--------|-----|-----------|
| **FFI** | `common-core`: `call_as_func` → `catch_panic` | Паника в тонкой обёртке addin (JSON/Janx, маршрутизация) |
| **Backend** | `common-backend`: поток worker + `catch_panic` на цикл handler | Паника в драйвере; после фатала — `health`, следующие `call`/`send` → `Err` |

`catch_unwind` только на FFI **не заменяет** worker-поток: не решает `!Send` соединений (SQLite), гонки при параллельных вызовах из 1С, poisoned `Mutex` вокруг драйвера.

**Не защищает** ни один уровень: segfault/abort в C-библиотеке драйвера — падает весь процесс 1С. Изоляция только отдельным процессом (вне этой схемы).

### Синхронизация FFI-оболочки

Worker-поток сериализует работу с драйвером, но **не** защищает поля и флаги на стороне `AddIn`: `started`, `logger`, `datasets`, вызовы делегата в `backend`/`common-server`. Если платформа держит один экземпляр компоненты и вызывает методы **из разных потоков** (параллельные задания, внешний хостинг, общий кэш объекта), без mutex на оболочке возможны гонки — даже при корректном worker.

**Обязательно** в `addin.rs` (и в server-`wrapper.rs`, где есть обёртка):

- `Arc<Mutex<State>>` — backend-делегат, служебное состояние, logger; все FFI-методы через `common_utils::lock_unpoisoned`;
- для SQL с dataset — `datasets` внутри того же `State`, не отдельное поле на `AddIn` (в `lib.rs` — тонкие `datasets_*` на `AddIn`).

Свойства getset (`connection_string`, `server_address`, `address` и т.п.) допустимо оставить на `AddIn` **вне** mutex; методы, которые читают их вместе с `State`, берут lock и при необходимости клонируют строку до обращения к backend (см. `grpc` `connect`).

Это **не** отменяет запрет ниже: `Arc<Mutex<соединение/драйвер>>` на addin по-прежнему нельзя — драйвер только в worker/`Session`.

### Структура крейта (клиенты: БД, FTP, ZeroMQ и т.п.)

```
src/addins/<name>/src/
  lib.rs         — METHODS, get_params_amount, cal_func, impl_addin_exports
  addin.rs       — тонкий AddIn: FFI-методы, `Arc<Mutex<State>>` на оболочке, без Mutex вокруг драйвера
  backend.rs     — *Backend: настройки до connect, ленивый поток, SetLogger
  worker.rs      — WorkerCommand, Session, spawn_thread, вся работа с драйвером
  query.rs       — только если есть отдельная логика SQL/запросов (MSSQL, Postgres, …)
  settings.rs    — разбор/хранение настроек connect (по необходимости)
  operations.rs  — парсинг Janx-параметров, маппинг в API драйвера (по необходимости)
release.bat      — CARGO_NAME, LIB_NAME, вызов ../build.bat
```

**Сборка:** корневого Cargo workspace нет — каждый addin собирается отдельно. После `cargo check` для проверки компиляции запускать `release.bat` в каталоге addin. Скрипт кросс-компилирует бинарники и формирует zip в четыре места: `src/ru/OInt/addins/OPI_<Name>.zip`, `src/en/OInt/addins/…`, `CommonTemplates/OPI_<Name>/Template.addin` (ru и en). Файл `Template.addin` — **артефакт сборки**, обычно в gitignore; в репозиторий коммитится только `.mdo` шаблона.

**Особые сборки** (Win7, static OpenSSL): ветка `addins-special`, см. `src/addins/special/README.md` и `docs/ru/md/Start/Component-requirements.md`.

**Не использовать** в новом коде:

- `Arc<Mutex<Драйвер>>` на стороне addin;
- создание backend-потока в `new()` (только **лениво** при первом connect/операции — `ensure_thread`);
- дублирование логики connect/execute в `lib.rs`.

### Выбор транспорта backend

| Тип драйвера | Крейт | Поток | Примеры |
|--------------|-------|-------|---------|
| Синхронный API | `SyncBackendThread` | Обычный `std::thread`, без tokio | `postgres`, `mysql`, `sqlite`, `ftp` |
| Async / tokio внутри драйвера | `BackendThread` | Поток + `Runtime::new()` в worker | `mssql`, `mongodb`, `zeromq` |
| Долгоживущий сервер (listen/accept) | `common-server::Backend` | Внутри — `BackendThread` | `tcp_server`, `http_server`, `ws_server` |

`common-server` — тот же канал команд, но свой API (`send_command`, `handle_async_command`); не смешивать с паттерном `addin/backend/worker` без необходимости.

### Общие зависимости (`Cargo.toml`)

- `common-core` — макросы FFI, `catch_panic` на границе.
- `common-backend` — `BackendThread` / `SyncBackendThread`.
- `common-logs` — `Logger`, `log!`, `SetLogger` / `GetLogs` на FFI.
- `common-janx` — `JanxValue`, `janx!`, `FromJanx` / `IntoJanx` для бинарных полей и составных ответов.
- `common-tcp` — TLS, proxy, `create_tcp_connection` (FTP, БД с TLS).
- `common-dataset` — только где есть пакетные SQL/dataset (MSSQL).

### Паттерн `backend.rs`

- Поля: `thread: Option<…>`, настройки до connect (`tls`, `proxy`, строка подключения), `logger: Option<Arc<Logger>>`.
- `set_logger` / `set_tls` — **только до** установления соединения.
- `connect` → `ensure_thread()` → `thread.call(WorkerCommand::Connect { … })`.
- `close` / `Drop` → `shutdown(Some(WorkerCommand::Shutdown))`.
- `get_logs` — читать из `Logger` на стороне addin/backend (не из worker), если logger хранится в backend.

### Паттерн `worker.rs`

- `enum WorkerCommand` — одна варианта на операцию; ответы через `mpsc::Sender<Result<…>>` или `Sender<String>` для готового JSON.
- `struct Session` — `client`/`connection`, `logger`.
- `fn log(&self, …)` — `common_logs::log!(logger, …)`.
- `spawn_thread` — единственное место цикла `while let Ok(cmd) = rx.recv()`.
- Вся работа с `FtpStream` / `Client` / `Connection` — **только** внутри этого потока.

### FFI: логирование

Добавить в `METHODS` (перед `Version`):

- `SetLogger` — JSON-конфиг (`Logger::from_json`);
- `GetLogs` — `count`, ответ `{ result, logs, total, returned }`.

Порядок на стороне BSL (`OPI_*`): настройки → `SetLogger` (если передано `Логирование`) → connect/open.

### BSL (`OPI_<Имя>`)

Модуль: `src/ru/BSL/OpenIntegrations/src/CommonModules/OPI_<Имя>/Module.bsl` + `OPI_<Имя>.mdo`.

**Шапка модуля** (используется CI для документации и CLI):

```bsl
// OneScript: ./OInt/api/<cli>/Modules/OPI_<Имя>.os
// Lib: <Имя в UI>
// CLI: <ключ в lib.json>
// DocsCategory: …
// DocsNameRU: …
// DocsNameEN: …
```

Обёртка: `#Если Не ВебКлиент Тогда // !OPI` … `#КонецЕсли`.

**Паттерны:**

- `OPI_Компоненты.ПолучитьКомпоненту("<Имя>")` → объект `AddIn.OPI_<Имя>.Main`; жёсткого реестра компонент в `OPI_Компоненты` нет.
- `ЭтоКоннектор`: `Строка(ТипЗнч(Значение)) = "AddIn.OPI_<Имя>.Main"`.
- Сложные параметры FFI: `OPI_Компоненты.СериализоватьJanx` → вызов метода компоненты → `ДесериализоватьJanx`.
- TLS/прокси: `OPI_Компоненты.УстановитьTls`, `ПолучитьНастройкиTls` (если применимо).

В области основных методов:

- `ПолучитьНастройкиЛогирования` → делегат в `OPI_Компоненты.ПолучитьНастройкиЛогирования`;
- `ПолучитьЛог` → `OPI_Компоненты.ПолучитьЛог`;
- в `ОткрытьСоединение` (или аналог) — необязательный параметр `Логирование`, вызов `Коннектор.SetLogger` до `Connect`.

### Метаданные 1С (`.mdo`)

| Объект | Путь |
|--------|------|
| CommonModule `OPI_<Имя>` | `OpenIntegrations/src/CommonModules/OPI_<Имя>/OPI_<Имя>.mdo` |
| CommonTemplate addin | `OpenIntegrations/src/CommonTemplates/OPI_<Имя>/OPI_<Имя>.mdo` (`templateType=AddIn`) |
| Тесты `OPIt_<Имя>` | `Tests/src/CommonModules/OPIt_<Имя>/OPIt_<Имя>.mdo` |

Зарегистрировать в **обоих** `Configuration.mdo`:

- `src/ru/BSL/OpenIntegrations/src/Configuration/Configuration.mdo` — `CommonTemplate.OPI_<Имя>`, `CommonModule.OPI_<Имя>`;
- `src/ru/BSL/Tests/src/Configuration/Configuration.mdo` — `CommonModule.OPIt_<Имя>` (и `OPItc_<Имя>` появится после генерации в CI).

UUID в `.mdo` — новый уникальный на каждый объект.

### CLI (ручная часть)

- Добавить ключ в `src/ru/cli/data/Classes/index/lib.json`: `"<cli>": "OPI_<Имя>"`.
- Файл `src/ru/cli/data/Classes/index/<cli>.json` (regions, methods, CLI-параметры) **генерируется в CI** из BSL-модуля и комментариев `// Lib`, `// CLI`, `@param` в тестах — править вручную не нужно.
- Если компоненту в CLI-тестах нужно передавать не сам объект addin, а сериализованные настройки — добавить ветку в `ОбработатьПараметрКомпонентыCLI` в `OPI_ПолучениеДанныхТестов` (по образцу `OPI_RCON` → `GetSettings()`, `OPI_LDAP` → `GetConfiguration()`).

### Тестовое окружение

Интеграционные тесты читают параметры из `OPI_ПолучениеДанныхТестов.ПолучитьТестовыеДанные()` (секреты CI / локальный конфиг). Для новой библиотеки завести осмысленные ключи, например `LDAP_URL`, `LDAP_BindDN`, `LDAP_Password`, `LDAP_Base`.

Запускаемый тест `*_РасширеннаяПроверка`: в начале `УстановитьПризнакТестаCLI(Ложь)` и выход при `ЭтоТестCLI()` — см. `OPIt_RCON`, `OPIt_LDAP`.

### Тесты (новая и существующая компонента)

1. `OPIt_<Имя>`: области `ЗапускаемыеТесты` / `АтомарныеТесты` по правилам выше.
2. В запускаемый тест основных методов — `<Модуль>_ПолучитьНастройкиЛогирования`, `<Модуль>_ПолучитьЛог` (по образцу `OPIt_MSSQL`).
3. Атомарные тесты с `//END` для документации; без выноса повторов в служебные процедуры.
4. `OPI_ПолучениеДанныхТестов`: константа секции, записи в `ПолучитьТаблицуТестов`, функции `Проверка_*` (для логирования — ветки `Файл`, `Память`, `КакСтрока`).
5. Не править `OPItc_*` вручную — модуль появится/обновится в CI из `OPIt_*`.
6. Количество атомарных тестов (без `Расширенная_*`) = количеству экспортных методов `OPI_*`.

### Релиз и документация

- `service/releases.json` — пункт в `changes` **первого** (невыпущенного) релиза, если изменение видно пользователю библиотеки (см. «Описание релизов»): `lib`, `icon` (путь `media/<Lib>.png`), `description_ru`, `description_en`.
- Иконка библиотеки для changelog и docs — добавить в `media/` (если ещё нет).
- Страницы документации, sidebars, examples — **генерируются из тестов** в CI; достаточно корректных `OPIt_*` с `//END` и шапки `OPI_*`.
- Для addin-библиотек с TLS: на странице инструкции в docs появится предупреждение об OpenSSL, если в шапке модуля указана компонента — см. `docs/ru/md/Start/Component-requirements.md`.

### Серверы (отличие от клиентов)

- Логирование часто включается **третьим аргументом `Start`**, а не отдельным `SetLogger` до connect (см. `tcp_server`, `http_server`, `ws_server`).
- Состояние — accept/handle в `common-server`, не `Session { sql client }`.
- BSL-тесты логирования — по тому же принципу, но вызов через `Запустить` / параметры старта.

### Чеклист: новая компонента (end-to-end)

**Rust**

1. Создать `src/addins/<name>/` с `Cargo.toml`, `release.bat`.
2. Завести `lib.rs`, `addin.rs`, `backend.rs`, `worker.rs` (+ `query.rs` / `settings.rs` / `operations.rs` по необходимости).
3. Выбрать `SyncBackendThread` или `BackendThread` (или `common-server` для listen-сервера).
4. Заложить `SetLogger` / `GetLogs` и `log!` в connect/операциях.
5. `cargo check` в каталоге addin, затем `release.bat` для zip/`Template.addin`.

**BSL и 1С**

6. `OPI_<Имя>/Module.bsl` + `OPI_<Имя>.mdo`; регистрация в `OpenIntegrations/.../Configuration.mdo`.
7. `CommonTemplates/OPI_<Имя>/OPI_<Имя>.mdo` (бинарник `Template.addin` — из сборки).
8. `OPIt_<Имя>/Module.bsl` + `OPIt_<Имя>.mdo`; регистрация в `Tests/.../Configuration.mdo`.
9. `OPI_ПолучениеДанныхТестов`: константа, `НовыйТест(...)`, все `Проверка_<Имя>_*`; при необходимости — ветка в `ОбработатьПараметрКомпонентыCLI`.

**Интеграция и релиз**

10. `src/ru/cli/data/Classes/index/lib.json` — ключ CLI.
11. `service/releases.json` — запись в текущий релиз; иконка в `media/`.
12. Не править вручную: `src/ru/OInt`, `src/en`, `OPItc_*`, `docs/*`, `<cli>.json` — обновит CI.

### Чеклист: переработка старой компоненты

Те же шаги, что для новой, плюс:

1. Разнести монолитный `lib.rs`; убрать `Arc<Mutex<драйвер>>`, заложить `Arc<Mutex<State>>` на FFI-оболочку (см. «Синхронизация FFI-оболочки»).
2. Перенести клиент в `Session` worker-потока; поток — только ленивый `ensure_thread`.
3. **Сохранить** совместимость FFI: номера/имена методов, JSON-поля, намеренные побочные эффекты (например задержки в `cal_func`).

### Эталоны для копирования

| Задача | Смотреть |
|--------|----------|
| Новая sync-клиент + SQL | `src/addins/postgres` |
| Новая sync-клиент без SQL | `src/addins/ftp` |
| Новая async-клиент | `src/addins/mssql`, `mongodb` |
| BSL + тесты с нуля | `OPI_RCON`, `OPIt_RCON` (простой addin) или `OPI_PostgreSQL`, `OPIt_MSSQL` (SQL) |
| Новый сервер | `src/addins/tcp_server` + `commons/common-server` |
| Полный чеклист новой библиотеки | раздел «Чеклист: новая компонента (end-to-end)» выше |
