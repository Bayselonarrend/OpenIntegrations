---
sidebar_position: 10
---

# Проверить загрузку изображений товаров
 Проверяет загрузку изображений по массиву ID товаров



`Функция ПроверитьЗагрузкуИзображенийТоваров(Знач IDКлиента, Знач КлючAPI, Знач IDТоваров) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDТоваров | --products | Строка, Число, Массив Из Строка, Число | ID товаров для проверки |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/product/pictures/info](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductInfoPictures)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента = "2128753";
    КлючAPI   = "7cc90d26-33e4-499b...";
    IDТовара  = "1111588191";

    Результат = OPI_Ozon.ПроверитьЗагрузкуИзображенийТоваров(IDКлиента, КлючAPI, IDТовара);
```



```sh title="Пример команды CLI"
    
oint ozon ПроверитьЗагрузкуИзображенийТоваров --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --products %products%

```

```json title="Результат"
{
 "result": {
  "pictures": [
   {
    "product_id": 1111588191,
    "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
    "state": "imported",
    "is_primary": true,
    "is_360": false,
    "is_color": false
   },
   {
    "product_id": 1111588191,
    "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
    "state": "imported",
    "is_primary": false,
    "is_360": false,
    "is_color": false
   },
   {
    "product_id": 1111588191,
    "url": "GREEN",
    "state": "imported",
    "is_primary": false,
    "is_360": false,
    "is_color": true
   }
  ]
 }
}
```
