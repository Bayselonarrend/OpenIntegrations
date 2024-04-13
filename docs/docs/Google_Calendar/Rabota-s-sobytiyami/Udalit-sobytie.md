---
sidebar_position: 7
---

# Удалить событие
Удаляет событие по ID

*Функция УдалитьСобытие(Знач Токен, Знач Календарь, Знач Событие) Экспорт*

  | Параметр | CLI | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | Календарь | --calendar | Строка | ID календаря |
  | Событие | --event | Строка | ID события |
  
  Вовзращаемое значение: Пустая строка

```bsl title="Пример кода"
			
    Ответ = OPI_GoogleCalendar.УдалитьСобытие(Токен, "55868c32be16935f0...", "j4nonfcc0m2...");  //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                                  //Строка

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gcalendar УдалитьСобытие --token %token% --calendar %calendar% --event %event%
    
```

```json title="Результат"

""

```
