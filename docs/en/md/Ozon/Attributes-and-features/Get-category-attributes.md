---
sidebar_position: 2
---

# Get category attributes
 Gets the characteristics for the specified category and product type



`Function GetCategoryAttributes(Val ClientID, Val APIKey, Val CategoryID, Val TypeID, Val Lang = "DEFAULT") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | CategoryID | --categoryid | String, Number | Category identifier |
  | TypeID | --typeid | String, Number | Item type identifier |
  | Lang | --lang | String | Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
If dictionary_id has a value of 0, the attribute has no nested directories. If the value is different, there are directories. You can get them using the GetValuesCharacteristics method()

 Method at API documentation: [post /v1/description-category/attribute](https://docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetAttributes)
:::
<br/>


```bsl title="Code example"
    ClientID   = "2128753";
    APIKey     = "7cc90d26-33e4-499b...";
    CategoryID = 17029016;
    TypeID     = 970778135;

    Result = OPI_Ozon.GetCategoryAttributes(ClientID, APIKey, CategoryID, TypeID);
```



```sh title="CLI command example"
    
  oint ozon GetCategoryAttributes --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --categoryid %categoryid% --typeid %typeid% --lang %lang%

```

```json title="Result"
{
 "result": [
  {
   "id": 85,
   "attribute_complex_id": 0,
   "name": "Бренд",
   "description": "Укажите наименование бренда, под которым произведен товар. Если товар не имеет бренда, используйте значение \"Нет бренда\".",
   "type": "String",
   "is_collection": false,
   "is_required": true,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 28732849,
   "category_dependent": true
  },
  {
   "id": 4080,
   "attribute_complex_id": 0,
   "name": "3D-изображение",
   "description": "Укажите ссылки на фото, через запятую, которые показывает товар под разными равными углами. В серии фото важно соблюдать последовательность, чтобы ракурс каждого следующего фото отличался от предыдущего на равный угол. Из этих фотографий на сайте автоматически сформируется 3D-модель товара. Минимальное рекомендованное количество - 15 штук.",
   "type": "URL",
   "is_collection": true,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 0,
   "category_dependent": false
  },
  {
   "id": 4180,
   "attribute_complex_id": 0,
   "name": "Название",
   "description": "Название пишется по принципу:\nТип + Бренд + Модель (серия + пояснение) + Артикул производителя + , (запятая) + Атрибут\nНазвание не пишется большими буквами (не используем caps lock).\nПеред атрибутом ставится запятая. Если атрибутов несколько, они так же разделяются запятыми.\nЕсли какой-то составной части названия нет - пропускаем её.\nАтрибутом может быть: цвет, вес, объём, количество штук в упаковке и т.д.\nЦвет пишется с маленькой буквы, в мужском роде, единственном числе.\nСлово цвет в названии не пишем.\nТочка в конце не ставится.\nНикаких знаков препинания, кроме запятой, не используем.\nКавычки используем только для названий на русском языке.\nПримеры корректных названий:\nСмартфон Apple iPhone XS MT572RU/A, space black \nКеды Dr. Martens Киноклассика, бело-черные, размер 43\nСтиральный порошок Ariel Магия белого с мерной ложкой, 15 кг\nСоус Heinz Xtreme Tabasco суперострый, 10 мл\nИгрушка для животных Четыре лапы \"Бегающая мышка\" БММ, белый",
   "type": "String",
   "is_collection": false,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 0,
   "category_dependent": false
  },
  {
   "id": 4191,
   "attribute_complex_id": 0,
   "name": "Аннотация",
   "description": "Описание товара, маркетинговый текст. Необходимо заполнять на русском языке.",
   "type": "multiline",
   "is_collection": false,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 0,
   "category_dependent": false
  },
  {
   "id": 4385,
   "attribute_complex_id": 0,
   "name": "Гарантийный срок",
   "description": "Укажите гарантийный срок. Гарантийный срок – это период, в течение которого изготовитель гарантирует качество товара и обязуется принять данный товар у потребителя для проведения проверки качества (экспертизы) и выполнения предусмотренных законом требований.",
   "type": "String",
   "is_collection": false,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 0,
   "category_dependent": false
  },
  {
   "id": 4389,
   "attribute_complex_id": 0,
   "name": "Страна-изготовитель",
   "description": "Выберите из списка или укажите вручную. Можно добавить несколько значений через точку с запятой. Если точка с запятой есть в значении атрибута, поместите знак в кавычки \";\".",
   "type": "String",
   "is_collection": true,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 1935,
   "category_dependent": false
  },
  {
   "id": 6548,
   "attribute_complex_id": 0,
   "name": "Материал",
   "description": "Выберите из списка или укажите вручную. Можно добавить несколько значений через точку с запятой. Если точка с запятой есть в значении атрибута, поместите знак в кавычки \";\".",
   "type": "String",
   "is_collection": true,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 1503,
   "category_dependent": true
  },
  {
   "id": 8229,
   "attribute_complex_id": 0,
   "name": "Тип",
   "description": "Выберите наиболее подходящий тип товара. По типам товары распределяются по категориям на сайте Ozon. Если тип указан неправильно, товар попадет в неверную категорию. Чтобы правильно указать тип, найдите на сайте Ozon товары, похожие на ваш, и посмотрите, какой тип у них указан.",
   "type": "String",
   "is_collection": false,
   "is_required": true,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 1960,
   "category_dependent": true
  },
  {
   "id": 8245,
   "attribute_complex_id": 0,
   "name": "Число строк",
   "description": "Выберите из списка. Можно указать только одно значение.",
   "type": "String",
   "is_collection": false,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 1324,
   "category_dependent": true
  },
  {
   "id": 8249,
   "attribute_complex_id": 0,
   "name": "Число знаков шрифта для выделения",
   "description": "Можно указать только целое число.",
   "type": "Integer",
   "is_collection": false,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 0,
...
```
