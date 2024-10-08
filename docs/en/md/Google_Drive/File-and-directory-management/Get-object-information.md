﻿---
sidebar_position: 1
---

# Get object information
 Gets information about a folder or file by ID



`Function GetObjectInformation(Val Token, Val Identifier) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | Identifier of the file or folder |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Identifier = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";

    Result = OPI_GoogleDrive.GetObjectInformation(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive GetObjectInformation --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Result"
{
 "kind": "drive#file",
 "id": "1Q3vl7hcmdeJvd86jC84pdGKW5772apUy",
 "name": "TestFolder",
 "mimeType": "application/vnd.google-apps.folder",
 "description": "",
 "starred": false,
 "trashed": false,
 "explicitlyTrashed": false,
 "parents": [
  "0AN2vrbrhqfJrUk9PVA"
 ],
 "spaces": [
  "drive"
 ],
 "version": "1",
 "webViewLink": "https://drive.google.com/drive/folders/1Q3vl7hcmdeJvd86jC84pdGKW5772apUy",
 "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/application/vnd.google-apps.folder",
 "hasThumbnail": false,
 "thumbnailVersion": "0",
 "viewedByMe": false,
 "createdTime": "2024-06-03T07:24:06.147Z",
 "modifiedTime": "2024-06-03T07:24:06.147Z",
 "modifiedByMeTime": "2024-06-03T07:24:06.147Z",
 "modifiedByMe": true,
 "owners": [
  {
   "kind": "drive#user",
   "displayName": "Антон Титовец",
   "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s64",
   "me": true,
   "permissionId": "07468399490707249352",
   "emailAddress": "bayselonarrend@gmail.com"
  }
 ],
 "lastModifyingUser": {
  "kind": "drive#user",
  "displayName": "Антон Титовец",
  "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s64",
  "me": true,
  "permissionId": "07468399490707249352",
  "emailAddress": "bayselonarrend@gmail.com"
 },
 "shared": false,
 "ownedByMe": true,
 "capabilities": {
  "canAcceptOwnership": false,
  "canAddChildren": true,
  "canAddMyDriveParent": false,
  "canChangeCopyRequiresWriterPermission": false,
  "canChangeSecurityUpdateEnabled": false,
  "canChangeViewersCanCopyContent": false,
  "canComment": true,
  "canCopy": false,
  "canDelete": true,
  "canDownload": true,
  "canEdit": true,
  "canListChildren": true,
  "canModifyContent": true,
  "canModifyContentRestriction": false,
  "canModifyEditorContentRestriction": false,
  "canModifyOwnerContentRestriction": false,
  "canModifyLabels": false,
  "canMoveChildrenWithinDrive": true,
  "canMoveItemIntoTeamDrive": true,
  "canMoveItemOutOfDrive": true,
  "canMoveItemWithinDrive": true,
  "canReadLabels": false,
  "canReadRevisions": false,
  "canRemoveChildren": true,
  "canRemoveContentRestriction": false,
  "canRemoveMyDriveParent": true,
  "canRename": true,
  "canShare": true,
  "canTrash": true,
  "canUntrash": true
 },
 "viewersCanCopyContent": true,
 "copyRequiresWriterPermission": false,
 "writersCanShare": true,
 "permissions": [
  {
   "kind": "drive#permission",
   "id": "07468399490707249352",
   "type": "user",
   "emailAddress": "bayselonarrend@gmail.com",
   "role": "owner",
   "displayName": "Антон Титовец",
   "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s64",
   "deleted": false,
   "pendingOwner": false
  }
 ],
 "permissionIds": [
  "07468399490707249352"
 ],
 "folderColorRgb": "#8f8f8f",
 "quotaBytesUsed": "0",
 "isAppAuthorized": true,
 "linkShareMetadata": {
  "securityUpdateEligible": false,
  "securityUpdateEnabled": true
 }
}
```
