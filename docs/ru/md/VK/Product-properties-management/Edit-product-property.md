﻿---
sidebar_position: 3
---

# Изменить свойство товара
 Изменяет существующее свойство товара



`Функция ИзменитьСвойствоТовара(Знач Название, Знач Свойство, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Название | --title | Строка | Новое название |
  | Свойство | --prop | Строка,Число | ID свойства |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();

    Название  = "Цвет (изм.)";
    Свойство  = "841";

    Результат = OPI_VK.ИзменитьСвойствоТовара(Название, Свойство, Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk ИзменитьСвойствоТовара --title %title% --prop %prop% --auth %auth%

```

```json title="Результат"
{
 "response": 1
}
```
