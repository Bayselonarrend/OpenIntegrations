---
sidebar_position: 5
---

# Send file
 Send disk file to chat



`Function SendFile(Val URL, Val ChatID, Val FileID, Val Description = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | FileID | --fileid | String, Number | File ID from UploadFileToFolder method |
  | Description | --description | String | File description |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.disk.file.commit](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11485)
:::
<br/>


```bsl title="Code example"
    URL         = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID      = "872";
    File        = "https://openyellow.neocities.org/test_data/document.docx"; // Binary Data, URL or path to file
    Description = "Very important file";

    Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);
    FolderID  = Directory["result"]["ID"];

    UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID);
    FileID       = UploadedFile["result"]["ID"];

    Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    ChatID = "874";

    Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);
    FolderID  = Directory["result"]["ID"];

    UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID, Token);
    FileID       = UploadedFile["result"]["ID"];

    Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 SendFile --url "b24-ar17wx.bitrix24.by" --chat "452" --fileid "UploadedFile[result][ID]" --description "Very important file" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "FILES": {
   "upload12434": {
    "id": 12434,
    "chatId": 976,
    "date": {},
    "type": "file",
    "name": "Imortant doc.docx",
    "extension": "docx",
    "size": 24071,
    "image": false,
    "status": "done",
    "progress": 100,
    "authorId": 1,
    "authorName": "Антон Титовец",
    "urlPreview": "",
    "urlShow": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=12434&fileName=Imortant%20doc.docx",
    "urlDownload": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=12434&fileName=Imortant%20doc.docx",
    "viewerAttrs": {
     "viewer": null,
     "viewerType": "cloud-document",
     "src": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=12434&fileName=Imortant%20doc.docx",
     "viewerTypeClass": "BX.Messenger.Integration.Viewer.OnlyOfficeChatItem",
     "viewerSeparateItem": true,
     "viewerExtension": "im.integration.viewer",
     "objectId": "12434",
     "imChatId": 976,
     "title": "Imortant doc.docx",
     "actions": "[{\"type\":\"download\"},{\"type\":\"copyToMe\",\"text\":\"Сохранить на Битрикс24 Диск\",\"action\":\"BXIM.disk.saveToDiskAction\",\"params\":{\"fileId\":\"12434\"},\"extension\":\"disk.viewer.actions\",\"buttonIconClass\":\"ui-btn-icon-cloud\"}]"
    }
   }
  },
  "DISK_ID": [
   "12434"
  ],
  "FILE_MODELS": {
   "upload12434": {
    "id": 12434,
    "name": "Imortant doc.docx",
    "createTime": {},
    "updateTime": {},
    "deleteTime": null,
    "code": null,
    "xmlId": null,
    "storageId": 6,
    "realObjectId": 12434,
    "parentId": 12430,
    "deletedType": 0,
    "createdBy": "1",
    "updatedBy": "1",
    "deletedBy": "0",
    "typeFile": 4,
    "globalContentVersion": 2,
    "fileId": 8568,
    "size": 24071,
    "etag": "c7f097d1c64f770a85549f1f1069831a",
    "links": {
     "download": "/bitrix/services/main/ajax.php?action=disk.file.download&SITE_ID=s1&fileId=12434",
     "showInGrid": "/bitrix/tools/disk/focus.php?objectId=12434&action=showObjectInGrid&ncc=1"
    }
   }
  },
  "MESSAGE_ID": 17542
 },
 "time": {
  "start": 1728329224.66298,
  "finish": 1728329224.75002,
  "duration": 0.0870449542999268,
  "processing": 0.0619649887084961,
  "date_start": "2024-10-07T22:27:04+03:00",
  "date_finish": "2024-10-07T22:27:04+03:00",
  "operating_reset_at": 1728329824,
  "operating": 0
 }
}
```
