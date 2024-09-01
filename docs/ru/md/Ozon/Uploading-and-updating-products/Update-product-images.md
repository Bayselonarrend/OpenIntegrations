---
sidebar_position: 9
---

# Обновить изображения товара
 Обновляет изображения и маркетинговый цвет товара



`Функция ОбновитьИзображенияТовара(Знач IDКлиента, Знач КлючAPI, Знач IDТовара, Знач МассивИзображений = "", Знач Массив360 = "", Знач МаркетинговыйЦвет = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | IDКлиента | --clientid | Строка | Идентификатор клиента |
  | КлючAPI | --apikey | Строка | API ключ |
  | IDТовара | --productid | Строка, Число | Идентификатор товара |
  | МассивИзображений | --images | Массив Из Строка | Массив URL изображений |
  | Массив360 | --images360 | Массив Из Строка | Массив изображений 360 |
  | МаркетинговыйЦвет | --color | Строка | Маркетинговый цвет |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API

<br/>

:::tip
При каждом вызове метода передавайте все изображения, которые должны быть на карточке товара

 Для загрузки передайте адрес ссылки на изображение в общедоступном облачном хранилище. Формат изображения по ссылке — JPG или PNG

 Если вы хотите изменить состав или порядок изображений, получите информацию с помощью метода ПолучитьИнформациюОТоваре(), скопируйте данные полей images, images360, color_image, измените и дополните состав или порядок в соответствии с необходимостью

 Метод в документации API: [post /v1/product/pictures/import](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductImportPictures)
:::
<br/>


```bsl title="Пример кода"
    IDКлиента = "2128753";
    КлючAPI   = "7cc90d26-33e4-499b...";
    IDТовара  = "1111588191";

    Картинка1 = "https://openintegrations.dev/test_data/picture.jpg";
    Картинка2 = "https://openintegrations.dev/test_data/picture2.jpg";

    МаркетинговыйЦвет = "GREEN";

    МассивИзображений = Новый Массив;
    МассивИзображений.Добавить(Картинка1);
    МассивИзображений.Добавить(Картинка2);

    Результат = OPI_Ozon.ОбновитьИзображенияТовара(IDКлиента
        , КлючAPI
        , IDТовара
        , МассивИзображений
        ,
        , МаркетинговыйЦвет);
```



```sh title="Пример команды CLI"
    
  oint ozon ОбновитьИзображенияТовара --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --productid "1111588191" --images %images% --images360 %images360% --color %color%

```

```json title="Результат"
{
 "result": {
  "pictures": [
   {
    "product_id": 1111588191,
    "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
    "state": "imported",
    "is_primary": true,
    "is_360": false,
    "is_color": false
   },
   {
    "product_id": 1111588191,
    "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
    "state": "imported",
    "is_primary": false,
    "is_360": false,
    "is_color": false
   },
   {
    "product_id": 1111588191,
    "url": "GREEN",
    "state": "imported",
    "is_primary": false,
    "is_360": false,
    "is_color": true
   }
  ]
 }
}
```
