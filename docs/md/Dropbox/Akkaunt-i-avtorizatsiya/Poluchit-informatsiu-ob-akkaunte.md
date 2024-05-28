---
sidebar_position: 4
---

# Получить информацию об аккаунте
 Получает информацию об аккаунте


*Функция ПолучитьИнформациюОбАккаунте(Знач Токен, Знач Аккаунт = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Аккаунт | --account | Строка | ID аккаунта. Текущий аккаунт токена, если не заполнено |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Токен = "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT...";
    
    Результат = OPI_Dropbox.ПолучитьИнформациюОбАккаунте(Токен);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ПолучитьИнформациюОбАккаунте --token "sl.B17cqxbDyPFFIOUOnGtEqpFGF9gIqUvxX70TTaWmpA1BudA7xI0IR4UK3WuJkeHL7f229VtvwT..." --account %account%

```


```json title="Результат"



```
