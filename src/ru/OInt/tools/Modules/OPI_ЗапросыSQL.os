﻿// OneScript: ./OInt/tools/Modules/OPI_ЗапросыSQL.os

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
#Использовать "./internal"

#Область СлужебныйПрограммныйИнтерфейс

Функция ПустаяСхемаSQL(Знач Действие) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Действие);

    Действие = вРег(Действие);

    Если Действие = "SELECT" Тогда

        Схема = ПустаяСхемаSelect();

    ИначеЕсли Действие = "INSERT" Тогда

        Схема = ПустаяСхемаInsert();

    ИначеЕсли Действие = "UPDATE" Тогда

        Схема = ПустаяСхемаUpdate();

    ИначеЕсли Действие = "DELETE" Тогда

        Схема = ПустаяСхемаDelete();

    ИначеЕсли Действие = "CREATE" Тогда

        Схема = ПустаяСхемаCreate();

    Иначе

        Схема = Новый Структура;

    КонецЕсли;

    Возврат Схема;

КонецФункции

Функция СформироватьТекстSQL(Знач Схема) Экспорт

    ТекстОшибки = "Переданное значение не является валидной схемой SQL запроса";
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Схема, ТекстОшибки);

    ТипСхемы = "";

    Если Не OPI_Инструменты.ПолеКоллекцииСуществует(Схема, "type", ТипСхемы) Тогда
        ВызватьИсключение ТекстОшибки;
    КонецЕсли;

    ТипСхемы = вРег(ТипСхемы);

    Если ТипСхемы = "SELECT" Тогда

        ТекстЗапроса = СформироватьТекстSelect(Схема);

    ИначеЕсли ТипСхемы = "INSERT" Тогда

        ТекстЗапроса = СформироватьТекстInsert(Схема);

    ИначеЕсли ТипСхемы = "UPDATE" Тогда

        ТекстЗапроса = СформироватьТекстUpdate(Схема);

    ИначеЕсли ТипСхемы = "DELETE" Тогда

        ТекстЗапроса = СформироватьТекстDelete(Схема);

    ИначеЕсли ТипСхемы = "CREATE" Тогда

        ТекстЗапроса = СформироватьТекстCreate(Схема);

    Иначе

        ТекстЗапроса = "";

    КонецЕсли;

    Возврат ТекстЗапроса;

КонецФункции

Процедура ДобавитьКолонку(Схема, Знач Имя, Знач Тип) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Имя);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Тип);

    Если Не Схема["type"] = "CREATE" Тогда
        Возврат;
    КонецЕсли;

    СоответствиеКолонки = Новый Соответствие;
    СоответствиеКолонки.Вставить(Имя, Тип);

    Схема["columns"].Добавить(СоответствиеКолонки);

КонецПроцедуры

Процедура ДобавитьПоле(Схема, Знач Имя) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Имя);

    Схема["set"].Добавить(Имя);

КонецПроцедуры

Процедура ДобавитьОтбор(Схема, Знач Поле, Знач Тип, Знач Значение, Знач Группировка, Знач КакЕсть) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Поле);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Тип);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Группировка);
    OPI_ПреобразованиеТипов.ПолучитьБулево(КакЕсть);

    ОсновнаяСтруктура = Новый Структура("field,type,union"
        , Поле
        , Тип
        , Группировка);

    Если КакЕсть Тогда

        ОсновнаяСтруктура.Вставить("value", Строка(Значение));

    Иначе

        Схема["values"].Добавить(Значение);

        ПорядковыйНомер = Схема["values"].Количество();
        ОсновнаяСтруктура.Вставить("value", "?" + OPI_Инструменты.ЧислоВСтроку(ПорядковыйНомер));

    КонецЕсли;


    Схема["filter"].Добавить(ОсновнаяСтруктура);

КонецПроцедуры

Процедура ДобавитьСортировку(Схема, Знач Поле, Знач Тип) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Поле);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Тип);

    Схема["order"].Добавить(Новый Структура("field,type", Поле, Тип));

