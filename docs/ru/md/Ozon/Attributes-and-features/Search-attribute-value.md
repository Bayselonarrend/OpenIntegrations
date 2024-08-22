---
sidebar_position: 4
---

# Найти значения характеристики
 Получает справочные значения характеристики по заданному значению в запросе



`Функция НайтиЗначенияХарактеристики(Знач IDКлиента, Знач КлючAPI, Знач IDКатегории, Знач IDТипа, Знач IDХарактеристики, Знач Значение) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDКатегории | --categoryid | Строка, Число | Идентификатор категории |
  | IDТипа | --typeid | Строка, Число | Идентификатор типа товара |
  | IDХарактеристики | --attributeid | Строка, Число | ID характеристики для получения значений |
  | Значение | --value | Строка | Значение для поиска |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Узнать, есть ли вложенный справочник, можно через метод ПолучитьХарактеристикиКатегории()

 Метод в документации API: [post /v1/description-category/attribute/values/search](https://docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_SearchAttributeValues)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента        = "2128753";
    КлючAPI          = "7cc90d26-33e4-499b...";
    IDКатегории      = 17054869;
    IDТипа           = 97311;
    IDХарактеристики = 85;
    Значение         = "Sunshine";

    Результат = OPI_Ozon.НайтиЗначенияХарактеристики(IDКлиента
        , КлючAPI
        , IDКатегории
        , IDТипа
        , IDХарактеристики
        , Значение);
```



```sh title="Пример команды CLI"
    
  oint ozon НайтиЗначенияХарактеристики --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --categoryid %categoryid% --typeid %typeid% --attributeid %attributeid% --value %value%

```

```json title="Результат"
{
 "result": [
  {
   "id": 5055881,
   "value": "Sunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-i/6010930878.jpg"
  },
  {
   "id": 971026862,
   "value": "SUNSHINE",
   "info": "Спорт и отдых",
   "picture": ""
  },
  {
   "id": 971719299,
   "value": "Sunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-v/6601244203.jpg"
  },
  {
   "id": 971818888,
   "value": "Sunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-p/6644299477.jpg"
  },
  {
   "id": 972176200,
   "value": "sunshine",
   "info": "",
   "picture": "https://cdn1.ozonusercontent.com/s3/product-service-meta-media/e6dcf5aa-eb30-442d-afa0-5812652d2816.png"
  },
  {
   "id": 971227292,
   "value": "Sunshine Baby",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-r/6299308959.jpg"
  },
  {
   "id": 972029069,
   "value": "Sunshine Beams",
   "info": "",
   "picture": ""
  },
  {
   "id": 971168926,
   "value": "Sunshine-Craft",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-u/6267516354.jpg"
  },
  {
   "id": 972173064,
   "value": "Sunshine Day",
   "info": "",
   "picture": ""
  },
  {
   "id": 970974258,
   "value": "sunshinefilm",
   "info": "Защитная пленка на экран смартфона, гидрогелевая",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-w/6048813188.jpg"
  },
  {
   "id": 972066951,
   "value": "SunShineFox",
   "info": "",
   "picture": ""
  },
  {
   "id": 972172514,
   "value": "SUNSHINEFXY",
   "info": "",
   "picture": "https://cdn1.ozonusercontent.com/s3/product-service-meta-media/d48c1614-b9c4-4785-b9ef-3142f5cfb12c.png"
  },
  {
   "id": 971110891,
   "value": "Sunshine Habibi",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6158730376.jpg"
  },
  {
   "id": 971896068,
   "value": "Sunshine House",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-b/6704404415.jpg"
  },
  {
   "id": 971967921,
   "value": "SunShine in me",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1/6775950013.jpg"
  },
  {
   "id": 970712762,
   "value": "Sunshine Innovations",
   "info": "",
   "picture": ""
  },
  {
   "id": 5115939,
   "value": "Sunshine Kids",
   "info": "",
   "picture": ""
  },
  {
   "id": 971303326,
   "value": "Sunshine Lady",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-p/6371652253.jpg"
  },
  {
   "id": 972131760,
   "value": "Sunshineland",
   "info": "",
   "picture": "https://cdn1.ozonusercontent.com/s3/product-service-meta-media/63bfd44b-6338-4fa6-8843-39b1c7827099.jpg"
  },
  {
   "id": 5142226,
   "value": "Sunshine Optics",
   "info": "",
   "picture": ""
  },
  {
   "id": 972026686,
   "value": "SUNSHINE PANDI",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-3/6842409075.jpg"
  },
  {
   "id": 970954160,
   "value": "SUNSHINE PEARL",
   "info": "Соль для ванны",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-j/6041114827.jpg"
  },
  {
   "id": 970697481,
   "value": "SunShines",
   "info": "",
   "picture": ""
  },
  {
   "id": 972077059,
   "value": "Sunshine shop",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-p/6938763421.jpg"
  },
  {
   "id": 971419123,
   "value": "Sunshine Supboard",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-n/6492337823.jpg"
  },
  {
   "id": 971907049,
   "value": "Sunshine-sz",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-s/6706205764.jpg"
  },
  {
   "id": 972041847,
   "value": "SunShineTea",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-d/6856248853.jpg"
  },
  {
   "id": 972118999,
   "value": "Sunshine Tree",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1-9/7019561409.jpg"
  },
  {
   "id": 971303507,
   "value": "Sunshine wall",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-r/6372407715.jpg"
  },
  {
   "id": 972144681,
   "value": "SunShine X",
   "info": "",
   "picture": "https://cdn1.ozonusercontent.com/s3/product-service-meta-media/b4fd7a21-72c4-43bf-ac4c-3fad1d1f80e8.png"
  },
  {
   "id": 971940092,
   "value": "BabySunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-7/6725755399.jpg"
  },
  {
   "id": 971344650,
   "value": "Eternal Sunshine Creations",
   "info": "",
   "picture": ""
  },
  {
   "id": 971991466,
   "value": "G.SUNSHINE8",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-5/6820808681.jpg"
  },
  {
   "id": 971432528,
   "value": "MySunshine",
   "info": "",
   "picture": ""
  },
  {
   "id": 970861688,
   "value": "NailSunShine",
   "info": "Маникюрные принадлежности",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-x/6025829277.jpg"
  },
  {
   "id": 971348915,
   "value": "Nail SunShine",
   "info": "",
   "picture": ""
  },
  {
   "id": 971011190,
   "value": "Nature's Sunshine",
   "info": "БАД (биологически активные добавки)",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-r/6765616743.jpg"
  },
  {
   "id": 971282329,
   "value": "Oh,Sunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-l/6321507993.jpg"
  },
  {
   "id": 972022110,
   "value": "Rising Sunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-r/6833535279.jpg"
  },
  {
   "id": 971948406,
   "value": "Sweet Sunshine",
   "info": "",
   "picture": ""
  }
 ]
}
```
