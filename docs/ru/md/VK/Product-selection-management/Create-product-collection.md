﻿---
sidebar_position: 3
---

# Создать подборку товаров
 Создает пустую подборку товаров



`Функция СоздатьПодборкуТоваров(Знач Название, Знач Картинка, Знач Основная = Ложь, Знач Скрытая = Ложь, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Название | --title | Строка | Название подборки |
  | Картинка | --picture | Строка,ДвоичныеДанные | Файл картинки |
  | Основная | --main | Булево | Основная |
  | Скрытая | --hidden | Булево | Скрытая |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();

    Название = "Тестовая подборка";
    Картинка = "https://openyellow.neocities.org/test_data/picture.jpg";
    Основная = Истина;
    Скрытая  = Ложь;

    Результат = OPI_VK.СоздатьПодборкуТоваров(Название
        , Картинка
        , Основная
        , Скрытая
        , Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk СоздатьПодборкуТоваров --title %title% --picture %picture% --main %main% --hidden %hidden% --auth %auth%

```

```json title="Результат"
{
 "response": {
  "market_album_id": 125,
  "albums_count": 66
 }
}
```
