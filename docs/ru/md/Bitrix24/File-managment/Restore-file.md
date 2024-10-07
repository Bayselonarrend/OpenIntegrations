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
  "ID": "12336",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
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
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=623a0467006e9f06006b12e400000001000007bd6d86696f59ebb8fa58416ef6f1859c&token=disk%7CaWQ9MTIzMzYmXz1UaGMxWFBibHFnRjI4U2lQeldRY2MweHhockJtVGdkdQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpNelltWHoxVWFHTXhXRkJpYkhGblJqSTRVMmxRZWxkUlkyTXdlSGhvY2tKdFZHZGtkUT09fDYyM2EwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YmQ2ZDg2Njk2ZjU5ZWJiOGZhNTg0MTZlZjZmMTg1OWMi.sb1ZlsVNI4XD1IfYqJAMCulb8veXHhNfaBuBieq14zA%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728326805.81006,
  "finish": 1728326805.84074,
  "duration": 0.0306811332702637,
  "processing": 0.00524210929870606,
  "date_start": "2024-10-07T21:46:45+03:00",
  "date_finish": "2024-10-07T21:46:45+03:00",
  "operating_reset_at": 1728327405,
  "operating": 0
 }
}
```
