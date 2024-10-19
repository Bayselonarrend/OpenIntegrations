﻿// OneScript: ./OInt/core/Modules/OPI_CDEK.os
// Lib: CDEK
// CLI: cdek

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
// BSLLS:LatinAndCyrillicSymbolInWord-off
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

#Область ОбщиеМетоды

// Получить токен
// Получает токен на основе идентификатора аккаунта и пароля
//
// Примечание:
// Метод в документации API: [Авторизация клиентов](@api-docs.cdek.ru/29923918.html)
//
// Параметры:
//  Аккаунт     - Строка - Идентификатор клиента (Account)              - account
//  Пароль      - Строка - Секретный ключ (Password)                    - pass
//  ТестовыйAPI - Булево - Флаг использования API для тестовых запросов - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция ПолучитьТокен(Знач Аккаунт, Знач Пароль, ТестовыйAPI = Ложь) Экспорт

    URL = СформироватьURL("/oauth/token", ТестовыйAPI);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("grant_type"   , "client_credentials", "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("client_id"    , Аккаунт             , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("client_secret", Пароль              , "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, , Ложь);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСЗаказми

// Создать заказ
// Создает заказ по описанию полей
//
// Примечание:
// Метод в документации API: [Регистрация заказа](@api-docs.cdek.ru/29923926.html)
//
// Параметры:
//  Токен           - Строка                     - Токен авторизации                              - token
//  ОписаниеЗаказа  - Структура Из КлючИЗначение - Набор полей заказа. См. ПолучитьОписаниеЗаказа - order
//  ИнтернетМагазин - Булево                     - Признак типа заказа Интернет магазин           - ostore
//  ТестовыйAPI     - Булево                     - Флаг использования API для тестовых запросов   - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция СоздатьЗаказ(Знач Токен, Знач ОписаниеЗаказа, Знач ИнтернетМагазин = Ложь, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(ОписаниеЗаказа);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ИнтернетМагазин);

    URL       = СформироватьURL("/orders", ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    OPI_Инструменты.ДобавитьПоле("type", ?(ИнтернетМагазин, 1, 2), "Число", ОписаниеЗаказа);

    Ответ = OPI_Инструменты.Post(URL, ОписаниеЗаказа, Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить заказ
// Изменяет значения полей выбранного заказа
//
// Примечание:
// Метод в документации API: [Изменение заказа](@api-docs.cdek.ru/36981178.html)
//
// Параметры:
//  Токен           - Строка                     - Токен авторизации                              - token
//  UUID            - Строка                     - UUID заказа для изменение                      - uuid
//  ОписаниеЗаказа  - Структура Из КлючИЗначение - Набор изменяемых полей заказа                  - order
//  ТестовыйAPI     - Булево                     - Флаг использования API для тестовых запросов   - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция ИзменитьЗаказ(Знач Токен, Знач UUID, Знач ОписаниеЗаказа, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(ОписаниеЗаказа);

    URL       = СформироватьURL("/orders", ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    OPI_Инструменты.ДобавитьПоле("uuid", UUID, "Строка", ОписаниеЗаказа);

    Ответ = OPI_Инструменты.Patch(URL, ОписаниеЗаказа, Заголовки);

    Возврат Ответ;

КонецФункции

// Удалить заказ
// Удаляет заказ по UUID
//
// Примечание:
// Метод в документации API: [Удаление заказа](@api-docs.cdek.ru/29924487.html)
//
// Параметры:
//  Токен       - Строка - Токен авторизации                              - token
//  UUID        - Строка - UUID заказа для удаления                       - uuid
//  ТестовыйAPI - Булево - Флаг использования API для тестовых запросов   - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция УдалитьЗаказ(Знач Токен, Знач UUID, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(UUID);

    URL       = СформироватьURL("/orders/" + UUID, ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Ответ = OPI_Инструменты.Delete(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Получить заказ
// Получает заказ по UUID
//
// Примечание:
// Метод в документации API: [Информация о заказе](@api-docs.cdek.ru/29923975.html)
//
// Параметры:
//  Токен       - Строка - Токен авторизации                            - token
//  UUID        - Строка - UUID заказа                                  - uuid
//  ТестовыйAPI - Булево - Флаг использования API для тестовых запросов - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция ПолучитьЗаказ(Знач Токен, Знач UUID, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(UUID);

    URL       = СформироватьURL("/orders/" + UUID, ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Ответ = OPI_Инструменты.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Получить заказ по номеру
// Получает заказ по номеру СДЭК или внутреннему номеру клиента
//
// Примечание:
// Метод в документации API: [Информация о заказе](@api-docs.cdek.ru/29923975.html)
//
// Параметры:
//  Токен       - Строка - Токен авторизации                                                   - token
//  НомерЗаказа - Строка - Номер заказа                                                        - number
//  Внутренний  - Булево - Вид номера заказа. Истина > номер в базе клиента, Ложь > номер СДЭК - internal
//  ТестовыйAPI - Булево - Флаг использования API для тестовых запросов                        - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция ПолучитьЗаказПоНомеру(Знач Токен, Знач НомерЗаказа, Знач Внутренний = Ложь, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Внутренний);

    URL          = СформироватьURL("/orders", ТестовыйAPI);
    Заголовки    = СоздатьЗаголовкиЗапроса(Токен);

    ИмяПараметра = ?(Внутренний, "im_number", "cdek_number");

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле(ИмяПараметра, НомерЗаказа, "Строка", Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Оформить клиентский возврат
// Оформляет клиентский возврат для заказа интернет магазина
//
// Примечание:
// Этот метод используется в случае, если прямой заказ доставлялся СДЭК и получатель хочет вернуть его полностью
// Если заказ доставлялся другой службой, либо нужно вернуть не все товары, то необходимо использовать метод СоздатьЗаказ с is_client_return = true
// Метод в документации API: [Клиентские возвраты](@api-docs.cdek.ru/122762174.html)
//
// Параметры:
//  Токен       - Строка - Токен авторизации                             - token
//  UUID        - Строка - UUID заказа                                   - uuid
//  Тариф       - Число  - Код тарифа (из доступных по договору)         - tariff
//  ТестовыйAPI - Булево - Флаг использования API для тестовых запросов  - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция ОформитьКлиентскийВозврат(Знач Токен, Знач UUID, Знач Тариф, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(UUID);

    URL       = СформироватьURL("/orders/" + UUID + "/clientReturn", ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("tariff_code", Тариф, "Число", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Создать отказ
// Создает отказ по заказу для возврата в интернет магазин
//
// Примечание:
// Метод в документации API: [Регистрация отказа](@api-docs.cdek.ru/55327658.html)
//
// Параметры:
//  Токен       - Строка - Токен авторизации                             - token
//  UUID        - Строка - UUID заказа                                   - uuid
//  ТестовыйAPI - Булево - Флаг использования API для тестовых запросов  - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция СоздатьОтказ(Знач Токен, Знач UUID, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(UUID);

    URL       = СформироватьURL("/orders/" + UUID + "/refusal", ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Ответ = OPI_Инструменты.Post(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Сформировать квитанцию
// Формирует квитанции в формате pdf к заказам
//
// Примечание:
// Доступные типы (языки) квитанций: tpl_china, tpl_armenia, tpl_russia, tpl_english, tpl_italian, tpl_korean, tpl_latvian, tpl_lithuanian, tpl_german, tpl_turkish, tpl_czech, tpl_thailand, tpl_invoice
// Рекомендуется указывать не менее 2 копий на листе (параметр КопийНаЛисте): одна приклеивается на груз, вторая остается у отправителя
// Метод в документации API: [Формирование квитанции к заказу](@api-docs.cdek.ru/36967276.html)
//
// Параметры:
//  Токен        - Строка                   - Токен авторизации                             - token
//  МассивUUID   - Строка, Массив Из Строка - Один или массив UUID заказов                  - uuids
//  Тип          - Строка                   - Тип (язык) квитанции                          - type
//  КопийНаЛисте - Число                    - Число копий одной квитанции на листе          - count
//  ТестовыйAPI  - Булево                   - Флаг использования API для тестовых запросов  - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция СформироватьКвитанцию(Знач Токен
    , Знач МассивUUID
    , Знач Тип = "tpl_russia"
    , Знач КопийНаЛисте = 2
    , Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьМассив(МассивUUID);

    URL       = СформироватьURL("/print/orders", ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Параметры     = Новый Структура;
    МассивЗаказов = Новый Массив;

    Для Каждого UUID Из МассивUUID Цикл

        OPI_ПреобразованиеТипов.ПолучитьСтроку(UUID);
        МассивЗаказов.Добавить(Новый Структура("order_uuid", UUID));

    КонецЦикла;

    OPI_Инструменты.ДобавитьПоле("orders"    , МассивЗаказов, "Массив", Параметры);
    OPI_Инструменты.ДобавитьПоле("copy_count", КопийНаЛисте , "Число" , Параметры);
    OPI_Инструменты.ДобавитьПоле("type"      , Тип          , "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить квитанцию
// Получает квитанцию к заказу
//
// Примечание:
// Квитанция должна быть предварительно создана. См. СформироватьКвитанцию
// Ссылка на файл с квитанцией к заказам доступна в течение 1 часа
// Метод в документации API: [Получение квитанции к заказу](@api-docs.cdek.ru/36967287.html)
//
// Параметры:
//  Токен        - Строка - Токен авторизации                                                         - token
//  UUID         - Строка - UUID квитанции, полученный при ее формировании                            - uuid
//  ПолучитьФайл - Булево - Истина > будут получены сразу данные PDF файла, Ложь > ответ сервера CDEK - getfile
//  ТестовыйAPI  - Булево - Флаг использования API для тестовых запросов                              - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение, ДвоичныеДанные - сериализованный JSON ответа от CDEK или PDF файл
Функция ПолучитьКвитанцию(Знач Токен, Знач UUID, Знач ПолучитьФайл = Ложь, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(UUID);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ПолучитьФайл);

    URL       = СформироватьURL("/print/orders/" + UUID, ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Ответ = OPI_Инструменты.Get(URL, , Заголовки);

    Если ПолучитьФайл Тогда

        Содержимое = Ответ["entity"];

        Если Не ЗначениеЗаполнено(Содержимое) Тогда
            Возврат Ответ;
        КонецЕсли;

        URL = Содержимое["url"];

        Если Не ЗначениеЗаполнено(URL) Тогда
            Возврат Ответ;
        КонецЕсли;

        Ответ = OPI_Инструменты.Get(URL, , Заголовки);

    КонецЕсли;

    Возврат Ответ;

КонецФункции

// Получить описание заказа
// Получает макет для создания заказа в функции СоздатьЗаказ
//
// Примечание:
// Обязательность реквизитов может зависить от типа зказа или вложенности. Обязательно ознакомьтесь с документацией CDEK
// Описания полей в документации: [Регистрация заказа](@api-docs.cdek.ru/29923926.html)
//
// Параметры:
//  Пустая             - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//  ТолькоОбязательные - Булево - Истина > в макете будут только обязательные поля                                 - required
//  ИнтернетМагазин    - Булево - Признак включения в макет полей исключительно для заказо Интернет магазина       - ostore
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьОписаниеЗаказа(Знач Пустая = Ложь, Знач ТолькоОбязательные = Ложь, Знач ИнтернетМагазин = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ТолькоОбязательные);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ИнтернетМагазин);

    СтруктураЗаказа = Новый Структура;

    СтруктураЗаказа.Вставить("tariff_code" , "<Код тарифа (подробнее см. приложение 1)>");

        СтруктураПолучателя = Новый Структура;
        СтруктураПолучателя.Вставить("company"               , "<Название компании>");
        СтруктураПолучателя.Вставить("name"                  , "<ФИО контактного лица>");
        СтруктураПолучателя.Вставить("passport_series"       , "<Серия паспорта>");
        СтруктураПолучателя.Вставить("passport_number"       , "<Номер паспорта>");
        СтруктураПолучателя.Вставить("passport_date_of_issue", "<Дата выдачи паспорта>");
        СтруктураПолучателя.Вставить("passport_organization" , "<Орган выдачи паспорта>");
        СтруктураПолучателя.Вставить("tin"                   , "<ИНН>");
        СтруктураПолучателя.Вставить("passport_date_of_birth", "<Дата рождения>");
        СтруктураПолучателя.Вставить("email"                 , "<Email как RFC 2822>");
        СтруктураПолучателя.Вставить("contragent_type"       , "<Тип отправителя: LEGAL_ENTITY, INDIVIDUAL >");

            МассивТелефонов   = Новый Массив;
            СтруктураТелефона = Новый Структура;

            СтруктураТелефона.Вставить("number"    , "<Номер телефона>");
            СтруктураТелефона.Вставить("additional", "<Дополнительная информация (добавочный номер)>");

            МассивТелефонов.Добавить(СтруктураТелефона);

        СтруктураПолучателя.Вставить("phones", МассивТелефонов);

    СтруктураЗаказа.Вставить("recipient", СтруктураПолучателя);

        МассивУпаковок    = Новый Массив;
        СтруктураУпаковки = Новый Структура;

        СтруктураУпаковки.Вставить("number" , "<Номер упаковки>");
        СтруктураУпаковки.Вставить("weight" , "<Общий вес (в граммах)>");
        СтруктураУпаковки.Вставить("length" , "<Габариты упаковки. Длина (в сантиметрах)>");
        СтруктураУпаковки.Вставить("width"  , "<Габариты упаковки. Ширина (в сантиметрах)>");
        СтруктураУпаковки.Вставить("height" , "<Габариты упаковки. Высота (в сантиметрах)>");
        СтруктураУпаковки.Вставить("comment", "<Комментарий к упаковке>");

            МассивПозиций    = Новый Массив;
            СтруктураПозиции = Новый Структура;

            СтруктураПозиции.Вставить("name"    , "<Наименование товара>");
            СтруктураПозиции.Вставить("ware_key", "<Идентификатор/артикул товара>");
            СтруктураПозиции.Вставить("marking" , "<Маркировка товара>");

                СтруктураОплаты = Новый Структура;
                СтруктураОплаты.Вставить("value"   , "<Сумма наложенного платежа, в том числе и НДС>");
                СтруктураОплаты.Вставить("vat_sum" , "<Сумма НДС>");
                СтруктураОплаты.Вставить("vat_rate", "<Ставка НДС (значение - 0, 10, 12, 20, null - нет НДС)>");

            СтруктураПозиции.Вставить("payment"     , СтруктураОплаты);
            СтруктураПозиции.Вставить("cost"        , "<Объявленная стоимость товара>");
            СтруктураПозиции.Вставить("weight"      , "<Вес (за единицу товара, в граммах)>");
            СтруктураПозиции.Вставить("weight_gross", "<Вес брутто>");
            СтруктураПозиции.Вставить("amount"      , "<Количество единиц товара (в штуках)>");
            СтруктураПозиции.Вставить("name_i18n"   , "<Наименование на иностранном языке>");
            СтруктураПозиции.Вставить("brand"       , "<Бренд на иностранном языке>");
            СтруктураПозиции.Вставить("country_code", "<Код страны производителя товара ISO_3166-1_alpha-2>");
            СтруктураПозиции.Вставить("material"    , "<Код материала>");
            СтруктураПозиции.Вставить("wifi_gsm"    , "<Содержит wifi или gsm>");
            СтруктураПозиции.Вставить("url"         , "<Ссылка на сайт интернет-магазина с описанием товара>");

            МассивПозиций.Добавить(СтруктураПозиции);

        СтруктураУпаковки.Вставить("items", МассивПозиций);
        МассивУпаковок.Добавить(СтруктураУпаковки);

    СтруктураЗаказа.Вставить("packages", МассивУпаковок);

    Если Не ТолькоОбязательные Тогда

        СтруктураЗаказа.Вставить("additional_order_types" , "<Дополнительный тип заказа>");
        СтруктураЗаказа.Вставить("comment"                , "<Комментарий к заказу>");
        СтруктураЗаказа.Вставить("developer_key"          , "<Ключ разработчика (для разработчиков модулей)>");
        СтруктураЗаказа.Вставить("shipment_point"         , "<Код ПВЗ СДЭК для самостоятельного привоза клиентом>");
        СтруктураЗаказа.Вставить("delivery_point"         , "<Код офиса СДЭК, на который будет доставлена посылка>");
        СтруктураЗаказа.Вставить("date_invoice"           , "<Дата инвойса>");
        СтруктураЗаказа.Вставить("shipper_name"           , "<Грузоотправитель>");
        СтруктураЗаказа.Вставить("shipper_address"        , "<Адрес грузоотправителя>");

            СтруктураОтправителя = Новый Структура;
            СтруктураОтправителя.Вставить("company"                , "<Название компании>");
            СтруктураОтправителя.Вставить("name"                   , "<ФИО контактного лица>");
            СтруктураОтправителя.Вставить("email"                  , "<Email для оповещений RFC 2822>");
            СтруктураОтправителя.Вставить("passport_series"        , "<Серия паспорта>");
            СтруктураОтправителя.Вставить("passport_number"        , "<Номер паспорта>");
            СтруктураОтправителя.Вставить("passport_date_of_issue" , "<Дата выдачи паспорта>");
            СтруктураОтправителя.Вставить("passport_organization"  , "<Орган выдачи паспорта>");
            СтруктураОтправителя.Вставить("tin"                    , "<ИНН>");
            СтруктураОтправителя.Вставить("passport_date_of_birth" , "<Дата рождения>");
            СтруктураОтправителя.Вставить("contragent_type"        , "<Тип отправителя: LEGAL_ENTITY, INDIVIDUAL>");

                МассивТелефонов   = Новый Массив;
                СтруктураТелефона = Новый Структура;

                СтруктураТелефона.Вставить("number"    , "<Номер телефона>");
                СтруктураТелефона.Вставить("additional", "<Дополнительная информация (добавочный номер)>");

                МассивТелефонов.Добавить(СтруктураТелефона);

            СтруктураОтправителя.Вставить("phones", МассивТелефонов);

        СтруктураЗаказа.Вставить("sender", СтруктураОтправителя);

            СтруктураАдреса = Новый Структура;
            СтруктураАдреса.Вставить("code"        , "<Код населенного пункта СДЭК>");
            СтруктураАдреса.Вставить("fias_guid"   , "<Уникальный идентификатор ФИАС>");
            СтруктураАдреса.Вставить("postal_code" , "<Почтовый индекс>");
            СтруктураАдреса.Вставить("longitude"   , "<Долгота>");
            СтруктураАдреса.Вставить("latitude"    , "<Широта>");
            СтруктураАдреса.Вставить("country_code", "<Код страны в формате  ISO_3166-1_alpha-2>");
            СтруктураАдреса.Вставить("region"      , "<Название региона, уточняющий параметр для поля city>");
            СтруктураАдреса.Вставить("region_code" , "<Код региона СДЭК, уточняющий параметр для поля city>");
            СтруктураАдреса.Вставить("sub_region"  , "<Название района региона, уточняющий параметр для поля region>");
            СтруктураАдреса.Вставить("city"        , "<Название города, уточняющий параметр для postal_code>");
            СтруктураАдреса.Вставить("kladr_code"  , "<Код КЛАДР>");
            СтруктураАдреса.Вставить("address"     , "<Строка адреса >");

        СтруктураЗаказа.Вставить("from_location", СтруктураАдреса);
        СтруктураЗаказа.Вставить("to_location"  , СтруктураАдреса);

            СтруктураУслуги = Новый Структура;
            СтруктураУслуги.Вставить("code"     , "<Тип дополнительной услуги>");
            СтруктураУслуги.Вставить("parameter", "<Параметр дополнительной услуги>");

        СтруктураЗаказа.Вставить("services"           , СтруктураУслуги);
        СтруктураЗаказа.Вставить("print"              , "<Необходимость сформировать печатную форму>");
        СтруктураЗаказа.Вставить("is_client_return"   , "<Клиентский возврат>");
        СтруктураЗаказа.Вставить("accompanying_number", "<Номер сопроводительной накладной>");
        СтруктураЗаказа.Вставить("widget_token"       , "<Токен, полученный от widget.cdek.ru>");

        Если ИнтернетМагазин Тогда

            СтруктураЗаказа.Вставить("number", "<Номер заказа в ИС Клиента (uuid, если не заполнено)>");

                СтруктураСбора = Новый Структура;
                СтруктураСбора.Вставить("value"   , "<Сумма дополнительного сбора (в том числе и НДС)>");
                СтруктураСбора.Вставить("vat_sum" , "<Сумма НДС>");
                СтруктураСбора.Вставить("vat_rate", "<Ставка НДС (значение - 0, 10, 12, 20, null - нет НДС)>");

            СтруктураЗаказа.Вставить("delivery_recipient_cost", СтруктураСбора);

                МассивПорогов   = Новый Массив;
                СтруктураПорога = Новый Структура;

                СтруктураПорога.Вставить("threshold", "<Порог стоимости товара в целых единицах валюты>");
                СтруктураПорога.Вставить("sum"      , "<Доп. сбор за доставку товаров, общая стоимость которых в интервале>");
                СтруктураПорога.Вставить("vat_sum"  , "<Сумма НДС, включённая в доп. сбор за доставку>");
                СтруктураПорога.Вставить("vat_rate" , "<Ставка НДС (значение - 0, 10, 12, 20, null - нет НДС)>");

                МассивПорогов.Добавить(СтруктураПорога);

            СтруктураЗаказа.Вставить("delivery_recipient_cost_adv", МассивПорогов);

                СтруктураПродавца = Новый Структура;
                СтруктураПродавца.Вставить("name"          , "<Наименование истинного продавца>");
                СтруктураПродавца.Вставить("inn"           , "<ИНН истинного продавца>");
                СтруктураПродавца.Вставить("phone"         , "<Телефон истинного продавца>");
                СтруктураПродавца.Вставить("ownership_form", "<Код формы собственности>");
                СтруктураПродавца.Вставить("address"       , "<Адрес истинного продавца>");

            СтруктураЗаказа.Вставить("seller", СтруктураПродавца);

        КонецЕсли;

    КонецЕсли;

    Если Пустая Тогда
        СтруктураЗаказа = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураЗаказа);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураЗаказа;

КонецФункции

#КонецОбласти

#Область РаботаСЗаявкамиНаВызовКурьера

// Создать заявку на вызов курьера
// Создает новую заявку на вызов курьера для забора груза
//
// Примечание:
// Метод в документации API: [Регистрация отказа](@api-docs.cdek.ru/55327658.html)
//
// Параметры:
//  Токен          - Строка - Токен авторизации                                                      - token
//  ОписаниеЗаявки - Структура Из КлючИЗначение - Описание заявки. См. ПолучитьОписаниеЗаявкиКурьера - intake
//  ТестовыйAPI    - Булево - Флаг использования API для тестовых запросов                           - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция СоздатьЗаявкуНаВызовКурьера(Знач Токен, Знач ОписаниеЗаявки, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(ОписаниеЗаявки);

    URL       = СформироватьURL("/intakes", ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Ответ = OPI_Инструменты.Post(URL, ОписаниеЗаявки, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить заявку на вызов курьера
// Получает заявку на вызов курьера по UUID
//
// Примечание:
// Метод в документации API: [Информация о заявке](@api-docs.cdek.ru/29948360.html)
//
// Параметры:
//  Токен        - Строка - Токен авторизации                             - token
//  UUID         - Строка - UUID заявки                                   - uuid
//  ТестовыйAPI  - Булево - Флаг использования API для тестовых запросов  - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция ПолучитьЗаявкуНаВызовКурьера(Знач Токен, Знач UUID, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(UUID);

    URL       = СформироватьURL("/intakes/" + UUID, ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Ответ = OPI_Инструменты.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Удалить заявку на вызов курьера
//
// Примечание:
// Метод в документации API: [Удаление заявки](@api-docs.cdek.ru/29948379.html)
//
// Параметры:
//  Токен        - Строка - Токен авторизации                             - token
//  UUID         - Строка - UUID заявки для удаления                      - uuid
//  ТестовыйAPI  - Булево - Флаг использования API для тестовых запросов  - testapi
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция УдалитьЗаявкуНаВызовКурьера(Знач Токен, Знач UUID, Знач ТестовыйAPI = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(UUID);

    URL       = СформироватьURL("/intakes/" + UUID, ТестовыйAPI);
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Ответ = OPI_Инструменты.Delete(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Получить описание заявки курьера
// Получает макет для создания заявки на вызов курьера в функции СоздатьЗаявкуНаВызовКурьера
//
// Примечание:
// Обязательность реквизитов может зависить от типа зказа или вложенности. Обязательно ознакомьтесь с документацией CDEK
// Описания полей в документации: [Регистрация заявки на вызов курьера](@api-docs.cdek.ru/29925274.html)
//
// Параметры:
//  Пустая             - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//  ТолькоОбязательные - Булево - Истина > в макете будут только обязательные поля                                 - required
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьОписаниеЗаявкиКурьера(Знач Пустая = Ложь, Знач ТолькоОбязательные = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ТолькоОбязательные);

    СтруктураЗаявки = Новый Структура;

    СтруктураЗаявки.Вставить("intake_date"      , "<Дата ожидания курьера>");
    СтруктураЗаявки.Вставить("intake_time_from" , "<Время начала ожидания курьера>");
    СтруктураЗаявки.Вставить("intake_time_to"   , "<Время окончания ожидания курьера>");

    Если Не ТолькоОбязательные Тогда

        СтруктураЗаявки.Вставить("cdek_number"              , "<Номер заказа СДЭК>");
        СтруктураЗаявки.Вставить("order_uuid"               , "<Идентификатор заказа в ИС СДЭК>");
        СтруктураЗаявки.Вставить("lunch_time_from"          , "<Время начала обеда>");
        СтруктураЗаявки.Вставить("lunch_time_to"            , "<Время окончания обеда>");
        СтруктураЗаявки.Вставить("name"                     , "<Описание груза>");
        СтруктураЗаявки.Вставить("weight"                   , "<Общий вес (в граммах)>");
        СтруктураЗаявки.Вставить("length"                   , "<Габариты упаковки. Длина (в сантиметрах)>");
        СтруктураЗаявки.Вставить("width"                    , "<Габариты упаковки. Ширина (в сантиметрах)>");
        СтруктураЗаявки.Вставить("height"                   , "<Габариты упаковки. Высота (в сантиметрах)>");
        СтруктураЗаявки.Вставить("comment"                  , "<Комментарий к заявке для курьера>");
        СтруктураЗаявки.Вставить("need_call"                , "<Необходим прозвон отправителя>");
        СтруктураЗаявки.Вставить("courier_power_of_attorney", "<Курьеру необходима доверенность>");
        СтруктураЗаявки.Вставить("courier_identity_card"    , "<Курьеру необходим документ удостоверяющий личность>");

            СтруктураОтправителя = Новый Структура;
            СтруктураОтправителя.Вставить("company"        , "<Название компании отправителя>");
            СтруктураОтправителя.Вставить("name"           , "<ФИО контактного лица>");
            СтруктураОтправителя.Вставить("contragent_type", "<Тип отправителя: LEGAL_ENTITY, INDIVIDUAL>");

                МассивТелефонов = Новый Массив;

                СтруктураТелефона = Новый Структура;
                СтруктураТелефона.Вставить("number"    , "<Номер телефона>");
                СтруктураТелефона.Вставить("additional", "<Дополнительная информация (добавочный номер)>");

                МассивТелефонов.Добавить(СтруктураТелефона);

            СтруктураОтправителя.Вставить("phones", МассивТелефонов);

        СтруктураЗаявки.Вставить("sender" , СтруктураОтправителя);

            СтруктураАдресаОтправления = Новый Структура;
            СтруктураАдресаОтправления.Вставить("code"        , "<Код населенного пункта СДЭК>");
            СтруктураАдресаОтправления.Вставить("fias_guid"   , "<Уникальный идентификатор ФИАС>");
            СтруктураАдресаОтправления.Вставить("postal_code" , "<Почтовый индекс>");
            СтруктураАдресаОтправления.Вставить("longitude"   , "<Долгота>");
            СтруктураАдресаОтправления.Вставить("latitude"    , "<Широта>");
            СтруктураАдресаОтправления.Вставить("country_code", "<Код страны>");
            СтруктураАдресаОтправления.Вставить("region"      , "<Название региона, уточняющий параметр для поля city>");
            СтруктураАдресаОтправления.Вставить("region_code" , "<Код региона СДЭК, уточняющий параметр для поля city>");
            СтруктураАдресаОтправления.Вставить("sub_region"  , "<Название района региона, уточняющий параметр для поля region>");
            СтруктураАдресаОтправления.Вставить("city"        , "<Название города, уточняющий параметр для postal_code>");
            СтруктураАдресаОтправления.Вставить("kladr_code"  , "<Код КЛАДР. Устаревшее поле>");
            СтруктураАдресаОтправления.Вставить("address"     , "<Строка адреса>");

        СтруктураЗаявки.Вставить("from_location" , СтруктураАдресаОтправления);

    КонецЕсли;

    Если Пустая Тогда
        СтруктураЗаявки = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураЗаявки);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураЗаявки;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СформироватьURL(Знач Метод, Знач ТестовыйAPI)

    OPI_ПреобразованиеТипов.ПолучитьБулево(ТестовыйAPI);

    Если ТестовыйAPI Тогда
        URL = "https://api.edu.cdek.ru/v2";
    Иначе
        URL = "https://api.cdek.ru";
    КонецЕсли;

    URL = URL + Метод;

    Возврат URL;

КонецФункции

Функция СоздатьЗаголовкиЗапроса(Знач Токен)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);

    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "Bearer " + Токен);
    Возврат Заголовки;

КонецФункции

#КонецОбласти
