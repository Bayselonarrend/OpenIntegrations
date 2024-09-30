---
sidebar_position: 3
---

# Получить список файлов
 Получает список файлов



`Функция ПолучитьСписокФайлов(Знач Токен, Знач ИмяСодержит = "", Знач Каталог = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИмяСодержит | --querry | Строка | Отбор по имени |
  | Каталог | --catalog | Строка | Отбор по ID каталога родителя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - Массив соответствий файлов

<br/>




```bsl title="Пример кода"
    Токен       = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Каталог     = "root";
    ИмяСодержит = "data";

    Результат   = OPI_GoogleDrive.ПолучитьСписокФайлов(Токен, ИмяСодержит, Каталог);
```



```sh title="Пример команды CLI"
    
  oint gdrive ПолучитьСписокФайлов --token %token% --querry %querry% --catalog "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4"

```

```json title="Результат"
[
 {
  "kind": "drive#file",
  "fileExtension": "json",
  "copyRequiresWriterPermission": false,
  "md5Checksum": "dea2818d0dca271ee922375ffd8ec683",
  "writersCanShare": true,
  "viewedByMe": true,
  "mimeType": "application/json",
  "parents": [
   "0AN2vrbrhqfJrUk9PVA"
  ],
  "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/application/json",
  "shared": false,
  "lastModifyingUser": {
   "displayName": "Антон Титовец",
   "kind": "drive#user",
   "me": true,
   "permissionId": "07468399490707249352",
   "emailAddress": "bayselonarrend@gmail.com",
   "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s64"
  },
  "owners": [
   {
    "displayName": "Антон Титовец",
    "kind": "drive#user",
    "me": true,
    "permissionId": "07468399490707249352",
    "emailAddress": "bayselonarrend@gmail.com",
    "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s64"
   }
  ],
  "headRevisionId": "0B92vrbrhqfJrUkxWam1TdyttV0VRZU1XT3ptazg0VGRodS9RPQ",
  "webViewLink": "https://drive.google.com/file/d/1NKMmj4SJh3WUw74nhLuMofW7dfpUR520/view?usp=drivesdk",
  "webContentLink": "https://drive.google.com/uc?id=1NKMmj4SJh3WUw74nhLuMofW7dfpUR520&export=download",
  "size": "10661",
  "viewersCanCopyContent": true,
  "permissions": [
   {
    "id": "07468399490707249352",
    "displayName": "Антон Титовец",
    "type": "user",
    "kind": "drive#permission",
    "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s64",
    "emailAddress": "bayselonarrend@gmail.com",
    "role": "owner",
    "deleted": false,
    "pendingOwner": false
   }
  ],
  "hasThumbnail": false,
  "spaces": [
   "drive"
  ],
  "id": "1NKMmj4SJh3WUw74nhLuMofW7dfpUR520",
  "name": "data.json",
  "starred": false,
  "trashed": false,
  "explicitlyTrashed": false,
  "createdTime": "2024-02-29T19:22:49.616Z",
  "modifiedTime": "2024-09-29T16:25:16.537Z",
  "modifiedByMeTime": "2024-09-29T16:25:16.537Z",
  "viewedByMeTime": "2024-09-29T16:25:16.537Z",
  "quotaBytesUsed": "10661",
  "version": "5716",
  "originalFilename": "data.json",
  "ownedByMe": true,
  "fullFileExtension": "json",
  "isAppAuthorized": false,
  "capabilities": {
   "canChangeViewersCanCopyContent": true,
   "canEdit": true,
   "canCopy": true,
   "canComment": true,
   "canAddChildren": false,
   "canDelete": true,
   "canDownload": true,
   "canListChildren": false,
   "canRemoveChildren": false,
   "canRename": true,
   "canTrash": true,
   "canReadRevisions": true,
   "canChangeCopyRequiresWriterPermission": true,
   "canMoveItemIntoTeamDrive": true,
   "canUntrash": true,
   "canModifyContent": true,
   "canMoveItemOutOfDrive": true,
   "canAddMyDriveParent": false,
   "canRemoveMyDriveParent": true,
   "canMoveItemWithinDrive": true,
   "canShare": true,
   "canMoveChildrenWithinDrive": false,
   "canModifyContentRestriction": true,
   "canChangeSecurityUpdateEnabled": false,
   "canAcceptOwnership": false,
   "canReadLabels": false,
   "canModifyLabels": false,
   "canModifyEditorContentRestriction": true,
   "canModifyOwnerContentRestriction": true,
   "canRemoveContentRestriction": false
  },
  "thumbnailVersion": "0",
  "modifiedByMe": true,
  "permissionIds": [
   "07468399490707249352"
  ],
  "linkShareMetadata": {
   "securityUpdateEligible": false,
   "securityUpdateEnabled": true
  },
  "sha1Checksum": "ad082a298fcc8873a00d49a0508c656f9ef00e4f",
  "sha256Checksum": "bda11bb0892e65004e2b8725464a0e8764576b7c5e5d88ece42cfea6d1ffc742"
 }
]
```
