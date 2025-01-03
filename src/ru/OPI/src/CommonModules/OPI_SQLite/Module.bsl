﻿// OneScript: ./OInt/core/Modules/OPI_SQLite.os
// Lib: SQLite
// CLI: sqlite

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
//@skip-check constructor-function-return-section

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область ОсновныеМетоды

// Открыть соединение !NOCLI
// Создает подключение к указанной базе
//
// Параметры:
//  База - Строка - Путь к базе. In memory, если не заполнено - db
//
// Возвращаемое значение:
//  Произвольный - Объект коннектора или структура с информацией об ошибке
Функция ОткрытьСоединение(Знач База = "") Экспорт

    Если ЭтоКоннектор(База) Тогда
        Возврат База;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);

    Коннектор = ПодключитьКомпонентуНаСервере("OPI_SQLite");

    Коннектор.Database = База;

    Результат = Коннектор.Connect();
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Возврат ?(Результат["result"], Коннектор, Результат);

КонецФункции

// Закрыть соединение !NOCLI
// Явно закрывает переданное соединение
//
// Параметры:
//  Соединение - Произвольный - Объект компоненты с открытым соединением - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Результат закрытия соединения
Функция ЗакрытьСоединение(Знач Соединение) Экспорт

    Если ЭтоКоннектор(Соединение) Тогда

        Результат = Соединение.Close();
        Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Иначе

        Результат = Новый Структура("result,error", Ложь, "It's not a connection");

    КонецЕсли;

    Возврат Результат;

КонецФункции

// Выполнить запрос SQL
// Выполняет произвольный SQL запрос
//
// Примечание:
// Доступные типы параметров: Cтрока, Число, Дата, Булево, ДвоичныеДанные.^^
// Двоичные данные могут также быть переданы как структура `{'blob':<Путь к файлу>}`. Возвращаются значения двоичных данных (BLOB)^^
// в виде `{'blob':<Base64 строка>}`
// Без указания флага `ФорсироватьРезультат`, чтение результата осуществляется только для запросов, начинающихся с `SELECT`^^
// Для остальных запросов возвращается `result:true` или `false` с текстом ошибки
//
// Параметры:
//  ТекстЗапроса         - Строка                 - Текст запроса к базе                                                  - sql
//  Параметры            - Массив Из Произвольный - Массив позиционных параметров запроса                                 - params
//  ФорсироватьРезультат - Булево                 - Включает попытку получения результата, даже для не SELECT запросов    - force
//  Соединение           - Строка, Произвольный   - Существующее соединение или путь к базе. In memory, если не заполнено - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Результат выполнения запроса
Функция ВыполнитьЗапросSQL(Знач ТекстЗапроса
    , Знач Параметры = ""
    , Знач ФорсироватьРезультат = Ложь
    , Знач Соединение = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекстЗапроса);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ФорсироватьРезультат);

    Параметры_ = ОбработатьПараметры(Параметры);
    Коннектор  = ОткрытьСоединение(Соединение);

    Если ТипЗнч(Коннектор) <> Тип("AddIn.OPI_SQLite.Main") Тогда
        Возврат Коннектор;
    КонецЕсли;

    Результат = Коннектор.Execute(ТекстЗапроса, Параметры_, ФорсироватьРезультат);
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Возврат Результат;

КонецФункции

#КонецОбласти

#Область ORM

