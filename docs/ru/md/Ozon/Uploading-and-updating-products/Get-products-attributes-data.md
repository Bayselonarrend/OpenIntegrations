---
sidebar_position: 2
---

# Получить описания харакетристик товаров
 Получает описания характеристик товаров с фильтром или без



`Функция ПолучитьОписанияХарактеристикТоваров(Знач IDКлиента, Знач КлючAPI, Знач Фильтр = "", Знач IDПоследнего = 0) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | Фильтр | --filter | Структура Из КлючИЗначение | Фильтр выборки товаров. См. ПолучитьСтруктуруФильтраТоваров |
  | IDПоследнего | --last | Строка, Число | ID последнего значения (last_id) из предыдущего запроса |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v3/products/info/attributes](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductAttributesV3)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента  = "2128753";
    КлючAPI    = "7cc90d26-33e4-499b...";

    МассивID = Новый Массив;
    МассивID.Добавить("143210608");

    Фильтр = Новый Структура;
    Фильтр.Вставить("visibility", "ALL");
    Фильтр.Вставить("offer_id"  , МассивID);

    Результат = OPI_Ozon.ПолучитьОписанияХарактеристикТоваров(IDКлиента, КлючAPI, Фильтр);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьОписанияХарактеристикТоваров --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --filter %filter% --last %last%

```

```json title="Результат"
{
 "result": [
  {
   "id": 1167679693,
   "barcode": "",
   "category_id": 0,
   "name": "Комплект защитных плёнок для X3 NFC. Темный хлопок",
   "offer_id": "143210608",
   "height": 250,
   "depth": 10,
   "width": 150,
   "dimension_unit": "mm",
   "weight": 100,
   "weight_unit": "g",
   "images": [
    {
     "file_name": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
     "default": false,
     "index": 1
    },
    {
     "file_name": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
     "default": false,
     "index": 2
    }
   ],
   "image_group_id": "",
   "images360": [],
   "pdf_list": [],
   "attributes": [
    {
     "attribute_id": 85,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 5060050,
       "value": "Samsung"
      }
     ]
    },
    {
     "attribute_id": 10096,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 61576,
       "value": "красный"
      }
     ]
    },
    {
     "attribute_id": 8229,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 95911,
       "value": "Комплект защитных плёнок для X3 NFC. Темный хлопок"
      }
     ]
    },
    {
     "attribute_id": 9048,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "Комплект защитных плёнок для X3 NFC. Темный хлопок"
      }
     ]
    },
    {
     "attribute_id": 4180,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "Комплект защитных плёнок для X3 NFC. Темный хлопок"
      }
     ]
    },
    {
     "attribute_id": 9024,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "143210608"
      }
     ]
    },
    {
     "attribute_id": 20900,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "true"
      }
     ]
    }
   ],
   "complex_attributes": [
    {
     "attributes": [
      {
       "attribute_id": 21837,
       "complex_id": 100001,
       "values": [
        {
         "dictionary_value_id": 0,
         "value": "viedo1"
        }
       ]
      },
      {
       "attribute_id": 21841,
       "complex_id": 100001,
       "values": [
        {
         "dictionary_value_id": 0,
         "value": "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/"
        }
       ]
      }
     ]
    }
   ],
   "color_image": "",
   "last_id": "",
   "description_category_id": 17028922
  }
 ],
 "total": 1,
 "last_id": ""
}
```
