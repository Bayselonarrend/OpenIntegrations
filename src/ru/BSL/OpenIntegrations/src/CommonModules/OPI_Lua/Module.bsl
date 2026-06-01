// OneScript: ./OInt/api/lua/Modules/OPI_Lua.os
// Lib: Lua
// CLI: lua
// Keywords: lua

// DocsCategory: Calendar
// DocsNameRU: Lua
// DocsNameEN: Lua

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// #Использовать "../../../tools/main"

#Если Не ВебКлиент Тогда // !OPI

#Область ПрограммныйИнтерфейс

// Создать VM !NOCLI
// Инициализирует LuaVM указанной версии
//
// Параметры:
//  Версия      - Строка                     - Версия VM: Lua54, LuaJIT                                - ver
//  Логирование - Структура Из КлючИЗначение - Настройки логирования. См. ПолучитьНастройкиЛогирования - log
//
// Возвращаемое значение:
//  Произвольный - Объект коннектора или соответствие с информацией об ошибке
Функция СоздатьVM(Знач Версия, Знач Логирование = Неопределено) Экспорт

    Если ЭтоVM(Версия) Тогда
        Возврат Версия;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Версия);

    Если Версия <> "Lua54" И Версия <> "LuaJIT" Тогда

        СоответствиеОшибки = Новый Соответствие;
        СоответствиеОшибки.Вставить("result", false);
        СоответствиеОшибки.Вставить("error" , "Unsupported Lua version. Required: Lua54, LuaJIT");

    КонецЕсли;

    Компонента = OPI_Компоненты.ПолучитьКомпоненту(Версия);

    Если Логирование = Неопределено Тогда

        СтрокаНастроек = "";

    Иначе

        ТекстОшибки    = "Некорректные настройки логирования";
        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Логирование, ТекстОшибки);
        СтрокаНастроек = OPI_Инструменты.JSONСтрокой(Логирование);

    КонецЕсли;

    Если ЗначениеЗаполнено(СтрокаНастроек) Тогда

        РезультатЛога = Компонента.SetLogger(СтрокаНастроек);
        РезультатЛога = OPI_Компоненты.ДесериализоватьJanx(РезультатЛога);

        Если Не РезультатЛога["result"] Тогда
            Возврат РезультатЛога;
        КонецЕсли;

    КонецЕсли;

    Возврат Компонента;

КонецФункции

// Выполнить код из строки
// Выполняет Lua скрипт из переданной строки
//
// Примечание:
// Ошибка при выполнении Lua кода вызовет исключение
//
// Параметры:
//  Lua - Произвольный - Компонента Lua или версия Lua для запуска - lua
//  Код - Строка       - Код строкой                               - code
//
// Возвращаемое значение:
//  Произвольный - Результат выполнения кода
Функция ВыполнитьКодИзСтроки(Знач Lua, Знач Код) Экспорт

    Компонента = СоздатьVM(Lua);

     Если ЭтоVM(Компонента) Тогда
         Возврат Компонента;
     КонецЕсли;

     OPI_ПреобразованиеТипов.ПолучитьСтроку(Код);

    РезультатДД = Компонента.ExecuteString(Код);

    Возврат РезультатИзJanx(РезультатДД);

КонецФункции

// Выполнить код из файла
// Выполняет Lua скрипт на диске
//
// Примечание:
// Ошибка при выполнении Lua кода вызовет исключение
//
// Параметры:
//  Lua  - Произвольный - Компонента Lua или версия Lua для запуска - lua
//  Путь - Строка       - Путь к файлу скрипта                      - path
//
// Возвращаемое значение:
//  Произвольный - Результат выполнения кода
Функция ВыполнитьКодИзФайла(Знач Lua, Знач Путь) Экспорт

    Компонента = СоздатьVM(Lua);

     Если ЭтоVM(Компонента) Тогда
         Возврат Компонента;
     КонецЕсли;

     OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);

     ФайлСкрипта = Новый Файл(Путь);

     Если Не ФайлСкрипта.Существует() Тогда

         СоответствиеОшибки = Новый Соответствие;
         СоответствиеОшибки.Вставить("result", Ложь);
         СоответствиеОшибки.Вставить("error" , "File not found");

         Возврат СоответствиеОшибки;

     КонецЕсли;

    РезультатДД = Компонента.ExecuteFile(ФайлСкрипта.ПолноеИмя);

    Возврат РезультатИзJanx(РезультатДД);

КонецФункции

// Вызвать функцию
// Вызывает функцию Lua с аргументами, переданными массивом
//
// Параметры:
//  Lua        - Произвольный - Компонента Lua или версия Lua для запуска     - lua
//  ИмяФункции - Строка       - Имя функции или путь вида module.func         - func
//  Аргументы  - Массив       - Аргументы вызова (допускаются ДвоичныеДанные) - args
//
// Возвращаемое значение:
//  Произвольный - Результат вызова
Функция ВызватьФункцию(Знач Lua, Знач ИмяФункции, Знач Аргументы = Неопределено) Экспорт

    Компонента = СоздатьVM(Lua);

    Если ЭтоVM(Компонента) Тогда
        Возврат Компонента;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИмяФункции);

    Если Аргументы = Неопределено Тогда
        Аргументы = Новый Массив;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьМассив(Аргументы);

    АргументыДД = OPI_Компоненты.СериализоватьJanx(Аргументы);
    РезультатДД = Компонента.CallFunction(ИмяФункции, АргументыДД);

    Возврат РезультатИзJanx(РезультатДД);

КонецФункции

// Это VM !NOCLI
// Проверяет, что значение является объектом внешней компоненты Lua
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоVM(Знач Значение) Экспорт

    ТипСтрокой = Строка(ТипЗнч(Значение));

    Возврат ТипСтрокой = "AddIn.OPI_LuaJIT.Main"
        Или ТипСтрокой = "AddIn.OPI_Lua54.Main"

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Функция РезультатИзJanx(Знач ДанныеJanx)

    Результат = OPI_Компоненты.ДесериализоватьJanx(ДанныеJanx);

    Если Не Результат["result"] Тогда
        ВызватьИсключение Результат["error"];
    КонецЕсли;

    Возврат Результат["data"];

КонецФункции

#КонецОбласти

#КонецЕсли // !OPI

