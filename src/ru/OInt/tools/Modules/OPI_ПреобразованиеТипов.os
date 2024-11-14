﻿// OneScript: ./OInt/tools/Modules/OPI_ПреобразованиеТипов.os

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

#Использовать "./internal"
#Область СлужебныйПрограммныйИнтерфейс

Процедура ПолучитьДвоичныеДанные(Значение) Экспорт

    Если Значение = Неопределено Тогда
        Возврат;
    КонецЕсли;

    Попытка

        Если ТипЗнч(Значение) = Тип("ДвоичныеДанные") Тогда
            Возврат;
        Иначе

            Файл = Новый Файл(Значение);

            Если Файл.Существует() Тогда

                Значение = Новый ДвоичныеДанные(Значение);

            ИначеЕсли СтрНачинаетсяС(СокрЛ(Значение), "http://")
                Или СтрНачинаетсяС(СокрЛ(Значение), "https://") Тогда

                Значение = OPI_Инструменты.Get(Значение);

            Иначе

                Значение = Base64Значение(Значение);

            КонецЕсли;

        КонецЕсли;

    Исключение
        ВызватьИсключение "Ошибка получения двоичных данных из параметра: " + ОписаниеОшибки();
    КонецПопытки;

КонецПроцедуры

Процедура ПолучитьДвоичныеИлиПоток(Значение) Экспорт

    Если Значение = Неопределено Тогда
        Возврат;
    КонецЕсли;

    Если ТипЗнч(Значение) <> Тип("Строка") Тогда
        ПолучитьДвоичныеДанные(Значение);
        Возврат;
    КонецЕсли;

    Файл = Новый Файл(Значение);

    Если Файл.Существует() Тогда
        Значение = Новый ФайловыйПоток(Значение, РежимОткрытияФайла.Открыть);
    Иначе
        ПолучитьДвоичныеДанные(Значение);
    КонецЕсли;

КонецПроцедуры

Процедура ПолучитьКоллекцию(Значение) Экспорт

    Если Значение = Неопределено Тогда
        Возврат;
    КонецЕсли;

    Попытка

        ИсходноеЗначение = Значение;

        Если ЭтоКоллекция(Значение) Тогда
            Возврат;
        Иначе

            Если ТипЗнч(Значение)    = Тип("ДвоичныеДанные") Тогда
                Значение             = ПолучитьСтрокуИзДвоичныхДанных(Значение);
            Иначе
                Значение             = OPI_Инструменты.ЧислоВСтроку(Значение);
            КонецЕсли;

            Файл        = Новый Файл(Значение);
            ЧтениеJSON  = Новый ЧтениеJSON;

            Если Файл.Существует() Тогда

                ЧтениеJSON.ОткрытьФайл(Значение);

            ИначеЕсли СтрНачинаетсяС(нРег(Значение), "http") Тогда

                ИВФ = ПолучитьИмяВременногоФайла();
                КопироватьФайл(Значение, ИВФ);
                ЧтениеJSON.ОткрытьФайл(ИВФ);
                ЧтениеJSON.Прочитать();

                УдалитьФайлы(ИВФ);

            Иначе

                ЧтениеJSON.УстановитьСтроку(СокрЛП(Значение));

            КонецЕсли;

            Значение = ПрочитатьJSON(ЧтениеJSON, Истина, Неопределено, ФорматДатыJSON.ISO);
            ЧтениеJSON.Закрыть();

            Если (Не ЭтоКоллекция(Значение)) Или Не ЗначениеЗаполнено(Значение) Тогда

                Значение = ИсходноеЗначение;
                ПолучитьМассив(Значение);

            КонецЕсли;

        КонецЕсли;

    Исключение

        Значение = ИсходноеЗначение;
        ПолучитьМассив(Значение);

    КонецПопытки;

КонецПроцедуры

Процедура ПолучитьКоллекциюКлючИЗначение(Значение, Знач СообщениеОшибки) Экспорт

    ПолучитьКоллекцию(Значение);

    Если ТипЗнч(Значение) = Тип("Массив") Тогда
        ВызватьИсключение СообщениеОшибки;
    КонецЕсли;

КонецПроцедуры

