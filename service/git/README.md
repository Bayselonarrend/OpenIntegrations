# Очистка истории бинарников add-in и дедупликация копий

Тяжёлые артефакты лежат в четырёх местах (см. `src/addins/build.bat`):

| Назначение | Путь |
|------------|------|
| OneScript RU | `src/ru/OInt/addins/*.zip` |
| OneScript EN | `src/en/OInt/addins/*.zip` |
| Макет 1С RU | `src/ru/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin` |
| Макет 1С EN | `src/en/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin` |

## Что уже делает Git

В **одном коммите** одинаковые байты хранятся **одним blob** (проверка: `git ls-tree HEAD` для всех четырёх путей одного компонента даёт один и тот же hash). Четыре копии раздувают рабочий каталог и checkout (~240 MB), но не умножают объект в pack для текущей ревизии.

**История** раздувается при каждой пересборке: старые версии zip/addin остаются в pack-файлах навсегда, пока не переписать историю.

## Скрипты

| Файл | Назначение |
|------|------------|
| `prune-addin-binaries-from-history.ps1` | Windows: вырезать все версии zip/addin из истории, вернуть только актуальные файлы одним коммитом |
| `prune-addin-binaries-from-history.sh` | То же для Linux/macOS |
| `link-addin-duplicates.ps1` | Опционально: заменить дубликаты на symlink (только RU как источник) |

### Требования

- [git-filter-repo](https://github.com/newren/git-filter-repo) ≥ 2.38 (`pip install git-filter-repo`)
- Чистое дерево (`git status` без незакоммиченных изменений в затрагиваемых путях)
- Согласование с командой: после переписывания истории нужен **force push** всех веток, все клонируют заново или делают fresh clone

### Очистка истории (типовой сценарий)

```powershell
cd R:\Repos\OpenIntegrations
.\service\git\prune-addin-binaries-from-history.ps1 -BackupDir D:\opi-addin-backup
# проверить diff, затем:
git push --force-with-lease origin main
# и остальные активные ветки по необходимости
```

Скрипт:

1. Копирует все `*.zip` и `Template.addin` в backup.
2. Запускает `git filter-repo --invert-paths` только по этим glob (лицензии `Template.txt` и `.mdo` не трогает).
3. Восстанавливает файлы из backup и создаёт коммит `chore: restore add-in binaries after history prune`.
4. Запускает `git gc --prune=now`.

`git filter-repo` **удаляет remote `origin`** — скрипт предлагает команду для повторного добавления.

### После переписывания на GitHub

- Размер репозитория на стороне GitHub уменьшится не сразу; иногда нужны тикеты в support или ожидание GC на стороне хостинга.
- У вас в `.git/objects/pack` есть «битые» pack без `.idx` (~495 MB garbage по `git count-objects`) — после успешного `filter-repo` + `git gc` имеет смысл проверить `git count-objects -vH` ещё раз.

## Symlink вместо четырёх копий (без LFS)

Идея: в Git хранить **только** `src/ru/OInt/addins/*.zip`, остальное — симлинки:

```
src/en/OInt/addins/OPI_MySQL.zip -> ../../ru/OInt/addins/OPI_MySQL.zip
src/ru/BSL/.../OPI_MySQL/Template.addin -> ../../../../../../ru/OInt/addins/OPI_MySQL.zip
```

Плюсы: один blob в коммите, меньше checkout на Linux/CI.  
Минусы:

- Windows: нужны `git config core.symlinks true` и режим разработчика (или права на создание symlink); иначе вместо бинарника в рабочей копии окажется текстовый файл с путём.
- EDT/1С: перед продакшен-сборкой **проверьте**, что загрузка макета `Template.addin` и тесты 1С видят symlink (на Linux CI обычно ок).

Скрипт: `link-addin-duplicates.ps1` (не входит в переписывание истории; запускать отдельно после согласования).

## Альтернатива symlink: не хранить дубликаты в Git

Более надёжно для смешанной Windows/Linux команды:

1. В `.gitignore` добавить `src/en/OInt/addins/*.zip` и `**/CommonTemplates/*/Template.addin`.
2. Оставить в репозитории только `src/ru/OInt/addins/*.zip`.
3. В `build.bat` и CI перед тестами копировать zip в три остальных места (как уже делает сборка add-in).

Тогда в истории остаётся **один путь** на компонент; `filter-repo` проще. Минус: клон без шага CI/сборки не получит макеты 1С до копирования.

## Почему не LFS

GitHub LFS считает bandwidth на download; при частых CI и клонах квота заканчивается быстрее, чем при обычном git pack, особенно если историю уже почистили.
