---
sidebar_position: 10
---

# Переименовать файл
 Изменяет имя существующего файла



`Функция ПереименоватьФайл(Знач URL, Знач IDФайла, Знач Наименование, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | Идентификатор файла |
  | Наименование | --title | Строка | Новое наименование каталога |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.rename](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_rename.php)
:::
<br/>


```bsl title="Пример кода"
    Наименование  = "Новое имя файла.jpg";
    Наименование2 = "Новое имя файла 2.jpg";

    IDФайла2  = "10834";
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПереименоватьФайл(URL, IDФайла2, Наименование2);

    IDФайла  = "10836";
    URL      = "b24-ar17wx.bitrix24.by";
    Токен    = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПереименоватьФайл(URL, IDФайла, Наименование, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПереименоватьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --title %title% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "12216",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8426",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T09:26:32+03:00",
  "UPDATE_TIME": "2024-10-07T09:26:32+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9&token=disk%7CaWQ9MTIyMTYmXz13c1FwdjNreWRlRkQ3dmZmUFc3MFBhN1VHUmxVUjlZQg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlNVFltWHoxM2MxRndkak5yZVdSbFJrUTNkbVptVUZjM01GQmhOMVZIVW14VlVqbFpRZz09fGYwOGMwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3Mjg1OGU4MGFlOTVmYTc3Y2FkZDhlZTM0ZThiYmI3Yzki.axaYix%2B6RvM3%2FhIwJ5027nxdEIgjfBmivxxRvQBLJX4%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728282413.41993,
  "finish": 1728282413.46393,
  "duration": 0.0439929962158203,
  "processing": 0.0168240070343018,
  "date_start": "2024-10-07T09:26:53+03:00",
  "date_finish": "2024-10-07T09:26:53+03:00",
  "operating_reset_at": 1728283013,
  "operating": 0
 }
}
```
