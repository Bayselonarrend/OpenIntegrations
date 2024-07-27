﻿// OneScript: ./OInt/core/Modules/OPI_Airtable.os
// Lib: Airtable
// CLI: airtable

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

// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область РаботаСБазами

// Получить список баз
// Получает список доступных баз
//
// Параметры:
//  Токен  - Строка - Токен                                                              - token
//  Отступ - Строка - Идентификатор следующей страницы списка баз из перыдудщего запроса - offset
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция ПолучитьСписокБаз(Знач Токен, Знач Отступ = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Отступ);

    URL        = "https://api.airtable.com/v0/meta/bases";
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);
    Параметры  = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("offset", Отступ, "Строка", Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить таблицы базы
// Получает схему таблиц базы
//
// Параметры:
//  Токен - Строка - Токен              - token
//  База  - Строка - Идентификатор базы - base
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция ПолучитьТаблицыБазы(Знач Токен, Знач База) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);

    URL        = "https://api.airtable.com/v0/meta/bases/" + База + "/tables";
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Ответ = OPI_Инструменты.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Создать базу
// Создает новую базу данных
//
// Параметры:
//  Токен               - Строка                    - Токен                                                - token
//  РабочееПространство - Строка                    - Идентификатор рабочего пространства                  - ws
//  Наименование        - Строка                    - Наименование новой базы                              - title
//  КоллекцияТаблиц - Соответствие Из КлючИЗначение - Описание таблиц: Ключ > имя, Значение > массив полей - tablesdata
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция СоздатьБазу(Знач Токен, Знач РабочееПространство, Знач Наименование, Знач КоллекцияТаблиц) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(КоллекцияТаблиц);

    Если Не ТипЗнч(КоллекцияТаблиц)  = Тип("Структура")
        И Не ТипЗнч(КоллекцияТаблиц) = Тип("Соответствие") Тогда

        ВызватьИсключение "Ошибка в данных коллекции таблиц";

    КонецЕсли;

    URL           = "https://api.airtable.com/v0/meta/bases";
    Заголовки     = ПолучитьЗаголовокАвторизации(Токен);
    МассивТаблиц  = Новый Массив;

    Для Каждого Таблица Из КоллекцияТаблиц Цикл

        Описание = СформироватьОписаниеТаблицы(Таблица.Ключ, Таблица.Значение);
        МассивТаблиц.Добавить(Описание);

    КонецЦикла;

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("name"       , Наименование       , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("tables"     , МассивТаблиц       , "Массив", Параметры);
    OPI_Инструменты.ДобавитьПоле("workspaceId", РабочееПространство, "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСТаблицами

// Создать таблицу
// Создает новую таблицу в базе
//
// Параметры:
//  Токен        - Строка              - Токен                      - token
//  База         - Строка              - Идентификатор базы         - base
//  Наименование - Строка              - Наименование новой таблицы - title
//  МассивПолей  - Массив Из Структура - Массив описаний полей      - fieldsdata
//  Описание     - Строка              - Описание таблицы           - description
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция СоздатьТаблицу(Знач Токен, Знач База, Знач Наименование, Знач МассивПолей, Знач Описание = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);

    URL        = "https://api.airtable.com/v0/meta/bases/" + База + "/tables";
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);
    Параметры  = СформироватьОписаниеТаблицы(Наименование, МассивПолей, Описание);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить таблицу
// Изменяет наименование и|или описание базы
//
// Параметры:
//  Токен        - Строка  - Токен                  - token
//  База         - Строка  - Идентификатор базы     - base
//  Таблица      - Строка  - Идентификатор таблицы  - table
//  Наименование - Строка  - Новое наименование     - title
//  Описание     - Строка  - Новое описание         - description
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция ИзменитьТаблицу(Знач Токен, Знач База, Знач Таблица, Знач Наименование = "", Знач Описание = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);

    URL        = "https://api.airtable.com/v0/meta/bases/" + База + "/tables/" + Таблица;
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);
    Параметры  = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("name"       , Наименование, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("description", Описание    , "Строка", Параметры);

    Ответ = OPI_Инструменты.Patch(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСПолями

// Создать поле
// Создет новое поле в таблице
//
// Параметры:
//  Токен         - Строка                     - Токен                  - token
//  База          - Строка                     - Идентификатор базы     - base
//  Таблица       - Строка                     - Идентификатор таблицы  - table
//  СтруктураПоля - Структура Из КлючИЗначение - Описание нового поля   - fielddata
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция СоздатьПоле(Знач Токен, Знач База, Знач Таблица, Знач СтруктураПоля) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(СтруктураПоля);

    Если Не ТипЗнч(СтруктураПоля)  = Тип("Структура")
        И Не ТипЗнч(СтруктураПоля) = Тип("Соответствие") Тогда

        ВызватьИсключение "Ошибка в данных описания поля";

    КонецЕсли;

    URL        = "https://api.airtable.com/v0/meta/bases/" + База + "/tables/" + Таблица + "/fields";
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Ответ = OPI_Инструменты.Post(URL, СтруктураПоля, Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить поле
// Изменяет имя и|или описание существующего поля таблицы
//
// Параметры:
//  Токен        - Строка - Токен                   - token
//  База         - Строка - Идентификатор базы База - base
//  Таблица      - Строка - Идентификатор таблицы   - table
//  Поле         - Строка - Идентификатор поля      - field
//  Наименование - Строка - Новое наименование      - title
//  Описание     - Строка - Новое описание          - description
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция ИзменитьПоле(Знач Токен, Знач База, Знач Таблица, Знач Поле, Знач Наименование = "", Знач Описание = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Поле);

    URL = "https://api.airtable.com/v0/meta/bases/"
        + База
        + "/tables/"
        + Таблица
        + "/fields/"
        + Поле;

    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура();
    OPI_Инструменты.ДобавитьПоле("name"       , Наименование, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("description", Описание    , "Строка", Параметры);

    Ответ = OPI_Инструменты.Patch(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить поле (строковое)
// Получает описание поля строкового типа
//
// Параметры:
//  Наименование - Строка - Наименование нового поля - title
//
// Возвращаемое значение:
//  Структура -  Описание поля
Функция ПолучитьПолеСтроковое(Знач Наименование) Экспорт

    Возврат ОписаниеПримитивногоПоля(Наименование, "richText");

КонецФункции

// Получить поле (числовое)
// Получает описание поля числового типа
//
// Параметры:
//  Наименование - Строка       - Наименование нового поля   - title
//  Точность     - Число,Строка - Число знаков после запятой - precision
//
// Возвращаемое значение:
//  Структура -  Описание поля
Функция ПолучитьПолеНомера(Знач Наименование, Знач Точность = 0) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьЧисло(Точность);

    СтруктураОпций = Новый Структура("precision", Точность);
    Возврат ОписаниеПримитивногоПоля(Наименование, "number", СтруктураОпций);

КонецФункции

// Получить поле (файл)
// Получает описание поля файлового типа
//
// Параметры:
//  Наименование - Строка - Наименование поля - title
//
// Возвращаемое значение:
//  Структура -  Описание поля
Функция ПолучитьПолеВложения(Знач Наименование) Экспорт

    Возврат ОписаниеПримитивногоПоля(Наименование, "multipleAttachments");

КонецФункции

// Получить поле (флажок)
// Получает описание поля типа булево
//
// Параметры:
//  Наименование - Строка - Наименование поля - title
//
// Возвращаемое значение:
//  Структура -  Описание поля
Функция ПолучитьПолеФлажка(Знач Наименование) Экспорт

    СтруктураОпций = Новый Структура("icon,color", "check", "yellowBright");
    Возврат ОписаниеПримитивногоПоля(Наименование, "checkbox", СтруктураОпций);

КонецФункции

// Получить поле (дата)
// Получает описание поля типа дата
//
// Параметры:
//  Наименование - Строка - Наименование поля - title
//
// Возвращаемое значение:
//  Структура -  Описание поля
Функция ПолучитьПолеДаты(Знач Наименование) Экспорт

    СтруктураФормата = Новый Структура("format,name", "YYYY-MM-DD", "iso");
    СтруктураОпций   = Новый Структура("dateFormat", СтруктураФормата);

    Возврат ОписаниеПримитивногоПоля(Наименование, "date", СтруктураОпций);

КонецФункции

// Получить поле (email)
// Получает описание поля с электронной почтой
//
// Параметры:
//  Наименование - Строка - Наименование поля - title
//
// Возвращаемое значение:
//  Структура -  Описание поля
Функция ПолучитьПолеПочты(Знач Наименование) Экспорт

    Возврат ОписаниеПримитивногоПоля(Наименование, "email");

КонецФункции

// Получить поле (телефон)
// Получает описание поля с номером телефона
//
// Параметры:
//  Наименование - Строка - Наименование поля - title
//
// Возвращаемое значение:
//  Структура -  Описание поля
Функция ПолучитьПолеТелефона(Знач Наименование) Экспорт

    Возврат ОписаниеПримитивногоПоля(Наименование, "phoneNumber");

КонецФункции

// Получить поле (url)
// Получает описание поля с URL
//
// Параметры:
//  Наименование - Строка - Наименование поля - title
//
// Возвращаемое значение:
//  Структура -  Описание поля
Функция ПолучитьПолеСсылки(Знач Наименование) Экспорт

    Возврат ОписаниеПримитивногоПоля(Наименование, "url");

КонецФункции

#КонецОбласти

#Область РаботаСЗаписями

// Получить список записей
// Получает список записей выбранной таблицы
//
// Параметры:
//  Токен   - Строка - Токен                                                         - token
//  База    - Строка - Идентификатор базы данных                                     - base
//  Таблица - Строка - Идентификатор таблицы                                         - table
//  Отступ  - Строка - Иднтификатор следующей страницы данных из предыдущего запроса - offset
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция ПолучитьСписокЗаписей(Знач Токен, Знач База, Знач Таблица, Знач Отступ = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);

    URL        = "https://api.airtable.com/v0/" + База + "/" + Таблица;
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Параметры  = Новый Структура();
    OPI_Инструменты.ДобавитьПоле("offset", Отступ, "Строка", Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить запись
// Получает данные строки таблицы по идентификатору
//
// Параметры:
//  Токен   - Строка - Токен                          - token
//  База    - Строка - Идентификатор базы данных      - base
//  Таблица - Строка - Идентификатор таблицы          - table
//  Запись  - Строка - Идентификатор записи в таблице - record
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция ПолучитьЗапись(Знач Токен, Знач База, Знач Таблица, Знач Запись) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Запись);

    URL        = "https://api.airtable.com/v0/" + База + "/" + Таблица + "/" + Запись;
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Ответ = OPI_Инструменты.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Создать записи
// Создает одну или массив записей по описанию или массиву описаний значений полей
//
// Параметры:
//  Токен   - Строка                         - Токен                                                            - token
//  База    - Строка                         - Идентификатор базы данных                                        - base
//  Таблица - Строка                         - Идентификатор таблицы                                            - table
//  Данные  - Структура, Массив из Структура - Набор или массив наборов пар Ключ : Значение > Поле : Показатель - data
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция СоздатьЗаписи(Знач Токен, Знач База, Знач Таблица, Знач Данные) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(Данные);

    Параметры = Новый Структура();
    ДобавитьОписаниеДанных(Данные, Параметры);

    URL        = "https://api.airtable.com/v0/" + База + "/" + Таблица;
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Удалить записи
// Удаляет одну или массив записей по идентификаторам
//
// Параметры:
//  Токен   - Строка                   - Токен                                             - token
//  База    - Строка                   - Идентификатор базы данных                         - base
//  Таблица - Строка                   - Идентификатор таблицы                             - table
//  Записи  - Строка, Массив из Строка - Идентификатор или массив индентификаторов записей - records
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция УдалитьЗаписи(Знач Токен, Знач База, Знач Таблица, Знач Записи) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьМассив(Записи);

    СтрокаЗаписей = "";

    Для Каждого Запись Из Записи Цикл
        СтрокаЗаписей   = СтрокаЗаписей
            + ?(ЗначениеЗаполнено(СтрокаЗаписей), "&", "?")
            + "records[]="
            + OPI_Инструменты.ЧислоВСтроку(Запись);
    КонецЦикла;

    URL        = "https://api.airtable.com/v0/" + База + "/" + Таблица + СтрокаЗаписей;
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Ответ = OPI_Инструменты.Delete(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСКомментариями

// Получить комментарии
// Получает список комментариев к записи в таблице
//
// Параметры:
//  Токен   - Строка - Токен                                                         - token
//  База    - Строка - Идентификатор базы данных                                     - base
//  Таблица - Строка - Идентификатор таблицы                                         - table
//  Запись  - Строка - Идентификатор записи в таблице                                - record
//  Отступ  - Строка - Иднтификатор следующей страницы данных из предыдущего запроса - offset
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция ПолучитьКомментарии(Знач Токен, Знач База, Знач Таблица, Знач Запись, Знач Отступ = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Запись);

    URL        = "https://api.airtable.com/v0/" + База + "/" + Таблица + "/" + Запись + "/comments";
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Параметры  = Новый Структура();
    OPI_Инструменты.ДобавитьПоле("offset", Отступ, "Строка", Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Создать комментарий
// Создает комментарий к записи в таблице
//
// Параметры:
//  Токен   - Строка - Токен                           - token
//  База    - Строка - Идентификатор базы данных       - base
//  Таблица - Строка - Идентификатор таблицы           - table
//  Запись  - Строка - Идентификатор записи в таблице  - record
//  Текст   - Строка - Текст комментария               - text
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция СоздатьКомментарий(Знач Токен, Знач База, Знач Таблица, Знач Запись, Знач Текст) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Запись);

    URL        = "https://api.airtable.com/v0/" + База + "/" + Таблица + "/" + Запись + "/comments";
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Параметры  = Новый Структура();
    OPI_Инструменты.ДобавитьПоле("text", Текст, "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить комментарий
// Изменяет текст существующего комментария
//
// Параметры:
//  Токен       - Строка - Токен                           - token
//  База        - Строка - Идентификатор базы данных       - base
//  Таблица     - Строка - Идентификатор таблицы           - table
//  Запись      - Строка - Идентификатор записи в таблице  - record
//  Комментарий - Строка - Идентификатор комментария       - comment
//  Текст       - Строка - Новый текст комментария         - text
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция ИзменитьКомментарий(Знач Токен, Знач База, Знач Таблица, Знач Запись, Знач Комментарий, Знач Текст) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Запись);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Комментарий);

    URL        = "https://api.airtable.com/v0/" + База + "/" + Таблица + "/" + Запись + "/comments/" + Комментарий;
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);

    Параметры  = Новый Структура();
    OPI_Инструменты.ДобавитьПоле("text", Текст, "Строка", Параметры);

    Ответ = OPI_Инструменты.Patch(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Удалить комментарий
// Удаляет комментарий к записи таблицы
//
// Параметры:
//  Токен       - Строка - Токен                           - token
//  База        - Строка - Идентификатор базы данных       - base
//  Таблица     - Строка - Идентификатор таблицы           - table
//  Запись      - Строка - Идентификатор записи в таблице  - record
//  Комментарий - Строка - Идентификатор комментария       - comment
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable
Функция УдалитьКомментарий(Знач Токен, Знач База, Знач Таблица, Знач Запись, Знач Комментарий) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Запись);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Комментарий);

    URL       = "https://api.airtable.com/v0/" + База + "/" + Таблица + "/" + Запись + "/comments/" + Комментарий;
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Ответ = OPI_Инструменты.Delete(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьЗаголовокАвторизации(Знач Токен)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);

    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "Bearer " + Токен);

    Возврат Заголовки;

КонецФункции

Функция СформироватьОписаниеТаблицы(Знач Наименование, Знач МассивПолей, Знач Описание = "")

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивПолей);

    ОписаниеТаблицы = Новый Структура("name,fields", Наименование, МассивПолей);

    OPI_Инструменты.ДобавитьПоле("description", Описание, "Строка", ОписаниеТаблицы);

    Возврат ОписаниеТаблицы;

КонецФункции

Функция ОписаниеПримитивногоПоля(Знач Наименование, Знач Тип, Знач Опции = "")

    СтруктураПоля = Новый Структура();
    OPI_Инструменты.ДобавитьПоле("name"   , Наименование, "Строка"   , СтруктураПоля);
    OPI_Инструменты.ДобавитьПоле("type"   , Тип         , "Строка"   , СтруктураПоля);
    OPI_Инструменты.ДобавитьПоле("options", Опции       , "Коллекция", СтруктураПоля);

    Возврат СтруктураПоля;

КонецФункции

Процедура ДобавитьОписаниеДанных(Знач Данные, Параметры)

    Если ТипЗнч(Данные) = Тип("Массив") Тогда

        МассивОтправки = Новый Массив;

        Для Каждого ОписаниеЗаписи Из Данные Цикл
            МассивОтправки.Добавить(Новый Структура("fields", ОписаниеЗаписи));
        КонецЦикла;

        OPI_Инструменты.ДобавитьПоле("records", МассивОтправки, "Массив", Параметры);

    Иначе

       OPI_Инструменты.ДобавитьПоле("fields", Данные, "Коллекция", Параметры);

    КонецЕсли;

КонецПроцедуры

#КонецОбласти