КонецПроцедуры


Процедура УстановитьИмяТаблицы(Схема, Знач Имя) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Имя);

    Схема.Вставить("table", Имя);

КонецПроцедуры

Процедура УстановитьЛимит(Схема, Знач Количество) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьЧисло(Количество);

    Схема.Вставить("limit", Количество);

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область Схемы

Функция ПустаяСхемаSelect()

    Схема = Новый Структура("type", "SELECT");

    Схема.Вставить("table"   , "");
    Схема.Вставить("filter"  , Новый Массив);
    Схема.Вставить("order"   , Новый Массив);
    Схема.Вставить("limit"   , 0);
    Схема.Вставить("set"     , Новый Массив);
    Схема.Вставить("values"  , Новый Массив);

    Возврат Схема;

КонецФункции

Функция ПустаяСхемаInsert()

    Схема = Новый Структура("type", "INSERT");

    Схема.Вставить("table", "");
    Схема.Вставить("set"  , Новый Массив);

    Возврат Схема;

КонецФункции

Функция ПустаяСхемаUpdate()

    Схема = Новый Структура("type", "UPDATE");

    Схема.Вставить("table" , "");
    Схема.Вставить("set"   , Новый Массив);
    Схема.Вставить("filter", Новый Массив);

    Возврат Схема;

КонецФункции

Функция ПустаяСхемаDelete()

    Схема = Новый Структура("type", "DELETE");

    Схема.Вставить("table" , "");
    Схема.Вставить("filter", Новый Массив);

    Возврат Схема;

КонецФункции

Функция ПустаяСхемаCreate()

    Схема = Новый Структура("type", "CREATE");

    Схема.Вставить("table"  , "");
    Схема.Вставить("columns", Новый Массив);

    Возврат Схема;

КонецФункции

#КонецОбласти

#Область Процессоры

Функция СформироватьТекстSelect(Знач Схема)

    ПроверитьОбязательныеПоляСхемы(Схема, "table,filter,order,limit,set");

    Таблица    = Схема["table"];
    Поля       = Схема["set"];
    Фильтры    = Схема["filter"];
    Сортировка = Схема["order"];
    Количество = Схема["limit"];

    ШаблонSQL = "SELECT %1 FROM %2
    |%3";

    БлокНастроек = СформироватьТекстНастроекSelect(Фильтры, Сортировка, Количество);

    ТекстSQL = СтрШаблон(ШаблонSQL, СтрСоединить(Поля, ", "), Таблица, БлокНастроек);

    Возврат ТекстSQL;

КонецФункции

Функция СформироватьТекстInsert(Знач Схема)

    ПроверитьОбязательныеПоляСхемы(Схема, "table,set");

    Таблица = Схема["table"];
    Поля    = Схема["set"];

    ШаблонSQL = "INSERT INTO %1 (%2) VALUES (%3)";

    Параметры = Новый Массив;

    Для Н = 1 По Поля.Количество() Цикл
        Параметры.Добавить("?" + OPI_Инструменты.ЧислоВСтроку(Н));
    КонецЦикла;

    ТекстSQL = СтрШаблон(ШаблонSQL
        , Таблица
        , СтрСоединить(Поля, ", ")
        , СтрСоединить(Параметры, ", "));

    Возврат ТекстSQL;

КонецФункции

Функция СформироватьТекстUpdate(Знач Схема)

    ТекстSQL = "";

    Возврат ТекстSQL;

КонецФункции

Функция СформироватьТекстDelete(Знач Схема)

    ТекстSQL = "";

    Возврат ТекстSQL;

КонецФункции

