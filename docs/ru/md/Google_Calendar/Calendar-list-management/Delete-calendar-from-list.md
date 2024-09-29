---
sidebar_position: 4
---

# Удалить календарь из списка
 Удаляет календарь из списка пользователя



`Функция УдалитьКалендарьИзСписка(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Календарь = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.УдалитьКалендарьИзСписка(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar УдалитьКалендарьИзСписка --token %token% --calendar %calendar%

```

```json title="Результат"
null
```
