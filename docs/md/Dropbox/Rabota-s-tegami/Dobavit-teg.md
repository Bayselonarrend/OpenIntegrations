---
sidebar_position: 2
---

# Добавить тег
 Добавляет новый текстовый тег к файлу или каталогу


*Функция ДобавитьТег(Знач Токен, Знач Путь, Знач Тег) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту, для которого необходимо создать тег |
  | Тег | --tag | Строка | Текст тега |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Тег       = "Важное";
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    Путь      = "/New/mydoc.docx";  
    
    Результат = OPI_Dropbox.ДобавитьТег(Токен, Путь, Тег);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ДобавитьТег --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --path %path% --tag %tag%

```


```json title="Результат"



```
