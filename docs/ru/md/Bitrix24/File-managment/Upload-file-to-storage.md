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
  "ID": 12336,
  "NAME": "Картинка1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8506,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T21:46:24+03:00",
  "UPDATE_TIME": "2024-10-07T21:46:24+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=623a0467006e9f06006b12e400000001000007bd6d86696f59ebb8fa58416ef6f1859c&token=disk%7CaWQ9MTIzMzYmXz1ZRHZvNFJtUjJhQ2NISzFIM3V0SWhnaWQzdUdYMVhhNA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpNelltWHoxWlJIWnZORkp0VWpKaFEyTklTekZJTTNWMFNXaG5hV1F6ZFVkWU1WaGhOQT09fDYyM2EwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YmQ2ZDg2Njk2ZjU5ZWJiOGZhNTg0MTZlZjZmMTg1OWMi.SKb9SNC1zd5%2F%2FsAz0umEjWusCNG8tGoJHeJFGnIS8VI%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Картинка1.jpg"
 },
 "time": {
  "start": 1728326784.59192,
  "finish": 1728326784.82749,
  "duration": 0.235572099685669,
  "processing": 0.212218046188354,
  "date_start": "2024-10-07T21:46:24+03:00",
  "date_finish": "2024-10-07T21:46:24+03:00",
  "operating_reset_at": 1728327384,
  "operating": 0.212200880050659
 }
}
```
