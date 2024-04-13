---
sidebar_position: 5
---

# Удалить календарь из списка
Удаляет календарь из списка календарей пользователя

*Функция УдалитьКалендарьИзСписка(Знач Токен, Знач Календарь) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен доступа |
  | Календарь | --calendar | Строка | ID календаря для получения |
  
  Вовзращаемое значение: Пустая строка

```bsl title="Пример кода"
			
    Ответ = OPI_GoogleCalendar.УдалитьКалендарьИзСписка(Токен, "55868c32be16935f0..."); //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                                         //Строка

```

```sh title="Пример команд CLI"

    oint google ОбновитьТокен --id %clientid% --secret %clientsecret% --refresh %refreshtoken% > token.json
    oint tools РазложитьJSON --json token.json --name access_token > token.tmp
    set /p token=<token.tmp
    oint gcalendar УдалитьКалендарьИзСписка --token %token% --calendar %calendar%
    
```

```json title="Результат"

""

```
