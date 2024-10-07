---
sidebar_position: 2
---

# Получить список файлов папки
 Получает список первых файлов каталога или продолжает получение следующих при указании курсора



`Функция ПолучитьСписокФайловПапки(Знач Токен, Знач Путь = "", Знач Подробно = Ложь, Знач Курсор = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к каталогу. Необязателен, если указан курсор |
  | Подробно | --detail | Булево | Добавляет дополнительные поля информации для медиафайлов |
  | Курсор | --cursor | Строка | Курсор из предыдущего запроса для получения следующего набора файлов |

  
  Возвращаемое значение:   HTTPОтвет - Получить список файлов папки

<br/>




```bsl title="Пример кода"
    Путь      = "/New";
    Токен     = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";

    Результат = OPI_Dropbox.ПолучитьСписокФайловПапки(Токен, Путь, Истина);
```



```sh title="Пример команды CLI"
    
  oint dropbox ПолучитьСписокФайловПапки --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --detail %detail% --cursor %cursor%

```

```json title="Результат"
{
 "entries": [
  {
   ".tag": "file",
   "name": "Dogs.mp3",
   "path_lower": "/new/dogs.mp3",
   "path_display": "/New/Dogs.mp3",
   "id": "id:kJU6-a-pT48AAAAAAAAACA",
   "client_modified": "2024-05-15T16:58:30Z",
   "server_modified": "2024-10-07T18:44:52Z",
   "rev": "623e76a904bb2bd841553",
   "size": 9229352,
   "is_downloadable": true,
   "content_hash": "376f728ef041d9cef08406f16debc12de89d83130e69c66a817fd834d2d82dc2"
  },
  {
   ".tag": "file",
   "name": "url_doc (1).docx",
   "path_lower": "/new/url_doc (1).docx",
   "path_display": "/New/url_doc (1).docx",
   "id": "id:kJU6-a-pT48AAAAAAAALvg",
   "client_modified": "2024-07-15T17:40:28Z",
   "server_modified": "2024-10-07T18:44:52Z",
   "rev": "623e76a904bb3bd841553",
   "size": 24069,
   "is_downloadable": true,
   "content_hash": "8d63c5989ceec1a90f3fde2ffaa76efcd2c050191e6b55a1761e4e352590bd8c"
  },
  {
   ".tag": "file",
   "name": "mydoc.docx",
   "path_lower": "/new/mydoc.docx",
   "path_display": "/New/mydoc.docx",
   "id": "id:kJU6-a-pT48AAAAAAAAABw",
   "client_modified": "2024-05-14T16:49:41Z",
   "server_modified": "2024-10-07T18:44:52Z",
   "rev": "623e76a904bb4bd841553",
   "size": 24069,
   "is_downloadable": true,
   "content_hash": "8d63c5989ceec1a90f3fde2ffaa76efcd2c050191e6b55a1761e4e352590bd8c"
  }
 ],
 "cursor": "AAHydw7Azwh4VpJc9RT04o0g0m5hXVnc74QCdRNca4Ntu7kVZP0GclNCr6SlU8wIBEbH46Olxz7qerW0EaDZ-i-MxgrQlNy81efcspDDisGz0yk-MyTCX6cao3zGd2XsJyKDks3iBvEI2Q45Mfl-xbXIK2GSI4qbeYueK5fgMQ4aZ_o70U_FgEBIYngc_OJKwaWszb2dHKyRtQ-6zug44HAn",
 "has_more": false
}
```
