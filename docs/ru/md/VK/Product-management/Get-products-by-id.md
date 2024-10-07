---
sidebar_position: 3
---

# Получить товары по ID
 Получает информацию о товарах по массиву ID



`Функция ПолучитьТоварыПоИД(Знач Товары, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Товары | --items | Строка, Массив Из Строка | Массив ID товаров |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();

    Товар1 = "9670998";
    Товар2 = "9671000";

    МассивТоваров = Новый Массив;
    МассивТоваров.Добавить(Товар1);
    МассивТоваров.Добавить(Товар2);

    Результат = OPI_VK.ПолучитьТоварыПоИД(МассивТоваров, Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk ПолучитьТоварыПоИД --items %items% --auth %auth%

```

```json title="Результат"
{
 "response": {
  "count": 2,
  "items": [
   {
    "availability": 0,
    "category": {
     "inner_type": "market_market_category_old",
     "id": 20173,
     "name": "Батарейки",
     "section": {
      "id": 10016,
      "name": "Канцелярские товары"
     }
    },
    "description": "Описание товара",
    "id": 9681086,
    "owner_id": -218861756,
    "price": {
     "amount": "100",
     "currency": {
      "id": 643,
      "name": "RUB",
      "title": "₽"
     },
     "text": "1 ₽",
     "discount_rate": -93,
     "old_amount": "1500",
     "old_amount_text": "15 ₽"
    },
    "title": "Тестовый товар (со свойством)",
    "other_items": [
     {
      "title": "Другие товары сообщества",
      "view_type": 1,
      "item_ids": [
       "-218861756_9681087",
       "-218861756_9642576",
       "-218861756_9640025",
       "-218861756_9578921",
       "-218861756_9499082",
       "-218861756_9423489",
       "-218861756_9387853",
       "-218861756_9320009",
       "-218861756_9320008",
       "-218861756_9259547"
      ],
      "referrer_item_type": "other_goods"
     }
    ],
    "dimensions": {
     "width": 20,
     "height": 30,
     "length": 40
    },
    "weight": 100,
    "albums_ids": [],
    "photos": [
     {
      "album_id": -53,
      "date": 1728325900,
      "id": 457249006,
      "owner_id": -218861756,
      "access_key": "fbb39b1337c77011cc",
      "sizes": [
       {
        "height": 56,
        "type": "s",
        "width": 75,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=75x56"
       },
       {
        "height": 97,
        "type": "m",
        "width": 130,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=130x97"
       },
       {
        "height": 453,
        "type": "x",
        "width": 604,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=604x453"
       },
       {
        "height": 605,
        "type": "y",
        "width": 807,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=807x605"
       },
       {
        "height": 960,
        "type": "z",
        "width": 1280,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=1280x960"
       },
       {
        "height": 1920,
        "type": "w",
        "width": 2560,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=2560x1920"
       },
       {
        "height": 97,
        "type": "o",
        "width": 130,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=130x97"
       },
       {
        "height": 150,
        "type": "p",
        "width": 200,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=200x150"
       },
       {
        "height": 240,
        "type": "q",
        "width": 320,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=320x240"
       },
       {
        "height": 382,
        "type": "r",
        "width": 510,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=510x382"
       }
      ],
      "text": "",
      "user_id": 100,
      "web_view_token": "46645154b2ca251708",
      "has_tags": false,
      "orig_photo": {
       "height": 1920,
       "type": "base",
       "url": "https://sun9-13.userapi.com/s/v1/ig2/MDtlDOos092H_70sdO_1iNmurhYjZ_TC4MtG9tJgXMOZwBlEAZrasMsfgGKhwgzhdl8-PnhZR9CUHTkT2rl5A1lD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu",
       "width": 2560
      }
     },
     {
      "album_id": -53,
      "date": 1728325903,
      "id": 457249007,
      "owner_id": -218861756,
      "access_key": "a222eb9bbcece9c2e0",
      "sizes": [
       {
        "height": 56,
        "type": "s",
        "width": 75,
        "url": "https://sun9-13.userapi.com/s/v1/ig2/NxFlHRbER-yCHWYFX_s6jSnFwJzl9nCriaovK4Vy2k3LRKQQy3oTdYKs_JXw6TciA-TQ4QQm61EEd5oTCi0497g1.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=75x56"
       },
...
```
