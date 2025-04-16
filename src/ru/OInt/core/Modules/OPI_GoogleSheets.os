﻿// OneScript: ./OInt/core/Modules/OPI_GoogleSheets.os
// Lib: Google Sheets
// CLI: gsheets
// Keywords: googlesheets, google sheets, spreadsheets

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область РаботаСКнигами

// Создать книгу
// Создает новую книгу
//
// Параметры:
//  Токен            - Строка           - Токен                                           - token
//  Наименование     - Строка           - Наименование                                    - title
//  МассивИменЛистов - Массив из Строка - Массив имен для добавления новых листов в книгу - sheets
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция СоздатьКнигу(Знач Токен, Знач Наименование, Знач МассивИменЛистов) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивИменЛистов);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets";

    Свойства = Новый Структура("title" , Наименование);
    Листы    = Новый Массив;

    ЗаполнитьМассивЛистов(МассивИменЛистов, Листы);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("properties", Свойства, "Коллекция", Параметры);
    OPI_Инструменты.ДобавитьПоле("sheets"    , Листы   , "Коллекция", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить книгу
// Получает информацию о книге по ID
//
// Параметры:
//  Токен         - Строка - Токен               - token
//  Идентификатор - Строка - Идентификатор книги - spreadsheet
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьКнигу(Знач Токен, Знач Идентификатор) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Идентификатор);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Идентификатор;

    Ответ = OPI_ЗапросыHTTP.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить наименование книги
// Изменяет наименование существующей книги
//
// Параметры:
//  Токен        - Строка - Токен              - token
//  Книга        - Строка - ID книги           - spreadsheet
//  Наименование - Строка - Новое наименование - title
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ИзменитьНаименованиеКниги(Знач Токен, Знач Книга, Знач Наименование) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Книга);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Книга + ":batchUpdate";

    Изменение       = Новый Структура("title", Наименование);
    ЗапросИзменения = Новый Структура("properties,fields", Изменение, "title");
    Запрос          = Новый Структура("updateSpreadsheetProperties", ЗапросИзменения);

    МассивЗапросов = Новый Массив;
    МассивЗапросов.Добавить(Запрос);

    Параметры = Новый Структура("requests", МассивЗапросов);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСЛистами

// Добавить лист
// Добавляет новый лист в книгу
//
//
// Параметры:
//  Токен        - Строка - Токен                     - token
//  Книга        - Строка - Идентификатор книги       - spreadsheet
//  Наименование - Строка - Наименование нового листа - title
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ДобавитьЛист(Знач Токен, Знач Книга, Знач Наименование) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Книга);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Книга + ":batchUpdate";
    Лист      = СоздатьЛист(Наименование);

    Запросы   = Новый Массив;
    Изменение = Новый Структура("addSheet", Лист);
    Запросы.Добавить(Изменение);

    Параметры = Новый Структура("requests", Запросы);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Удалить лист
// Удаляет лист из книги
//
// Параметры:
//  Токен   - Строка - Токен                          - token
//  Книга   - Строка - Идентификатор книги            - spreadsheet
//  Лист    - Строка - Идентификатор удаляемого листа - sheet
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция УдалитьЛист(Знач Токен, Знач Книга, Знач Лист) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Книга);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Лист);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Книга + ":batchUpdate";

    Запросы   = Новый Массив;
    Лист      = Новый Структура("sheetId"    , Лист);
    Изменение = Новый Структура("deleteSheet", Лист);
    Запросы.Добавить(Изменение);

    Параметры = Новый Структура("requests", Запросы);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Копировать лист
// Копирует лист из одной книги в другую
//
// Параметры:
//  Токен  - Строка - Токен - token
//  Откуда - Строка - ID книги источника   - from
//  Куда   - Строка - ID книги приемника   - to
//  Лист   - Строка - ID копируемого листа - sheet
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция КопироватьЛист(Знач Токен, Знач Откуда, Знач Куда, Знач Лист) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Откуда);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Куда);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Лист);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/"
        + Откуда
        + "/sheets/"
        + Лист
        + ":copyTo";

    Параметры = Новый Структура("destinationSpreadsheetId", Куда);
    Ответ     = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСДанными

// Установить значения ячеек
// Устанавливает значения ячеек листа
//
// Параметры:
//  Токен                - Строка                        - Токен    - token
//  Книга                - Строка                        - ID книги - spreadsheet
//  СоответствиеЗначений - Соответствие Из КлючИЗначение - Данные заполнения, где ключ это имя ячейки вида A1   - data
//  Лист                 - Строка                        - Имя листа (первый лист по умолчанию) - sheetname
//  ОсновноеИзмерение    - Строка                        - Основное измерение при заполнении диапазона массивом - dim
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция УстановитьЗначенияЯчеек(Знач Токен
    , Знач Книга
    , Знач СоответствиеЗначений
    , Знач Лист = ""
    , Знач ОсновноеИзмерение = "COLUMNS") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Книга);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(СоответствиеЗначений);

    Если Не ТипЗнч(СоответствиеЗначений) = Тип("Структура")
        И Не ТипЗнч(СоответствиеЗначений) = Тип("Соответствие") Тогда
        Возврат "Не удалось привести структуру значений к коллекции";
    КонецЕсли;

    Заголовки    = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL          = "https://sheets.googleapis.com/v4/spreadsheets/" + Книга + "/values:batchUpdate";
    МассивДанных = СформироватьМассивДанныхЯчеек(СоответствиеЗначений, ОсновноеИзмерение, Лист);

    Параметры = Новый Структура("data,valueInputOption", МассивДанных, "USER_ENTERED");
    Ответ     = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Очистить ячейки
