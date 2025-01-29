﻿// OneScript: ./OInt/core/Modules/OPI_ПроксиИнтеграций.os
// Lib: Методы прокси интеграций
// CLI: proxy

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
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область НастройкаПроектов

// Создать проект
// Создает файл проекта по выбранному пути
//
// Параметры:
//  Путь - Строка  - Путь к файлу проекта - path
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - результат создания
Функция СоздатьПроект(Знач Путь) Экспорт

    Возврат НормализоватьПроект(Путь);

КонецФункции

// Добавить обработчик запросов
// Добавляет новый обработчик в проект
//
// Параметры:
//  Проект        - Строка - Путь к файлу проекта                                                    - proj
//  Имя           - Строка - Имя нового обработчика                                                  - name
//  СекретныйКлюч - Строка - Секретный ключ для URL обработчика                                      - secret
//  Метод         - Строка - HTTP метод, который будет обрабатывать обработчик: GET, POST, MULTIPART - method
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - результат добавления обработчика
Функция ДобавитьОбработчикЗапросов(Знач Проект, Знач Имя, Знач СекретныйКлюч, Знач Метод = "GET") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Имя);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(СекретныйКлюч);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Метод);

    Результат = ПроверитьСуществованиеПроекта(Проект);

    Если Не Результат["result"] Тогда
        Возврат Результат;
    Иначе
        Проект = Результат["path"];
    КонецЕсли;

    МассивДанных = Новый Массив;
    МассивДанных.Добавить(Новый Структура("name,secret,method", Имя, СекретныйКлюч, Метод));

    ИмяТаблицыОбработчиков = КонстантноеЗначение("ТаблицаОбработчиков");
    Результат              = OPI_SQLite.ДобавитьЗаписи(ИмяТаблицыОбработчиков, МассивДанных, , Проект);

    Возврат Результат;

КонецФункции

// Запустить
// Запускает прокси сервер интеграций
//
// Параметры:
//  Порт   - Число   - Порт запуска сервера - port
//  Проект - Строка  - Путь к файлу проекта - proj
// Возвращаемое значение:
//  Структура Из КлючИЗначение - результат остановки сервера
Функция Запустить(Знач Порт, Знач Проект) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьЧисло(Порт);

    ТипСервер = Тип("ВебСервер");

    ПараметрыСервера    = Новый Массив(1);
    ПараметрыСервера[0] = Порт;

    ВебСервер = Новый(ТипСервер, ПараметрыСервера);

    ВебСервер.ДобавитьОбработчикЗапросов(OPI_ПроксиИнтеграций, "ОсновнаяОбработка");
    ВебСервер.Запустить();

    Возврат СформироватьОтвет(Истина, "Остановлен");

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область Проект

Функция ПроверитьСуществованиеПроекта(Путь)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_Инструменты.ВернутьУправляющиеПоследовательности(Путь);

    ФайлПроекта = Новый Файл(Путь);
    Текст       = "Файл проекта существует!";
    Результат   = Истина;

    Если Не ФайлПроекта.Существует() Тогда
        Текст     = "Файл проекта по указанному пути не найден!";
        Результат = Ложь;
    КонецЕсли;

    Если ФайлПроекта.ЭтоКаталог() Тогда
        Текст     =  "Передан путь к каталогу, а не файл проекта!";
        Результат = Ложь;
    КонецЕсли;

    СтруктураОтвета = СформироватьОтвет(Результат, Текст, ФайлПроекта.ПолноеИмя);

    Возврат СтруктураОтвета;

КонецФункции

Функция НормализоватьПроект(Путь)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_Инструменты.ВернутьУправляющиеПоследовательности(Путь);

    ФайлБазы = Новый Файл(Путь);

    Если ФайлБазы.Существует() И ФайлБазы.ЭтоКаталог() Тогда

        Счетчик = 0;

        Пока ФайлБазы.Существует() Цикл

            НовыйПуть = Путь + "/new_project_" + Строка(Счетчик) + ".oint";
            ФайлБазы  = Новый Файл(НовыйПуть);

            Счетчик = Счетчик + 1;

        КонецЦикла;

    КонецЕсли;

    ПолныйПуть = ФайлБазы.ПолноеИмя;

    Если Не ФайлБазы.Существует() Тогда

        Результат = СоздатьНовыйПроект(ПолныйПуть);

        Если Результат["result"] Тогда
            Текст = "Файл проекта успешно создан!";
            Ответ = СформироватьОтвет(Истина, Текст, ПолныйПуть);
        Иначе
            Ответ = Результат;
        КонецЕсли;

    Иначе

        Текст = "Файл проекта по заданному пути уже существует!";
        Ответ = СформироватьОтвет(Ложь, Текст, ПолныйПуть);

    КонецЕсли;

    Возврат Ответ;

КонецФункции

Функция СформироватьОтвет(Знач Результат, Знач Текст, Знач Путь = "")

    Ответ = Новый Структура("result,message", Результат, Текст);

    Если ЗначениеЗаполнено(Путь) Тогда
        Ответ.Вставить("path", Путь);
    КонецЕсли;

    Возврат Ответ;

КонецФункции

Функция КонстантноеЗначение(Знач Ключ)

    Если Ключ = "ТаблицаОбработчиков" Тогда Возврат "handlers"
    Иначе Возврат "" КонецЕсли;

КонецФункции

Функция СоздатьНовыйПроект(Путь)

    ПустойФайл = ПолучитьДвоичныеДанныеИзСтроки("");
    ПустойФайл.Записать(Путь);

    Результат = СоздатьТаблицуОбработчиков(Путь);

    Если Не Результат["result"] Тогда
        УдалитьФайлы(Путь);
    КонецЕсли;

    Возврат Результат;

КонецФункции

Функция СоздатьТаблицуОбработчиков(Путь)

    СтруктураТаблицы = Новый Структура();
    СтруктураТаблицы.Вставить("id"    , "INTEGER PRIMARY KEY");
    СтруктураТаблицы.Вставить("name"  , "TEXT");
    СтруктураТаблицы.Вставить("secret", "TEXT");
    СтруктураТаблицы.Вставить("method", "TEXT");

    ИмяТаблицыОбработчиков = КонстантноеЗначение("ТаблицаОбработчиков");
    Результат              = OPI_SQLite.СоздатьТаблицу(ИмяТаблицыОбработчиков, СтруктураТаблицы, Путь);

    Возврат Результат;

КонецФункции

#КонецОбласти

#Область Обработчики

Процедура ОсновнаяОбработка(Контекст, СледующийОбработчик) Экспорт

    Попытка
        ОбработатьЗапрос(Контекст);
    Исключение

        Ошибка = ОписаниеОшибки();

        Контекст.Ответ.КодСостояния = 500;
        Контекст.Ответ.Записать(Ошибка);

    КонецПопытки

КонецПроцедуры

Процедура ОбработатьЗапрос(Контекст)

    // Путь = Контекст.Запрос.Путь;

    Контекст.Ответ.КодСостояния = 200;
    Контекст.Ответ.Записать("Hello world!");

КонецПроцедуры

#КонецОбласти

#КонецОбласти
