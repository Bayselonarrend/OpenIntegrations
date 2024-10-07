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
   "description_category_id": 52265716,
   "category_name": "Аптека",
   "disabled": false,
   "children": [
    {
     "description_category_id": 52620255,
     "category_name": "Медицинские приборы",
     "disabled": false,
     "children": [
      {
       "type_name": "Дигитайзер",
       "type_id": 971405578,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Линза высокодиоптрийная",
       "type_id": 971134130,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Лупа бинокулярная",
       "type_id": 504866193,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Рефлектор лобный",
       "type_id": 412778335,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Пульсоксиметр",
       "type_id": 370309949,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Браслет для диабетика",
       "type_id": 970824818,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Устройство антихрап",
       "type_id": 91864,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Инструмент от паразитов",
       "type_id": 970994141,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Лазер стоматологический",
       "type_id": 971405488,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Артикулятор",
       "type_id": 971123896,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Отоскоп",
       "type_id": 630450956,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Измельчитель таблеток",
       "type_id": 970827264,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Дыхательная смесь",
       "type_id": 97496,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Монитор здоровья",
       "type_id": 970904865,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Весы медицинские",
       "type_id": 971890888,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Аппарат для отбеливания зубов",
       "type_id": 970940062,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Голосообразующий аппарат",
       "type_id": 971043353,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Капсулятор ручной",
       "type_id": 971749982,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Подоскоп",
       "type_id": 971452805,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Анализатор лактата",
       "type_id": 971291169,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Ланцеты для глюкометра",
       "type_id": 94570,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Пульсотахометр",
       "type_id": 91851,
       "disabled": false,
       "children": []
      },
      {
       "type_name": "Очки для светотерапии",
       "type_id": 970984872,
       "disabled": false,
       "children": []
      },
...
```
