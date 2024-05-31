---
sidebar_position: 13
---

# Получить список версий объекта
 Получает список версий (ревизий) объекта


*Функция ПолучитьСписокВерсийОбъекта(Знач Токен, Знач Путь, Знач Количество = 10) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |
  | Количество | --amount | Строка, Число | Число последних версий объекта для отображения |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен     = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    Путь      = "/New/pic.png"; 
    
    Результат = OPI_Dropbox.ПолучитьСписокВерсийОбъекта(Токен, Путь, 1);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьСписокВерсийОбъекта --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --path %path% --amount %amount%

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
