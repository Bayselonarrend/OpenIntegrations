---
sidebar_position: 7
---

# Восстановить файл
 Восстанавливает файл из корзины



`Функция ВосстановитьФайл(Знач URL, Знач IDФайла, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | Идентификатор файла |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.restore](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_restore.php)
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDФайла = "10836";

    Результат  = OPI_Bitrix24.ВосстановитьФайл(URL, IDФайла);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ВосстановитьФайл(URL, IDФайла, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ВосстановитьФайл --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "ID": "12276",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
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
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a9ea0367006e9f06006b12e4000000010000077cf7361dce36b4295333ecec6bf0f55c&token=disk%7CaWQ9MTIyNzYmXz1scFhHeWdGQVZZMzZacU5sUnRESHQ0cldGZDdvd0NQbg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlOelltWHoxc2NGaEhlV2RHUVZaWk16WmFjVTVzVW5SRVNIUTBjbGRHWkRkdmQwTlFiZz09fGE5ZWEwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3N2NmNzM2MWRjZTM2YjQyOTUzMzNlY2VjNmJmMGY1NWMi.8oJO7nLzlhWjU0LXx4fzNSrDM0jtPORQ39aTljQQ%2Bg4%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728306407.05158,
  "finish": 1728306407.08936,
  "duration": 0.0377771854400635,
  "processing": 0.00683712959289551,
  "date_start": "2024-10-07T16:06:47+03:00",
  "date_finish": "2024-10-07T16:06:47+03:00",
  "operating_reset_at": 1728307007,
  "operating": 0
 }
}
```
