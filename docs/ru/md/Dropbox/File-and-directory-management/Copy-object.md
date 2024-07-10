---
sidebar_position: 8
---

# Копировать объект
 Копирует файл или каталог по выбранному пути


<br/>


`Функция КопироватьОбъект(Знач Токен, Знач Откуда, Знач Куда) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Откуда | --form | Строка | Путь к объекту оригинала |
  | Куда | --to | Строка | Целевой путь для нового объекта |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
  Оригинал  = "/New/pic.png";
  Копия     = "/New/pic_copy.png";
  Токен     = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
  
  Результат = OPI_Dropbox.КопироватьОбъект(Токен, Оригинал, Копия);
```
	


```sh title="Пример команды CLI"
    
  oint dropbox КопироватьОбъект --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --form %form% --to %to%

```

```json title="Результат"
    {
 "metadata": {
  ".tag": "file",
  "name": "pic_copy.png",
  "path_lower": "/new/pic_copy.png",
  "path_display": "/New/pic_copy.png",
  "id": "id:kJU6-a-pT48AAAAAAAABYg",
  "client_modified": "2024-05-30T12:32:09Z",
  "server_modified": "2024-05-30T12:32:54Z",
  "rev": "619ab10ed491ebd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
