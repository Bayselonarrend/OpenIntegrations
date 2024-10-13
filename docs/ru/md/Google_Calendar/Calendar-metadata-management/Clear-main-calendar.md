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
    Токен = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";

    Результат = OPI_GoogleCalendar.ОчиститьОсновнойКалендарь(Токен);
```



```sh title="Пример команды CLI"
    
  oint gcalendar ОчиститьОсновнойКалендарь --token %token%

```

```json title="Результат"
null
```
