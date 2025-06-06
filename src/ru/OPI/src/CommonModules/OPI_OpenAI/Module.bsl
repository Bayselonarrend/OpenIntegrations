// OneScript: ./OInt/core/Modules/OPI_OpenAI.os
// Lib: OpenAI
// CLI: openai

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

// Получить ответ
// Генерирует ответ по заданному текстовому запросу
//
// Примечание:
// Метод в документации API: [Create chat completion](@platform.openai.com/docs/api-reference/chat/create)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                                  - url
//  Токен        - Строка                        - Токен авторизации OpenAI                            - token
//  Модель       - Строка                        - Имя модели                                          - model
//  Сообщения    - Строка, Массив Из Строка      - Сообщения разговора. См. ПолучитьСтруктуруСообщения - msgs
//  ДопПараметры - Структура Из КлючИЗначение    - Коллекция КлючЗначение дополнительных параметров    - options
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп. заголовки запроса, если необходимо             - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьОтвет(Знач URL, Знач Токен, Знач Модель, Знач Сообщения, Знач ДопПараметры = "", Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "v1/chat/completions");

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("model"   , Модель   , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("messages", Сообщения, "Массив", Параметры);
    OPI_Инструменты.ДобавитьПоле("stream"  , Ложь     , "Булево", Параметры);

    ОбработатьПараметры(Параметры, ДопПараметры);
    ОбработатьЗаголовки(ДопЗаголовки, Токен);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Получить представления
// Получает представления (embeddings) для заданных вводных
//
// Примечание:
// Метод в документации API: [Create embeddings](@platform.openai.com/docs/api-reference/embeddings/create)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                                           - url
//  Токен        - Строка                        - Токен авторизации OpenAI                                     - token
//  Модель       - Строка                        - Имя модели                                                   - model
//  Текст        - Массив Из Строка              - Строка или массив строк запросов                             - input
//  ДопПараметры - Структура Из КлючИЗначение    - Доп. параметры. См. ПолучитьСтруктуруПараметровПредставлений - options
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо                       - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьПредставления(Знач URL, Знач Токен, Знач Модель, Знач Текст, Знач ДопПараметры = "", Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "v1/embeddings");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("model", Модель, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("input", Текст , "Массив", Параметры);

    ОбработатьПараметры(Параметры, ДопПараметры);
    ОбработатьЗаголовки(ДопЗаголовки, Токен);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Получить структуру сообщения контекста
// Получает структуру сообщения для списка сообщений запроса
//
// Параметры:
//  Роль   - Строка  - Источник сообщения: system, user, developer  - role
//  Текст  - Строка  - Текст сообщения                              - text
//  Имя    - Строка  - Имя участника разговора                      - name
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьСтруктуруСообщения(Знач Роль, Знач Текст, Знач Имя = "") Экспорт

    СтруктураПолей = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("role"   , Роль , "Строка", СтруктураПолей);
    OPI_Инструменты.ДобавитьПоле("content", Текст, "Строка", СтруктураПолей);
    OPI_Инструменты.ДобавитьПоле("name"   , Имя  , "Строка", СтруктураПолей);

    Возврат СтруктураПолей;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

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

Процедура ОбработатьЗаголовки(ДопЗаголовки, Знач Токен)

    Если Не ЗначениеЗаполнено(ДопЗаголовки) Тогда
        ДопЗаголовки = Новый Соответствие;
    Иначе
        ТекстОшибки  = "Передана некорректная коллекция доп. заголовков!";
        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ДопЗаголовки, ТекстОшибки);
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    ДопЗаголовки.Вставить("Authorization", СтрШаблон("Bearer %1", Токен));

КонецПроцедуры

#КонецОбласти
