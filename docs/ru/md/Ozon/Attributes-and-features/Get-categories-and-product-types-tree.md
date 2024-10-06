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
   "description_category_id": 17027495,
   "category_name": "Автотовары",
   "disabled": false,
   "children": [
    {
     "description_category_id": 17028755,
     "category_name": "Тюнинг и внешний декор",
     "disabled": false,
     "children": [
      {
       "type_name": "Замок лобового стекла",
       "type_id": 971006632,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Пленка антигравийная",
       "type_id": 970943796,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Дефлектор капота",
       "type_id": 94656,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Накладка на кузов",
       "type_id": 971006634,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Колпаки на колеса",
       "type_id": 94659,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Защита внешних частей автомобиля",
       "type_id": 94658,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Накладка на пороги",
       "type_id": 98334,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Порог-площадка",
       "type_id": 97601,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Крышка на пикап",
       "type_id": 971045988,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Спойлер автомобиля",
       "type_id": 970895069,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Пленка защитная для автомобиля",
       "type_id": 971053255,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Подкрылки",
       "type_id": 94663,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Защита бампера",
       "type_id": 97599,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Заглушка бампера автомобиля",
       "type_id": 970954154,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Пленка виниловая",
       "type_id": 970943799,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Дефлектор для окон",
       "type_id": 97593,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Накладка на фары",
       "type_id": 970682241,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Накладка на бампер",
       "type_id": 92180,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Накладка крышки багажника",
       "type_id": 970879042,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Веткоотбойники для автомобиля",
       "type_id": 970891873,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Уплотнитель автомобильный",
       "type_id": 970891910,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Фейринг",
       "type_id": 971110642,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Набор для ламинации автомобиля",
       "type_id": 970977425,
       "disabled": false,
       "children": []
      },
...
```
