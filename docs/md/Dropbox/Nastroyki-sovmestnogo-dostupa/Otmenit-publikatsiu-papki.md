---
sidebar_position: 2
---

# Отменить публикацию папки
 Отменяет режим общего доступа для каталога


*Функция ОтменитьПубликациюПапки(Знач Токен, Знач IDПапки) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDПапки | --folder | Строка | ID публичного каталога (shared folder ID) |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен  = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";
    Папка  = "4999224241";
 
    Результат = OPI_Dropbox.ОтменитьПубликациюПапки(Токен, Папка);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ОтменитьПубликациюПапки --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --folder %folder%

```


```json title="Результат"

{
 ".tag": "complete"
}

```
