// OneScript: ./OInt/core/Modules/OPI_MongoDB.os
// Lib: MongoDB
// CLI: mongodb
// Keywords: mongodb, mongo, nosql

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

#Область ПрограммныйИнтерфейс

#Область ОсновныеМетоды

// Открыть соединение !NOCLI
// Создает подключение к указанной базе
//
// Параметры:
//  СтрокаПодключения - Строка - Строка подключения - string
//
// Возвращаемое значение:
//  Произвольный - Объект коннектора или структура с информацией об ошибке
Функция ОткрытьСоединение(Знач СтрокаПодключения) Экспорт

    Если ЭтоКоннектор(СтрокаПодключения) Тогда
        Возврат СтрокаПодключения;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьСтроку(СтрокаПодключения);
    OPI_Инструменты.ВернутьУправляющиеПоследовательности(СтрокаПодключения);

    Коннектор = OPI_Компоненты.ПолучитьКомпоненту("MongoDB");

    Коннектор.ConnectionString = СтрокаПодключения;

    Результат = Коннектор.Connect();
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Возврат ?(Результат["result"], Коннектор, Результат);

КонецФункции

// Закрыть соединение !NOCLI
// Явно закрывает переданное соединение
//
// Параметры:
//  Соединение - Произвольный - Объект компоненты с открытым соединением - dbc
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Результат закрытия соединения
Функция ЗакрытьСоединение(Знач Соединение) Экспорт

    Если ЭтоКоннектор(Соединение) Тогда

        Результат = Соединение.Disconnect();
        Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Иначе

        Результат = Новый Структура("result,error", Ложь, "It's not a connection");

    КонецЕсли;

    Возврат Результат;

КонецФункции

// Это коннектор !NOCLI
// Проверяет, что значение является объектом внешней компоненты MSSQL
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоКоннектор(Знач Значение) Экспорт

    Возврат Строка(ТипЗнч(Значение)) = "AddIn.OPI_MongoDB.Main";

КонецФункции

// Сформировать строку подключения
// Формирует строку для подключения к серверу MongoDB
//
// Параметры:
//  Адрес     - Строка                                   - IP адрес с портом или доменное имя для подключения - addr
//  База      - Строка                                   - База для подключения, если необходимо              - db
//  Логин     - Строка                                   - Имя пользователя авторизации                       - usr
//  Пароль    - Строка                                   - Пароль пользователя для авторизации                - pwd
//  Параметры - Структура Из КлючИЗначение, Неопределено - Дополнительные параметры подключения               - params
//
// Возвращаемое значение:
//  Строка - Строка подключения MongoDB
Функция СформироватьСтрокуПодключения(Знач Адрес
    , Знач База = ""
    , Знач Логин = ""
    , Знач Пароль = ""
    , Знач Параметры = Неопределено) Экспорт


    OPI_ПреобразованиеТипов.ПолучитьСтроку(Адрес);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Логин);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Пароль);

    Если ЗначениеЗаполнено(Параметры) Тогда
        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Параметры);
    КонецЕсли;

    ШаблонПодключения = "mongodb://%1";

    Если ЗначениеЗаполнено(Логин) Тогда
        Авторизация = СтрШаблон("%1:%2", Логин, Пароль);
    Иначе
        Авторизация = "";
    КонецЕсли;

    Если ЗначениеЗаполнено(Авторизация) Тогда
        ОсновнаяЧасть = СтрШаблон("%1@%2", Авторизация, Адрес);
    Иначе
        ОсновнаяЧасть = Адрес;
    КонецЕсли;

    СтрокаПодключения = СтрШаблон(ШаблонПодключения, ОсновнаяЧасть);

    Если ЗначениеЗаполнено(База) Или ЗначениеЗаполнено(Параметры) Тогда

        СтрокаПодключения = СтрокаПодключения + "/";

        Если ЗначениеЗаполнено(База) Тогда
            СтрокаПодключения = СтрокаПодключения + База;
        КонецЕсли;

        Если ЗначениеЗаполнено(Параметры) Тогда

            СтрокаПодключения = СтрокаПодключения + "?";
            МассивПараметров  = Новый Массив;

            Для Каждого Параметр Из Параметры Цикл
                МассивПараметров.Добавить(СтрШаблон("%1=%2", Параметр.Ключ, Параметр.Значение));
            КонецЦикла;

            СтрокаПодключения = СтрокаПодключения + СтрСоединить(МассивПараметров, "&");

        КонецЕсли;

    КонецЕсли;

    Возврат СтрокаПодключения;

КонецФункции

#КонецОбласти

#КонецОбласти
