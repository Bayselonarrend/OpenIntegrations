﻿---
sidebar_position: 4
---

# Удалить объект
 Удаляет объект по заданному пути



`Функция УдалитьОбъект(Знач Токен, Знач Путь, Знач ВКорзину = Истина) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к удаляемой папке или файлу |
  | ВКорзину | --can | Булево | В корзину |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Токен = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Путь  = "/90663562-d505-474e-a778-e25c2cf50b4b.png";

    Результат = OPI_YandexDisk.УдалитьОбъект(Токен, Путь, Ложь);
```



```sh title="Пример команды CLI"
    
  oint yadisk УдалитьОбъект --token "y0_AgAAAABdylaOAA..." --path "/Альпака.png" --can %can%

```

```json title="Результат"
null
```
