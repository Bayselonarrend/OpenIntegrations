---
sidebar_position: 5
---

# Получить контент рейтинг товаров
 Получает контент рейтинг товаров по SKU



`Функция ПолучитьКонтентРейтингТоваров(Знач IDКлиента, Знач КлючAPI, Знач SKU) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | SKU | --sku | Число, Массив Из Число | Идентификаторы товаров в системе Ozon (SKU) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Метод в документации API: [post /v1/product/rating-by-sku](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductRatingBySku)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента  = "2128753";
    КлючAPI    = "7cc90d26-33e4-499b...";
    SKU        = 1626044001;

    Результат = OPI_Ozon.ПолучитьКонтентРейтингТоваров(IDКлиента, КлючAPI, SKU);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьКонтентРейтингТоваров --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --sku %sku%

```

```json title="Результат"
{
 "products": [
  {
   "sku": 1626044001,
   "rating": 70,
   "groups": [
    {
     "key": "important_attributes",
     "name": "Важные атрибуты",
     "rating": 100,
     "weight": 30,
     "conditions": [
      {
       "key": "important_2",
       "description": "Заполнено 2 атрибута и более",
       "fulfilled": true,
       "cost": 50
      },
      {
       "key": "important_50_percent",
       "description": "Заполнено более 50% атрибутов",
       "fulfilled": true,
       "cost": 25
      },
      {
       "key": "important_70_percent",
       "description": "Заполнено более 70% атрибутов",
       "fulfilled": true,
       "cost": 25
      }
     ],
     "improve_attributes": [],
     "improve_at_least": 0
    },
    {
     "key": "other_attributes",
     "name": "Остальные атрибуты",
     "rating": 100,
     "weight": 25,
     "conditions": [
      {
       "key": "other_2",
       "description": "Заполнено 2 атрибута и более",
       "fulfilled": true,
       "cost": 50
      },
      {
       "key": "other_50_percent",
       "description": "Заполнено более 50% атрибутов",
       "fulfilled": true,
       "cost": 50
      }
     ],
     "improve_attributes": [],
     "improve_at_least": 0
    },
    {
     "key": "text",
     "name": "Текстовое описание",
     "rating": 50,
     "weight": 20,
     "conditions": [
      {
       "key": "text_annotation_100_chars",
       "description": "Аннотация более 100 знаков",
       "fulfilled": true,
       "cost": 25
      },
      {
       "key": "text_annotation_500_chars",
       "description": "Аннотация более 500 знаков",
       "fulfilled": true,
       "cost": 25
      },
      {
       "key": "text_rich",
       "description": "Заполнен Rich-контент",
       "fulfilled": false,
       "cost": 100
      }
     ],
     "improve_attributes": [
      {
       "id": 11254,
       "name": "Rich-контент JSON"
      }
     ],
     "improve_at_least": 1
    },
    {
     "key": "media",
     "name": "Медиа",
     "rating": 20,
     "weight": 25,
     "conditions": [
      {
       "key": "media_video_cover",
       "description": "Добавлена видеообложка",
       "fulfilled": false,
       "cost": 50
      },
      {
       "key": "media_video",
       "description": "Добавлено видео",
       "fulfilled": false,
       "cost": 30
      },
      {
       "key": "media_images_3",
       "description": "Добавлено 3 изображения и более",
       "fulfilled": true,
       "cost": 20
      }
     ],
     "improve_attributes": [
      {
       "id": 21841,
       "name": "Озон.Видео: ссылка"
      },
      {
       "id": 21845,
       "name": "Озон.Видеообложка: ссылка"
      }
     ],
     "improve_at_least": 2
    }
   ]
  }
 ]
}
```
