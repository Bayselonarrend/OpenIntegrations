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
    Токен     = "ya29.a0AcM612yhdixI9i7TxOgZIa9kwI5a42S4MfHVMdYZeolUKySbI7x1gtyAhGDlso57x7N6WNRpp9BZX0N3MQOcZEdR6lDciUHI4nof3u9xi...";
    Календарь = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Событие   = "h51qr9dclbnie1hh633er26umo";

    Результат = OPI_GoogleCalendar.УдалитьСобытие(Токен, Календарь, Событие);
```



```sh title="Пример команды CLI"
    
  oint gcalendar УдалитьСобытие --token %token% --calendar %calendar% --event %event%

```

```json title="Результат"
""
```
