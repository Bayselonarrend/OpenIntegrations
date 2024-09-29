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
    Токен         = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Идентификатор = "1VzNEKCqJX81aWHzQ40wAjcBakKOi_1dr";

    Результат = OPI_GoogleDrive.УдалитьОбъект(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gdrive УдалитьОбъект --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Результат"
null
```
