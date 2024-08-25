﻿---
sidebar_position: 13
---

# Добавить видео товара
 Добавляет видео к атрибутам товара



`Функция ДобавитьВидеоТовара(СтруктураТовара, Знач URL, Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | СтруктураТовара | --item | Структура Из Строка | Основная структура полей товара. См. ПолучитьСтруктуруТовара |
  | URL | --url | Строка | URL к видео для добавления |
  | Наименование | --title | Строка | Техническое наименование видео |

  
  Возвращаемое значение:   Структура Из КлючИЗначение - Структура полей товара с добавленным видео

<br/>

:::tip
В 1С метод может использоваться как процедура, без получения возвращаемого значения. Возвращаемое значение необходимо для CLI версии
:::
<br/>


```bsl title="Пример кода"
    Видео     = "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/";

    СтруктураТовара = Новый Структура;
    СтруктураТовара.Вставить("description_category_id", 17028922);
    СтруктураТовара.Вставить("name"                   , "Комплект защитных плёнок для X3 NFC. Темный хлопок");
    СтруктураТовара.Вставить("offer_id"               , "143210608");
    СтруктураТовара.Вставить("barcode"                , "112772873170");
    СтруктураТовара.Вставить("price"                  , "1000");
    СтруктураТовара.Вставить("old_price"              , "1100");
    СтруктураТовара.Вставить("vat"                    , "0.1");
    СтруктураТовара.Вставить("height"                 , 250);
    СтруктураТовара.Вставить("width"                  , 150);
    СтруктураТовара.Вставить("depth"                  , 10);
    СтруктураТовара.Вставить("dimension_unit"         , "mm");
    СтруктураТовара.Вставить("weight"                 , 100);
    СтруктураТовара.Вставить("weight_unit"            , "g");

    // Видео

    OPI_Ozon.ДобавитьВидеоТовара(СтруктураТовара, Видео, "viedo1");
```



```sh title="Пример команды CLI"
    
  oint ozon ДобавитьВидеоТовара --item %item% --url %url% --title %title%

```

```json title="Результат"
{
 "description_category_id": 17028922,
 "name": "Комплект защитных плёнок для X3 NFC. Темный хлопок",
 "offer_id": "143210608",
 "barcode": "112772873170",
 "price": "1000",
 "old_price": "1100",
 "vat": "0.1",
 "height": 250,
 "width": 150,
 "depth": 10,
 "dimension_unit": "mm",
 "weight": 100,
 "weight_unit": "g",
 "complex_attributes": [
  {
   "attributes": [
    {
     "id": 21841,
     "complex_id": 100001,
     "values": [
      {
       "value": "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/"
      }
     ]
    },
    {
     "id": 21837,
     "complex_id": 100001,
     "values": [
      {
       "value": "viedo1"
      }
     ]
    }
   ]
  }
 ]
}
```