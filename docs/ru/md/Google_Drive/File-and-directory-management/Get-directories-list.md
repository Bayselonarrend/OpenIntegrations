---
sidebar_position: 2
---

# Получить список каталогов
 Получает список каталогов диска



`Функция ПолучитьСписокКаталогов(Знач Токен, Знач ИмяСодержит = "", Знач Подробно = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИмяСодержит | --querry | Строка | Отбор по имени |
  | Подробно | --depth | Булево | Добавляет список файлов к полям каталога |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - Массив соответствий каталогов

<br/>




```bsl title="Пример кода"
    Имя       = "Тестовая папка";
    Токен     = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";

    Результат = OPI_GoogleDrive.ПолучитьСписокКаталогов(Токен, Имя, Истина);
```



```sh title="Пример команды CLI"
    
  oint gdrive ПолучитьСписокКаталогов --token %token% --querry %querry% --depth %depth%

```

```json title="Результат"
[
 {
  "kind": "drive#file",
  "copyRequiresWriterPermission": false,
  "writersCanShare": true,
  "viewedByMe": true,
  "mimeType": "application/vnd.google-apps.folder",
  "parents": [
   "0AN2vrbrhqfJrUk9PVA"
  ],
  "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/application/vnd.google-apps.folder",
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
  "webViewLink": "https://drive.google.com/drive/folders/191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM",
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
  "folderColorRgb": "#8f8f8f",
  "id": "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM",
  "name": "Тестовая папка",
  "starred": false,
  "trashed": false,
  "explicitlyTrashed": false,
  "createdTime": "2024-05-30T07:31:43.495Z",
  "modifiedTime": "2024-05-30T07:31:44.676Z",
  "modifiedByMeTime": "2024-05-30T07:31:44.676Z",
  "viewedByMeTime": "2024-05-30T07:31:43.495Z",
  "quotaBytesUsed": "0",
  "version": "1",
  "ownedByMe": true,
  "isAppAuthorized": false,
  "capabilities": {
   "canChangeViewersCanCopyContent": false,
   "canEdit": true,
   "canCopy": false,
   "canComment": true,
   "canAddChildren": true,
   "canDelete": true,
   "canDownload": true,
   "canListChildren": true,
   "canRemoveChildren": true,
   "canRename": true,
   "canTrash": true,
   "canReadRevisions": false,
   "canChangeCopyRequiresWriterPermission": false,
   "canMoveItemIntoTeamDrive": true,
   "canUntrash": true,
   "canModifyContent": true,
   "canMoveItemOutOfDrive": true,
   "canAddMyDriveParent": false,
   "canRemoveMyDriveParent": true,
   "canMoveItemWithinDrive": true,
   "canShare": true,
   "canMoveChildrenWithinDrive": true,
   "canModifyContentRestriction": false,
   "canChangeSecurityUpdateEnabled": false,
   "canAcceptOwnership": false,
   "canReadLabels": false,
   "canModifyLabels": false,
   "canModifyEditorContentRestriction": false,
   "canModifyOwnerContentRestriction": false,
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
  "files": [
   {
    "kind": "drive#file",
    "fileExtension": "jpg",
    "copyRequiresWriterPermission": false,
    "md5Checksum": "5a4b7be6d3fade1faa7afc1641d8e5ac",
    "writersCanShare": true,
    "viewedByMe": false,
    "mimeType": "image/jpeg",
    "parents": [
     "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM"
    ],
    "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/image/jpeg",
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
    "headRevisionId": "0B92vrbrhqfJrbWRlRDBkU1BIaW9yUjIxRnc1cnBMQjBaNUpnPQ",
    "webViewLink": "https://drive.google.com/file/d/1Hb0ObC9XXwF_9EzMB1JsNQiyqhqUV153/view?usp=drivesdk",
    "webContentLink": "https://drive.google.com/uc?id=1Hb0ObC9XXwF_9EzMB1JsNQiyqhqUV153&export=download",
    "size": "427",
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
    "id": "1Hb0ObC9XXwF_9EzMB1JsNQiyqhqUV153",
    "name": "Новый файл.jpg",
    "description": "Это новый файл",
    "starred": false,
    "trashed": false,
    "explicitlyTrashed": false,
    "createdTime": "2024-09-28T16:28:55.665Z",
    "modifiedTime": "2024-09-28T16:28:55.665Z",
    "modifiedByMeTime": "2024-09-28T16:28:55.665Z",
    "quotaBytesUsed": "427",
    "version": "2",
    "originalFilename": "Новый файл.jpg",
    "ownedByMe": true,
    "fullFileExtension": "jpg",
    "isAppAuthorized": true,
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
    "imageMediaMetadata": {
     "width": 0,
     "height": 0
    },
    "linkShareMetadata": {
     "securityUpdateEligible": false,
     "securityUpdateEnabled": true
    },
    "sha1Checksum": "384aecd16d0557cc396720f8dacfbe6cc718214d",
    "sha256Checksum": "322bf101cecdace88b88426250e78cf620adcb8e8f7817ad272f5ce4de158838"
   },
   {
    "kind": "drive#file",
    "fileExtension": "jpg",
    "copyRequiresWriterPermission": false,
    "md5Checksum": "5a4b7be6d3fade1faa7afc1641d8e5ac",
    "writersCanShare": true,
    "viewedByMe": false,
    "mimeType": "image/jpeg",
    "parents": [
     "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM"
    ],
    "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/image/jpeg",
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
    "headRevisionId": "0B92vrbrhqfJrYlh6OVQ0WGZwMWw4VGZITDdLQjFnV2ZlVUlnPQ",
    "webViewLink": "https://drive.google.com/file/d/1jTpVQaiXJ81LoSZyyxGggExT5QtD478r/view?usp=drivesdk",
    "webContentLink": "https://drive.google.com/uc?id=1jTpVQaiXJ81LoSZyyxGggExT5QtD478r&export=download",
    "size": "427",
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
    "id": "1jTpVQaiXJ81LoSZyyxGggExT5QtD478r",
    "name": "Новый файл.jpg",
    "description": "Это новый файл",
    "starred": false,
    "trashed": false,
    "explicitlyTrashed": false,
    "createdTime": "2024-09-28T16:26:54.608Z",
    "modifiedTime": "2024-09-28T16:26:54.608Z",
    "modifiedByMeTime": "2024-09-28T16:26:54.608Z",
    "quotaBytesUsed": "427",
    "version": "2",
    "originalFilename": "Новый файл.jpg",
    "ownedByMe": true,
    "fullFileExtension": "jpg",
    "isAppAuthorized": true,
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
    "imageMediaMetadata": {
     "width": 0,
     "height": 0
    },
    "linkShareMetadata": {
     "securityUpdateEligible": false,
     "securityUpdateEnabled": true
    },
    "sha1Checksum": "384aecd16d0557cc396720f8dacfbe6cc718214d",
    "sha256Checksum": "322bf101cecdace88b88426250e78cf620adcb8e8f7817ad272f5ce4de158838"
   }
  ]
 }
]
```
