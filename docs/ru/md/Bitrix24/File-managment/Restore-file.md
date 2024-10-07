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
  "UPDATE_TIME": "2024-10-07T09:26:53+03:00",
  "DELETE_TIME": "2024-10-07T09:26:53+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9&token=disk%7CaWQ9MTIyMTYmXz10ZUwwenF5ZHZzOHpUMFNtdzRFR1lqdlhGSndXUHdMcg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXlNVFltWHoxMFpVd3dlbkY1Wkhaek9IcFVNRk50ZHpSRlIxbHFkbGhHU25kWFVIZE1jZz09fGYwOGMwMzY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3Mjg1OGU4MGFlOTVmYTc3Y2FkZDhlZTM0ZThiYmI3Yzki.ATcBOePCw8tdnG35N1UVI18K0AuU5w1rn1ETrJzCYFg%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728282413.85535,
  "finish": 1728282413.89081,
  "duration": 0.0354599952697754,
  "processing": 0.00769805908203125,
  "date_start": "2024-10-07T09:26:53+03:00",
  "date_finish": "2024-10-07T09:26:53+03:00",
  "operating_reset_at": 1728283013,
  "operating": 0
 }
}
```
