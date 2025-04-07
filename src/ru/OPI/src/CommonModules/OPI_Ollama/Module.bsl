// OneScript: ./OInt/core/Modules/OPI_Ollama.os
// Lib: Ollama
// CLI: ollama

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область ОбработкаЗапросов

// Обработать запрос
// Генерирует ответ по заданному текстовому запросу
//
// Примечание:
// Метод в документации API: [Generate a completion](@github.com/ollama/ollama/blob/main/docs/api.md#generate-a-completion)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                                     - url
//  Модель       - Строка                        - Имя модели                                             - model
//  Промпт       - Строка                        - Текст запроса                                          - prompt
//  ДопПараметры - Структура Из КлючИЗначение    - Доп. параметры. См. ПолучитьСтруктуруПараметровЗапроса - options
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо                 - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ОбработатьЗапрос(Знач URL, Знач Модель, Знач Промпт, Знач ДопПараметры = "", Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/generate");

    Параметры = Новый Структура;
    Параметры.Вставить("suffix", "");

    OPI_Инструменты.ДобавитьПоле("model" , Модель, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("prompt", Промпт, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("stream", Ложь  , "Булево", Параметры);

    ОбработатьПараметры(Параметры, ДопПараметры);
    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

Процедура ДополнитьURL(URL, Знач Путь)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);

    URL = ?(СтрЗаканчиваетсяНа(URL, "/"), URL, URL + "/");
    URL = URL + Путь;

КонецПроцедуры

Процедура ОбработатьПараметры(Параметры, Знач ДопПараметры)

    Если Не ЗначениеЗаполнено(ДопПараметры) Тогда
        Возврат;
    КонецЕсли;

    ТекстОшибки = "Передана некорректная коллекция доп. параметров!";
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ДопПараметры, ТекстОшибки);

    Для Каждого ДопПараметр Из ДопПараметры Цикл
        Параметры.Вставить(ДопПараметр.Ключ, ДопПараметр.Значение);
    КонецЦикла;

КонецПроцедуры

Процедура ОбработатьЗаголовки(ДопЗаголовки)

    Если Не ЗначениеЗаполнено(ДопЗаголовки) Тогда
        ДопЗаголовки = Новый Соответствие;
    Иначе
        ТекстОшибки  = "Передана некорректная коллекция доп. заголовков!";
        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ДопЗаголовки, ТекстОшибки);
    КонецЕсли;

КонецПроцедуры

#КонецОбласти
