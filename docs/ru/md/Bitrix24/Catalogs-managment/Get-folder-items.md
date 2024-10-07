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
   "ID": "12344",
   "NAME": "Новый подкаталог 2",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12344",
   "PARENT_ID": "12342",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-07T21:46:46+03:00",
   "UPDATE_TIME": "2024-10-07T21:46:47+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог/Новый подкаталог 2"
  },
  {
   "ID": "12346",
   "NAME": "Новый подкаталог",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12346",
   "PARENT_ID": "12342",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-07T21:46:47+03:00",
   "UPDATE_TIME": "2024-10-07T21:46:47+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/Новый каталог/Новый подкаталог"
  },
  {
   "ID": "12364",
   "NAME": "Новое имя файла.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "12342",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8518",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-07T21:46:50+03:00",
   "UPDATE_TIME": "2024-10-07T21:46:50+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=623a0467006e9f06006b12e400000001000007bd6d86696f59ebb8fa58416ef6f1859c&token=disk%7CaWQ9MTIzNjQmXz1DYlpwMUI1S25KbWc4NDRYYm44anRkb1B3VGV4QkxVNA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpOalFtWHoxRFlscHdNVUkxUzI1S2JXYzRORFJZWW00NGFuUmtiMUIzVkdWNFFreFZOQT09fDYyM2EwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YmQ2ZDg2Njk2ZjU5ZWJiOGZhNTg0MTZlZjZmMTg1OWMi.3MiJFqrTgb1bmtbDEe4tmi6amjgXvqgBMNzeoV3qaUA%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новое имя файла.jpg"
  }
 ],
 "total": 3,
 "time": {
  "start": 1728326810.82461,
  "finish": 1728326810.85935,
  "duration": 0.0347340106964111,
  "processing": 0.00718998908996582,
  "date_start": "2024-10-07T21:46:50+03:00",
  "date_finish": "2024-10-07T21:46:50+03:00",
  "operating_reset_at": 1728327410,
  "operating": 0
 }
}
```
