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

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

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

    Путь = Контекст.Запрос.Путь;

    Путь = ?(СтрНачинаетсяС(Путь    , "/")    , Прав(Путь, СтрДлина(Путь - 1)) , Путь);
    Путь = ?(СтрЗаканчиваетсяНа(Путь, "/")    , Лев(Путь , СтрДлина(Путь - 1)) , Путь);

    ОписаниеОбработчика = МодульПрокси.ПолучитьОбработчикЗапросов(ПутьПроекта, Путь);

    Контекст.Ответ.КодСостояния = 200;
    Контекст.Ответ.Записать("Hello world!");

КонецПроцедуры

#КонецОбласти
