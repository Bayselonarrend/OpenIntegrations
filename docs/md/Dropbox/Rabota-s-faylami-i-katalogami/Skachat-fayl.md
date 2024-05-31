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

НЕ JSON: FF D8 FF E1 54 C1 45 78 69 66 00 00 49 49 2A 00 08 00 00 00 0B 00 0E 01 02 00 20 00 00 00 92 00 00 00 0F 01 02 00 05 00 00 00 B2 00 00 00 10 01 02 00 07 00 00 00 B8 00 00 00 12 01 03 00 01 00…

```
