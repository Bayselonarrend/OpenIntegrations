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
	
    Токен     = "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e...";
    Путь      = "/New/mydoc.docx"; 
    
    Результат = OPI_Dropbox.ПолучитьПревью(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьПревью --token "sl.B2BrYIsNrnf_h8d1VSt-ilH_LEUuySQXhbDb51qh3chXboh4PF5ZjVKK-fmicHuGMHS8iZ3_6e..." --path %path%

```


```json title="Результат"



```
