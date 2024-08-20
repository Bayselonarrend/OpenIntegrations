---
sidebar_position: 13
---

# Получить список версий объекта
 Получает список версий (ревизий) объекта



`Функция ПолучитьСписокВерсийОбъекта(Знач Токен, Знач Путь, Знач Количество = 10) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |
  | Количество | --amount | Строка, Число | Число последних версий объекта для отображения |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен     = "sl.B7RRdlnDML6hoVUHl6bk7CQxx0SFu8rLlSxh2VTkVQIh_m6CJKk_MYsdfWowBOji0Gn-hg1kNb...";
    Путь      = "/New/pic.png";

    Результат = OPI_Dropbox.ПолучитьСписокВерсийОбъекта(Токен, Путь, 1);
```



```sh title="Пример команды CLI"
    
  oint dropbox ПолучитьСписокВерсийОбъекта --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --amount %amount%

```

```json title="Результат"
{
 "is_deleted": false,
 "entries": [
  {
   "name": "pic.png",
   "path_lower": "/new/pic.png",
   "path_display": "/New/pic.png",
   "id": "id:kJU6-a-pT48AAAAAAAABYA",
   "client_modified": "2024-05-30T12:32:09Z",
   "server_modified": "2024-05-30T12:32:09Z",
   "rev": "619ab0e44a57cbd841553",
   "size": 2114023,
   "is_downloadable": true,
   "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
  }
 ]
}
```
