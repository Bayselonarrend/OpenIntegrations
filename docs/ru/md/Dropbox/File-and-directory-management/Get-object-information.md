---
sidebar_position: 1
---

# Получить информацию об объекте
 Получает информацию о файле или каталоге


*Функция ПолучитьИнформациюОбОбъекте(Знач Токен, Знач Путь, Знач Подробно = Ложь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |
  | Подробно | --detail | Булево | Добавляет дополнительные поля информации для медиафайлов |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox 

```bsl title="Пример кода"
	
  Путь      = "/New/pic.png";
  Токен     = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
  
  Результат = OPI_Dropbox.ПолучитьИнформациюОбОбъекте(Токен, Путь, Истина);
	
```

```sh title="Пример команды CLI"
    
      oint dropbox ПолучитьИнформациюОбОбъекте --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --detail %detail%


```


```json title="Результат"

{
 ".tag": "file",
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

```
