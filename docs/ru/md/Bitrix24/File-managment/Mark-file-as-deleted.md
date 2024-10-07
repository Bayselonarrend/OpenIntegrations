---
sidebar_position: 6
---

# Поместить файл в корзину
 Перемещает файл в корзину удаляемых файлов



`Функция ПоместитьФайлВКорзину(Знач URL, Знач IDФайла, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDФайла | --fileid | Строка, Число | Идентификатор файла |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [disk.file.markdeleted](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_markdeleted.php)
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDФайла = "10836";

    Результат  = OPI_Bitrix24.ПоместитьФайлВКорзину(URL, IDФайла);

    URL         = "b24-ar17wx.bitrix24.by";
    Токен       = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПоместитьФайлВКорзину(URL, IDФайла, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПоместитьФайлВКорзину --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

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
  "DELETED_TYPE": "3",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8506",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T21:46:24+03:00",
  "UPDATE_TIME": "2024-10-07T21:46:24+03:00",
  "DELETE_TIME": "2024-10-07T21:46:45+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=623a0467006e9f06006b12e400000001000007bd6d86696f59ebb8fa58416ef6f1859c&token=disk%7CaWQ9MTIzMzYmXz1UNWdRWXcxZUdhalZ6VEM4eWxlbXZiVWlUMHB3Nk12Tg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpNelltWHoxVU5XZFJXWGN4WlVkaGFsWjZWRU00ZVd4bGJYWmlWV2xVTUhCM05rMTJUZz09fDYyM2EwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YmQ2ZDg2Njk2ZjU5ZWJiOGZhNTg0MTZlZjZmMTg1OWMi.HlrKayyh%2BJutQ5iq1JYY7i%2FIIhvqAsJw0vj6qOP3D9M%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpgi17283268055535i"
 },
 "time": {
  "start": 1728326805.6192,
  "finish": 1728326805.64929,
  "duration": 0.0300948619842529,
  "processing": 0.00502109527587891,
  "date_start": "2024-10-07T21:46:45+03:00",
  "date_finish": "2024-10-07T21:46:45+03:00",
  "operating_reset_at": 1728327405,
  "operating": 0
 }
}
```
