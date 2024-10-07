---
sidebar_position: 5
---

# Отправить файл
 Отправляет файл диска в чат по ID



`Функция ОтправитьФайл(Знач URL, Знач IDЧата, Знач IDФайла, Знач Описание = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата |
  | IDФайла | --fileid | Строка, Число | ID файла, загруженного при помощи ЗагрузитьФайлВКаталог |
  | Описание | --description | Строка | Описание файла |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.disk.file.commit](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11485)
:::
<br/>


```bsl title="Пример кода"
    URL         = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЧата      = "872";
    Файл        = "https://openyellow.neocities.org/test_data/document.docx"; // Двоичные данные, URL или путь к файлу
    Описание    = "Очень важный файл";

    Каталог    = OPI_Bitrix24.ПолучитьКаталогФайловЧата(URL, IDЧата);
    IDКаталога = Каталог["result"]["ID"];

    ЗагруженныйФайл = OPI_Bitrix24.ЗагрузитьФайлВКаталог(URL, "Важный документ.docx", Файл, IDКаталога);
    IDФайла         = ЗагруженныйФайл["result"]["ID"];

    Результат = OPI_Bitrix24.ОтправитьФайл(URL, IDЧата, IDФайла, Описание);

    URL    = "b24-ar17wx.bitrix24.by";
    Токен  = "37d1fe66006e9f06006b12e400000001000...";
    IDЧата = "874";

    Каталог    = OPI_Bitrix24.ПолучитьКаталогФайловЧата(URL, IDЧата, Токен);
    IDКаталога = Каталог["result"]["ID"];

    ЗагруженныйФайл = OPI_Bitrix24.ЗагрузитьФайлВКаталог(URL, "Важный документ.docx", Файл, IDКаталога, Токен);
    IDФайла         = ЗагруженныйФайл["result"]["ID"];

    Результат = OPI_Bitrix24.ОтправитьФайл(URL, IDЧата, IDФайла, Описание, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ОтправитьФайл --url %url% --chat %chat% --fileid %fileid% --description %description% --token %token%

```

```json title="Результат"
{
 "result": {
  "FILES": {
   "upload12254": {
    "id": 12254,
    "chatId": 964,
    "date": {},
    "type": "file",
    "name": "Важный документ.docx",
    "extension": "docx",
    "size": 24071,
    "image": false,
    "status": "done",
    "progress": 100,
    "authorId": 1,
    "authorName": "Антон Титовец",
    "urlPreview": "",
    "urlShow": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=12254&fileName=%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
    "urlDownload": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=12254&fileName=%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
    "viewerAttrs": {
     "viewer": null,
     "viewerType": "cloud-document",
     "src": "/bitrix/services/main/ajax.php?action=disk.api.file.download&SITE_ID=s1&humanRE=1&fileId=12254&fileName=%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
     "viewerTypeClass": "BX.Messenger.Integration.Viewer.OnlyOfficeChatItem",
     "viewerSeparateItem": true,
     "viewerExtension": "im.integration.viewer",
     "objectId": "12254",
     "imChatId": 964,
     "title": "Важный документ.docx",
     "actions": "[{\"type\":\"download\"},{\"type\":\"copyToMe\",\"text\":\"Сохранить на Битрикс24 Диск\",\"action\":\"BXIM.disk.saveToDiskAction\",\"params\":{\"fileId\":\"12254\"},\"extension\":\"disk.viewer.actions\",\"buttonIconClass\":\"ui-btn-icon-cloud\"}]"
    }
   }
  },
  "DISK_ID": [
   "12254"
  ],
  "FILE_MODELS": {
   "upload12254": {
    "id": 12254,
    "name": "Важный документ.docx",
    "createTime": {},
    "updateTime": {},
    "deleteTime": null,
    "code": null,
    "xmlId": null,
    "storageId": 6,
    "realObjectId": 12254,
    "parentId": 12250,
    "deletedType": 0,
    "createdBy": "1",
    "updatedBy": "1",
    "deletedBy": "0",
    "typeFile": 4,
    "globalContentVersion": 2,
    "fileId": 8448,
    "size": 24071,
    "etag": "34abb08120baef93e631dc926fbce252",
    "links": {
     "download": "/bitrix/services/main/ajax.php?action=disk.file.download&SITE_ID=s1&fileId=12254",
     "showInGrid": "/bitrix/tools/disk/focus.php?objectId=12254&action=showObjectInGrid&ncc=1"
    }
   }
  },
  "MESSAGE_ID": 17334
 },
 "time": {
  "start": 1728282505.84519,
  "finish": 1728282505.96066,
  "duration": 0.115471124649048,
  "processing": 0.0821809768676758,
  "date_start": "2024-10-07T09:28:25+03:00",
  "date_finish": "2024-10-07T09:28:25+03:00",
  "operating_reset_at": 1728283105,
  "operating": 0
 }
}
```
