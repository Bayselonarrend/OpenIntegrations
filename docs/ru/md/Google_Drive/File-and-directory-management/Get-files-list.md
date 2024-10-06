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
  "md5Checksum": "5001d8fdee164f5b6cf4bf3b6ae3e135",
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
  "headRevisionId": "0B92vrbrhqfJraDNoaENneXVCNmxZdncxV09jaVRpYU55RVV3PQ",
  "webViewLink": "https://drive.google.com/file/d/1NKMmj4SJh3WUw74nhLuMofW7dfpUR520/view?usp=drivesdk",
  "webContentLink": "https://drive.google.com/uc?id=1NKMmj4SJh3WUw74nhLuMofW7dfpUR520&export=download",
  "size": "10577",
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
  "modifiedTime": "2024-10-05T13:43:41.346Z",
  "modifiedByMeTime": "2024-10-05T13:43:41.346Z",
  "viewedByMeTime": "2024-10-05T13:43:41.346Z",
  "quotaBytesUsed": "10577",
  "version": "5782",
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
  "sha1Checksum": "f54fcef182fd8c7965b7daa1961455008bf7628a",
  "sha256Checksum": "50df10e06a49247be6216a06ff2244cd6c8c22ae7ba8307fc8c80ccb63acd20e"
 }
]
```
