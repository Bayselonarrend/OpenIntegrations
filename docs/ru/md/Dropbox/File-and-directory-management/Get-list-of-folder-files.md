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
    Токен     = "sl.B6_e9uxZDzud1x7oZyvJJEiFu78rkVmLclhxrJ0KMVVZNxl9XbxwWUr5wv8IKSqnoi6KyNyRe0...";

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
   "server_modified": "2024-06-09T13:12:45Z",
   "rev": "61a74c9e3b3f3bd841553",
   "size": 9229352,
   "is_downloadable": true,
   "content_hash": "376f728ef041d9cef08406f16debc12de89d83130e69c66a817fd834d2d82dc2"
  },
  {
   ".tag": "file",
   "name": "mydoc.docx",
   "path_lower": "/new/mydoc.docx",
   "path_display": "/New/mydoc.docx",
   "id": "id:kJU6-a-pT48AAAAAAAAABw",
   "client_modified": "2024-05-14T16:49:41Z",
   "server_modified": "2024-06-09T13:12:45Z",
   "rev": "61a74c9e3b3f4bd841553",
   "size": 24069,
   "is_downloadable": true,
   "content_hash": "8d63c5989ceec1a90f3fde2ffaa76efcd2c050191e6b55a1761e4e352590bd8c"
  }
 ],
 "cursor": "AAEXfuMhG6Xl2ENYH4uAoLS_nOUV4SC7ChaMxK4ZIphj9x5INumYZrHv6jqph4fgkOy6PpFTTaaJ4BTjzVGZnTk7tB5wCCp1Eogn8gCW-Agz-ej4X6ir5p-KX63vBgDV0OZ-boy78oUXMJeOtU9sjEij34BoqBCtWYOFje4PXhEV3KwVySRWzPlXSEq9arMo1AaP8PFuDxx6JTxSGRdcQwnc",
 "has_more": false
}
```
