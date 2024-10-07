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
   "ID": "12224",
   "NAME": "Новый подкаталог 2",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12224",
   "PARENT_ID": "12222",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-07T09:26:54+03:00",
   "UPDATE_TIME": "2024-10-07T09:26:55+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог/Новый подкаталог 2"
  },
  {
   "ID": "12226",
   "NAME": "Новый подкаталог",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12226",
   "PARENT_ID": "12222",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-07T09:26:55+03:00",
   "UPDATE_TIME": "2024-10-07T09:26:55+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог/Новый подкаталог"
  },
  {
   "ID": "12244",
   "NAME": "Новое имя файла.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "12222",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8438",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-07T09:26:59+03:00",
   "UPDATE_TIME": "2024-10-07T09:26:59+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9&token=disk%7CaWQ9MTIyNDQmXz1Kd1ZpRzNxWXNQdmdtOFJRR0ROSThQQ1I3aDVZTE0xWQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlORFFtWHoxS2QxWnBSek54V1hOUWRtZHRPRkpSUjBST1NUaFFRMUkzYURWWlRFMHhXUT09fGYwOGMwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3Mjg1OGU4MGFlOTVmYTc3Y2FkZDhlZTM0ZThiYmI3Yzki.VzPJ17ev80UaKo0%2FEig2xnZ4cUJjNlA%2Fgtf%2B0LL3x10%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новое имя файла.jpg"
  }
 ],
 "total": 3,
 "time": {
  "start": 1728282419.77703,
  "finish": 1728282419.81126,
  "duration": 0.034235954284668,
  "processing": 0.00765705108642578,
  "date_start": "2024-10-07T09:26:59+03:00",
  "date_finish": "2024-10-07T09:26:59+03:00",
  "operating_reset_at": 1728283019,
  "operating": 0
 }
}
```
