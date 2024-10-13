---
sidebar_position: 9
---

# Удалить объект
 Удаляет файл или каталог по ID



`Функция УдалитьОбъект(Знач Токен, Знач Идентификатор) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор объекта для удаления |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Идентификатор = "14hysfOxsStktI4JZEXRiSZ9Rl69wNJwX";

    Результат = OPI_GoogleDrive.УдалитьОбъект(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gdrive УдалитьОбъект --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Результат"
null
```
