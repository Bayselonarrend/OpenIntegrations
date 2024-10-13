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
    Токен     = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Календарь = "2cd4d2b5dc7a898d4f1d65956b5ccca32841aff4a1603b373ff14db442ac9fab@group.calendar.google.com";

    Результат = OPI_GoogleCalendar.УдалитьКалендарьИзСписка(Токен, Календарь);
```



```sh title="Пример команды CLI"
    
  oint gcalendar УдалитьКалендарьИзСписка --token %token% --calendar %calendar%

```

```json title="Результат"
null
```