Процедура ПолучитьМассив(Значение) Экспорт

    Если ТипЗнч(Значение) = Тип("Массив") Тогда
        Возврат;
    КонецЕсли;

    Если ТипЗнч(Значение) = Тип("Строка") Тогда

        Значение_ = СокрЛП(Значение);

        Если СтрНачинаетсяС(Значение_, "{") Или СтрНачинаетсяС(Значение_, "[") Тогда

            ЧтениеJSON = Новый ЧтениеJSON;
            ЧтениеJSON.УстановитьСтроку(Значение);
            Значение   = ПрочитатьJSON(ЧтениеJSON);
            ЧтениеJSON.Закрыть();
        КонецЕсли;

    Иначе

        Если ТипЗнч(Значение) = Тип("Число") Тогда

            Значение = OPI_Инструменты.ЧислоВСтроку(Значение);

        КонецЕсли;

    КонецЕсли;

    Если Не ТипЗнч(Значение) = Тип("Массив") Тогда
        OPI_Инструменты.ЗначениеВМассив(Значение);
    КонецЕсли;

КонецПроцедуры

Процедура ПолучитьБулево(Значение) Экспорт

    Если Значение = Неопределено Тогда
        Возврат;
    КонецЕсли;

    Попытка

        Если ТипЗнч(Значение) = Тип("Булево") Тогда

            Возврат;

        Иначе

            Значение = Булево(Значение);

        КонецЕсли;

    Исключение
        ВызватьИсключение "Ошибка получения данных булево из параметра";
    КонецПопытки;

КонецПроцедуры

Процедура ПолучитьСтроку(Значение, Знач ИзИсточника = Ложь) Экспорт

    Если Значение = Неопределено Тогда
        Возврат;
    КонецЕсли;

    Попытка

        Если ЭтоСимвольное(Значение) Тогда

            Если Не ИзИсточника Тогда
                Значение = OPI_Инструменты.ЧислоВСтроку(Значение);
                Возврат;
            КонецЕсли;

            Значение = OPI_Инструменты.ЧислоВСтроку(Значение);
            Файл     = Новый Файл(Значение);

            Если Файл.Существует() Тогда

                ЧтениеТекста = Новый ЧтениеТекста(Значение);
                Значение     = ЧтениеТекста.Прочитать();
                ЧтениеТекста.Закрыть();

            ИначеЕсли СтрНачинаетсяС(СокрЛ(Значение), "http://")
                Или СтрНачинаетсяС(СокрЛ(Значение), "https://") Тогда

                Значение = OPI_Инструменты.Get(Значение);
                ПолучитьСтроку(Значение);

            Иначе

                Значение = OPI_Инструменты.ЧислоВСтроку(Значение);

            КонецЕсли;

        ИначеЕсли ТипЗнч(Значение) = Тип("ДвоичныеДанные") Тогда

            Значение = ПолучитьСтрокуИзДвоичныхДанных(Значение);

        ИначеЕсли ЭтоКоллекция(Значение) Тогда

            Значение = OPI_Инструменты.JSONСтрокой(Значение);

        ИначеЕсли ТипЗнч(Значение) = Тип("ЗаписьXML") Тогда

            Значение = Значение.Закрыть();

        Иначе
            Возврат;
        КонецЕсли;

    Исключение
        Значение = Строка(Значение);
        Возврат;
    КонецПопытки;

КонецПроцедуры

Процедура ПолучитьДату(Значение) Экспорт

    Если Значение = Неопределено Тогда
        Возврат;
    КонецЕсли;

    Дата = "Дата";

    Попытка

        Если ТипЗнч(Значение) = Тип(Дата) Тогда

            Возврат;

        Иначе

            Значение = XMLЗначение(Тип(Дата), Значение);

        КонецЕсли;

    Исключение
        ООД      = Новый ОписаниеТипов(Дата);
        Значение = ООД.ПривестиЗначение(Значение);
    КонецПопытки;

КонецПроцедуры

Процедура ПолучитьЧисло(Значение) Экспорт

    ОписаниеТипа = Новый ОписаниеТипов("Число");
    Значение     = ОписаниеТипа.ПривестиЗначение(Значение);

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ЭтоКоллекция(Знач Значение)

    Возврат ТипЗнч(Значение) = Тип("Массив")
        Или ТипЗнч(Значение) = Тип("Структура")
        Или ТипЗнч(Значение) = Тип("Соответствие");

КонецФункции

Функция ЭтоСимвольное(Знач Значение)

    Возврат ТипЗнч(Значение) = Тип("Строка")
        Или ТипЗнч(Значение) = Тип("Число")
        Или ТипЗнч(Значение) = Тип("Дата");

КонецФункции

#КонецОбласти
