---
sidebar_position: 7
---

# Удалить объект
 Удаляет объект с облачного диска


*Функция УдалитьОбъект(Знач Токен, Знач Путь, Знач Безвозвратно = Ложь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту удаления |
  | БезВозвратно | --permanently | Строка | Удалить объект без возможности востановления |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Путь      = "/New/pic.png";  
    Токен     = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";  
    
    Результат = OPI_Dropbox.УдалитьОбъект(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox УдалитьОбъект --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --path %path% --permanently %permanently%

```


```json title="Результат"

{
 "metadata": {
  ".tag": "file",
  "name": "pic.png",
  "path_lower": "/new/pic.png",
  "path_display": "/New/pic.png",
  "id": "id:kJU6-a-pT48AAAAAAAABYA",
  "client_modified": "2024-05-30T12:32:09Z",
  "server_modified": "2024-05-30T12:32:48Z",
  "rev": "619ab108e3d3dbd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}

```
