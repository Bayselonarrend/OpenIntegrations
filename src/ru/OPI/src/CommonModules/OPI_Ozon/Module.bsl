// OneScript: ./OInt/core/Modules/OPI_VKTeams.os
// Lib: VKTeams
// CLI: vkteams

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
