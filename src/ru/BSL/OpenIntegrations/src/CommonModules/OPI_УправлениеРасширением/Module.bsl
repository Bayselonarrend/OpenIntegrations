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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:CognitiveComplexity-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

#Если Не ВебКлиент Тогда // !OPI

#Область СлужебныйПрограммныйИнтерфейс

Процедура ПодключитьВсеКомпоненты() Экспорт

    СписокМакетовКомпонент = OPI_ИнструментыВызовСервера.ПолучитьСписокКомпонент();

    Для Каждого МакетКомпоненты Из СписокМакетовКомпонент Цикл
        ПодключитьКомпоненту(МакетКомпоненты);
    КонецЦикла;

    OPI_Инструменты.Пауза(1);

КонецПроцедуры

Процедура ПодключитьКомпоненту(Знач ИмяКомпоненты) Экспорт

    Местоположение = СтрШаблон("ОбщийМакет.%1", ИмяКомпоненты);

    Попытка

        ТипКомпоненты = СтрШаблон("AddIn.%1.Main", ИмяКомпоненты);

        //@skip-check module-unused-local-variable
        Компонента    = Новый (ТипКомпоненты);

    Исключение
        #Если Клиент Тогда

            ООп = Новый ОписаниеОповещения("ПослеПодключенияКомпоненты", ЭтотОбъект, ИмяКомпоненты);

            НачатьПодключениеВнешнейКомпоненты(ООп
                , Местоположение
                , ИмяКомпоненты
                , ТипВнешнейКомпоненты.Native);

        #Иначе
            ПодключитьВнешнююКомпоненту(Местоположение, ИмяКомпоненты, ТипВнешнейКомпоненты.Native);
        #КонецЕсли
    КонецПопытки;

КонецПроцедуры

Функция ПолучитьСписокВерсийКомпонент() Экспорт

    СписокМакетовКомпонент = OPI_ИнструментыВызовСервера.ПолучитьСписокКомпонент();
    МассивДанныхКомпонент  = Новый Массив;

    Для Каждого МакетКомпоненты Из СписокМакетовКомпонент Цикл

        ВерсияКонфигурации = OPI_ИнструментыВызовСервера.ПолучитьВерсиюКомпоненты(МакетКомпоненты);
        ВерсияКлиента      = Неопределено;

        #Если Клиент Тогда

            Компонента = Неопределено;

            Попытка
                ТипКомпоненты = СтрШаблон("AddIn.%1.Main", МакетКомпоненты);
                Компонента    = Новый (ТипКомпоненты);
            Исключение
                ВерсияКлиента = Неопределено;
            КонецПопытки;

            Если Компонента <> Неопределено Тогда

                Попытка
                    ВерсияКлиента = Компонента.Version();
                Исключение
                    ВерсияКлиента = ОписаниеОшибки();
                КонецПопытки;

            КонецЕсли;

        #КонецЕсли

        СтруктураКомпоненты = Новый Структура;
        СтруктураКомпоненты.Вставить("ИмяКомпоненты"     , МакетКомпоненты);
        СтруктураКомпоненты.Вставить("ВерсияКонфигурации", ВерсияКонфигурации);
        СтруктураКомпоненты.Вставить("ВерсияКлиента"     , ВерсияКлиента);

        МассивДанныхКомпонент.Добавить(СтруктураКомпоненты);

    КонецЦикла;

    Возврат МассивДанныхКомпонент;

КонецФункции

Процедура ОбновитьКомпонентыНаКлиенте(Знач ИменаКомпонент) Экспорт

    #Если Клиент Тогда
        Для Каждого ИмяКомпоненты Из ИменаКомпонент Цикл

            ООп = Новый ОписаниеОповещения("ПодключитьКомпоненту", ЭтотОбъект, ИмяКомпоненты);
            НачатьУстановкуВнешнейКомпоненты(ООп, СтрШаблон("ОбщийМакет.%1", ИмяКомпоненты));

        КонецЦикла;
    #КонецЕсли

КонецПроцедуры

Процедура ПослеПодключенияКомпоненты(Знач Подключена, Знач ИмяКомпоненты) Экспорт

    Если Подключена Тогда

        ТипКомпоненты = СтрШаблон("AddIn.%1.Main", ИмяКомпоненты);
        Компонента    = Новый (ТипКомпоненты);

        Попытка
            ВерсияКлиента = Компонента.Version();
        Исключение
            ВерсияКлиента = ОписаниеОшибки();
        КонецПопытки;

    Иначе
        ВерсияКлиента = Неопределено;
    КонецЕсли;

    ВерсияКонфигурации = OPI_ИнструментыВызовСервера.ПолучитьВерсиюКомпоненты(ИмяКомпоненты);

    СтруктураОповещения = Новый Структура();
    СтруктураОповещения.Вставить("ИмяКомпоненты"     , ИмяКомпоненты);
    СтруктураОповещения.Вставить("ВерсияКлиента"     , ВерсияКлиента);
    СтруктураОповещения.Вставить("ВерсияКонфигурации", ВерсияКонфигурации);

    Оповестить("OPI_ЗавершениеУстановки", СтруктураОповещения);

КонецПроцедуры

#КонецОбласти

#КонецЕсли // !OPI