// Очищает значение в ячейках
//
// Параметры:
//  Токен       - Строка           - Токен                                - token
//  Книга       - Строка           - ID книги                             - spreadsheet
//  МассивЯчеек - Массив из Строка - Массив ячеек вида А1 для очистки     - cells
//  Лист        - Строка           - Имя листа (первый лист по умолчанию) - sheetname
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ОчиститьЯчейки(Знач Токен, Знач Книга, Знач МассивЯчеек, Знач Лист = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Книга);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивЯчеек);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Книга + "/values:batchClear";

    СформироватьМассивИменЯчеек(МассивЯчеек, Лист);

    Параметры = Новый Структура("ranges", МассивЯчеек);
    Ответ     = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить значения ячеек
// Получает значения ячеек таблицы
//
// Параметры:
//  Токен       - Строка           - Токен                                                              - token
//  Книга       - Строка           - ID книги                                                           - spreadsheet
//  МассивЯчеек - Массив из Строка - Массив ячеек вида А1 для получения (весь лист, если не заполнено)  - cells
//  Лист        - Строка           - Имя листа (первый лист по умолчанию)                               - sheetname
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьЗначенияЯчеек(Знач Токен, Знач Книга, Знач МассивЯчеек = "", Знач Лист = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Книга);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://sheets.googleapis.com/v4/spreadsheets/" + Книга + "/values:batchGet";

    Если ЗначениеЗаполнено(МассивЯчеек) Тогда

        OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивЯчеек);
        СформироватьМассивИменЯчеек(МассивЯчеек, Лист);
        Первый = Истина;

        Для Каждого Ячейка Из МассивЯчеек Цикл

            Разделитель = ?(Первый, "?", "&");
            URL         = URL + Разделитель + "ranges=" + Ячейка;
            Первый      = Ложь;

        КонецЦикла;

    Иначе

        URL = URL + "?ranges='" + Лист + "'";

    КонецЕсли;

    Ответ = OPI_ЗапросыHTTP.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЗаполнитьМассивЛистов(Знач МассивИмен, МассивЛистов)

    Для Каждого ИмяЛиста Из МассивИмен Цикл

        Лист = СоздатьЛист(ИмяЛиста);
        МассивЛистов.Добавить(Лист);

    КонецЦикла;

КонецПроцедуры

Процедура ДобавитьИмяЛиста(Ячейка, Знач Лист)

    Если ЗначениеЗаполнено(Лист) Тогда
        Ячейка = "'" + Лист + "'!" + Ячейка;
    КонецЕсли;

КонецПроцедуры

Функция СоздатьЛист(Знач Наименование)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);

    СвойстваЛиста = Новый Структура("title"     , Наименование);
    Лист          = Новый Структура("properties", СвойстваЛиста);

    Возврат Лист;

КонецФункции

Функция СформироватьМассивДанныхЯчеек(Знач СтруктураЗначений, Знач ОсновноеИзмерение, Знач Лист)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Лист);

    МассивДанных = Новый Массив;

    Для Каждого ДанныеЯчейки Из СтруктураЗначений Цикл

        ТекущееЗначение = ДанныеЯчейки.Значение;
        ТекущийКлюч     = ДанныеЯчейки.Ключ;

        ДобавитьИмяЛиста(ТекущийКлюч, Лист);

        OPI_ПреобразованиеТипов.ПолучитьМассив(ТекущееЗначение);

        ТекущиеДанные = Новый Соответствие;
        ТекущийМассив = Новый Массив;

        ТекущийМассив.Добавить(ТекущееЗначение);

        OPI_Инструменты.ДобавитьПоле("range"         , ТекущийКлюч      , "Строка", ТекущиеДанные);
        OPI_Инструменты.ДобавитьПоле("values"        , ТекущийМассив    , "Массив", ТекущиеДанные);
        OPI_Инструменты.ДобавитьПоле("majorDimension", ОсновноеИзмерение, "Строка", ТекущиеДанные);

        МассивДанных.Добавить(ТекущиеДанные);

    КонецЦикла;

    Возврат МассивДанных;

КонецФункции

Процедура СформироватьМассивИменЯчеек(Знач МассивИмен, Знач Лист)

   OPI_ПреобразованиеТипов.ПолучитьСтроку(Лист);

   Для Н = 0 По МассивИмен.ВГраница() Цикл
       ДобавитьИмяЛиста(МассивИмен[Н], Лист);
   КонецЦикла;

КонецПроцедуры

#КонецОбласти
