# Jenkins

Справочник заданий и параметров. Правила, которые действуют в каждом сеансе, остаются в `AGENTS.md`.

## Jenkins

Имя `https://jenkins.openintegrations.dev` резолвится только DNS-сервером самого Jenkins (`jenkinsHost` в `ci/config_global.json`). С этой машины оно недоступно. Отсюда открывать и вызывать HTTP по Tailscale: `http://100.74.74.9:8080/`. Путь задания тот же: `http://100.74.74.9:8080/job/OPITest/job/OpiFullTest/job/OpiOsWinRu/`. Если MCP вернул ссылку на `jenkins.openintegrations.dev`, для браузера и curl с этого ПК подставлять хост Tailscale, схему `http` и порт `8080`. Задания читать и запускать через MCP namespace `user-jenkins`.

`fullName` пишется через `/` (`OPITest/OpiFullTest/OpiOsWinRu`). Каталог `...\Jenkins\.jenkins\workspace\OPITest\OpiFullTest\OpiOsWinRu` — это тот же `fullName` с `\` вместо `/`.

Поиск и чтение:

- `getJobs` с `parentFullName` и `tree=jobs[name,fullName,url]`. `limit` не больше 10. Без `tree` ответ огромный и обрывается по таймауту. `getJob` по имени папки (`OPITest`, `OpiBuild`) ничего не возвращает — дочерние задания смотреть через `getJobs`.
- У корневого `WorkflowJob` в ответе `getJobs` часто есть только `_class`, без `name`. Имя такого задания проверять точечным `getJob`.
- Лог и тесты упавшего прогона: `getBuild`, `getBuildLog`, `searchBuildLog`, `getTestResults`. Очередь: `getQueueItem`, статус сервера: `getStatus`.
- `triggerBuild` и `rebuildBuild` вызывать, только когда пользователь прямо просит запустить прогон. Цикл Alpaca запускает сборку и тесты сам; из чата его не повторять.
- У `BigFloppa`, заданий `OpiBuild`/`OpiDocs` из его цепочки и тестовых пайплайнов есть параметр `BRANCH` (по умолчанию `main`). Jenkins читает Jenkinsfile из `main`, затем пайплайн делает checkout `BRANCH` и пушит коммиты сборки в эту ветку. `UPLOAD_ARTIFACTS` у `BigFloppa` по умолчанию `true`; для проверки изменений передавать `false`. Пока в Jenkinsfile на `main` параметра нет, в `triggerBuild` его не передавать. То же с `SKIP_DB_UPDATE` у `BigFloppa`: пока определение из Jenkinsfile не попало на `main` и задание с ним не запускалось, параметр не передавать.

Jenkinsfile лежат в `ci/pipelines` (`paths.jenkinsSrc` в `ci/config.json`). Почти каждый пайплайн сначала вызывает `src/addins/sync-addins.bat` (на Linux — `sync-addins.sh`): в прогон попадают уже собранные zip компонент. `OpiMain` Rust не компилирует. Пока `release.bat` нужного add-in не собран, Jenkins этого исправления не увидит.

### Сборка и публикация — папка `OpiBuild`

| fullName | Jenkinsfile | Что делает |
|----------|-------------|------------|
| `OpiBuild/OpiMain` | `main.jenkinsfile` | `MainProcessingScript.os`: зеркала OInt/en, CLI, `OPItc_*`, документация, индексы. Коммит `Main build (Jenkins)` и push в `origin main` |
| `OpiBuild/OpiCliCheck` | `cli_check.jenkinsfile` | `CLIOutputInspector.os` |
| `OpiBuild/OpiBaseUpdate` | `edt_build.jenkinsfile` | `IBUpdater.os` — обновление тестовых баз 1С |
| `OpiBuild/OpiRelease` | `release.jenkinsfile` | `ReleaseFactory.os`, архив каталога версии. Параметр `UPLOAD_ARTIFACTS` |
| `OpiBuild/Publish` | `publish.jenkinsfile` | `ReleasePublisher.os` — публикация релиза |
| `OpiBuild/OpiOpmPush` | `opm_push.jenkinsfile` | `opm push` пакетов `oint` и `oint-cli` в stable |
| `OpiBuild/OpiSonar` | `sonar.jenkinsfile` | SonarQube |
| `OpiBuild/OpiSourceForge` | `sourceforge.jenkinsfile` | выгрузка на SourceForge |

### Документация — папка `OpiDocs`

`DocsDeployScript.os <контур> <язык>`:

| fullName | Jenkinsfile | Аргументы |
|----------|-------------|-----------|
| `OpiDocs/OpiDocsRu` | `docs_ru.jenkinsfile` | `release ru` |
| `OpiDocs/OpiDocsEn` | `docs_en.jenkinsfile` | `release en` |
| `OpiDocs/OpiDocsTestRu` | `docs_test_ru.jenkinsfile` | `test ru` |
| `OpiDocs/OpiDocsTestEn` | `docs_test_en.jenkinsfile` | `test en` |

### Оркестраторы (корень сервера)

| fullName | Jenkinsfile | Что делает |
|----------|-------------|------------|
| `BigFloppa` | `big_floppa.jenkinsfile` | По очереди: `OpiMain`, `OpiCliCheck` (не ждёт), `OpiBaseUpdate`, `OpiRelease`, затем тестовые доки ru/en. `UPLOAD_ARTIFACTS` прокидывается в релиз. `SKIP_DB_UPDATE` (по умолчанию false) пропускает `OpiBaseUpdate` |
| корневое WorkflowJob рядом с `BigFloppa` | `publish_all.jenkinsfile` | `CONFIRM_RUN=true`, иначе пайплайн сам прерывается. Дальше боевые доки ru/en, `OpiBuild/Publish`, `OpiOpmPush`, `OpiSourceForge`. Имя на сервере перед запуском снять точечным `getJob`: в списке корня оно не приходит |

### Тесты — папка `OPITest`

Полный прогон всех библиотек: `OPITest/OpiFullTest/<задание>`, jenkinsfile в `ci/pipelines/tests_full/`. Прогон одной библиотеки: `OPITest/OpiSplitTests/<Библиотека>/<задание>`, jenkinsfile в `ci/pipelines/tests_split/<Библиотека>/`. Имя папки библиотеки совпадает с ключом секции (`FTP`, `GRPC`, `Telegram`, …). Список папок: `getJobs` с `parentFullName=OPITest/OpiSplitTests`. Задания внутри папки библиотеки называются так же, как в полном прогоне. Пример: `OPITest/OpiSplitTests/FTP/OpiOsWinRu`. Если библиотека изменения известна, по умолчанию запускать её `OpiOsWinRu` (OneScript, RU), а не полный прогон. Полный `OPITest/OpiFullTest/OpiOsWinRu` — когда библиотека неизвестна или затронуто несколько.

Имена заданий создаёт `ci/os/internal/Classes/JenkinsTestsMethods.os`. Суффикс `Ru`/`En` — язык. У каждого задания boolean-параметр на библиотеку (`Core`, `FTP`, …); в split-пайплайне включены только библиотеки этой папки.

| Задание | Jenkinsfile | Где исполняется | Что гоняет |
|---------|-------------|-----------------|------------|
| `OpiOsWinRu` / `OpiOsWinEn` | `os_test_<lang>.jenkinsfile` | `windows` | `1testrunner` по `src/<lang>/OInt/tests` |
| `OpiOsDebRu` / `OpiOsDebEn` | `os_deb_test_<lang>.jenkinsfile` | `Deb-Agent` | OneScript, DEB |
| `OpiOsRpmRu` / `OpiOsRpmEn` | `os_rpm_test_<lang>.jenkinsfile` | `Rpm-Agent` | OneScript, RPM |
| `OpiCliWinRu` / `OpiCliWinEn` | `cli_test_<lang>.jenkinsfile` | `windows` | CLI |
| `OpiCliDebRu` / `OpiCliDebEn` | `cli_deb_test_<lang>.jenkinsfile` | `Deb-Agent` | CLI, DEB |
| `OpiCliRpmRu` / `OpiCliRpmEn` | `cli_rpm_test_<lang>.jenkinsfile` | `Rpm-Agent` | CLI, RPM |
| `Opi1cWinRu` / `Opi1cWinEn` | `1c_test_<lang>.jenkinsfile` | `windows` | 1С, серверная база, vrunner |
| `Opi1cfWinRu` / `Opi1cfWinEn` | `1cf_test_<lang>.jenkinsfile` | `windows` | 1С, файловая база |

Лог `1testrunner -run "./src/ru/OInt/tests/Modules/OPIt_FTP.os" "FT_РаботаСФайлами"` из workspace `OpiFullTest\OpiOsWinRu` — это задание `OPITest/OpiFullTest/OpiOsWinRu`. Тот же модуль из папки `OpiSplitTests\FTP` — `OPITest/OpiSplitTests/FTP/OpiOsWinRu`.

### Alpaca

Два задания корня: `AlpacaWatch` (`ci/pipelines/alpaca_watch.jenkinsfile`) и `AlpacaWork` (`ci/pipelines/alpaca_work.jenkinsfile`). Watcher раз в час смотрит issue с меткой `alpaca` и при необходимости запускает Work, не дожидаясь его. Work правит ветку `alpaca/<номер>` через Cursor CLI, коммитит сам, публикует компоненты и вызывает `BigFloppa` с `UPLOAD_ARTIFACTS=false` и `SKIP_DB_UPDATE=true`. Подробности: `.agents/knowledge/alpaca.md`.
