---
sidebar_position: 1
---

# Загрузить файл в хранилище
 Загружает файл в выбранное хранилище



`Функция ЗагрузитьФайлВХранилище(Знач URL, Знач Наименование, Знач Файл, Знач IDХранилища, Знач Доступы = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Наименование | --title | Строка | Наименование файла с расширением для сохранения |
  | Файл | --file | Строка, ДвоичныеДанные | Файл для загрузки |
  | IDХранилища | --storageid | Строка | Идентификатор хранилища для загрузки |
  | Доступы | --rights | Строка | Массив доступов по задачам, если необходимо |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.storage.uploadfile](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_uploadfile.php)
:::
<br/>


```bsl title="Пример кода"
    Наименование2  = "Картинка2.jpg";
    Наименование   = "Картинка1.jpg";

    Картинка2 = "https://openyellow.neocities.org/test_data/picture.jpg";  // Локальный путь, URL или Двоичные данные
    Картинка  = "https://openyellow.neocities.org/test_data/picture2.jpg"; // Локальный путь, URL или Двоичные данные

    IDПриемника = 3;

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ЗагрузитьФайлВХранилище(URL, Наименование2, Картинка2, IDПриемника);

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ЗагрузитьФайлВХранилище(URL, Наименование, Картинка, IDПриемника, , Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ЗагрузитьФайлВХранилище --url "b24-ar17wx.bitrix24.by" --title %title% --file %file% --storageid %storageid% --rights %rights% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": 12156,
  "NAME": "Картинка1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8386,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-06T17:32:53+03:00",
  "UPDATE_TIME": "2024-10-06T17:32:53+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=76ad0267006e9f06006b12e400000001000007b25673cab9bbfe352545eeb9a0d9a9fe&token=disk%7CaWQ9MTIxNTYmXz02eXJQOVNwVHFjdFAwMUE1TmIxeEFBaGI4NHE1RkdmRw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXhOVFltWHowMmVYSlFPVk53VkhGamRGQXdNVUUxVG1JeGVFRkJhR0k0TkhFMVJrZG1Sdz09fDc2YWQwMjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YjI1NjczY2FiOWJiZmUzNTI1NDVlZWI5YTBkOWE5ZmUi.mZdhRJi3ruGT7P6BJH97rIt467XEC9OLZnvPiHXD4jM%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка1.jpg"
 },
 "time": {
  "start": 1728225173.73887,
  "finish": 1728225174.01374,
  "duration": 0.274866104125977,
  "processing": 0.253226041793823,
  "date_start": "2024-10-06T17:32:53+03:00",
  "date_finish": "2024-10-06T17:32:54+03:00",
  "operating_reset_at": 1728225773,
  "operating": 0.253206014633179
 }
}
```
