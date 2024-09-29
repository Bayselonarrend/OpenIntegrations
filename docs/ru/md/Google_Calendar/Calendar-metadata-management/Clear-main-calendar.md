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
    Токен = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";

    Результат = OPI_GoogleCalendar.ОчиститьОсновнойКалендарь(Токен);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ОчиститьОсновнойКалендарь --token %token%

```

```json title="Результат"
null
```
