// OneScript: ./OInt/tools/Modules/OPI_ЗапросыSQL.os

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

    Схема["columns"].Добавить(Новый Структура(Имя, Тип));

КонецПроцедуры

Процедура УстановитьИмяТаблицы(Схема, Знач Имя) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Имя);

    Схема.Вставить("table", Имя);

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область Схемы

Функция ПустаяСхемаSelect()

    Схема = Новый Структура("type", "SELECT");

    Схема.Вставить("table"   , "");
    Схема.Вставить("filter"  , Новый Массив);
    Схема.Вставить("order_by", Новый Массив);
    Схема.Вставить("limit"   , Новый Массив);
    Схема.Вставить("fileds"  , Новый Массив);

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

    ТекстSQL = "";

    Возврат ТекстSQL;

КонецФункции

Функция СформироватьТекстInsert(Знач Схема)

    ТекстSQL = "";

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
        МассивОписанийКолонок.Добавить(СтрШаблон(ШаблонКолонки, Колонка.Ключ, Колонка.Значение));
    КонецЦикла;

    ОписанияКолонок = СтрСоединить(МассивОписанийКолонок, "," + Символы.ПС);

    ТекстSQL = СтрШаблон(ШаблонSQL, Таблица, ОписанияКолонок);

    Возврат ТекстSQL;

КонецФункции

#КонецОбласти

Процедура ПроверитьОбязательныеПоляСхемы(Схема, Знач Поля)

    МассивОбязательныхПолей = СтрСоединить(Поля, ",");
    МассивОтсутствующих     = OPI_Инструменты.НайтиОтсутствующиеПоляКоллекции(Схема, МассивОбязательныхПолей);

    Если ЗначениеЗаполнено(МассивОтсутствующих) Тогда
        ВызватьИсключение "Отсутствуют необходимые поля схемы: " + СтрСоединить(МассивОтсутствующих, ", ");
    КонецЕсли;

КонецПроцедуры

#КонецОбласти
