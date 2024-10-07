---
sidebar_position: 8
---

# Скопировать файл
 Копирует файл из одного расположения в другое



`Функция СкопироватьФайл(Знач URL, Знач IDФайла, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | ID файла для копирования |
  | IDКаталога | --folderid | Строка, Число | ID каталога размещения копии |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.copyto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_copyto.php)
:::
<br/>


```bsl title="Пример кода"
    IDКаталога = "10840";
    IDФайла    = "10836";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.СкопироватьФайл(URL, IDФайла, IDКаталога);

    IDКаталога = "10842";

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.СкопироватьФайл(URL, IDФайла, IDКаталога, Токен);

    OPI_ПолучениеДанныхТестов.Проверка_БитриксОбъект(Результат);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 СкопироватьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": 12364,
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12342",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8518,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T21:46:50+03:00",
  "UPDATE_TIME": "2024-10-07T21:46:50+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=623a0467006e9f06006b12e400000001000007bd6d86696f59ebb8fa58416ef6f1859c&token=disk%7CaWQ9MTIzNjQmXz1PNkUwbFlQb1RVOE9FSTBKSDhCcU4xZjB0VTl6SWJDRA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpOalFtWHoxUE5rVXdiRmxRYjFSVk9FOUZTVEJLU0RoQ2NVNHhaakIwVlRsNlNXSkRSQT09fDYyM2EwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YmQ2ZDg2Njk2ZjU5ZWJiOGZhNTg0MTZlZjZmMTg1OWMi.Q2VgPbY34Zu6M9XmPC%2F66pTlhoqQX9oY0VGJeWbAgSk%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728326810.27192,
  "finish": 1728326810.32952,
  "duration": 0.0576069355010986,
  "processing": 0.0321469306945801,
  "date_start": "2024-10-07T21:46:50+03:00",
  "date_finish": "2024-10-07T21:46:50+03:00",
  "operating_reset_at": 1728327410,
  "operating": 0
 }
}
```
