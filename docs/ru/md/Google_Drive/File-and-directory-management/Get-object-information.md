---
sidebar_position: 1
---

# Получить информацию об объекте
 Получает информацию о папке или файле по ID


<br/>


`Функция ПолучитьИнформациюОбОбъекте(Знач Токен, Знач Идентификатор) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор файла или каталога |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google





```bsl title="Пример кода"
  
  Идентификатор = "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa";
  
  Ответ = OPI_GoogleDrive.ПолучитьИнформациюОбОбъекте(Токен, Идентификатор);  //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                 //Строка
  
```
	


```sh title="Пример команды CLI"
    
  oint gdrive ПолучитьИнформациюОбОбъекте --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Результат"
  {
  "linkShareMetadata": {
  "securityUpdateEnabled": true,
  "securityUpdateEligible": false
  },
  "quotaBytesUsed": "0",
  "folderColorRgb": "#8f8f8f",
  "writersCanShare": true,
  "lastModifyingUser": {
  "emailAddress": "bayselonarrend@gmail.com",
  "permissionId": "07468399490707249352",
  "me": true,
  "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
  "displayName": "Антон Титовец",
  "kind": "drive#user"
  },
  "modifiedByMe": true,
  "capabilities": {
  "canUntrash": true,
  "canTrash": true,
  "canRemoveMyDriveParent": true,
  "canRemoveContentRestriction": false,
  "canRemoveChildren": true,
  "canMoveItemWithinDrive": true,
  "canMoveItemOutOfDrive": true,
  "canMoveItemIntoTeamDrive": true,
  "canModifyLabels": false,
  "canModifyOwnerContentRestriction": false,
  "canReadRevisions": false,
  "canModifyContentRestriction": false,
  "canShare": true,
  "canModifyContent": true,
  "canDownload": true,
  "canMoveChildrenWithinDrive": true,
  "canCopy": false,
  "canModifyEditorContentRestriction": false,
  "canChangeSecurityUpdateEnabled": false,
  "canRename": true,
  "canChangeCopyRequiresWriterPermission": false,
  "canDelete": true,
  "canChangeViewersCanCopyContent": false,
  "canEdit": true,
  "canReadLabels": false,
  "canAddMyDriveParent": false,
  "canComment": true,
  "canAddChildren": true,
  "canListChildren": true,
  "canAcceptOwnership": false
  },
  "copyRequiresWriterPermission": false,
  "modifiedTime": "2023-12-28T13:22:03.333Z",
  "createdTime": "2023-12-28T13:22:00.683Z",
  "viewedByMeTime": "2023-12-28T13:22:00.683Z",
  "viewedByMe": true,
  "shared": false,
  "hasThumbnail": false,
  "version": "3",
  "owners": [
  {
  "emailAddress": "bayselonarrend@gmail.com",
  "permissionId": "07468399490707249352",
  "me": true,
  "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
  "displayName": "Антон Титовец",
  "kind": "drive#user"
  }
  ],
  "isAppAuthorized": false,
  "webViewLink": "https://drive.google.com/drive/folders/1dg_MhZrLoPSPYT0p3y-8dvGWoapbwiDm",
  "spaces": [
  "drive"
  ],
  "modifiedByMeTime": "2023-12-28T13:22:03.333Z",
  "permissionIds": [
  "07468399490707249352"
  ],
  "explicitlyTrashed": false,
  "parents": [
  "1603PU_Hrkvj4HeFJKYSVxZJDRoGvd3SJ"
  ],
  "ownedByMe": true,
  "trashed": false,
  "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/application/vnd.google-apps.folder",
  "viewersCanCopyContent": true,
  "mimeType": "application/vnd.google-apps.folder",
  "permissions": [
  {
  "pendingOwner": false,
  "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
  "role": "owner",
  "emailAddress": "bayselonarrend@gmail.com",
  "type": "user",
  "deleted": false,
  "displayName": "Антон Титовец",
  "id": "07468399490707249352",
  "kind": "drive#permission"
  }
  ],
  "name": "ОПИ",
  "starred": false,
  "id": "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa",
  "kind": "drive#file",
  "thumbnailVersion": "0"
  }
```
