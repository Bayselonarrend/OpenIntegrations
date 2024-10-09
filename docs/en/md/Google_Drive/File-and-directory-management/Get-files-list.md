---
sidebar_position: 3
---

# Get list of files
 Gets the list of files



`Function GetFilesList(Val Token, Val NameContains = "", Val Directory = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | NameContains | --querry | String | Filter by name |
  | Directory | --catalog | String | Filter by parent directory ID |

  
  Returns:  Map Of KeyAndValue - Array of file mappings

<br/>




```bsl title="Code example"
    Token        = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Directory    = "root";
    NameContains = "data";

    Result = OPI_GoogleDrive.GetFilesList(Token, NameContains, Directory);
```



```sh title="CLI command example"
    
  oint gdrive GetFilesList --token %token% --querry %querry% --catalog "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4"

```

```json title="Result"
[
 {
  "kind": "drive#file",
  "fileExtension": "json",
  "copyRequiresWriterPermission": false,
  "md5Checksum": "cf83e956f3cddf775f02ff1955954efd",
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
  "headRevisionId": "0B92vrbrhqfJrYWlNZXZQbXhaZm84c2xqVzdIYzM4N2luVkV3PQ",
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
  "modifiedTime": "2024-10-08T17:03:36.717Z",
  "modifiedByMeTime": "2024-10-08T17:03:36.717Z",
  "viewedByMeTime": "2024-10-08T17:03:36.717Z",
  "quotaBytesUsed": "10577",
  "version": "5878",
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
  "sha1Checksum": "f2d5069322045898ea4932524eb2450b0ef1fdd5",
  "sha256Checksum": "2353109234e9285120e08407374b196bf640ef55adfb6923da467a52d9b28084"
 }
]
```
