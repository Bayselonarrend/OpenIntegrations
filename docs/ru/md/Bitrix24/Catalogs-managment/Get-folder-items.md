---
sidebar_position: 7
---

# Получить дочерние элементы каталога
 Получает дочерние элементы каталога



`Функция ПолучитьДочерниеЭлементыКаталога(Знач URL, Знач IDКаталога, Знач Фильтр = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDКаталога | --folderid | Строка, Число | Идентификатор каталога |
  | Фильтр | --filter | Структура из КлючИЗначение | Отбор элементов (См. ПолучитьСтруктуруФильтраКаталога) |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.folder.getchildren](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_getchildren.php)
:::
<br/>


```bsl title="Пример кода"
    URL           = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDКаталога    = "10842";

    Результат  = OPI_Bitrix24.ПолучитьДочерниеЭлементыКаталога(URL, IDКаталога);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьДочерниеЭлементыКаталога(URL, IDКаталога, , Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьДочерниеЭлементыКаталога --url "b24-ar17wx.bitrix24.by" --folderid "2490" --filter %filter% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": [
  {
   "ID": "12164",
   "NAME": "Новый подкаталог 2",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12164",
   "PARENT_ID": "12162",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-06T17:33:15+03:00",
   "UPDATE_TIME": "2024-10-06T17:33:16+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог/Новый подкаталог 2"
  },
  {
   "ID": "12166",
   "NAME": "Новый подкаталог",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12166",
   "PARENT_ID": "12162",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-06T17:33:16+03:00",
   "UPDATE_TIME": "2024-10-06T17:33:16+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог/Новый подкаталог"
  },
  {
   "ID": "12184",
   "NAME": "Новое имя файла.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "12162",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8398",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-06T17:33:19+03:00",
   "UPDATE_TIME": "2024-10-06T17:33:19+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=76ad0267006e9f06006b12e400000001000007b25673cab9bbfe352545eeb9a0d9a9fe&token=disk%7CaWQ9MTIxODQmXz1mRmtDWDJyenMzR241Q1RBUXltR1RzVFRVTUdnZW1LUw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXhPRFFtWHoxbVJtdERXREp5ZW5NelIyNDFRMVJCVVhsdFIxUnpWRlJWVFVkblpXMUxVdz09fDc2YWQwMjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YjI1NjczY2FiOWJiZmUzNTI1NDVlZWI5YTBkOWE5ZmUi.cK0%2FrbwfdT5bvrmq0ttQIxFqBSi5V3k2jDz1K623I68%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новое имя файла.jpg"
  }
 ],
 "total": 3,
 "time": {
  "start": 1728225199.71525,
  "finish": 1728225199.74621,
  "duration": 0.0309669971466064,
  "processing": 0.00773096084594726,
  "date_start": "2024-10-06T17:33:19+03:00",
  "date_finish": "2024-10-06T17:33:19+03:00",
  "operating_reset_at": 1728225799,
  "operating": 0
 }
}
```
