---
sidebar_position: 1
---

# Получить дерево категорий и типов товаров
 Возвращает категории и типы для товаров в виде дерева



`Функция ПолучитьДеревоКатегорийИТиповТоваров(Знач IDКлиента, Знач КлючAPI, Знач Язык = "DEFAULT") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | Язык | --lang | Строка | Язык ответа: DEFAULT (русский), RU, EN, TR (турецкий), ZH_HANS (китайский) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
Создание товаров доступно только в категориях последнего уровня, сравните именно их с категориями на своей площадке. Категории не создаются по запросу пользователя

 Внимательно выбирайте категорию для товара: для разных категорий применяется разный размер комиссии.

 Метод в документации API: [post /v1/description-category/tree](https://docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetTree)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента    = "2128753";
    КлючAPI      = "7cc90d26-33e4-499b...";

    Результат = OPI_Ozon.ПолучитьДеревоКатегорийИТиповТоваров(IDКлиента, КлючAPI, "EN");

    Результат = OPI_Ozon.ПолучитьДеревоКатегорийИТиповТоваров(IDКлиента, КлючAPI);
```



```sh title="Пример команды CLI"
    
  oint ozon ПолучитьДеревоКатегорийИТиповТоваров --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --lang %lang%

```

```json title="Результат"
{
 "result": [
  {
   "description_category_id": 17027485,
   "category_name": "Хобби и творчество",
   "disabled": false,
   "children": [
    {
     "description_category_id": 88621580,
     "category_name": "Оборудование для творчества",
     "disabled": false,
     "children": [
      {
       "type_name": "Пленка для аэрографии",
       "type_id": 970849152,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Сопло для аэрографа",
       "type_id": 970849029,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Набор для чистки аэрографа",
       "type_id": 970849022,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Компрессор для аэрографа",
       "type_id": 970849026,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Аэрограф для творчества",
       "type_id": 970843532,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Игла для аэрографа",
       "type_id": 970849028,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Шланг для аэрографа",
       "type_id": 970849042,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Расходные материалы для аэрографа",
       "type_id": 971880987,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Трафарет для аэрографии",
       "type_id": 970849027,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Средство для чистки аэрографа",
       "type_id": 970849043,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Диффузор для аэрографа",
       "type_id": 970849040,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Емкость для аэрографа",
       "type_id": 971748069,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Краска для аэрографа",
       "type_id": 970849024,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Подставка для аэрографа",
       "type_id": 970849041,
       "disabled": false,
       "children": []
      }
     ]
    },
 	...
    }
   ]
  }
 ]
}
```
