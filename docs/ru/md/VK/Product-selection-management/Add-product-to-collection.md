﻿---
sidebar_position: 5
---

# Добавить товар в подборку
 Добавляет товар в подборку



`Функция ДобавитьТоварВПодборку(Знач МассивТоваров, Знач Подборка, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | МассивТоваров | --items | Массив из Строка, Число | Массив товаров или товар |
  | Подборка | --sel | Строка | ID подборки |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();

    Товар     = "9671013";
    Подборка  = "125";

    Результат = OPI_VK.ДобавитьТоварВПодборку(Товар, Подборка, Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk ДобавитьТоварВПодборку --items %items% --sel %sel% --auth %auth%

```

```json title="Результат"
{
 "response": 1
}
```