Функция СформироватьТекстCreate(Знач Схема)

    ПроверитьОбязательныеПоляСхемы(Схема, "table,columns");

    Таблица = Схема["table"];
    Колонки = Схема["columns"];

    ШаблонSQL = "CREATE TABLE %1 (
    | %2
    | )";

    ШаблонКолонки = "%1 %2";

    МассивОписанийКолонок = Новый Массив;

    Для Каждого Колонка Из Колонки Цикл
        Для Каждого Элемент Из Колонка Цикл
            МассивОписанийКолонок.Добавить(СтрШаблон(ШаблонКолонки, Элемент.Ключ, Элемент.Значение));
        КонецЦикла;
    КонецЦикла;

    ОписанияКолонок = СтрСоединить(МассивОписанийКолонок, "," + Символы.ПС);

    ТекстSQL = СтрШаблон(ШаблонSQL, Таблица, ОписанияКолонок);

    Возврат ТекстSQL;

КонецФункции

#КонецОбласти

Функция СформироватьТекстНастроекSelect(Знач Фильтры, Знач Сортировка, Знач Количество)

    ШаблонБлока = "%1
    |%2
    |%3";

    ТекстФильтра    = СформироватьТекстФильтра(Фильтры);
    ТекстСортировки = СформироватьТекстСортировки(Сортировка);
    ТекстКоличества = СформироватьТекстКоличества(Количество);

    ТекстБлока = СтрШаблон(ШаблонБлока, ТекстФильтра, ТекстСортировки, ТекстКоличества);

    Возврат ТекстБлока;

КонецФункции

Функция СформироватьТекстФильтра(Знач Фильтры)

    Если Не ЗначениеЗаполнено(Фильтры) Тогда
        Возврат "";
    КонецЕсли;

    ТекстФильтров = "WHERE %1";

    МассивФильтров = Новый Массив;

    Счетчик = 1;
    Всего   = Фильтры.Количество();

    Для Каждого Фильтр Из Фильтры Цикл

        ТекущийТекст = "%1 %2 %3 %4";

        Поле       = Фильтр["field"];
        Тип        = Фильтр["type"];
        Значение   = Фильтр["value"];
        Соединение = Фильтр["union"];
        Соединение = ?(ЗначениеЗаполнено(Соединение), Соединение, "AND");

        Если Счетчик = Всего Тогда
            Соединение = "";
        КонецЕсли;

        ТекущийТекст = СтрШаблон(ТекущийТекст, Поле, Тип, Значение, Соединение);
        МассивФильтров.Добавить(ТекущийТекст);

        Счетчик = Счетчик + 1;

    КонецЦикла;

    ТекстФильтров = СтрШаблон(ТекстФильтров, СтрСоединить(МассивФильтров, " "));

    Возврат ТекстФильтров;

КонецФункции

Функция СформироватьТекстСортировки(Знач Сортировка)

    Если Не ЗначениеЗаполнено(Сортировка) Тогда
        Возврат "";
    КонецЕсли;

    ТекстСортировки = "ORDER BY %1";

    МассивСортировки = Новый Массив;

    Для Каждого Элемент Из Сортировка Цикл

        МассивСортировки.Добавить(Элемент["field"] + " " + Элемент["type"]);

    КонецЦикла;

    ТекстСортировки = СтрШаблон(ТекстСортировки, СтрСоединить(МассивСортировки, ", "));

    Возврат ТекстСортировки;

КонецФункции

Функция СформироватьТекстКоличества(Знач Количество)

    Если Не ЗначениеЗаполнено(Количество) Тогда
        Возврат "";
    КонецЕсли;

    ТекстКоличества = "LIMIT %1";
    ТекстКоличества = СтрШаблон(ТекстКоличества, OPI_Инструменты.ЧислоВСтроку(Количество));

    Возврат ТекстКоличества;

КонецФункции

Процедура ПроверитьОбязательныеПоляСхемы(Схема, Знач Поля)

    МассивОбязательныхПолей = СтрРазделить(Поля, ",");
    МассивОтсутствующих     = OPI_Инструменты.НайтиОтсутствующиеПоляКоллекции(Схема, МассивОбязательныхПолей);

    Если ЗначениеЗаполнено(МассивОтсутствующих) Тогда
        ВызватьИсключение "Отсутствуют необходимые поля схемы: " + СтрСоединить(МассивОтсутствующих, ", ");
    КонецЕсли;

КонецПроцедуры

#КонецОбласти
