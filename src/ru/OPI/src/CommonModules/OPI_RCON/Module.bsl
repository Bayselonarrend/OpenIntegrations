// OneScript: ./OInt/api/rcon/Modules/OPI_RCON.os
// Lib: RCON
// CLI: rcon
// Keywords: rcon, remote console

// DocsCategory: Exchange
// DocsNameRU: RCON
// DocsNameEN: RCON

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// #Использовать "../../../tools/main"
// #Использовать "../../../tools/http"

#Область ПрограммныйИнтерфейс

#Область ВыполнениеКоманд

// Открыть соединение !NOCLI
// Открывает новое соединения RCON
//
// Параметры:
//  ПараметрыСоединения - Структура Из КлючИЗначение - Параметры соединения. См. СформироватьПараметрыСоединения - params
//
// Возвращаемое значение:
//  Произвольный - Объект коннектора или структура с информацией об ошибке
Функция ОткрытьСоединение(Знач ПараметрыСоединения) Экспорт

    Если ЭтоКоннектор(ПараметрыСоединения) Тогда
        Возврат ПараметрыСоединения;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ПараметрыСоединения);

    МассивОбязательных = СтрРазделить("url,password,read_timeout,write_timeout", ",");
    МассивНедостающих  = OPI_Инструменты.НайтиОтсутствующиеПоляКоллекции(ПараметрыСоединения, МассивОбязательных);

    Если ЗначениеЗаполнено(МассивНедостающих) Тогда
        ВызватьИсключение СтрШаблон("Отсутствуют параметры подключения: %1", СтрСоединить(МассивНедостающих, ", "));
    КонецЕсли;

    Коннектор = OPI_Компоненты.ПолучитьКомпоненту("RCON");

    URL           = ПараметрыСоединения["url"];
    Пароль        = ПараметрыСоединения["password"];
    ТаймаутЧтения = ПараметрыСоединения["read_timeout"];
    ТаймаутЗаписи = ПараметрыСоединения["write_timeout"];

    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Пароль);
    OPI_ПреобразованиеТипов.ПолучитьЧисло(ТаймаутЧтения);
    OPI_ПреобразованиеТипов.ПолучитьЧисло(ТаймаутЗаписи);

    Результат = Коннектор.Connect(URL, Пароль, ТаймаутЧтения, ТаймаутЗаписи);
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Возврат ?(Результат["result"], Коннектор, Результат);

КонецФункции

// Выполнить команду
// Выполняет команду на сервере
//
// Примечание:
// При передаче параметров соединения, новое соединение будет создано и закрыто в рамках выполнения одной команды.^^
// Для выполнения нескольких команд (в версиях для OS и 1С) рекомендуется использовать заранее созданное соединение (см. ОткрытьСоединение)
//
// Параметры:
//  Команда    - Строка                                   - Текст команды                       - exec
//  Соединение - Произвольный, Структура Из КлючИЗначение - Соединение или параметры соединения - conn
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения команды
Функция ВыполнитьКоманду(Знач Команда, Знач Соединение) Экспорт

    Если ЭтоКоннектор(Соединение) Тогда
        Коннектор = Соединение;
    Иначе
        Коннектор = ОткрытьСоединение(Соединение);
    КонецЕсли;

    Если Не ЭтоКоннектор(Коннектор) Тогда
        Возврат Коннектор;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Команда);

    Результат = Коннектор.Command(Команда);
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат);

    Возврат Результат;

КонецФункции

// Сформировать параметры соединения
// Формирует коллекцию параметров соединения
//
// Параметры:
//  URL           - Строка - URL сервера                                    - url
//  Пароль        - Строка - Пароль для подключения                         - pass
//  ТаймаутЧтения - Число  - Таймаут ожидания ответа (в секундах)           - rtout
//  ТаймаутЗаписи - Число  - Таймаут ожидания отправки запроса (в секундах) - wtout
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура параметров соединения
Функция СформироватьПараметрыСоединения(Знач URL, Знач Пароль, Знач ТаймаутЧтения = 30, Знач ТаймаутЗаписи = 30) Экспорт

    ПараметрыСоединения = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("url"          , URL          , "Строка", ПараметрыСоединения);
    OPI_Инструменты.ДобавитьПоле("password"     , Пароль       , "Строка", ПараметрыСоединения);
    OPI_Инструменты.ДобавитьПоле("read_timeout" , ТаймаутЧтения, "Число" , ПараметрыСоединения);
    OPI_Инструменты.ДобавитьПоле("write_timeout", ТаймаутЗаписи, "Число" , ПараметрыСоединения);

    Возврат ПараметрыСоединения;

КонецФункции

// Это коннектор !NOCLI
// Проверяет, что значение является объектом внешней компоненты RCON
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоКоннектор(Знач Значение) Экспорт

    Возврат Строка(ТипЗнч(Значение)) = "AddIn.OPI_RCON.Main";

КонецФункции

#КонецОбласти

#КонецОбласти
