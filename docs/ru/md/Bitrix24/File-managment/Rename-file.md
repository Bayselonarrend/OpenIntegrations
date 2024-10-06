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
  "ID": "12156",
  "NAME": "Новое имя файла.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8386",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-06T17:32:53+03:00",
  "UPDATE_TIME": "2024-10-06T17:32:53+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=76ad0267006e9f06006b12e400000001000007b25673cab9bbfe352545eeb9a0d9a9fe&token=disk%7CaWQ9MTIxNTYmXz1xOVBXdm1pYm1vZFpxWDJCODF6TExQVzZpZGlLbWNNeQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXhOVFltWHoxeE9WQlhkbTFwWW0xdlpGcHhXREpDT0RGNlRFeFFWelpwWkdsTGJXTk5lUT09fDc2YWQwMjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3YjI1NjczY2FiOWJiZmUzNTI1NDVlZWI5YTBkOWE5ZmUi.Am7SlSmd52rSrGYFNKtBYcbhcR5%2FZpmHY9R%2B5yzPxZk%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Новое имя файла.jpg"
 },
 "time": {
  "start": 1728225194.63957,
  "finish": 1728225194.6803,
  "duration": 0.0407340526580811,
  "processing": 0.0150909423828125,
  "date_start": "2024-10-06T17:33:14+03:00",
  "date_finish": "2024-10-06T17:33:14+03:00",
  "operating_reset_at": 1728225794,
  "operating": 0
 }
}
```
