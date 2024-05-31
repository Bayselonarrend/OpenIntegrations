---
sidebar_position: 3
---

# Удалить тег
 Удаляет текстовый тег файла или каталога


*Функция УдалитьТег(Знач Токен, Знач Путь, Знач Тег) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту, тег которого необходимо удалить |
  | Тег | --tag | Строка | Текст тега |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Тег       = "Важное";
    Токен     = "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c...";
    Путь      = "/New/mydoc.docx";  
    
    Результат = OPI_Dropbox.УдалитьТег(Токен, Путь, Тег);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox УдалитьТег --token "sl.B2PZ-Sk7vWqtAfWKI0CKnYNapuN4bH-a4_tTsbN02eoxT1dlQ9Vs_vcf30ZAAl9h-m3xg5uz5c..." --path %path% --tag %tag%

```


```json title="Результат"

{}

```
