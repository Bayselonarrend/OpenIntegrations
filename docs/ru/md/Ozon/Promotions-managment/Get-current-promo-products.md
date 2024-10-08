﻿---
sidebar_position: 3
---

# Получить участвующие товары акции
 Получает товары, участвующие в выбранной акции



`Функция ПолучитьУчаствующиеТоварыАкции(Знач IDКлиента, Знач КлючAPI, Знач IDАкции, Знач Отступ = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDАкции | --actionid | Число | ID акции |
  | Отступ | --offset | Число | Отступ получения элементов списка |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/actions/products](https://docs.ozon.ru/api/seller/#operation/PromosProducts)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента     = "2128753";
    КлючAPI       = "7cc90d26-33e4-499b...";
    IDАкции       = 111111111;

    Результат = OPI_Ozon.ПолучитьУчаствующиеТоварыАкции(IDКлиента, КлючAPI, IDАкции);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьУчаствующиеТоварыАкции --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --actionid %actionid% --offset %offset%

```

```json title="Результат"
{
 "code": 5,
 "message": "Resource not found",
 "details": []
}
```
