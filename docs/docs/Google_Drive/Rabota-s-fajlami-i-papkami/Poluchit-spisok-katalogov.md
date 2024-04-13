---
sidebar_position: 2
---

# Получить список каталогов
Получает список каталогов диска

*Функция ПолучитьСписокКаталогов(Знач Токен, Знач ИмяСодержит = "", Знач Подробно = Ложь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | ИмяСодержит | --querry | Строка (необяз.) | Отбор по нахождению строки в имени каталога |
  | Подробно | --depth | Булево (необяз.) | Добавляет к описанию каталога массив содержащихся в нем файлов   |
  
  Вовзращаемое значение: Массив из Соответствие - массив описаний каталогов

```bsl title="Пример кода"
			
    Имя   = "Описание";
    Ответ = OPI_GoogleDrive.ПолучитьСписокКаталогов(Токен, Имя, Ложь);  //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                         //Строка

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gdrive ПолучитьСписокКаталогов --token "%token%" --querry "Новый"

```

```json title="Результат"

[
 {
  "linkShareMetadata": {
   "securityUpdateEnabled": true,
   "securityUpdateEligible": false
  },
  "modifiedByMe": true,
  "quotaBytesUsed": "0",
  "viewedByMeTime": "2024-03-13T06:02:50.470Z",
  "createdTime": "2024-03-13T06:02:50.470Z",
  "permissionIds": [
   "07468399490707249352"
  ],
  "modifiedByMeTime": "2024-03-13T06:02:50.470Z",
  "explicitlyTrashed": false,
  "trashed": true,
  "id": "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4",
  "starred": false,
  "name": "ОписаниеДвижений",
  "permissions": [
   {
    "pendingOwner": false,
    "role": "owner",
    "emailAddress": "bayselonarrend@gmail.com",
    "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
    "kind": "drive#permission",
    "type": "user",
    "deleted": false,
    "displayName": "Антон Титовец",
    "id": "07468399490707249352"
   }
  ],
  "spaces": [
   "drive"
  ],
  "webViewLink": "https://drive.google.com/drive/folders/1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4",
  "isAppAuthorized": false,
  "owners": [
   {
    "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
    "emailAddress": "bayselonarrend@gmail.com",
    "permissionId": "07468399490707249352",
    "me": true,
    "kind": "drive#user",
    "displayName": "Антон Титовец"
   }
  ],
  "version": "2",
  "lastModifyingUser": {
   "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
   "emailAddress": "bayselonarrend@gmail.com",
   "permissionId": "07468399490707249352",
   "me": true,
   "kind": "drive#user",
   "displayName": "Антон Титовец"
  },
  "shared": false,
  "hasThumbnail": false,
  "parents": [
   "1PAFI1-rThB46uix012xmLQ01h-JARjaz"
  ],
  "ownedByMe": true,
  "mimeType": "application/vnd.google-apps.folder",
  "viewersCanCopyContent": true,
  "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/application/vnd.google-apps.folder",
  "viewedByMe": true,
  "writersCanShare": true,
  "folderColorRgb": "#8f8f8f",
  "copyRequiresWriterPermission": false,
  "capabilities": {
   "canRemoveContentRestriction": false,
   "canModifyOwnerContentRestriction": false,
   "canModifyLabels": false,
   "canAcceptOwnership": false,
   "canChangeSecurityUpdateEnabled": false,
   "canMoveItemWithinDrive": true,
   "canRemoveMyDriveParent": true,
   "canReadLabels": false,
   "canAddMyDriveParent": false,
   "canShare": true,
   "canModifyContent": true,
   "canUntrash": true,
   "canMoveItemOutOfDrive": false,
   "canMoveItemIntoTeamDrive": false,
   "canModifyContentRestriction": false,
   "canReadRevisions": false,
   "canTrash": true,
   "canRemoveChildren": true,
   "canListChildren": true,
   "canDownload": true,
   "canDelete": true,
   "canRename": true,
   "canChangeCopyRequiresWriterPermission": false,
   "canAddChildren": true,
   "canComment": true,
   "canModifyEditorContentRestriction": false,
   "canMoveChildrenWithinDrive": true,
   "canCopy": false,
   "canChangeViewersCanCopyContent": false,
   "canEdit": true
  },
  "modifiedTime": "2024-03-13T06:02:50.470Z",
  "thumbnailVersion": "0",
  "kind": "drive#file"
 }
]

```
