---
sidebar_position: 2
---

# Get list of directories
 Gets the list of drive directories


*Function GetDirectoriesList(Val Token, Val NameContains = "", Val Detailed = False) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | NameContains | --querry | String | Filter by name |
 | Detailed | --depth | Boolean | Adds a list of files to the directory fields |

 
 Returns: Key-Value Pair - Array of directory mappings

```bsl title="Code example"
	
 
 Name = "Description";
 Response = OPI_GoogleDrive.GetDirectoriesList(Token, Name, False); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
 
	
```

```sh title="CLI command example"
 
 oint gdrive GetDirectoriesList --token %token% --querry %querry% --depth %depth%


```


```json title="Result"

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
 "name": "MovesDescription",
 "permissions": [
 {
 "pendingOwner": false,
 "role": "owner",
 "emailAddress": "bayselonarrend@gmail.com",
 "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
 "kind": "drive#permission",
 "type": "user",
 "deleted": false,
 "displayName": "Anton Titovets",
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
 "displayName": "Anton Titovets"
 }
 ],
 "version": "2",
 "lastModifyingUser": {
 "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
 "emailAddress": "bayselonarrend@gmail.com",
 "permissionId": "07468399490707249352",
 "me": true,
 "kind": "drive#user",
 "displayName": "Anton Titovets"
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
