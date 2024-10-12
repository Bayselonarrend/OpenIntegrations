---
sidebar_position: 18
---

# Получить статус добавления товара
 Получает статус добавления нового товара по ID задачи



`Функция ПолучитьСтатусДобавленияТовара(Знач IDКлиента, Знач КлючAPI, Знач IDЗадачи) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDЗадачи | --taskid | Строка, Число | ID задачи добавления товара |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/product/import/info](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetImportProductsInfo)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента  = "2128753";
    КлючAPI    = "7cc90d26-33e4-499b...";
    IDЗадачи   = "1352681806";

    Результат  = OPI_Ozon.ПолучитьСтатусДобавленияТовара(IDКлиента, КлючAPI, IDЗадачи);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьСтатусДобавленияТовара --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --taskid %taskid%

```

```json title="Результат"
{
 "result": {
  "items": [
   {
    "offer_id": "143210609",
    "product_id": 1215208579,
    "status": "imported",
    "errors": [
     {
      "code": "SELLER_NO_CONTRACT_FAILED",
      "field": "",
      "attribute_id": 0,
      "state": "unmatched",
      "level": "error",
      "description": "Истек срок договора. Чтобы загрузить товар, возобновите договор в личном кабинете.",
      "optional_description_elements": {},
      "attribute_name": "",
      "message": "Истек срок договора. Чтобы загрузить товар, возобновите договор в личном кабинете."
     }
    ]
   }
  ],
  "total": 1
 }
}
```
