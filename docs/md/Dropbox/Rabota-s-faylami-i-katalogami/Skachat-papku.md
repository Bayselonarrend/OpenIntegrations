---
sidebar_position: 12
---

# Скачать папку
 Скачивает zip архив с содержимым указанного каталога


*Функция СкачатьПапку(Знач Токен, Знач Путь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь или ID каталога |

  
  Вовзращаемое значение:   ДвоичныеДанные - двоичные данные zip архива с содержимым каталога

```bsl title="Пример кода"
	
    Токен     = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";
    Путь      = "/New";
    
    Результат = OPI_Dropbox.СкачатьПапку(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox СкачатьПапку --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --path %path%

```


```json title="Результат"



```
