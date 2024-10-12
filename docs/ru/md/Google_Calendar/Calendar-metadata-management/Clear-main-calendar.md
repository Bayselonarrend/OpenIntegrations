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
    Токен = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";

    Результат = OPI_GoogleCalendar.ОчиститьОсновнойКалендарь(Токен);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ОчиститьОсновнойКалендарь --token %token%

```

```json title="Результат"
null
```
