---
sidebar_position: 7
---

# Удалить объект
 Удаляет объект с облачного диска


*Функция УдалитьОбъект(Знач Токен, Знач Путь, Знач Безвозвратно = Ложь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту удаления |
  | БезВозвратно | --permanently | Строка | Удалить объект без возможности востановления |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Путь      = "/New/pic.png";  
    Токен     = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";  
    
    Результат = OPI_Dropbox.УдалитьОбъект(Токен, Путь);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox УдалитьОбъект --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --path %path% --permanently %permanently%

```


```json title="Результат"



```
