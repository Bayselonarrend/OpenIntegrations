---
sidebar_position: 5
---

# Удалить календарь
 Удаляет календарь по ID



`Функция УдалитьКалендарь(Знач Токен, Знач Календарь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Календарь = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.УдалитьКалендарь(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar УдалитьКалендарь --token %token% --calendar %calendar%

```

```json title="Результат"
""
```
