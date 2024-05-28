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
	
    Токен     = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";
    Путь      = "/New/mydoc.docx"; 
    
    Результат = OPI_Dropbox.ПолучитьПревью(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьПревью --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --path %path%

```


```json title="Результат"



```
