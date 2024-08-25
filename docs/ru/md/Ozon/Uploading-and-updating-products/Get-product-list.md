---
sidebar_position: 1
---

# Получить список товаров
 Получает список товаров с фильтром или без



`Функция ПолучитьСписокТоваров(Знач IDКлиента, Знач КлючAPI, Знач Фильтр = "", Знач IDПоследнего = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | Фильтр | --filter | Структура Из КлючИЗначение | Фильтр выборки товаров. См. ПолучитьСтруктуруФильтраТоваров |
  | IDПоследнего | --last | Строка, Число | ID последнего значения (last_id) из предыдущего запроса |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v2/product/list](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductList)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента  = "2128753";
    КлючAPI    = "7cc90d26-33e4-499b...";

    МассивID = Новый Массив;
    МассивID.Добавить("143210608");

    Фильтр = Новый Структура;
    Фильтр.Вставить("visibility"   , "ALL");
    Фильтр.Вставить("offer_id"     , МассивID);

    Результат = OPI_Ozon.ПолучитьСписокТоваров(IDКлиента, КлючAPI, Фильтр);
```



```sh title="Пример команды CLI"
    
oint ozon ПолучитьСписокТоваров --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --filter %filter% --last %last%

```

```json title="Результат"
{
 "result": {
  "items": [
   {
    "product_id": 1111588191,
    "offer_id": "143210608",
    "is_fbo_visible": false,
    "is_fbs_visible": false,
    "archived": false,
    "is_discounted": false
   }
  ],
  "total": 1,
  "last_id": "WzExMTE1ODgxOTEsMTExMTU4ODE5MV0="
 }
}
```
