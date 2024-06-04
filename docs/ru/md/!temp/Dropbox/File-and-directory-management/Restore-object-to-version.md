---
sidebar_position: 14
---

# Восстановить объект к версии
 Восстанавливает состояние объекта к необходимой версии (ревизии)


*Функция ВосстановитьОбъектКВерсии(Знач Токен, Знач Путь, Знач Версия) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |
  | Версия | --rev | Строка | ID версии (ревизии) для востановления |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Версия    = "016196bc6e08dda00000001295a2bc1";
    Токен     = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    Путь      = "/New/pic.png";  
    
    Результат = OPI_Dropbox.ВосстановитьОбъектКВерсии(Токен, Путь, Версия);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ВосстановитьОбъектКВерсии --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --path %path% --rev "016196bc6e08dda00000001295a2bc1"

```


```json title="Результат"

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

```
