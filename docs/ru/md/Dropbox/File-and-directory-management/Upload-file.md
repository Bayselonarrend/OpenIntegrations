---
sidebar_position: 4
---

# Загрузить файл
 Загружает файл на облачный диск



`Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач Путь, Знач Перезаписывать = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Файл | --file | Строка, ДвоичныеДанные | Данные файл для загрузки |
  | Путь | --path | Строка | Путь сохранения на Dropbox |
  | Перезаписывать | --overwrite | Булево | Перезаписывать файл при конфликте путей |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Путь      = "/New/pic.png";
    Токен     = "sl.B-q5XQaxJtwx0uMZIwtpBtvwgWmplxOVWNQyY1gbKG31NYy3fDHqe4IuADj33al8uD1l3FYARn...";
    Картинка  = "https://api.athenaeum.digital/test_data/picture.jpg";

    КартинкаПуть = ПолучитьИмяВременногоФайла("png");
    КопироватьФайл(Картинка, КартинкаПуть);

    Результат = OPI_Dropbox.ЗагрузитьФайл(Токен, КартинкаПуть, Путь, Истина);
```



```sh title="Пример команды CLI"
    
  oint dropbox ЗагрузитьФайл --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --file %file% --path %path% --overwrite %overwrite%

```

```json title="Результат"
{
 "name": "pic.png",
 "path_lower": "/new/pic.png",
 "path_display": "/New/pic.png",
 "id": "id:kJU6-a-pT48AAAAAAAAcWQ",
 "client_modified": "2024-10-08T17:44:58Z",
 "server_modified": "2024-10-08T17:44:59Z",
 "rev": "623fab23a7559bd841553",
 "size": 2114023,
 "is_downloadable": true,
 "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
}
```
