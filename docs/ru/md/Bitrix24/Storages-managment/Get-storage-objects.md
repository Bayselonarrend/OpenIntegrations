---
sidebar_position: 5
---

# Получить содержимое хранилища
 Получает список файлов и каталогов, находящихся в корне хранилища



`Функция ПолучитьСодержимоеХранилища(Знач URL, Знач IDХранилища, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDХранилища | --storageid | Строка, Число | Идентификатор хранилища |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.storage.getchildren](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getchildren.php)
:::
<br/>


```bsl title="Пример кода"
    URL         = "https://b24-ar17wx.bitrix24.by/rest/1/f2pp...";
    IDХранилища = 3;

    Результат   = OPI_Bitrix24.ПолучитьСодержимоеХранилища(URL, IDХранилища);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "fe3fa966006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСодержимоеХранилища(URL, IDХранилища, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСодержимоеХранилища --url "b24-ar17wx.bitrix24.by" --storageid %storageid% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": [
  {
   "ID": "568",
   "NAME": "Картинка2.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "558",
   "SIZE": "2114023",
   "CREATE_TIME": "2024-06-22T09:07:30+00:00",
   "UPDATE_TIME": "2024-06-22T09:07:30+00:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=efa17666006e9f06006b12e400000001000007b2f26f9898812ad669fd7da83d478d1a&token=disk%7CaWQ9NTY4Jl89NnBxNndlcmpudjQwY0tHNnZhdVN2VHZ2TTYwSmFFSXA%3D%7CImRvd25sb2FkfGRpc2t8YVdROU5UWTRKbDg5Tm5CeE5uZGxjbXB1ZGpRd1kwdEhOblpoZFZOMlZIWjJUVFl3U21GRlNYQT18ZWZhMTc2NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDdiMmYyNmY5ODk4ODEyYWQ2NjlmZDdkYTgzZDQ3OGQxYSI%3D.qSfz7Ap6RM8nwlRRrw4lqlYcNQoHQJMcdzSbvlLHw60%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка2.jpg"
  },
  {
   "ID": "570",
   "NAME": "Картинка1.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "560",
   "SIZE": "805189",
   "CREATE_TIME": "2024-06-22T09:07:32+00:00",
   "UPDATE_TIME": "2024-06-22T09:07:32+00:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=efa17666006e9f06006b12e400000001000007b2f26f9898812ad669fd7da83d478d1a&token=disk%7CaWQ9NTcwJl89SmpkOWlyMGpwS1N1TEI1aWxIWWxtU0JtTllsT1BoNVI%3D%7CImRvd25sb2FkfGRpc2t8YVdROU5UY3dKbDg5U21wa09XbHlNR3B3UzFOMVRFSTFhV3hJV1d4dFUwSnRUbGxzVDFCb05WST18ZWZhMTc2NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDdiMmYyNmY5ODk4ODEyYWQ2NjlmZDdkYTgzZDQ3OGQxYSI%3D.X8XQ3FtYG30XrOGGxoO1p%2FXistiComyxQei37Xh%2B%2FIM%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка1.jpg"
  }
 ],
 "total": 2,
 "time": {
  "start": 1719047253.42516,
  "finish": 1719047253.47205,
  "duration": 0.0468947887420654,
  "processing": 0.016359806060791,
  "date_start": "2024-06-22T09:07:33+00:00",
  "date_finish": "2024-06-22T09:07:33+00:00",
  "operating_reset_at": 1719047853,
  "operating": 0
 }
}
```
