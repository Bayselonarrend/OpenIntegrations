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
   "description_category_id": 17027915,
   "category_name": "Мебель",
   "disabled": false,
   "children": [
    {
     "description_category_id": 79164512,
     "category_name": "Компьютерные и офисные кресла",
     "disabled": false,
     "children": [
      {
       "type_name": "Кресло руководителя",
       "type_id": 970679619,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Офисное кресло",
       "type_id": 95041,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Игровое компьютерное кресло",
       "type_id": 95026,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Игровая вибронакидка",
       "type_id": 91796,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Стул промышленный",
       "type_id": 970884997,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Кресло-седло",
       "type_id": 970685081,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Детское компьютерное кресло",
       "type_id": 970685072,
       "disabled": false,
       "children": []
      }
     ]
    },
    {
     "description_category_id": 85282223,
     "category_name": "Мебель для бизнеса",
     "disabled": false,
     "children": [
      {
       "type_name": "Подтоварник",
       "type_id": 970988637,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Подставка производственная",
       "type_id": 971816790,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Ларь для овощей",
       "type_id": 970988646,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Подставка под пароконвектомат",
       "type_id": 970988638,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Защитный экран для кассы",
       "type_id": 970744413,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Стойка ресепшн для ПВЗ",
       "type_id": 971108795,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Тележка-шпилька",
       "type_id": 970988645,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Швейный уголок",
       "type_id": 971363893,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Защитный экран для офиса",
       "type_id": 970744412,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Шкаф производственный",
       "type_id": 970988648,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Полка производственная",
       "type_id": 970993837,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Досмотровая тумба, стол",
       "type_id": 971371488,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Шкаф для сумок",
       "type_id": 971276898,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Стол-тележка для торта",
       "type_id": 971361009,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Складской стеллаж",
       "type_id": 970988642,
       "disabled": false,
       "children": []
...
```