// Создать таблицу
// Создает пустую таблицу в базе
//
// Параметры:
//  Таблица          - Строка                     - Имя таблицы                                          - table
//  СтруктураКолонок - Структура Из КлючИЗначение - Структура колонок: Ключ > имя, Значение > Тип данных - cols
//  НеВыполнять      - Булево                     - Истина > Не выполняет запрос, а возвращает текст SQL - noex
//  Соединение       - Строка, Произвольный       - Существующее соединение или путь к базе              - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса или его текст
Функция СоздатьТаблицу(Знач Таблица, Знач СтруктураКолонок, Знач НеВыполнять = Ложь, Знач Соединение = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(НеВыполнять);

    ТекстОшибки = "Структура колонок не является валидной структурой ключ-значение";
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(СтруктураКолонок, ТекстОшибки);

    Схема = OPI_ЗапросыSQL.ПустаяСхемаSQL("CREATE");

    OPI_ЗапросыSQL.УстановитьИмяТаблицы(Схема, Таблица);

    Для Каждого Колонка Из СтруктураКолонок Цикл
        OPI_ЗапросыSQL.ДобавитьКолонку(Схема, Колонка.Ключ, Колонка.Значение);
    КонецЦикла;

    Запрос = OPI_ЗапросыSQL.СформироватьТекстSQL(Схема);

    Если НеВыполнять Тогда
        Результат = Запрос;
    Иначе
        Результат = ВыполнитьЗапросSQL(Запрос, , , Соединение);
    КонецЕсли;

    Возврат Результат;

КонецФункции

// Добавить записи
// Добавляет записи в таблицу
//
// Параметры:
//  Таблица      - Строка               - Имя таблицы                                                         - table
//  МассивДанных - Массив Из Структура  - Массив структур данных строк: Ключ > поле, Значение > значение поля - rows
//  Транзакция   - Булево               - Истина > добавление записей в транзакции с откатом при ошибке       - trn
//  Соединение   - Строка, Произвольный - Существующее соединение или путь к базе                             - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса
Функция ДобавитьЗаписи(Знач Таблица, Знач МассивДанных, Знач Транзакция = Истина, Знач Соединение = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьМассив(МассивДанных);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Транзакция);

    Соединение = ОткрытьСоединение(Соединение);

    Если Не ЭтоКоннектор(Соединение) Тогда
        Возврат Соединение;
    КонецЕсли;

    Если Транзакция Тогда

        Начало = ВыполнитьЗапросSQL("BEGIN TRANSACTION", , , Соединение);

        Если Не Начало["result"] Тогда
            Возврат Начало;
        КонецЕсли;

    КонецЕсли;

    Счетчик         = 0;
    СчетчикУспешных = 0;

    Ошибка          = Ложь;
    МассивОшибок    = Новый Массив;
    ОшибкаКоллекции = "Invalid data";

    СтруктураРезультата = Новый Структура;

    Для Каждого Запись Из МассивДанных Цикл

        Если Ошибка И Транзакция Тогда

            Откат = ВыполнитьЗапросSQL("ROLLBACK", , , Соединение);

            СчетчикУспешных = 0;
            СтруктураРезультата.Вставить("rollback", Откат);
            Прервать;

        КонецЕсли;

        Счетчик = Счетчик + 1;
        Ошибка  = Ложь;

        Попытка
            OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Запись, ОшибкаКоллекции);
        Исключение
            МассивОшибок.Добавить(Новый Структура("row,error", Счетчик, ОшибкаКоллекции));
            Ошибка = Истина;
            Продолжить;
        КонецПопытки;

        Результат = ДобавитьЗапись(Таблица, Запись, Соединение);

        Если Результат["result"] Тогда

            СчетчикУспешных = СчетчикУспешных + 1;

        Иначе

            МассивОшибок.Добавить(Новый Структура("row,error", Счетчик, Результат["error"]));
            Ошибка = Истина;

        КонецЕсли;

    КонецЦикла;

    Если Транзакция И Не Ошибка Тогда

        Завершение = ВыполнитьЗапросSQL("COMMIT", , , Соединение);
        СтруктураРезультата.Вставить("commit", Завершение);

    КонецЕсли;

    СтруктураРезультата.Вставить("result", МассивОшибок.Количество() = 0);
    СтруктураРезультата.Вставить("rows"  , СчетчикУспешных);
    СтруктураРезультата.Вставить("errors", МассивОшибок);

     Возврат СтруктураРезультата;

КонецФункции

