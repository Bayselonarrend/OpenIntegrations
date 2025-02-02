// OneScript: ./OInt/tools/Classes/OPI_ОбработчикЗапросовПрокси.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfOptionalParams-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check use-non-recommended-method
//@skip-check module-accessibility-at-client
//@skip-check object-module-export-variable

#Область ОписаниеПеременных


Перем ПутьПроекта Экспорт;
Перем МодульПрокси Экспорт;
Перем ОбъектОПИ Экспорт;

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Процедура ОсновнаяОбработка(Контекст, СледующийОбработчик) Экспорт

    Попытка
        ОбработатьЗапрос(Контекст);
    Исключение

        Ошибка = ОписаниеОшибки();

        Контекст.Ответ.КодСостояния = 500;
        Контекст.Ответ.ЗаписатьКакJson(Новый Структура("result,error", Ложь, Ошибка));

    КонецПопытки

КонецПроцедуры

Процедура ОбработатьЗапрос(Контекст)

    Путь = Контекст.Запрос.Путь;

    Путь = ?(СтрНачинаетсяС(Путь    , "/")    , Прав(Путь, СтрДлина(Путь) - 1) , Путь);
    Путь = ?(СтрЗаканчиваетсяНа(Путь, "/")    , Лев(Путь , СтрДлина(Путь) - 1) , Путь);

    ОписаниеОбработчика = МодульПрокси.ПолучитьОбработчикЗапросов(ПутьПроекта, Путь);

    Если ОписаниеОбработчика["result"] Тогда

        Обработчик = ОписаниеОбработчика["data"];
        Обработчик = ?(ТипЗнч(Обработчик) = Тип("Массив"), Обработчик[0], Обработчик);

        ВыполнитьОбработку(Контекст, Обработчик);

    Иначе
        ОшибкаОбработки(Контекст, 404, "Handler not found!");
    КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ВыполнитьОбработку(Контекст, Обработчик)

    Метод = вРег(Контекст.Запрос.Метод);

    Если Не Метод = вРег(Обработчик["method"]) Тогда
        ОшибкаОбработки(Контекст, 405, "Method not allowed for this handler");
        Возврат;
    КонецЕсли;

    Если Метод = "GET" Тогда
        ВыполнитьОбработкуGet(Контекст, Обработчик);
    Иначе
        ОшибкаОбработки(Контекст, 405, "Method not allowed for this handler");
    КонецЕсли;

КонецПроцедуры

Процедура ВыполнитьОбработкуGet(Контекст, Обработчик)

    Запрос    = Контекст.Запрос;
    Параметры = Запрос.Параметры;
    Аргументы = Обработчик["args"];

    АргументыСтрогие   = Новый Соответствие;
    АргументыНестрогие = Новый Соответствие;

    Для Каждого Аргумент Из Аргументы Цикл

        Если Аргумент["strict"] = 1 Тогда
            АргументыСтрогие.Вставить(Аргумент["arg"], Аргумент["value"]);
        Иначе
            АргументыНестрогие.Вставить(Аргумент["arg"], Аргумент["value"]);
        КонецЕсли;

    КонецЦикла;

    КотелПараметров = АргументыНестрогие;

    Для Каждого Параметр Из Параметры Цикл
        КотелПараметров.Вставить(Параметр.Ключ, Параметр.Значение);
    КонецЦикла;

    Для Каждого Аргумент Из АргументыСтрогие Цикл
        КотелПараметров.Вставить(Аргумент.Ключ, Аргумент.Значение);
    КонецЦикла;

    ВыполнитьУниверсальнуюОбработку(Контекст
        , Обработчик["library"]
        , Обработчик["function"]
        , КотелПараметров);

КонецПроцедуры

Процедура ВыполнитьУниверсальнуюОбработку(Контекст, Команда, Метод, Параметры)

    СтруктураВыполнения = ОбъектОПИ.СформироватьСтрокуВызоваМетода(Параметры, Команда, Метод);

    Если СтруктураВыполнения["Ошибка"] Тогда
        Ответ = Новый Структура("result,error", Ложь, "Error in a handler command or method");
    Иначе

        ТекстВыполнения = СтруктураВыполнения["Результат"];

        Выполнить(ТекстВыполнения);


    КонецЕсли;

    Контекст.Ответ.ЗаписатьКакJson(Ответ);

КонецПроцедуры

Процедура ОшибкаОбработки(Контекст, Код, Текст)

    Контекст.Ответ.КодСостояния = Код;
    Контекст.Ответ.ЗаписатьКакJson(Новый Структура("result,error", Ложь, Текст));

КонецПроцедуры

#КонецОбласти
