# Очистка истории бинарников add-in и дедупликация копий

Тяжёлые артефакты лежат в четырёх местах (см. `src/addins/build.bat`):

| Назначение | Путь |
|------------|------|
| OneScript RU | `src/ru/OInt/addins/*.zip` |
| OneScript EN | `src/en/OInt/addins/*.zip` |
| Макет 1С RU | `src/ru/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin` |
| Макет 1С EN | `src/en/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin` |

## Текущая схема (ветка `addins`)

С **2026** собранные бинарники **не коммитятся в `main`/`stable`**. Они хранятся в orphan-ветке [`addins`](https://github.com/Bayselonarrend/OpenIntegrations/tree/addins) (один коммит с zip и `Template.addin`), а в `.gitignore` основных веток перечислены те же пути.

| Скрипт | Назначение |
|--------|------------|
| `src/addins/sync-addins.bat` / `sync-addins.sh` | Подтянуть бинарники с `origin/addins` в рабочий каталог (без staging) |
| `src/addins/publish-addins.bat` | Собрать коммит в `addins` и force-push на `origin` |
| `src/addins/build.bat` | Локальная сборка и раскладка zip в четыре каталога |

CI и Jenkins перед сборкой/тестами вызывают `sync-addins`. После `publish-addins.bat` sync вызывается автоматически — иначе при возврате на `main` git удаляет бинарники из рабочего каталога.

Клон `main`/`stable` **не содержит** zip/addin в истории. Для `main` — `sync-addins`; для `stable` бинарники с `addins` могут не подойти — сборка из `src/addins` на коммите ветки или архивы из релиза.

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
# проверить diff, затем — см. раздел «После переписывания» ниже
```

Скрипт:

1. Копирует все `*.zip` и `Template.addin` в backup.
2. Запускает `git filter-repo --invert-paths` только по этим glob (лицензии `Template.txt` и `.mdo` не трогает).
3. Восстанавливает файлы из backup и создаёт коммит `chore: restore add-in binaries after history prune`.
4. Запускает `git gc --prune=now`.

`git filter-repo` **удаляет remote `origin`** — скрипт предлагает команду для повторного добавления.

### После переписывания (обязательно)

`git filter-repo` переписывает **все** ветки и теги в локальном клоне. На remote попадает только то, что вы явно force-push'нули. Если отправить только `main`, старые теги и ветки (например `stable`) останутся на GitHub со старыми hash — в pack продолжит жить вся тяжёлая история (старые add-in, `.deb`/`.rpm` и т.д.). Обычный `git clone` по одной ветке будет казаться лёгким, а `git clone --mirror` — нет.

#### 1. Force-push всех активных веток и тегов

```powershell
cd R:\Repos\OpenIntegrations

# ветки (минимум main и stable; добавьте остальные активные)
git push --force-with-lease origin main
git push --force-with-lease origin stable

# все теги — без этого размер mirror/полного клона не уменьшится
git push --force origin '+refs/tags/*:refs/tags/*'
```

Проверка, что remote совпал с локальным (hash должны совпасть):

```powershell
git rev-parse main stable 'refs/tags/2.1.0^{commit}'
git ls-remote origin refs/heads/main refs/heads/stable refs/tags/2.1.0
```

#### 2. Обновить bare mirror (если используется)

После force-push на GitHub mirror нужно принудительно подтянуть refs и выбросить недостижимые объекты:

```powershell
git -C R:\ointMirror\OpenIntegrations.git fetch --force --prune origin `
  '+refs/heads/*:refs/heads/*' '+refs/tags/*:refs/tags/*'
git -C R:\ointMirror\OpenIntegrations.git gc --prune=now --aggressive
git -C R:\ointMirror\OpenIntegrations.git count-objects -vH
```

Для регулярного обновления mirror после любого переписывания истории:

```powershell
git fetch --force --prune origin '+refs/heads/*:refs/heads/*' '+refs/tags/*:refs/tags/*'
git gc --prune=now
```

#### 3. Убрать битые pack-файлы в локальном клоне (Windows)

После `filter-repo` иногда остаются `.pack` без пары `.idx` — `git count-objects -vH` показывает `size-garbage` с предупреждениями `no corresponding .idx`:

```powershell
cd R:\Repos\OpenIntegrations
Get-ChildItem .git\objects\pack\pack-*.pack | Where-Object {
    -not (Test-Path ($_.FullName -replace '\.pack$','.idx'))
} | Remove-Item
git gc --prune=now
git count-objects -vH
```

На Linux/macOS:

```bash
cd /path/to/OpenIntegrations
find .git/objects/pack -name 'pack-*.pack' ! -exec sh -c 'test -f "${1%.pack}.idx"' _ {} \; -print -delete
git gc --prune=now
git count-objects -vH
```

#### 4. GitHub

- Размер на стороне GitHub уменьшится не сразу; иногда нужны тикеты в support или ожидание GC на стороне хостинга.
- Пока на remote старые теги, `git clone --mirror` будет тянуть тяжёлый pack независимо от того, что `main` уже переписан.

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

Реализовано через **отдельную ветку `addins` + `.gitignore` на `main`/`stable`** (см. [Текущая схема](#текущая-схема-ветка-addins)):

1. В `.gitignore` перечислены `src/ru/OInt/addins/*.zip`, `src/en/OInt/addins/*.zip` и `**/CommonTemplates/*/Template.addin`.
2. Актуальные файлы публикуются в ветку `addins` (`publish-addins.bat`).
3. Перед сборкой/тестами `sync-addins` копирует их в рабочий каталог; `build.bat` раскладывает свежую сборку в те же четыре места.

В истории `main` бинарников нет; `filter-repo` ниже — для **очистки старой истории**, если тяжёлые blob ещё остались в pack до перехода на ветку `addins`.

## Почему не LFS

GitHub LFS считает bandwidth на download; при частых CI и клонах квота заканчивается быстрее, чем при обычном git pack, особенно если историю уже почистили.
