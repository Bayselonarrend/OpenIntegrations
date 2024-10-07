---
sidebar_position: 9
---

# Переместить файл
 Перемещает файл из одного расположения в другое



`Функция ПереместитьФайлВКаталог(Знач URL, Знач IDФайла, Знач IDКаталога, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | ID файла для перемещения |
  | IDКаталога | --folderid | Строка, Число | ID каталога нового размещения |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.moveto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_moveto.php)
:::
<br/>


```bsl title="Пример кода"
    IDКаталога = "10844";
    IDФайла    = "10836";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПереместитьФайлВКаталог(URL, IDФайла, IDКаталога);

    IDКаталога = "10846";

    URL   = "b24-ar17wx.bitrix24.by";
    Токен = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПереместитьФайлВКаталог(URL, IDФайла, IDКаталога, Токен);

    OPI_ПолучениеДанныхТестов.Проверка_БитриксОбъект(Результат);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПереместитьФайлВКаталог --url "b24-ar17wx.bitrix24.by" --fileid "2484" --folderid "2494" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "12276",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": 12286,
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8466",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T16:06:25+03:00",
  "UPDATE_TIME": "2024-10-07T16:06:46+03:00",
  "DELETE_TIME": "2024-10-07T16:06:46+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a9ea0367006e9f06006b12e4000000010000077cf7361dce36b4295333ecec6bf0f55c&token=disk%7CaWQ9MTIyNzYmXz1kOG9TTzdwRUE0UjI4b2hQMjd2Q1ZlYk8wWnF6VGFBWQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlOelltWHoxa09HOVRUemR3UlVFMFVqSTRiMmhRTWpkMlExWmxZazh3V25GNlZHRkJXUT09fGE5ZWEwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3N2NmNzM2MWRjZTM2YjQyOTUzMzNlY2VjNmJmMGY1NWMi.seq%2Fj42LV2DA%2Fbol25V0tXK%2BZNIkjBweJUIeS7ngvyw%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новый подкаталог/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728306408.29144,
  "finish": 1728306408.34775,
  "duration": 0.0563020706176758,
  "processing": 0.0252890586853027,
  "date_start": "2024-10-07T16:06:48+03:00",
  "date_finish": "2024-10-07T16:06:48+03:00",
  "operating_reset_at": 1728307008,
  "operating": 0
 }
}
```
