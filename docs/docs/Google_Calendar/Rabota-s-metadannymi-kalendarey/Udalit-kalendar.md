---
sidebar_position: 4
---

# Удалить календарь
Удаляет созданный ранее календарь

*Функция УдалитьКалендарь(Знач Токен, Знач Календарь) Экспорт*

  | Параметр | CLI | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | Календарь | --calendar | Строка | ID календаря для удаления |
  
  Вовзращаемое значение: Пустая строка

```bsl title="Пример кода"
			
    Ответ = OPI_GoogleCalendar.УдалитьКалендарь(Токен, "55868c32be16935f0...");

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gcalendar УдалитьКалендарь --token "%token%" --calendar %calendar%
    
```

```json title="Результат"

""

```
