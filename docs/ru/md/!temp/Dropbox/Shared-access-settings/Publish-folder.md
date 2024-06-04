---
sidebar_position: 1
---

# Опубликовать папку
 Переводит каталог в режим публичного доступа


*Функция ОпубликоватьПапку(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к целевому каталогу |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен     = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    Путь      = "/New"; 
   
    Результат = OPI_Dropbox.ОпубликоватьПапку(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ОпубликоватьПапку --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --path %path%

```


```json title="Результат"

{
 ".tag": "complete",
 "access_type": {
  ".tag": "owner"
 },
 "is_inside_team_folder": false,
 "is_team_folder": false,
 "path_display": "/New",
 "path_lower": "/new",
 "name": "New",
 "policy": {
  "acl_update_policy": {
   ".tag": "editors"
  },
  "shared_link_policy": {
   ".tag": "anyone"
  },
  "viewer_info_policy": {
   ".tag": "enabled"
  }
 },
 "preview_url": "https://www.dropbox.com/scl/fo/0eu3zz5f05vymefoq6yyl/h?dl=0",
 "shared_folder_id": "5009428129",
 "time_invited": "2024-05-30T12:35:34Z",
 "access_inheritance": {
  ".tag": "inherit"
 },
 "folder_id": "id:kJU6-a-pT48AAAAAAAABXw"
}

```