// Получить записи
// Получает записи из выбранной таблицы
//
// Параметры:
//  Таблица    - Строка                     - Имя таблицы                                                  - table
//  Поля       - Массив Из Строка           - Поля для выборки                                             - fields
//  Фильтры    - Массив Из Структура        - Массив фильтров. См. ПолучитьСтруктуруФильтраЗаписей         - filter
//  Сортировка - Структура Из КлючИЗначение - Сортировка: Ключ > поле, Значение > направление (ASC, DESC)  - order
//  Количество - Число                      - Ограничение количества получаемых строк                      - limit
//  Соединение - Строка, Произвольный       - Существующее соединение или путь к базе                      - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса
Функция ПолучитьЗаписи(Знач Таблица
    , Знач Поля = "*"
    , Знач Фильтры = ""
    , Знач Сортировка = ""
    , Знач Количество = ""
    , Знач Соединение = "") Экспорт

    Схема = OPI_ЗапросыSQL.ПустаяСхемаSQL("SELECT");

    OPI_ЗапросыSQL.УстановитьИмяТаблицы(Схема, Таблица);
    OPI_ЗапросыSQL.УстановитьЛимит(Схема, Количество);

    ЗаполнитьПоля(Схема, Поля);
    ЗаполнитьФильтры(Схема, Фильтры);
    ЗаполнитьСортировку(Схема, Сортировка);

    Запрос = OPI_ЗапросыSQL.СформироватьТекстSQL(Схема);

    Результат = ВыполнитьЗапросSQL(Запрос, Схема["values"], , Соединение);

    Возврат Результат;

КонецФункции

// Получить структуру фильтра записей
// Получает структуру шаблон для фильтрации записей в запросах ORM
//
// Примечание:
// Использование признака `raw` необходимо для составных конструкций, вроде `BEETWEEN`.^^
// Например: при `raw:false` фильтр `type:BETWEEN` `value:10 AND 20` будет интерпритирован как `BETWEEN ?1 `^^
// где `?1 = "10 AND 20"`, что приведет к ошибке.^^
// В таком случае необходимо использовать `raw:true` для установки условия напрямую в текст запроса
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Элемент фильтра записей
Функция ПолучитьСтруктуруФильтраЗаписей(Знач Пустая = Ложь) Экспорт

    СтруктураФильтра = Новый Структура;

    СтруктураФильтра.Вставить("field", "<имя поля для отбора>");
    СтруктураФильтра.Вставить("type" , "<тип сравнения>");
    СтруктураФильтра.Вставить("value", "<значение для сравнения>");
    СтруктураФильтра.Вставить("union", "<связь со следующим условием: AND, OR и пр.>");
    СтруктураФильтра.Вставить("raw"  , "<истина - значение будет вставлено текстом, как есть, ложь - через параметр>");

    Если Пустая Тогда
        СтруктураФильтра = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураФильтра);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураФильтра;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПодключитьКомпонентуНаСервере(Знач ИмяКомпоненты, Знач Класс = "Main")

    Если OPI_Инструменты.ЭтоOneScript() Тогда
        ИмяМакета = OPI_Инструменты.КаталогКомпонентOS() + ИмяКомпоненты + ".zip";
    Иначе
        ИмяМакета = "ОбщийМакет." + ИмяКомпоненты;
    КонецЕсли;

    ПодключитьВнешнююКомпоненту(ИмяМакета, ИмяКомпоненты, ТипВнешнейКомпоненты.Native);

    Компонента = Новый ("AddIn." + ИмяКомпоненты + "." + Класс);
    Возврат Компонента;

КонецФункции

