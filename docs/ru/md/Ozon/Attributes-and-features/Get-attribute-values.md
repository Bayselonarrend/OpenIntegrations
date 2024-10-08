﻿---
sidebar_position: 3
---

# Получить значения характеристики
 Получает список доступных значений характеристики



`Функция ПолучитьЗначенияХарактеристики(Знач IDКлиента, Знач КлючAPI, Знач IDКатегории, Знач IDТипа, Знач IDХарактеристики, Знач IDСправочника = 1, Знач Язык = "DEFAULT") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDКатегории | --categoryid | Строка, Число | Идентификатор категории |
  | IDТипа | --typeid | Строка, Число | Идентификатор типа товара |
  | IDХарактеристики | --attributeid | Строка, Число | ID характеристики для получения значений |
  | IDСправочника | --start | Строка, Число | ID первого справочника в ответе |
  | Язык | --lang | Строка | Язык ответа: DEFAULT (русский), RU, EN, TR (турецкий), ZH_HANS (китайский) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Узнать, есть ли вложенный справочник, можно через метод ПолучитьХарактеристикиКатегории()

 Метод в документации API: [post /v1/description-category/attribute/values](https://docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetAttributeValues)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента        = "2128753";
    КлючAPI          = "7cc90d26-33e4-499b...";
    IDКатегории      = 17054869;
    IDТипа           = 97311;
    IDХарактеристики = 85;

    Результат = OPI_Ozon.ПолучитьЗначенияХарактеристики(IDКлиента, КлючAPI, IDКатегории, IDТипа, IDХарактеристики);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьЗначенияХарактеристики --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --categoryid %categoryid% --typeid %typeid% --attributeid %attributeid% --start %start% --lang %lang%

```

```json title="Результат"
{
 "result": [
  {
   "id": 5056737,
   "value": "Essence",
   "info": "Красота и здоровье",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-v/6088253599.jpg"
  },
  {
   "id": 5057962,
   "value": "Hot",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1/6011312389.jpg"
  },
  {
   "id": 5058518,
   "value": "CS",
   "info": "",
   "picture": ""
  },
  {
   "id": 5059837,
   "value": "Каскад",
   "info": "Зоотовары",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6027361156.jpg"
  },
  {
   "id": 5062537,
   "value": "Enigma",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-5/6427347617.jpg"
  },
  {
   "id": 5062790,
   "value": "Kitfort",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-6/6737348550.jpg"
  },
  {
   "id": 5064843,
   "value": "Parlux",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-w/6011101280.jpg"
  },
  {
   "id": 5065236,
   "value": "Сателлит",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6010470136.jpg"
  },
  {
   "id": 5066816,
   "value": "Carioca",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-8/6063013796.jpg"
  },
  {
   "id": 5068632,
   "value": "Bawi",
   "info": "",
   "picture": ""
  },
  {
   "id": 5069237,
   "value": "Kodak",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-m/6011062066.jpg"
  },
  {
   "id": 5069442,
   "value": "Mattel",
   "info": "Детские игрушки",
   "picture": "https://cdn1.ozone.ru/multimedia/1013076413.jpg"
  },
  {
   "id": 5071003,
   "value": "Ivo",
   "info": "",
   "picture": ""
  },
  {
   "id": 5071289,
   "value": "HTC",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1011058578.jpg"
  },
  {
   "id": 5073069,
   "value": "Ghost",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073089,
   "value": "Oleg Cassini",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073356,
   "value": "Ritzenhoff & Breker",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073389,
   "value": "William Levene",
   "info": "",
   "picture": ""
  },
  {
   "id": 5074417,
   "value": "KEF",
   "info": "",
   "picture": ""
  },
  {
   "id": 5074684,
   "value": "Cutipol",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-o/6011755428.jpg"
  },
  {
   "id": 5075889,
   "value": "Jacob Zeidler & Co",
   "info": "",
   "picture": ""
  },
  {
   "id": 5076255,
   "value": "The Original Book Works Limited",
   "info": "",
   "picture": ""
  },
  {
   "id": 5076787,
   "value": "Ocean Extreme",
   "info": "",
   "picture": ""
  },
  {
   "id": 5077287,
   "value": "Народное искусство",
   "info": "",
   "picture": ""
  },
  {
   "id": 5077379,
   "value": "Zyliss",
   "info": "",
...
```
