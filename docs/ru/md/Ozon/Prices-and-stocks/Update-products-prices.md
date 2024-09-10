---
sidebar_position: 5
---

# Обновить цены товаров
 Изменяет цены однного или нескольких товаров



`Функция ОбновитьЦеныТоваров(Знач IDКлиента, Знач КлючAPI, Знач Цены) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | Цены | --prices | Массив из Структура | Цены товаров. См. ПолучитьСтруктуруЦеныТовара |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/product/import/prices](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsPrices)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента     = "2128753";
    КлючAPI       = "7cc90d26-33e4-499b...";
    IDТовара      = "1111588191";

    Цены = Новый Структура;
    Цены.Вставить("auto_action_enabled"   , "DISABLED");
    Цены.Вставить("currency_code"         , "RUB");
    Цены.Вставить("min_price"             , "1300");
    Цены.Вставить("offer_id"              , "143210610");
    Цены.Вставить("old_price"             , "1400");
    Цены.Вставить("price"                 , "1300");
    Цены.Вставить("price_strategy_enabled", "DISABLED");
    Цены.Вставить("product_id"            , IDТовара);

    Результат = OPI_Ozon.ОбновитьЦеныТоваров(IDКлиента, КлючAPI, Цены);
```



```sh title="Пример команды CLI"
    
  oint ozon ОбновитьЦеныТоваров --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --prices %prices%

```

```json title="Результат"
{
 "code": 3,
 "message": "proto: (line 11:18): invalid value for int64 type: \"\"",
 "details": []
}
```