Функция ОбработатьПараметры(Знач Параметры)

    Если ЗначениеЗаполнено(Параметры) Тогда

        OPI_ПреобразованиеТипов.ПолучитьМассив(Параметры);

        Для Н = 0 По Параметры.ВГраница() Цикл

            ТекущийПараметр = Параметры[Н];

            Если ТипЗнч(ТекущийПараметр) = Тип("ДвоичныеДанные") Тогда

                ТекущийПараметр = Новый Структура("blob", Base64Строка(ТекущийПараметр));

            ИначеЕсли OPI_Инструменты.ПолеКоллекцииСуществует(ТекущийПараметр, "blob") Тогда

                ЗначениеДанных = ТекущийПараметр["blob"];
                ФайлДанных     = Новый Файл(Строка(ЗначениеДанных));

                Если ФайлДанных.Существует() Тогда
                    ТекущиеДанные   = Новый ДвоичныеДанные(Строка(ЗначениеДанных));
                    ТекущийПараметр = Новый Структура("blob", Base64Строка(ТекущиеДанные));
                КонецЕсли;

            ИначеЕсли ТипЗнч(ТекущийПараметр) = Тип("Дата") Тогда

                ТекущийПараметр = Формат(ТекущийПараметр, "ДФ='yyyy-MM-dd HH:MM:ss'");

            ИначеЕсли Не OPI_Инструменты.ЭтоПримитивныйТип(ТекущийПараметр) Тогда

                OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущийПараметр);

            КонецЕсли;

            Параметры[Н] = ТекущийПараметр;

        КонецЦикла;

        Параметры_ = OPI_Инструменты.JSONСтрокой(Параметры, , Ложь);

    Иначе

        Параметры_ = "[]";

    КонецЕсли;

    Возврат Параметры_;

КонецФункции

Функция ЭтоКоннектор(Знач Значение)

    Возврат Строка(ТипЗнч(Значение)) = "AddIn.OPI_SQLite.Main";

КонецФункции

Функция ДобавитьЗапись(Знач Таблица, Знач Запись, Знач Соединение)

    МассивПолей    = Новый Массив;
    МассивЗначений = Новый Массив;

    Схема = OPI_ЗапросыSQL.ПустаяСхемаSQL("INSERT");
    OPI_ЗапросыSQL.УстановитьИмяТаблицы(Схема, Таблица);

    РазделитьКоллекциюДанных(Запись, МассивПолей, МассивЗначений);

    Для Каждого Поле Из МассивПолей Цикл
        OPI_ЗапросыSQL.ДобавитьПоле(Схема, Поле);
    КонецЦикла;

    Запрос = OPI_ЗапросыSQL.СформироватьТекстSQL(Схема);

    Результат = ВыполнитьЗапросSQL(Запрос, МассивЗначений, , Соединение);

    Возврат Результат;

КонецФункции

Процедура РазделитьКоллекциюДанных(Знач Запись, МассивПолей, МассивЗначений)

    Для Каждого Элемент Из Запись Цикл

        МассивПолей.Добавить(Элемент.Ключ);
        МассивЗначений.Добавить(Элемент.Значение);

    КонецЦикла;

КонецПроцедуры

Процедура ЗаполнитьПоля(Схема, Знач Поля)

    Если Не ЗначениеЗаполнено(Поля) Тогда
        Поля = "*";
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьМассив(Поля);

    Для Каждого Поле Из Поля Цикл
        OPI_ЗапросыSQL.ДобавитьПоле(Схема, Поле);
    КонецЦикла;

КонецПроцедуры

Процедура ЗаполнитьФильтры(Схема, Знач Фильтры)

    Если Не ЗначениеЗаполнено(Фильтры) Тогда
        Возврат;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьМассив(Фильтры);

    Для Каждого Фильтр Из Фильтры Цикл

        OPI_ЗапросыSQL.ДобавитьОтбор(Схема
            , Фильтр["field"]
            , ?(Фильтр.Свойство("type"), Фильтр["type"], "=")
            , Фильтр["value"]
            , ?(Фильтр.Свойство("union"), Фильтр["union"], "AND")
            , ?(Фильтр.Свойство("raw"), Фильтр["raw"], Ложь));

    КонецЦикла;

КонецПроцедуры

Процедура ЗаполнитьСортировку(Знач Схема, Знач Сортировка)

    Если Не ЗначениеЗаполнено(Сортировка) Тогда
        Возврат;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(Сортировка);

    Для Каждого Элемент Из Сортировка Цикл

        OPI_ЗапросыSQL.ДобавитьСортировку(Схема, Элемент.Ключ, Элемент.Значение);

    КонецЦикла;

КонецПроцедуры

#КонецОбласти
