---
sidebar_position: 2
---

# Get list of directories
 Gets the list of drive directories



`Function GetDirectoriesList(Val Token, Val NameContains = "", Val Detailed = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | NameContains | --querry | String | Filter by name |
  | Detailed | --depth | Boolean | Adds a list of files to the directory fields |

  
  Returns:  Map Of KeyAndValue - Array of directory mappings

<br/>




```bsl title="Code example"
    Name  = "TestFolder";
    Token = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";

    Result = OPI_GoogleDrive.GetDirectoriesList(Token, Name, True);
```



```sh title="CLI command example"
    
  oint gdrive GetDirectoriesList --token %token% --querry %querry% --depth %depth%

```

```json title="Result"
[
 {
  "kind": "drive#file",
  "copyRequiresWriterPermission": false,
  "writersCanShare": true,
  "viewedByMe": false,
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
  "webViewLink": "https://drive.google.com/drive/folders/1Q3vl7hcmdeJvd86jC84pdGKW5772apUy",
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
  "id": "1Q3vl7hcmdeJvd86jC84pdGKW5772apUy",
  "name": "TestFolder",
  "description": "",
  "starred": false,
  "trashed": false,
  "explicitlyTrashed": false,
  "createdTime": "2024-06-03T07:24:06.147Z",
  "modifiedTime": "2024-06-03T07:24:06.147Z",
  "modifiedByMeTime": "2024-06-03T07:24:06.147Z",
  "quotaBytesUsed": "0",
  "version": "1",
  "ownedByMe": true,
  "isAppAuthorized": true,
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
    "md5Checksum": "85b6518b95b58536480354d9d5fc3d8b",
    "writersCanShare": true,
    "viewedByMe": false,
    "mimeType": "image/jpeg",
    "parents": [
     "1Q3vl7hcmdeJvd86jC84pdGKW5772apUy"
    ],
    "thumbnailLink": "https://lh3.googleusercontent.com/drive-storage/AJQWtBNesV02Ef9il8e7d7IOwKBZQJ138iNbeitSUe-fBrN0Cf30SdMtf0MXQknZ4HqcHMMcOOmkgilGQGRFaPntk3TpKuOxQwE39AHUSzszCHdj6eg=s220",
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
    "headRevisionId": "0B92vrbrhqfJrRTVPUUhub2t5dytHRm93enlyY2hYakozV1dFPQ",
    "webViewLink": "https://drive.google.com/file/d/1-vL_2o3B_v0-fYVKRgok5PmF3goKOsW3/view?usp=drivesdk",
    "webContentLink": "https://drive.google.com/uc?id=1-vL_2o3B_v0-fYVKRgok5PmF3goKOsW3&export=download",
    "size": "2114025",
    "viewersCanCopyContent": true,
    "permissions": [
     {
      "id": "07468399490707249352",
      "displayName": "Антон Титовец",
      "type": "user",
      "kind": "drive#permission",
      "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s64",
      "emailAddress": "bayselonarrend@gmail.com",
...
```
