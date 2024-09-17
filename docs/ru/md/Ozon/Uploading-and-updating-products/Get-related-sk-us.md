---
sidebar_position: 17
---

# Получить связанные SKU
 Получает единый SKU по старым идентификаторам SKU FBS и SKU FBO



`Функция ПолучитьСвязанныеSKU(Знач IDКлиента, Знач КлючAPI, Знач SKU) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | SKU | --sku | Число, Массив Из Число | Идентификаторы товаров в системе Ozon (SKU) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
В ответе будут все SKU, связанные с переданными. Метод может обработать любые SKU, даже скрытые или удалённые.

 Передавайте до 200 SKU в одном запросе.

 Метод в документации API: [post /v1/product/related-sku/get](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductGetRelatedSKU)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента  = ПараметрыФункции["Ozon_ClientID"];
    КлючAPI    = ПараметрыФункции["Ozon_ApiKey"];
    SKU        = 1626044001;

    Результат = OPI_Ozon.ПолучитьСвязанныеSKU(IDКлиента, КлючAPI, SKU);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьСвязанныеSKU --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --sku %sku%

```

```json title="Результат"
{
 "items": [
  {
   "delivery_schema": "SDS",
   "sku": 1626044001,
   "product_id": 1108702494,
   "availability": "AVAILABLE",
   "deleted_at": null
  }
 ],
 "errors": []
}
```
