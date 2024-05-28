---
sidebar_position: 11
---

# Скачать файл
 Скачивает файл по указанному пути или ID


*Функция СкачатьФайл(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь или ID файла |

  
  Вовзращаемое значение:   ДвоичныеДанные - двоичные данные файла

```bsl title="Пример кода"
	
    Токен     = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";
    Путь      = "/New/pic.png"; 
    
    Результат = OPI_Dropbox.СкачатьФайл(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox СкачатьФайл --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --path %path%

```


```json title="Результат"



```
