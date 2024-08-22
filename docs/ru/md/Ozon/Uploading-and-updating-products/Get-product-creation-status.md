---
sidebar_position: 2
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
    IDЗадачи   = "";

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
    "offer_id": "143210608",
    "product_id": 1111588191,
    "status": "imported",
    "errors": []
   }
  ],
  "total": 1
 }
}
```
