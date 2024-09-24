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
   "id": 9048,
   "attribute_complex_id": 0,
   "name": "Название модели (для объединения в одну карточку)",
   "description": "Укажите название модели товара. Не указывайте в этом поле тип и бренд.",
   "type": "String",
   "is_collection": false,
   "is_required": true,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 0,
   "category_dependent": false
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
   "description": "Выберите одно или несколько значений из списка. В xls-файле варианты заполняются через точку с запятой (;) без пробелов.",
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
   "description": "Выберите одно или несколько значений из списка. В xls-файле варианты заполняются через точку с запятой (;) без пробелов.",
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
   "id": 8245,
   "attribute_complex_id": 0,
   "name": "Число строк",
   "description": "Выберите одно значение из выпадающего списка.",
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
   "description": "",
   "type": "Integer",
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
   "id": 8789,
   "attribute_complex_id": 8788,
   "name": "Название файла PDF",
   "description": "",
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
   "id": 8790,
   "attribute_complex_id": 8788,
   "name": "Документ PDF",
   "description": "",
   "type": "URL",
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
   "id": 9024,
   "attribute_complex_id": 0,
   "name": "Код продавца",
   "description": "Цифро-буквенный код товара для его учета, является уникальным среди товаров бренда. Не является EAN/серийным номером/штрихкодом, не равен названию модели товара - для этих параметров есть отдельные атрибуты. Артикул выводится в карточке товара на сайте и может использоваться при автоматическом формировании названия товара.",
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
   "id": 9390,
   "attribute_complex_id": 0,
   "name": "Целевая аудитория",
   "description": "Выберите одно или несколько значений из списка. В xls-файле варианты заполняются через точку с запятой (;) без пробелов.",
   "type": "String",
   "is_collection": true,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 1183,
   "category_dependent": false
  },
  {
   "id": 10096,
   "attribute_complex_id": 0,
   "name": "Цвет товара",
   "description": "Укажите базовый или доминирующий цвет вашего товара, выбрав значение из списка. Если точного соответствия вы не находите, используйте ближайшие похожие цвета. \n\nСложные цвета нужно описывать перечислением простых цветов. Например, если вы описываете шмеля, и у него, очевидно, преобладают чёрный, жёлтый и белый цвета, то укажите их все простым перечислением. \n\nПомните, что атрибут Цвет товара - это базовый цвет, все любые другие цвета вы можете прописать в атрибуте Название цвета.\n",
   "type": "String",
   "is_collection": true,
   "is_required": false,
   "is_aspect": true,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 1494,
   "category_dependent": true
  },
  {
   "id": 11254,
   "attribute_complex_id": 0,
   "name": "Rich-контент JSON",
   "description": "Добавьте расширенное описание товара с фото и видео по шаблону в формате JSON. Подробнее: https://seller-edu.ozon.ru/docs/work-with-goods/dobavlenie-rich-kontenta-json.html",
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
   "id": 11650,
   "attribute_complex_id": 0,
   "name": "Количество заводских упаковок",
   "description": "Сколько заводских упаковок вы собрали вместе и теперь продаете, как одно SKU.\n\nЕсли ваш товар - это 24 банки детского пюре, запаянных в 1 упаковку на заводе, и в таком же виде этот товар может продаваться в других магазинах - значение атрибута будет 1.\n\nЕсли ваш товар - это 3 лампочки, запаянные или связанные в одну упаковку вами, и вы решили их объединить самостоятельно (а завод выпускает лампочки в упаковках, например, 1 шт. и 10 шт.) - значение атрибута будет 3.",
   "type": "Integer",
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
   "id": 21837,
   "attribute_complex_id": 100001,
   "name": "Озон.Видео: название",
   "description": "Укажите название для видео",
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
   "id": 21841,
   "attribute_complex_id": 100001,
   "name": "Озон.Видео: ссылка",
   "description": "Укажите ссылку на видео (MP4, MOV). Продолжительность от 8 сек до 5 минут, размер файла не более 2ГБ",
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
   "id": 21845,
   "attribute_complex_id": 100002,
   "name": "Озон.Видеообложка: ссылка",
   "description": "Укажите ссылку на видео (MP4, MOV). Продолжительность от 8 до 30 секунд, размер файла не более 20МБ",
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
   "id": 22232,
   "attribute_complex_id": 0,
   "name": "ТН ВЭД коды ЕАЭС",
   "description": "Выберите одно значение из списка или оставьте пустым, если ваш товар не требует маркировки",
   "type": "String",
   "is_collection": false,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 124412395,
   "category_dependent": true
  },
  {
   "id": 22273,
   "attribute_complex_id": 100001,
   "name": "Озон.Видео: товары на видео",
   "description": "Укажите товары, которые демонстрируются в вашем видео. Перечислите SKU через запятую (не более 5).",
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
   "id": 22336,
   "attribute_complex_id": 0,
   "name": "Ключевые слова",
   "description": "Через точку с запятой укажите ключевые слова и словосочетания, которые описывают ваш товар. Используйте только соответствующие фактическому товару значения.",
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
   "id": 22390,
   "attribute_complex_id": 0,
   "name": "Название серии",
   "description": "Введите одинаковое значение в этом атрибуте для объединения товаров в серию. Обратите внимание, что товары в серии собираются внутри одного бренда, если у товаров будет указана одна серия и разные бренды - вы получите две разные серии. Подробнее об объединении в серии можно прочитать тут https://seller-edu.ozon.ru/work-with-goods/zagruzka-tovarov/created-goods/obedinenie-tovarov-v-seriu",
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
   "id": 22992,
   "attribute_complex_id": 0,
   "name": "HS-код",
   "description": "Данное поле предназначено для заполнения только продавцам из Турции.\nПерейдите на сайт https://uygulama.gtb.gov.tr/Tara/, укажите ваш товар - в ответе будет указан код, который нужно вставить в данное поле. Код состоит из набора цифр длиной от 6 до 12 знаков.\nПодробнее про HS-коды и для чего они нужны можно узнать здесь https://docs.ozon.ru/global/fulfillment/rfbs/logistic-settings/selling-from-turkey/?country=TR",
   "type": "Integer",
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
   "id": 23119,
   "attribute_complex_id": 0,
   "name": "Код упаковки Узбекистан",
   "description": "Заполняется продавцами из Узбекистана",
   "type": "Integer",
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
   "id": 23124,
   "attribute_complex_id": 0,
   "name": "ИКПУ",
   "description": "Заполняется продавцами из Узбекистана, строго 17 цифр",
   "type": "String",
   "is_collection": false,
   "is_required": false,
   "is_aspect": false,
   "max_value_count": 0,
   "group_name": "",
   "group_id": 0,
   "dictionary_id": 0,
   "category_dependent": false
  }
 ]
}
```
