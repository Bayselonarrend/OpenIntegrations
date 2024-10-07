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
  "ID": "12216",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": 12226,
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8426",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T09:26:32+03:00",
  "UPDATE_TIME": "2024-10-07T09:26:53+03:00",
  "DELETE_TIME": "2024-10-07T09:26:53+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9&token=disk%7CaWQ9MTIyMTYmXz1XNVoxSUJDYzVaajc2RWVRc0VwcEJLbVdYa3hCc2FKVQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlNVFltWHoxWE5Wb3hTVUpEWXpWYWFqYzJSV1ZSYzBWd2NFSkxiVmRZYTNoQ2MyRktWUT09fGYwOGMwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3Mjg1OGU4MGFlOTVmYTc3Y2FkZDhlZTM0ZThiYmI3Yzki.NkPfeNBO6MDhkADFuXQp9uxJDQKNimcED7pbVgK3qCc%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новый подкаталог/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728282415.21689,
  "finish": 1728282415.27409,
  "duration": 0.0572009086608887,
  "processing": 0.0315020084381104,
  "date_start": "2024-10-07T09:26:55+03:00",
  "date_finish": "2024-10-07T09:26:55+03:00",
  "operating_reset_at": 1728283015,
  "operating": 0
 }
}
```
