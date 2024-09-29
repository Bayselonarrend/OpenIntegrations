---
sidebar_position: 4
---

# Очистить основной календарь
 Очищает список событий основного календаря



`Функция ОчиститьОсновнойКалендарь(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";

    Результат = OPI_GoogleCalendar.ОчиститьОсновнойКалендарь(Токен);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ОчиститьОсновнойКалендарь --token %token%

```

```json title="Результат"
null
```
