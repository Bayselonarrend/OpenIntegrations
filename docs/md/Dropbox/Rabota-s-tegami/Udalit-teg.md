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
    Токен     = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";
    Путь      = "/New/mydoc.docx";  
    
    Результат = OPI_Dropbox.УдалитьТег(Токен, Путь, Тег);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox УдалитьТег --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --path %path% --tag %tag%

```


```json title="Результат"



```
