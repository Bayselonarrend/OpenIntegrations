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
    OPI_Инструменты.ВернутьУправляющиеПоследовательности(База);

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

// Это коннектор !NOCLI
// Проверяет, что значение является объектом внешней компоненты SQLite
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоКоннектор(Знач Значение) Экспорт

    Возврат Строка(ТипЗнч(Значение)) = "AddIn.OPI_SQLite.Main";

КонецФункции

// Выполнить запрос SQL
// Выполняет произвольный SQL запрос
//
// Примечание:
// Доступные типы параметров: Cтрока, Число, Дата, Булево, ДвоичныеДанные.^^
// Двоичные данные могут также быть переданы как структура `{'blob':Путь к файлу}`. Возвращаются значения двоичных данных (BLOB)^^
// в виде `{'blob':Base64 строка}`
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
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат);

    Возврат Результат;

КонецФункции

#КонецОбласти

#Область ORM

// Получить информацию о таблице
// Получает информацию о таблице
//
// Параметры:
//  Таблица    - Строка               - Имя таблицы                             - table
//  Соединение - Строка, Произвольный - Существующее соединение или путь к базе - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса или его текст
Функция ПолучитьИнформациюОТаблице(Знач Таблица, Знач Соединение = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Таблица);

    ТекстSQL = "PRAGMA table_info('%1')";
    ТекстSQL = СтрШаблон(ТекстSQL, Таблица);

    Результат = ВыполнитьЗапросSQL(ТекстSQL, , Истина, Соединение);

    Возврат Результат;

КонецФункции

// Создать таблицу
// Создает пустую таблицу в базе
//
// Параметры:
//  Таблица          - Строка                     - Имя таблицы                                          - table
//  СтруктураКолонок - Структура Из КлючИЗначение - Структура колонок: Ключ > имя, Значение > Тип данных - cols
//  Соединение       - Строка, Произвольный       - Существующее соединение или путь к базе              - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса или его текст
Функция СоздатьТаблицу(Знач Таблица, Знач СтруктураКолонок, Знач Соединение = "") Экспорт

    Результат = OPI_ЗапросыSQL.СоздатьТаблицу(OPI_SQLite, Таблица, СтруктураКолонок, Соединение);
    Возврат Результат;

КонецФункции

// Добавить записи
// Добавляет записи в таблицу
//
// Примечание:
// Двоичные данные могут также быть переданы как структура `{'blob':Путь к файлу}`
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

    Результат = OPI_ЗапросыSQL.ДобавитьЗаписи(OPI_SQLite, Таблица, МассивДанных, Транзакция, Соединение);
    Возврат Результат;

КонецФункции

// Получить записи
// Получает записи из выбранной таблицы
//
// Примечание:
// Значения типа Двоичные данные (BLOB) возвращаются в виде `{'blob':Base64 строка}`
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

    Результат = OPI_ЗапросыSQL.ПолучитьЗаписи(OPI_SQLite, Таблица, Поля, Фильтры, Сортировка, Количество, Соединение);
    Возврат Результат;

КонецФункции

// Обновить записи
// Обновляет значение записей по выбранным критериям
//
// Параметры:
//  Таблица           - Строка                     - Имя таблицы                                               - table
//  СтруктураЗначений - Структура Из КлючИЗначение - Структура значений: Ключ > поле, Значение > значение поля - values
//  Фильтры           - Массив Из Структура        - Массив фильтров. См. ПолучитьСтруктуруФильтраЗаписей      - filter
//  Соединение        - Строка, Произвольный       - Существующее соединение или путь к базе                   - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса
Функция ОбновитьЗаписи(Знач Таблица, Знач СтруктураЗначений, Знач Фильтры = "", Знач Соединение = "") Экспорт

    Результат = OPI_ЗапросыSQL.ОбновитьЗаписи(OPI_SQLite, Таблица, СтруктураЗначений, Фильтры, Соединение);
    Возврат Результат;

КонецФункции

// Удалить записи
// Удаляет записи из таблицы
//
// Параметры:
//  Таблица    - Строка               - Имя таблицы                                          - table
//  Фильтры    - Массив Из Структура  - Массив фильтров. См. ПолучитьСтруктуруФильтраЗаписей - filter
//  Соединение - Строка, Произвольный - Существующее соединение или путь к базе              - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса
Функция УдалитьЗаписи(Знач Таблица, Знач Фильтры = "", Знач Соединение = "") Экспорт

    Результат = OPI_ЗапросыSQL.УдалитьЗаписи(OPI_SQLite, Таблица, Фильтры, Соединение);
    Возврат Результат;

КонецФункции

// Удалить таблицу
// Удаляет таблицу из базы
//
// Параметры:
//  Таблица    - Строка               - Имя таблицы                             - table
//  Соединение - Строка, Произвольный - Существующее соединение или путь к базе - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса
Функция УдалитьТаблицу(Знач Таблица, Знач Соединение = "") Экспорт

    Результат = OPI_ЗапросыSQL.УдалитьТаблицу(OPI_SQLite, Таблица, Соединение);
    Возврат Результат;

КонецФункции

// Очистить таблицу
// Очищает таблицу базы
//
// Параметры:
//  Таблица    - Строка               - Имя таблицы                             - table
//  Соединение - Строка, Произвольный - Существующее соединение или путь к базе - db
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение, Строка - Результат выполнения запроса
Функция ОчиститьТаблицу(Знач Таблица, Знач Соединение = "") Экспорт

    Результат = OPI_ЗапросыSQL.УдалитьЗаписи(OPI_SQLite, Таблица, , Соединение);
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

    Возврат OPI_ЗапросыSQL.ПолучитьСтруктуруФильтраЗаписей(Пустая);

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Функция ИмяКоннектора() Экспорт
    Возврат "OPI_SQLite";
КонецФункции

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

        Blob_ = "blob";

        OPI_ПреобразованиеТипов.ПолучитьМассив(Параметры);

        Для Н = 0 По Параметры.ВГраница() Цикл

            ТекущийПараметр = Параметры[Н];

            Если ТипЗнч(ТекущийПараметр) = Тип("ДвоичныеДанные") Тогда

                ТекущийПараметр = Новый Структура(Blob_, Base64Строка(ТекущийПараметр));

            ИначеЕсли OPI_Инструменты.ПолеКоллекцииСуществует(ТекущийПараметр, Blob_) Тогда

                ЗначениеДанных = ТекущийПараметр[Blob_];
                ФайлДанных     = Новый Файл(Строка(ЗначениеДанных));

                Если ФайлДанных.Существует() Тогда
                    ТекущиеДанные   = Новый ДвоичныеДанные(Строка(ЗначениеДанных));
                    ТекущийПараметр = Новый Структура(Blob_, Base64Строка(ТекущиеДанные));
                КонецЕсли;

            ИначеЕсли ТипЗнч(ТекущийПараметр) = Тип("Дата") Тогда

                ТекущийПараметр = Формат(ТекущийПараметр, "ДФ='yyyy-MM-dd HH:MM:ss'");

            Иначе
                
                Если Не OPI_Инструменты.ЭтоПримитивныйТип(ТекущийПараметр) Тогда
                    OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущийПараметр);
                КонецЕсли;

            КонецЕсли;

            Параметры[Н] = ТекущийПараметр;

        КонецЦикла;

        Параметры_ = OPI_Инструменты.JSONСтрокой(Параметры, , Ложь);

    Иначе

        Параметры_ = "[]";

    КонецЕсли;

    Возврат Параметры_;

КонецФункции

#КонецОбласти
