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
  "ID": "12336",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": 12346,
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8506",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T21:46:24+03:00",
  "UPDATE_TIME": "2024-10-07T21:46:45+03:00",
  "DELETE_TIME": "2024-10-07T21:46:45+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=623a0467006e9f06006b12e400000001000007bd6d86696f59ebb8fa58416ef6f1859c&token=disk%7CaWQ9MTIzMzYmXz0yUkRIZGdBbkxqNHBVV3VGSXE2M1VteUtPcTJKTWo0Nw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpNelltWHoweVVrUklaR2RCYmt4cU5IQlZWM1ZHU1hFMk0xVnRlVXRQY1RKS1RXbzBOdz09fDYyM2EwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YmQ2ZDg2Njk2ZjU5ZWJiOGZhNTg0MTZlZjZmMTg1OWMi.SXYK3%2FGQjkk1Mbln2zxnOgl2R8%2B9%2BI7I%2FDcS6Ys1Hi8%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новый каталог/Новый подкаталог/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728326807.21432,
  "finish": 1728326807.26325,
  "duration": 0.0489239692687988,
  "processing": 0.0231170654296875,
  "date_start": "2024-10-07T21:46:47+03:00",
  "date_finish": "2024-10-07T21:46:47+03:00",
  "operating_reset_at": 1728327407,
  "operating": 0
 }
}
```
