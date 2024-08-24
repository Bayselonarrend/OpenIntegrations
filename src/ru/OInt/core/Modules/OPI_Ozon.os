﻿// OneScript: ./OInt/core/Modules/OPI_Ozon.os
// Lib: Ozon
// CLI: ozon

// MIT License

// Copyright (c) 2023 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// BSLLS:Typo-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область АтрибутыИХарактеристики

// Получить дерево категорий и типов товаров
// Возвращает категории и типы для товаров в виде дерева
//
// Примечание:
// Создание товаров доступно только в категориях последнего уровня, сравните именно их с категориями на своей площадке. Категории не создаются по запросу пользователя
// Внимательно выбирайте категорию для товара: для разных категорий применяется разный размер комиссии.
// Метод в документации API: [post /v1/description-category/tree](@docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetTree)
//
// Параметры:
//  IDКлиента - Строка - Идентификатор клиента                                                        - clientid
//  КлючAPI   - Строка - API ключ                                                                     - apikey
//  Язык      - Строка - Язык ответа: DEFAULT (русский), RU, EN, TR (турецкий), ZH_HANS (китайский)   - lang
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция ПолучитьДеревоКатегорийИТиповТоваров(Знач IDКлиента, Знач КлючAPI, Знач Язык = "DEFAULT") Экспорт

    URL = "https://api-seller.ozon.ru/v1/description-category/tree";

    Заголовки = СоздатьЗаголовкиЗапроса(IDКлиента, КлючAPI);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("language", Язык, "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить характеристики категории
// Получает характеристики для указанной категории и типа товара
//
// Примечание:
// Если у dictionary_id значение 0, у атрибута нет вложенных справочников. Если значение другое, то справочники есть. Получить их можно методом ПолучитьЗначенияХарактеристик()
// Метод в документации API: [post /v1/description-category/attribute](@docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetAttributes)
//
// Параметры:
//  IDКлиента   - Строка        - Идентификатор клиента                                                      - clientid
//  КлючAPI     - Строка        - API ключ                                                                   - apikey
//  IDКатегории - Строка, Число - Идентификатор категории                                                    - categoryid
//  IDТипа      - Строка, Число - Идентификатор типа товара                                                  - typeid
//  Язык        - Строка        - Язык ответа: DEFAULT (русский), RU, EN, TR (турецкий), ZH_HANS (китайский) - lang
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция ПолучитьХарактеристикиКатегории(Знач IDКлиента
    , Знач КлючAPI
    , Знач IDКатегории
    , Знач IDТипа
    , Знач Язык = "DEFAULT") Экспорт

    URL = "https://api-seller.ozon.ru/v1/description-category/attribute";

    Заголовки = СоздатьЗаголовкиЗапроса(IDКлиента, КлючAPI);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("description_category_id", IDКатегории, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("type_id"                , IDТипа     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("language"               , Язык       , "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить значения характеристики
// Получает список доступных значений характеристики
//
// Примечание:
// Узнать, есть ли вложенный справочник, можно через метод ПолучитьХарактеристикиКатегории()
// Метод в документации API: [post /v1/description-category/attribute/values](@docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetAttributeValues)
//
// Параметры:
//  IDКлиента        - Строка        - Идентификатор клиента                                                      - clientid
//  КлючAPI          - Строка        - API ключ                                                                   - apikey
//  IDКатегории      - Строка, Число - Идентификатор категории                                                    - categoryid
//  IDТипа           - Строка, Число - Идентификатор типа товара                                                  - typeid
//  IDХарактеристики - Строка, Число - ID характеристики для получения значений                                   - attributeid
//  IDСправочника    - Строка, Число - ID первого справочника в ответе                                            - start
//  Язык             - Строка        - Язык ответа: DEFAULT (русский), RU, EN, TR (турецкий), ZH_HANS (китайский) - lang
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция ПолучитьЗначенияХарактеристики(Знач IDКлиента
    , Знач КлючAPI
    , Знач IDКатегории
    , Знач IDТипа
    , Знач IDХарактеристики
    , Знач IDСправочника = 1
    , Знач Язык = "DEFAULT") Экспорт

    URL = "https://api-seller.ozon.ru/v1/description-category/attribute/values";

    Заголовки = СоздатьЗаголовкиЗапроса(IDКлиента, КлючAPI);
    Лимит     = 200;

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("description_category_id", IDКатегории      , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("type_id"                , IDТипа           , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("attribute_id"           , IDХарактеристики , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("language"               , Язык             , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("limit"                  , Лимит            , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("last_value_id"          , IDСправочника - 1, "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Найти значения характеристики
// Получает справочные значения характеристики по заданному значению в запросе
//
// Примечание:
// Узнать, есть ли вложенный справочник, можно через метод ПолучитьХарактеристикиКатегории()
// Метод в документации API: [post /v1/description-category/attribute/values/search](@docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_SearchAttributeValues)
//
// Параметры:
//  IDКлиента        - Строка        - Идентификатор клиента                       - clientid
//  КлючAPI          - Строка        - API ключ                                    - apikey
//  IDКатегории      - Строка, Число - Идентификатор категории                     - categoryid
//  IDТипа           - Строка, Число - Идентификатор типа товара                   - typeid
//  IDХарактеристики - Строка, Число - ID характеристики для получения значений    - attributeid
//  Значение         - Строка        - Значение для поиска                         - value
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция НайтиЗначенияХарактеристики(Знач IDКлиента
    , Знач КлючAPI
    , Знач IDКатегории
    , Знач IDТипа
    , Знач IDХарактеристики
    , Знач Значение) Экспорт

    URL = "https://api-seller.ozon.ru/v1/description-category/attribute/values/search";

    Заголовки = СоздатьЗаголовкиЗапроса(IDКлиента, КлючAPI);
    Лимит     = 100;

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("description_category_id", IDКатегории      , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("type_id"                , IDТипа           , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("attribute_id"           , IDХарактеристики , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("limit"                  , Лимит            , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("value"                  , Значение         , "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область ЗагрузкаИОбновлениеТоваров

// Получить список товаров
// Получает список товаров с фильтром или без
//
// Примечание:
// Метод в документации API: [post /v2/product/list](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductList)
//
// Параметры:
//  IDКлиента    - Строка                     - Идентификатор клиента                                       - clientid
//  КлючAPI      - Строка                     - API ключ                                                    - apikey
//  Фильтр       - Структура Из КлючИЗначение - Фильтр выборки товаров. См. ПолучитьСтруктуруФильтраТоваров - filter
//  IDПоследнего - Строка, Число              - ID последнего значения (last_id) из предыдущего запроса     - last
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция ПолучитьСписокТоваров(Знач IDКлиента, Знач КлючAPI, Знач Фильтр = "", Знач IDПоследнего = 0) Экспорт

    URL = "https://api-seller.ozon.ru/v2/product/list";

    Заголовки = СоздатьЗаголовкиЗапроса(IDКлиента, КлючAPI);
    Лимит     = 200;

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("filter" , Фильтр      , "Коллекция", Параметры);
    OPI_Инструменты.ДобавитьПоле("limit"  , Лимит       , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("last_id", IDПоследнего, "Строка"   , Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Создать обновить товары
// Создает новые или обновляет существующие товары по структурам полей
//
// Примечание:
// Методы формирования структуры товара: ПолучитьСтруктуруТовара(), ДобавитьВидеоТовара(), ДобавитьВидеообложкуТовара()
// Метод в документации API: [post /v3/product/import](@docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsV3)
//
// Параметры:
//  IDКлиента     - Строка           - Идентификатор клиента                            - clientid
//  КлючAPI       - Строка           - API ключ                                         - apikey
//  МассивТоваров - Массив Из Строка - Массив или одна структура полей описания товара  - items
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция СоздатьОбновитьТовары(Знач IDКлиента, Знач КлючAPI, Знач МассивТоваров) Экспорт

    URL = "https://api-seller.ozon.ru/v3/product/import";

    Ответ = ОтправитьОписанияОбъектов(IDКлиента, КлючAPI, МассивТоваров, URL);

    Возврат Ответ;

КонецФункции

// Создать товары по Ozon ID
// Создаёт товар по указанному Ozon ID
//
// Примечание:
// Получить пустую структуру можно при помощи метода ПолучитьСокращеннуюСтруктуруТовара()
// Обновить товар по Ozon ID нельзя
// Метод в документации API: [post /v1/product/import-by-sku](@docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsBySKU)
//
// Параметры:
//  IDКлиента     - Строка           - Идентификатор клиента                                        - clientid
//  КлючAPI       - Строка           - API ключ                                                     - apikey
//  МассивТоваров - Массив Из Строка - Массив или одна сокращенная структура полей описания товара  - items
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция СоздатьТоварыПоOzonID(Знач IDКлиента, Знач КлючAPI, Знач МассивТоваров) Экспорт

    URL = "https://api-seller.ozon.ru/v1/product/import-by-sku";

    Ответ = ОтправитьОписанияОбъектов(IDКлиента, КлючAPI, МассивТоваров, URL);

    Возврат Ответ;

КонецФункции

// Обновить характеристики товаров
// Обновляет характеристики выбранных товаров
//
// Примечание:
// Получить пустую структуру можно при помощи метода ПолучитьСтруктуруОбновленияХарактеристик()
// Метод в документации API: [post /v1/product/attributes/update](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUpdateAttributes)
//
// Параметры:
//  IDКлиента           - Строка           - Идентификатор клиента                             - clientid
//  КлючAPI             - Строка           - API ключ                                          - apikey
//  МассивХарактеристик - Массив Из Строка - Массив или одна структура полей атрибутов товара  - items
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция ОбновитьХарактеристикиТоваров(Знач IDКлиента, Знач КлючAPI, Знач МассивХарактеристик) Экспорт

    URL = "https://api-seller.ozon.ru/v1/product/attributes/update";

    Ответ = ОтправитьОписанияОбъектов(IDКлиента, КлючAPI, МассивХарактеристик, URL);

    Возврат Ответ;

КонецФункции

// Получить статус добавления товара
// Получает статус добавления нового товара по ID задачи
//
// Примечание:
// Метод в документации API: [post /v1/product/import/info](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetImportProductsInfo)
//
// Параметры:
//  IDКлиента - Строка        - Идентификатор клиента       - clientid
//  КлючAPI   - Строка        - API ключ                    - apikey
//  IDЗадачи  - Строка, Число - ID задачи добавления товара - taskid
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Ozon Seller API
Функция ПолучитьСтатусДобавленияТовара(Знач IDКлиента, Знач КлючAPI, Знач IDЗадачи) Экспорт

    URL = "https://api-seller.ozon.ru/v1/product/import/info";

    Заголовки = СоздатьЗаголовкиЗапроса(IDКлиента, КлючAPI);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("task_id", IDЗадачи, "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить структуру товара
// Получает структуру стандартных полей товара
//
// Примечание:
// Эту структуру необходимо дополнить полями, зависящими от категории товара из ПолучитьХарактеристикиКатегории()
// Первая картинка в массиве картинок (поле images) будет основной
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей товара
Функция ПолучитьСтруктуруТовара(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураТовара = Новый Структура;
    СтруктураТовара.Вставить("description_category_id", "<ID категории товара>");
    СтруктураТовара.Вставить("name"                   , "<имя товара>");
    СтруктураТовара.Вставить("offer_id"               , "<артикул>");
    СтруктураТовара.Вставить("barcode"                , "<штрихкод>");
    СтруктураТовара.Вставить("price"                  , "<цена>");
    СтруктураТовара.Вставить("old_price"              , "<старая цена>");
    СтруктураТовара.Вставить("vat"                    , "<ставка ндс, например 0.2>");
    СтруктураТовара.Вставить("height"                 , "<высота>");
    СтруктураТовара.Вставить("width"                  , "<ширина>");
    СтруктураТовара.Вставить("depth"                  , "<глубина>");
    СтруктураТовара.Вставить("dimension_unit"         , "<единица измерения для размеров, например mm>");
    СтруктураТовара.Вставить("weight"                 , "<вес>");
    СтруктураТовара.Вставить("weight_unit"            , "<единица измерения для веса, например g>");
    СтруктураТовара.Вставить("images"                 , "<массив URL картинок товара>");
    СтруктураТовара.Вставить("images360"              , "<массив URL картинок 360>");
    СтруктураТовара.Вставить("color_image"            , "<маркетинговый цвет для картинок>");

    Если Пустая Тогда
        Для Каждого Поле Из СтруктураТовара Цикл
            Поле.Значение = "";
        КонецЦикла;
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураТовара;

КонецФункции

// Получить сокращенную структуру товара
// Получает структуру для создания товара на основе Ozon ID в функции СоздатьТоварыПоOzonID()
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей товара
Функция ПолучитьСокращеннуюСтруктуруТовара(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураТовара = Новый Структура;

    СтруктураТовара.Вставить("name"         , "<наименование>");
    СтруктураТовара.Вставить("sku"          , "<идентификатор товара в системе Ozon>");
    СтруктураТовара.Вставить("offer_id"     , "<артикул>");
    СтруктураТовара.Вставить("price"        , "<цена>");
    СтруктураТовара.Вставить("old_price"    , "<старая цена>");
    СтруктураТовара.Вставить("vat"          , "<ставка ндс, например 0.2>");
    СтруктураТовара.Вставить("currency_code", "<валюта>");

    Если Пустая Тогда
        Для Каждого Поле Из СтруктураТовара Цикл
            Поле.Значение = "";
        КонецЦикла;
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураТовара;

КонецФункции

// Получить структуру обновления характеристик
// Получает структуру для обновления характеристик товара в функции ОбновитьХарактеристикиТоваров()
//
// Примечание:
// Характеристики представляют из себя структуры с полями complex_id, id и массивом values. Для их быстрого создания есть метод ДополнитьКомплексныйАтрибут()
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей товара
Функция ПолучитьСтруктуруОбновленияХарактеристик(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураТовара = Новый Структура;

    СтруктураТовара.Вставить("offer_id"  , "<артикул>");
    СтруктураТовара.Вставить("attributes", "<массив обновляемых атрибутов>");

    Если Пустая Тогда
        Для Каждого Поле Из СтруктураТовара Цикл
            Поле.Значение = "";
        КонецЦикла;
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураТовара;

КонецФункции

// Получить структуру фильтра товаров
// Получает структуру для отбора списка товаров в функции ПолучитьСписокТоваров
//
// Примечание:
// Описание полей фильтра можно найти на странице документации по получению списка товаров: [post /v2/product/list](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductList)
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей фильра
Функция ПолучитьСтруктуруФильтраТоваров(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураТовара = Новый Структура;

    СтруктураТовара.Вставить("offer_id"  , "<массив артинкулов>");
    СтруктураТовара.Вставить("product_id", "<массив ID товаров>");
    СтруктураТовара.Вставить("visibility", "<видимость>");

    Если Пустая Тогда
        Для Каждого Поле Из СтруктураТовара Цикл
            Поле.Значение = "";
        КонецЦикла;
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураТовара;

КонецФункции

// Добавить видео товара
// Добавляет видео к атрибутам товара
//
// Примечание:
// В 1С метод может использоваться как процедура, без получения возвращаемого значения. Возвращаемое значение необходимо для CLI версии
//
// Параметры:
//  СтруктураТовара - Структура Из Строка - Основная структура полей товара. См. ПолучитьСтруктуруТовара - item
//  URL             - Строка              - URL к видео для добавления                                   - url
//  Наименование    - Строка              - Техническое наименование видео                               - title
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей товара с добавленным видео
Функция ДобавитьВидеоТовара(СтруктураТовара, Знач URL, Знач Наименование) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(СтруктураТовара);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);

    ОбъектВидео           = Новый Структура();
    СтруктураURL          = Новый Структура("value", URL);
    СтруктураНаименования = Новый Структура("value", Наименование);

    ДополнитьКомплексныйАтрибут(ОбъектВидео, 21841, 100001, СтруктураURL);
    ДополнитьКомплексныйАтрибут(ОбъектВидео, 21837, 100001, СтруктураНаименования);

    Если Не СтруктураТовара.Свойство("complex_attributes") Тогда
        СтруктураТовара.Вставить("complex_attributes", Новый Массив);
    КонецЕсли;

    СтруктураТовара["complex_attributes"].Добавить(ОбъектВидео);

    //@skip-check constructor-function-return-section
    Возврат СтруктураТовара;

КонецФункции

// Добавить видеообложку товара
// Добавляет видеообложку к атрибутам товара
//
// Примечание:
// В 1С метод может использоваться как процедура, без получения возвращаемого значения. Возвращаемое значение необходимо для CLI версии
//
// Параметры:
//  СтруктураТовара - Структура Из Строка - Основная структура полей товара. См. ПолучитьСтруктуруТовара - item
//  URL             - Строка              - URL к видеообложке для добавления                            - url
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей товара с добавленным видео
Функция ДобавитьВидеообложкуТовара(СтруктураТовара, Знач URL) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(СтруктураТовара);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);

    ОбъектОбложка  = Новый Структура();
    СтруктураURL   = Новый Структура("dictionary_value_id,value", 0, URL);

    ДополнитьКомплексныйАтрибут(ОбъектОбложка, 21845, 100002, СтруктураURL);

    Если Не СтруктураТовара.Свойство("complex_attributes") Тогда
        СтруктураТовара.Вставить("complex_attributes", Новый Массив);
    КонецЕсли;

    СтруктураТовара["complex_attributes"].Добавить(ОбъектОбложка);

    //@skip-check constructor-function-return-section
    Возврат СтруктураТовара;

КонецФункции

// Дополнить комплексный атрибут
// Оформляет значение в формате атрибута и добавляет его в массив attributes переданной коллекции
//
// Примечание:
// В 1С метод может использоваться как процедура, без получения возвращаемого значения. Возвращаемое значение необходимо для CLI версии
//
// Параметры:
//  Коллекция     - Структура Из Строка - Структура комплексного атрибута или структура товара - object
//  IDАтрибута    - Строка, Число       - ID атрибута                                          - attributeid
//  КомплексныйID - Строка, Число       - Комплексный ID                                       - complexid
//  Значения      - Произвольный        - Значение или массив значений для добавления в values - values
//
// Возвращаемое значение:
//  Структура - Коллекция, дополненная атрибутом
Функция ДополнитьКомплексныйАтрибут(Коллекция, Знач IDАтрибута, Знач КомплексныйID, Знач Значения) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьМассив(Значения);

    СтруктураАтрибута = Новый Структура("id,complex_id,values", IDАтрибута, КомплексныйID, Значения);

    Если Не Коллекция.Свойство("attributes") Тогда
        Коллекция.Вставить("attributes", Новый Массив);
    КонецЕсли;

    Коллекция["attributes"].Добавить(СтруктураАтрибута);

    //@skip-check constructor-function-return-section
    Возврат Коллекция;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СоздатьЗаголовкиЗапроса(Знач IDКлиента, Знач КлючAPI)

    Заголовки = Новый Соответствие;

    OPI_Инструменты.ДобавитьПоле("Client-Id", IDКлиента, "Строка", Заголовки);
    OPI_Инструменты.ДобавитьПоле("Api-Key"  , КлючAPI  , "Строка", Заголовки);

    Возврат Заголовки;

КонецФункции

Функция ОтправитьОписанияОбъектов(Знач IDКлиента, Знач КлючAPI, Знач МассивОбъектов, Знач URL)

    Заголовки = СоздатьЗаголовкиЗапроса(IDКлиента, КлючAPI);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("items", МассивОбъектов, "Массив", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти
