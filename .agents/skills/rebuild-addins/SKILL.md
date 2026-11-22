---
name: rebuild-addins
description: >-
  Пересобирает нативные компоненты OpenIntegrations через release.bat или
  build_all.bat и публикует бинарники через publish-addins.bat. Использовать,
  когда менялся Rust-код add-in, пользователь просит пересобрать компоненту,
  или Jenkins должен увидеть новые zip.
---

# Пересборка компонент

Каждая компонента собирается отдельно. Корневого Cargo workspace нет.

- Одна компонента: `src/addins/<name>/release.bat`
- Все сразу: `src/addins/build_all.bat` (пропускает `commons` и `special`)

`release.bat` кросс-компилирует бинарники и кладёт zip в `src/ru/OInt/addins`, `src/en/OInt/addins` и `Template.addin` в ru/en `CommonTemplates`. `Template.addin` в git не коммитится.

После сборки Jenkins увидит бинарники только когда они попадут в `origin/addins`. Это делает `src/addins/publish-addins.bat`.

## publish-addins затирает незакоммиченные правки

Так и есть. Скрипт:

1. Запоминает текущую ветку и уходит в orphan-ветку `addins`.
2. Коммитит только zip и `Template.addin`.
3. Делает `git push --force origin addins`.
4. Возвращается через `git checkout -f <сохранённая ветка>`.
5. Вызывает `sync-addins.bat`, который заменяет в worktree zip и `Template.addin` содержимым `origin/addins`.

`git checkout -f` отбрасывает незакоммиченные изменения отслеживаемых файлов. Уже сделанные коммиты и неотслеживаемые файлы остаются. На ветке `addins` скрипт сразу выходит и ничего не публикует.

Запускать `publish-addins.bat` только когда `git status --porcelain` пустой. Если дерево грязное — не запускать, сказать, что локальная сборка уже лежит в zip, а публикация сотрёт незакоммиченные правки.

В задании Alpaca Cursor не вызывает `publish-addins.bat`. Если менялся Rust, он запускает только `release.bat` и оставляет zip в дереве. После коммита задание публикует компоненты само. Чужие zip к этому моменту уже лежат в дереве: их подтянули в начале, и повторный sync перед публикацией затёр бы свежую сборку.
