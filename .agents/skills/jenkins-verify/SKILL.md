---
name: jenkins-verify
description: >-
  Собирает OpenIntegrations в Jenkins через BigFloppa и запускает или
  разбирает тесты OPITest: полный OpiOsWinRu или раздельный
  OpiSplitTests для одной библиотеки. Использовать, когда пользователь
  просит прогнать тесты, проверить сборку Jenkins или проверить изменение
  после пуша.
---

# Проверка через Jenkins

Перед тестами всегда нужен `BigFloppa`: он синхронизирует add-in, гоняет `OpiMain` (зеркала, CLI, документация), обновляет тестовые базы и собирает релиз. `OpiMain` Rust не компилирует. Пока zip компоненты не на `origin/addins`, прогон его не увидит.

Jenkins с этой машины открывать по Tailscale: `http://100.74.74.9:8080/`. Имя `jenkins.openintegrations.dev` отсюда не резолвится. Задания читать и запускать через MCP `user-jenkins`.

## Что запускать

Проверка после изменений:

1. `BigFloppa` с `UPLOAD_ARTIFACTS=false` и `BRANCH` выбранной ветки. Для обычной проверки можно передать `SKIP_DB_UPDATE=true`, когда параметр уже есть у задания: стадия обновления тестовой базы тогда не запускается. Пока Jenkinsfile с этим параметром не на `main` и `BigFloppa` с ним ни разу не запускался, параметр не передавать. Дождаться успешного завершения. `OpiCliCheck` внутри него не ждать: сам `BigFloppa` завершается после остальных стадий.
2. Затем тесты с тем же `BRANCH`. По умолчанию это OneScript, RU — задание `OpiOsWinRu`.
   - Известна одна библиотека: `OPITest/OpiSplitTests/<Библиотека>/OpiOsWinRu`. Имя папки совпадает с ключом секции (`FTP`, `GRPC`, `Telegram`, …). Список папок: `getJobs` с `parentFullName=OPITest/OpiSplitTests`.
   - Библиотека неизвестна или затронуто несколько: `OPITest/OpiFullTest/OpiOsWinRu`. Несколько известных библиотек можно прогнать отдельными split-заданиями вместо полного прогона.

`UPLOAD_ARTIFACTS=true` выкладывает релиз. Его не передавать, пока пользователь прямо не просит публикацию. `BigFloppa` и тестовые пайплайны коммитят и пушат в `BRANCH` (по умолчанию `main`).

Параметр `BRANCH` объявлен в Jenkinsfile. Пока этот Jenkinsfile не на `main`, Jenkins его не знает: передавать `BRANCH` нельзя, задание возьмёт `main`. Если `triggerBuild` ругается, что параметра нет, повторить без него.

Другие варианты того же прогона лежат рядом с `OpiOsWinRu`: `OpiOsWinEn`, `OpiCliWinRu`, `Opi1cWinRu`, `Opi1cfWinRu`, Deb/Rpm и их En. И в полном каталоге `OPITest/OpiFullTest/`, и в `OPITest/OpiSplitTests/<Библиотека>/` имена заданий одинаковые. Их брать, только если пользователь просит другой язык или рантайм.

## Как читать Jenkins

`fullName` через `/`. `getJobs`: `limit` не больше 10 и `tree=jobs[name,fullName,url]`. Без `tree` ответ обрывается. У `WorkflowJob` в списке часто только `_class` — имя брать точечным `getJob`.

- Последняя сборка: `getBuild` без номера, в `tree` поля `number,result,timestamp,building,duration,url`.
- Упавшие тесты: `getTestResults` с `onlyFailingTests=true`. Отчёт часто пустой.
- Лог: `getBuildLog` (`skip`/`limit`, отрицательный `limit` — хвост) и `searchBuildLog`.
- Наборы, которые упали: искать `ОШИБКА: Тест:`. Рядом строка `Сообщение:`. Прогоны идут параллельно, соседние строки лога принадлежат другому тесту.
- Очередь: `getQueueItem`. `triggerBuild` и `rebuildBuild` — только по просьбе пользователя. Задание Alpaca само собирает и тестирует, из чата его не повторять.

Разбирать падения, которые относятся к последнему изменению. Уже красные чужие наборы не считать регрессией этой правки.

В сеансе `AlpacaWork` сборку и тесты запускает Jenkins. Cursor только записывает имя задания в `ci/alpaca/out/test-job.txt` или вердикт в `ci/alpaca/out/verdict.txt`. `triggerBuild` из этого сеанса не вызывать. `retrigger` ставить только если упавший тест напрямую проверяет метод, изменённый в ветке.
