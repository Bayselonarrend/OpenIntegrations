// OneScript: ./OInt/core/Modules/OPI_Ozon.os
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
// #Использовать "../../tools"

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

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СоздатьЗаголовкиЗапроса(Знач IDКлиента, Знач КлючAPI)

    Заголовки = Новый Соответствие;

    OPI_Инструменты.ДобавитьПоле("Client-Id", IDКлиента, "Строка", Заголовки);
    OPI_Инструменты.ДобавитьПоле("Api-Key"  , КлючAPI  , "Строка", Заголовки);

    Возврат Заголовки;

КонецФункции

#КонецОбласти
