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
    Токен         = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Идентификатор = "1A0oqifjQs0coHvFLF4BFr7hCmOJxETDe";

    Результат = OPI_GoogleDrive.УдалитьОбъект(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gdrive УдалитьОбъект --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Результат"
''
```
