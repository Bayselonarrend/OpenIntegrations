﻿---
sidebar_position: 1
---

# Создать обсуждение
 Создает новое обсуждение



`Функция СоздатьОбсуждение(Знач Наименование, Знач ТекстПервогоСообщения, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Наименование | --title | Строка | Наименование обсуждения |
  | ТекстПервогоСообщения | --text | Строка | Текст первого сообщения |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры       = ПолучитьПараметрыВК();
    Название        = "Обсуждаем: какой цвет лучше?";
    Сообщение       = "Красный, желтый, синий или какой-то другой?";

    Результат = OPI_VK.СоздатьОбсуждение(Название, Сообщение, Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk СоздатьОбсуждение --title %title% --text %text% --auth %auth%

```

```json title="Результат"
{
 "response": 52571123
}
```
