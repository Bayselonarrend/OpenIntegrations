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
    Токен     = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Календарь = "47826632f9a0502adba79d3cbf90c5d4040622779e07bb8ed56964a2e4f8492a@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.УдалитьКалендарь(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar УдалитьКалендарь --token %token% --calendar %calendar%

```

```json title="Результат"
null
```
