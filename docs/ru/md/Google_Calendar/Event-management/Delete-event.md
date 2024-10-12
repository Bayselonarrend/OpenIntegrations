---
sidebar_position: 7
---

# Удалить событие
 Удаляет событие по ID



`Функция УдалитьСобытие(Знач Токен, Знач Календарь, Знач Событие) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | Событие | --event | Строка | ID события |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен     = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Календарь = "c3e1276b51960f0e037480209bde23a7fded89b36e9d689e0d00951403165f59@group.calendar.google.com";
    Событие   = "gacdd2rkrjnue8j1387ace13fc";

    Результат = OPI_GoogleCalendar.УдалитьСобытие(Токен, Календарь, Событие);
```



```sh title="Пример команды CLI"
    
  oint gcalendar УдалитьСобытие --token %token% --calendar %calendar% --event %event%

```

```json title="Результат"
null
```
