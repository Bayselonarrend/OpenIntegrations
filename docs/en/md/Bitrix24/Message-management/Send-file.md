---
sidebar_position: 5
---

# SendFile
 Send disk file to chat



`Function SendFile(Val URL, Val ChatID, Val FileID, Val Description = "", Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | ChatID | --chat | String, Number | Chat ID |
 | FileID | --fileid | String, Number | File ID from UploadFileToFolder method |
 | Description | --description | String | File description |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.disk.file.commit](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11485)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 ChatID = "264";
 File = "https://openintegrations.dev/test_data/document.docx"; // Binary Data, URL or path to file
 Description = "Very important file";
 
 Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);
 FolderID = Directory["result"]["ID"];
 
 UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID);
 FileID = UploadedFile["result"]["ID"];
 
 Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 ChatID = "266";
 
 Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);
 FolderID = Directory["result"]["ID"];
 
 UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID, Token);
 FileID = UploadedFile["result"]["ID"];
 
 Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 SendFile --url %url% --chat %chat% --fileid %fileid% --description %description% --token %token%

```

```json title="Result"
{
 "result": {
 "FILES": {
 "upload3254": {
 "id": 3254,
 "chatId": 254,
 "date": {},
 "type": "file",
 "name": "Imortant doc.docx",
 "extension": "docx",
 "size": 24071,
 "image": false,
 "status": "done",
 "progress": 100,
 "authorId": 1,
 "authorName": "Anton Titovets",
 "urlPreview": "",
 "urlShow": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=3254&fileName=%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
 "urlDownload": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=3254&fileName=%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
 "viewerAttrs": {
 "viewer": null,
 "viewerType": "cloud-document",
 "src": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=3254&fileName=%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
 "viewerTypeClass": "BX.Messenger.Integration.Viewer.OnlyOfficeChatItem",
 "viewerSeparateItem": true,
 "viewerExtension": "im.integration.viewer",
 "objectId": "3254",
 "imChatId": 254,
 "title": "Imortant doc.docx",
 "actions": "[{\"type\":\"download\"},{\"type\":\"copyToMe\",\"text\":\"Save to Bitrix24 Drive\",\"action\":\"BXIM.disk.saveToDiskAction\",\"params\":{\"fileId\":\"3254\"},\"extension\":\"disk.viewer.actions\",\"buttonIconClass\":\"ui-btn-icon-cloud\"}]"
 }
 }
 },
 "DISK_ID": [
 "3254"
 ],
 "FILE_MODELS": {
 "upload3254": {
 "id": 3254,
 "name": "Imortant doc.docx",
 "createTime": {},
 "updateTime": {},
 "deleteTime": null,
 "code": null,
 "xmlId": null,
 "storageId": 6,
 "realObjectId": 3254,
 "parentId": 3250,
 "deletedType": 0,
 "createdBy": "1",
 "updatedBy": "1",
 "deletedBy": "0",
 "typeFile": 4,
 "globalContentVersion": 2,
 "fileId": 2330,
 "size": 24071,
 "etag": "1179305ea90d0b0fef106e1163deaeb8",
 "links": {
 "download": "/bitrix/services/main/ajax.php?action=disk.file.download&SITE_ID=s1&fileId=3254",
 "showInGrid": "/bitrix/tools/disk/focus.php?objectId=3254&action=showObjectInGrid&ncc=1"
 }
 }
 },
 "MESSAGE_ID": 5346
 },
 "time": {
 "start": 1720969175.0006,
 "finish": 1720969175.09084,
 "duration": 0.0902431011199951,
 "processing": 0.0652461051940918,
 "date_start": "2024-07-14T14:59:35+00:00",
 "date_finish": "2024-07-14T14:59:35+00:00",
 "operating_reset_at": 1720969775,
 "operating": 0
 }
}
```
