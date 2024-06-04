---
sidebar_position: 3
---

# Получить превью
 Получает PDF или HTML превью объекта (только для токументов)


*Функция ПолучитьПревью(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |

  
  Вовзращаемое значение:   ДвоичныеДанные - превью документа 

```bsl title="Пример кода"
	
    Токен     = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    Путь      = "/New/mydoc.docx"; 
    
    Результат = OPI_Dropbox.ПолучитьПревью(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьПревью --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --path %path%

```


```json title="Результат"

НЕ JSON: 25 50 44 46 2D 31 2E 35 0D 0A 25 B5 B5 B5 B5 0D 0A 31 20 30 20 6F 62 6A 0D 0A 3C 3C 2F 54 79 70 65 2F 43 61 74 61 6C 6F 67 2F 50 61 67 65 73 20 32 20 30 20 52 2F 4C 61 6E 67 28 65 6E 2D 55 53…

```
