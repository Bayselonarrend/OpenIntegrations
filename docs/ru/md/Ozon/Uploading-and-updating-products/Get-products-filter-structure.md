﻿---
sidebar_position: 12
---

# Получить структуру фильтра товаров
 Получает структуру для отбора списка товаров в функции ПолучитьСписокТоваров



`Функция ПолучитьСтруктуруФильтраТоваров(Знач Пустая = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Пустая | --empty | Булево | Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей |

  
  Возвращаемое значение:   Структура Из КлючИЗначение - Структура полей фильра

<br/>

:::tip
Описание полей фильтра можно найти на странице документации по получению списка товаров: [post /v2/product/list](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductList)
:::
<br/>


```bsl title="Пример кода"
    Результат = OPI_Ozon.ПолучитьСтруктуруФильтраТоваров();
```



```sh title="Пример команды CLI"
    
oint ozon ПолучитьСтруктуруФильтраТоваров --empty %empty%

```

```json title="Результат"
{
 "offer_id": "<массив артинкулов>",
 "product_id": "<массив ID товаров>",
 "visibility": "<видимость>"
}
```