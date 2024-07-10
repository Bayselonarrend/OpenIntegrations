---
sidebar_position: 3
---

# Get list of files
 Gets the list of files


<br/>


`Function GetFilesList(Val Token, Val NameContains = "", Val Directory = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | NameContains | --querry | String | Filter by name |
 | Directory | --catalog | String | Filter by parent directory ID |

 
 Returns: Map Of KeyAndValue - Array of file mappings

<br/>




```bsl title="Code example"
Directory = "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4";
 Response = OPI_GoogleDrive.GetFilesList(Token,, Directory); //Map
 Response = OPI_Tools.JSONString(Response); //String
```
	


```sh title="CLI command example"
 
 oint gdrive GetFilesList --token %token% --querry %querry% --catalog "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4"

```

```json title="Result"
[
 {
 "sha256Checksum": "1a03612de72929ef42a272cb17123871bf9b7723c89f9659765a49f744b6162b",
 "linkShareMetadata": {
 "securityUpdateEnabled": true,
 "securityUpdateEligible": false
 },
 "imageMediaMetadata": {
 "exposureBias": 0,
 "focalLength": 5.2,
 "exposureTime": 0.00125,
 "cameraMake": "SONY",
 "isoSpeed": 100,
 "time": "2012:08:03 08:21:50",
 "width": 3264,
 "cameraModel": "DSC-H7",
 "whiteBalance": "Auto",
 "colorSpace": "sRGB",
 "aperture": 5.6,
 "exposureMode": "Auto",
 "rotation": 0,
 "height": 2448,
 "meteringMode": "Pattern",
 "maxApertureValue": 2.875,
 "flashUsed": true
 },
 "modifiedByMe": true,
 "thumbnailVersion": "1",
 "fullFileExtension": "jpg",
 "quotaBytesUsed": "2114025",
 "viewedByMeTime": "2024-03-17T08:09:01.753Z",
 "permissionIds": [
 "07468399490707249352"
 ],
 "modifiedByMeTime": "2024-03-17T08:05:59.327Z",
 "explicitlyTrashed": false,
 "trashed": false,
 "description": "This is a new file",
 "createdTime": "2024-03-17T08:05:59.327Z",
 "id": "1_3QPKWfAhAT0pl0QA1QSC6mRKZndwUrD",
 "starred": false,
 "spaces": [
 "drive"
 ],
 "name": "New file.jpg",
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
 "webContentLink": "https://drive.google.com/uc?id=1_3QPKWfAhAT0pl0QA1QSC6mRKZndwUrD&export=download",
 "isAppAuthorized": true,
 "webViewLink": "https://drive.google.com/file/d/1_3QPKWfAhAT0pl0QA1QSC6mRKZndwUrD/view?usp=drivesdk",
 "version": "4",
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
 "lastModifyingUser": {
 "photoLink": "https://lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s64",
 "emailAddress": "bayselonarrend@gmail.com",
 "permissionId": "07468399490707249352",
 "me": true,
 "kind": "drive#user",
 "displayName": "Anton Titovets"
 },
 "hasThumbnail": true,
 "shared": false,
 "ownedByMe": true,
 "parents": [
 "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4"
 ],
 "sha1Checksum": "ebdbaf8ed7fe21f6562fde438a2bb12ba49750f2",
 "viewedByMe": true,
 "headRevisionId": "0B92vrbrhqfJrN1VxL1Nib01LOVV1V3ArN3pGRytVMUNKQWs4PQ",
 "writersCanShare": true,
 "thumbnailLink": "https://lh3.googleusercontent.com/drive-storage/AJQWtBNcYDmfZOJX84IFS9WFTZXNjlIFg8qaIfYni7xr0ILGZ2rGr_-R2ixRuP9zBMHCp6bpROqLp3WtddBL1p1mwc7Zv8je0Ru2dVbDTKLryg=s220",
 "modifiedTime": "2024-03-17T08:05:59.327Z",
 "capabilities": {
 "canRemoveContentRestriction": false,
 "canModifyOwnerContentRestriction": true,
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
 "canMoveItemOutOfDrive": true,
 "canMoveItemIntoTeamDrive": true,
 "canModifyContentRestriction": true,
 "canReadRevisions": true,
 "canTrash": true,
 "canRemoveChildren": false,
 "canListChildren": false,
 "canDownload": true,
 "canDelete": true,
 "canRename": true,
 "canChangeCopyRequiresWriterPermission": true,
 "canAddChildren": false,
 "canComment": true,
 "canModifyEditorContentRestriction": true,
 "canMoveChildrenWithinDrive": false,
 "canCopy": true,
 "canChangeViewersCanCopyContent": true,
 "canEdit": true
 },
 "md5Checksum": "85b6518b95b58536480354d9d5fc3d8b",
 "copyRequiresWriterPermission": false,
 "fileExtension": "jpg",
 "originalFilename": "New file.jpg",
 "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/image/jpeg",
 "viewersCanCopyContent": true,
 "mimeType": "image/jpeg",
 "kind": "drive#file",
 "size": "2114025"
 }
 ]
```
