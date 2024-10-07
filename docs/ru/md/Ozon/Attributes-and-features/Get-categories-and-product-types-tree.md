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
   "description_category_id": 17027491,
   "category_name": "Спорт и отдых",
   "disabled": false,
   "children": [
    {
     "description_category_id": 17028997,
     "category_name": "Боксерские груши и мешки",
     "disabled": false,
     "children": [
      {
       "type_name": "Ракетка для тхэквондо",
       "type_id": 970601428,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Боксерский мешок",
       "type_id": 94338,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Макивара",
       "type_id": 970666976,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Водоналивной мешок",
       "type_id": 94334,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Настенная боксерская подушка",
       "type_id": 970736821,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Набор для бокса",
       "type_id": 970695846,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Манекен для борьбы",
       "type_id": 94337,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Боксерская груша",
       "type_id": 94335,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Комплект боксерская груша и перчатки",
       "type_id": 971102088,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Боксерский тренажер",
       "type_id": 970736820,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Лапы боксерские",
       "type_id": 94336,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Рукав для отработки захватов",
       "type_id": 970795782,
       "disabled": false,
       "children": []
      }
     ]
    },
    {
     "description_category_id": 85945852,
     "category_name": "Водный спорт и отдых на воде",
     "disabled": false,
     "children": [
      {
       "type_name": "Доска для серфинга",
       "type_id": 970739431,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Крепления для водных лыж",
       "type_id": 970739388,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Набор для снорклинга",
       "type_id": 971079265,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Мачта для виндсерфинга",
       "type_id": 970739443,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Стакан для виндсерфинга",
       "type_id": 970739438,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Насос для кайта",
       "type_id": 970780208,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Шнурки креплений для вейкборда",
       "type_id": 970780417,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Ниборд",
       "type_id": 970739432,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Защита доски для виндсерфинга",
       "type_id": 970780195,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Защита шарнира для виндсерфинга",
       "type_id": 970780194,
       "disabled": false,
       "children": []
...
```
