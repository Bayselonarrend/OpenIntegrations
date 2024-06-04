---
sidebar_position: 8
---

# Копировать объект
 Копирует файл или каталог по выбранному пути


*Функция КопироватьОбъект(Знач Токен, Знач Откуда, Знач Куда) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Откуда | --form | Строка | Путь к объекту оригинала |
  | Куда | --to | Строка | Целевой путь для нового объекта |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Оригинал  = "/New/pic.png";
    Копия     = "/New/pic_copy.png";  
    Токен     = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    
    Результат = OPI_Dropbox.КопироватьОбъект(Токен, Оригинал, Копия);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox КопироватьОбъект --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --form %form% --to %to%

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
