---
sidebar_position: 10
---

# Создать папку
 Создает пустой каталог по выбранному пути


*Функция СоздатьПапку(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Целевой путь создания каталога |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен     = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    Путь      = "/Новый каталог";
    
    Результат = OPI_Dropbox.СоздатьПапку(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox СоздатьПапку --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --path %path%

```


```json title="Результат"

{
 "metadata": {
  "name": "Новый каталог",
  "path_lower": "/новый каталог",
  "path_display": "/Новый каталог",
  "id": "id:kJU6-a-pT48AAAAAAAABZA"
 }
}

```
