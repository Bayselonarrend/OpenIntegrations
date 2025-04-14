﻿// OneScript: ./OInt/core/Modules/OPI_Ollama.os
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

// Получить версию
// Получает версию Ollama
//
// Примечание:
// Метод в документации API: [Version](@github.com/ollama/ollama/blob/main/docs/api.md#version)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                     - url
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьВерсию(Знач URL, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/version");
    Ответ = OPI_Инструменты.Get(URL, , ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Получить ответ
// Генерирует ответ по заданному текстовому запросу
//
// Примечание:
// Метод в документации API: [Generate a completion](@github.com/ollama/ollama/blob/main/docs/api.md#generate-a-completion)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                                     - url
//  Модель       - Строка                        - Имя модели                                             - model
//  Вопрос       - Строка                        - Текст запроса                                          - prompt
//  ДопПараметры - Структура Из КлючИЗначение    - Доп. параметры. См. ПолучитьСтруктуруПараметровЗапроса - options
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо                 - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьОтвет(Знач URL, Знач Модель, Знач Вопрос, Знач ДопПараметры = "", Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/generate");

    Параметры = Новый Структура;
    Параметры.Вставить("suffix", "");

    OPI_Инструменты.ДобавитьПоле("model" , Модель, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("prompt", Вопрос, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("stream", Ложь  , "Булево", Параметры);

    ОбработатьПараметры(Параметры, ДопПараметры);
    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Получить ответ в контексте
// Получает очередной ответ от модели в соответствии с историей сообщений
//
// Примечание:
// Метод в документации API: [Generate a chat completion](@github.com/ollama/ollama/blob/main/docs/api.md#generate-a-chat-completion)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                                         - url
//  Модель       - Строка                        - Имя модели                                                 - model
//  Сообщения    - Массив Из Структура           - История сообщений. См. ПолучитьСтруктуруСообщенияКонтекста - msgs
//  ДопПараметры - Структура Из КлючИЗначение    - Доп. параметры. См. ПолучитьСтруктуруПараметровЗапроса     - options
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо                     - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьОтветВКонтексте(Знач URL, Знач Модель, Знач Сообщения, Знач ДопПараметры = "", Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/chat");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("model"   , Модель   , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("messages", Сообщения, "Коллекция", Параметры);
    OPI_Инструменты.ДобавитьПоле("stream"  , Ложь     , "Булево"   , Параметры);

    ОбработатьПараметры(Параметры, ДопПараметры);
    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Получить представления
// Получает представления (embeddings) для заданных вводных
//
// Примечание:
// Метод в документации API: [Generate Embeddings](@github.com/ollama/ollama/blob/main/docs/api.md#generate-embeddings)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                                           - url
//  Модель       - Строка                        - Имя модели                                                   - model
//  Вопрос       - Массив Из Строка              - Строка или массив строк запросов                             - input
//  ДопПараметры - Структура Из КлючИЗначение    - Доп. параметры. См. ПолучитьСтруктуруПараметровПредставлений - options
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо                       - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьПредставления(Знач URL, Знач Модель, Знач Вопрос, Знач ДопПараметры = "", Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/embed");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("model", Модель, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("input", Вопрос, "Строка", Параметры);

    ОбработатьПараметры(Параметры, ДопПараметры);
    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Получить структуру параметров запроса
// Получает структуру дополнительных параметров для обработки запроса
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьСтруктуруПараметровЗапроса(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураПолей = Новый Структура;
    СтруктураПолей.Вставить("format"    , "<формат, в котором возвращается ответ: json или схема JSON>");
    СтруктураПолей.Вставить("options"   , "<дополнительные параметры модели, перечисленные в документации к Modelfile>");
    СтруктураПолей.Вставить("system"    , "<системное сообщение (переопределяет то, что определено в Modelfile)>");
    СтруктураПолей.Вставить("template"  , "<шаблон промпта (переопределяет то, что определено в Modelfile)>");
    СтруктураПолей.Вставить("raw"       , "<истина > откюлчить форматирование промпта>");
    СтруктураПолей.Вставить("keep_alive", "<как долго модель будет оставаться загруженной в память после запроса>");
    СтруктураПолей.Вставить("suffix"    , "<текст после ответа модели>");
    СтруктураПолей.Вставить("images"    , "<список картинок в формате Base64 (для многомодальных моделей, вроде llava)>");

    Если Пустая Тогда
        СтруктураПолей = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураПолей);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураПолей;

КонецФункции

// Получить структуру параметров представлений
// Получает структуру дополнительных параметров для обработки запросов получения представлений
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьСтруктуруПараметровПредставлений(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураПолей = Новый Структура;
    СтруктураПолей.Вставить("options"   , "<дополнительные параметры модели, перечисленные в документации к Modelfile>");
    СтруктураПолей.Вставить("keep_alive", "<как долго модель будет оставаться загруженной в память после запроса>");
    СтруктураПолей.Вставить("truncate"  , "<обрезает конец каждого ответа, чтобы уложиться в длину контекста. Возвращает ошибку, если false и длина превышена>");

    Если Пустая Тогда
        СтруктураПолей = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураПолей);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураПолей;

КонецФункции

// Получить структуру параметров в контексте
// Получает структуру дополнительных параметров для обработки запроса в контексте
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьСтруктуруПараметровВКонтексте(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураПолей = Новый Структура;
    СтруктураПолей.Вставить("format"    , "<формат, в котором возвращается ответ: json или схема JSON>");
    СтруктураПолей.Вставить("options"   , "<дополнительные параметры модели, перечисленные в документации к Modelfile>");
    СтруктураПолей.Вставить("keep_alive", "<как долго модель будет оставаться загруженной в память после запроса>");
    СтруктураПолей.Вставить("tools"     , "<список инструментов в формате JSON (для моделей, которые это поддерживают)>");

    Если Пустая Тогда
        СтруктураПолей = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураПолей);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураПолей;

КонецФункции

// Получить структуру сообщения контекста
// Получает структуру сообщения для списка сообщений запроса в контексте
//
// Параметры:
//  Роль        - Строка           - Источник сообщения: system, user, assistant, tool                          - role
//  Текст       - Строка           - Текст сообщения                                                            - text
//  Картинки    - Массив Из Строка - Список картинок в формате Base64 (для многомодальных моделей, вроде llava) - images
//  Инструменты - Массив Из Строка - Список инструментов в формате JSON, которые модель должна использовать     - tools
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьСтруктуруСообщенияКонтекста(Знач Роль, Знач Текст, Знач Картинки = "", Знач Инструменты = "") Экспорт

    СтруктураПолей = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("role"      , Роль       , "Строка"   , СтруктураПолей);
    OPI_Инструменты.ДобавитьПоле("content"   , Текст      , "Строка"   , СтруктураПолей);
    OPI_Инструменты.ДобавитьПоле("images"    , Картинки   , "Коллекция", СтруктураПолей);
    OPI_Инструменты.ДобавитьПоле("tool_calls", Инструменты, "Коллекция", СтруктураПолей);

    Возврат СтруктураПолей;

КонецФункции

#КонецОбласти

#Область РаботаСМоделями

// Получить список моделей
// Получает список локальных моделей
//
// Примечание:
// Метод в документации API: [List Local Models](@github.com/ollama/ollama/blob/main/docs/api.md#list-local-models)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                     - url
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьСписокМоделей(Знач URL, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/tags");

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Get(URL, , ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Получить список запущенных моделей
// Получает список запущенных моделей
//
// Примечание:
// Метод в документации API: [List Running Models](@github.com/ollama/ollama/blob/main/docs/api.md#list-running-models)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                     - url
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьСписокЗапущенныхМоделей(Знач URL, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/ps");

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Get(URL, , ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Получить информацию о модели
// Получает информацию о выбранной модели
//
// Примечание:
// Метод в документации API: [Show Model Information](@github.com/ollama/ollama/blob/main/docs/api.md#show-model-information)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                     - url
//  Модель       - Строка                        - Имя модели                             - model
//  Подробно     - Булево                        - Возврат полной информации о модели     - verbose
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ПолучитьИнформациюОМодели(Знач URL, Знач Модель, Знач Подробно = Истина, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/show");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("model"  , Модель  , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("verbose", Подробно, "Булево", Параметры);

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Создать модель
// Создает новую модель с заданными настройками
//
// Примечание:
// Метод в документации API: [Create a Model](@github.com/ollama/ollama/blob/main/docs/api.md#create-a-model)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                                     - url
//  Модель       - Строка                        - Имя модели                                             - model
//  Настройки    - Структура Из КлючИЗначение    - Настройки модели. См. ПолучитьСтруктуруНастроекМодели  - settings
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо                 - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция СоздатьМодель(Знач URL, Знач Модель, Знач Настройки, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/create");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("model" , Модель, "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("stream", Ложь  , "Булево"   , Параметры);

    ОбработатьПараметры(Параметры, Настройки);
    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Копировать модель
// Копирует существующую модель
//
// Примечание:
// Метод в документации API: [Copy a Model](@github.com/ollama/ollama/blob/main/docs/api.md#copy-a-model)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                     - url
//  Модель       - Строка                        - Имя существующей модели                - model
//  Имя          - Строка                        - Имя новой модели                       - name
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция КопироватьМодель(Знач URL, Знач Модель, Знач Имя, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/copy");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("source"     , Модель, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("destination", Имя   , "Строка", Параметры);

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки, , Истина);
    Ответ = Новый Структура("status_code", Ответ.КодСостояния);

    Возврат Ответ;

КонецФункции

// Удалить модель
// Удаляет существующую модель
//
// Примечание:
// Метод в документации API: [Delete a Model](@github.com/ollama/ollama/blob/main/docs/api.md#delete-a-model)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                     - url
//  Модель       - Строка                        - Имя модели                             - model
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция УдалитьМодель(Знач URL, Знач Модель, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/delete");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("model" , Модель, "Строка", Параметры);

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.DeleteСТелом(URL, Параметры, ДопЗаголовки, , Истина);
    Ответ = Новый Структура("status_code", Ответ.КодСостояния);

    Возврат Ответ;

КонецФункции

// Загрузить модель в память
// Загружает выбранную модель в оперативную память
//
// Примечание:
// Метод в документации API: [Load a model](@github.com/ollama/ollama/blob/main/docs/api.md#load-a-model)
//
// Параметры:
//  URL          - Строка  - URL сервера Ollama                                           - url
//  Модель       - Строка  - Имя модели                                                   - model
//  Период       - Число   - Время удержания модели в памяти в секундах                   - keep
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ЗагрузитьМодельВПамять(Знач URL, Знач Модель, Знач Период = 300, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/generate");

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("model"     , Модель, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("keep_alive", Период, "Число" , Параметры);

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Выгрузить модель из памяти
// Выгружает выбранную модель из памяти
//
// Примечание:
// Метод в документации API: [Unload a model](@github.com/ollama/ollama/blob/main/docs/api.md#unload-a-model)
//
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                     - url
//  Модель       - Строка                        - Имя модели                             - model
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ВыгрузитьМодельИзПамяти(Знач URL, Знач Модель, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/generate");

    Параметры = Новый Структура;
    Параметры.Вставить("keep_alive", 0);

    OPI_Инструменты.ДобавитьПоле("model", Модель, "Строка", Параметры);

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;

КонецФункции

// Отправить модель
// Загружает модель в библиотеку моделей
// 
// Примечание:
// Метод в документации API: [Push a Model](@github.com/ollama/ollama/blob/main/docs/api.md#push-a-model)
// Имя модели должно быть в формате <namespace>/<model>:<tag>^
// Требуется регистрация на ollama.ai и добавление открытого ключа. 
// 
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                              - url
//  Модель       - Строка                        - Имя модели                                      - model
//  Небезопасно  - Булево                        - Разрешает незащищенное соединение с библиотекой - insecure
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо          - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ОтправитьМодель(Знач URL, Знач Модель, Знач Небезопасно = Ложь, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/push");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("model"   , Модель     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("insecure", Небезопасно, "Булево", Параметры);
    OPI_Инструменты.ДобавитьПоле("stream"  , Ложь       , "Булево", Параметры);

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;
        
КонецФункции

// Скачать модель
// Скачивает модель из библиотеки
// 
// Примечание:
// Метод в документации API: [Pull a Model](@github.com/ollama/ollama/blob/main/docs/api.md#pull-a-model)
// 
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                              - url
//  Модель       - Строка                        - Имя модели                                      - model
//  Небезопасно  - Булево                        - Разрешает незащищенное соединение с библиотекой - insecure
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо          - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция СкачатьМодель(Знач URL, Знач Модель, Знач Небезопасно = Ложь, Знач ДопЗаголовки = "") Экспорт

    ДополнитьURL(URL, "api/pull");

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("model"   , Модель     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("insecure", Небезопасно, "Булево", Параметры);
    OPI_Инструменты.ДобавитьПоле("stream"  , Ложь       , "Булево", Параметры);

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.Post(URL, Параметры, ДопЗаголовки);

    Возврат Ответ;
        
КонецФункции

// Получить структуру настроек модели
// Получает структуру настроек для создания новой модели
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьСтруктуруНастроекМодели(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);

    СтруктураПолей = Новый Структура;
    СтруктураПолей.Вставить("from"      , "<имя существующей модели, из которой будет создана новая>");
    СтруктураПолей.Вставить("files"     , "<список имен файлов или SHA256 блобов, из которых будет создана модель>");
    СтруктураПолей.Вставить("adapters"  , "<список имен файлов или SHA256 блобов для LORA адаптеров>");
    СтруктураПолей.Вставить("template"  , "<шаблон промптов новой модели>");
    СтруктураПолей.Вставить("license"   , "<строка или список строк текста лицензий для модели>");
    СтруктураПолей.Вставить("system"    , "<строка с системным промптом для модели>");
    СтруктураПолей.Вставить("parameters", "<список параметров модели>");
    СтруктураПолей.Вставить("messages"  , "<список объектов сообщений контекста>");
    СтруктураПолей.Вставить("quantize"  , "<квантовать неквантованную (например, float16) модель>");

    Если Пустая Тогда
        СтруктураПолей = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураПолей);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураПолей;

КонецФункции

#КонецОбласти

#Область РаботаСBlob

// Отправить BLOB
// Отправляет двоичные данные на сервер Ollama
// 
// Примечание:
// Метод в документации API: [Push a Blob](@github.com/ollama/ollama/blob/main/docs/api.md#push-a-blob)
// 
// Параметры:
//  URL          - Строка                        - URL сервера Ollama                     - url
//  Данные       - Строка, ДвоичныеДанные        - Данные или путь к файлу                - data
//  ДопЗаголовки - Соответствие Из КлючИЗначение - Доп заголовки запроса, если необходимо - headers
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат обработки
Функция ОтправитьBlob(Знач URL, Знач Данные, Знач ДопЗаголовки = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Данные, Истина);
    
    ДополнитьURL(URL, "api/blobs/sha256:%1");
    
    Хеш = OPI_Криптография.Хеш(Данные, ХешФункция.SHA256);
    Хеш = нРег(ПолучитьHexСтрокуИзДвоичныхДанных(Хеш));
    
    URL = СтрШаблон(URL, Хеш);

    ОбработатьЗаголовки(ДопЗаголовки);

    Ответ = OPI_Инструменты.PostBinary(URL, Данные, ДопЗаголовки, Истина);
    Ответ = Новый Структура("status_code,hash", Ответ.КодСостояния, Хеш);

    Возврат Ответ;
        
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

Процедура ОбработатьЗаголовки(ДопЗаголовки)

    Если Не ЗначениеЗаполнено(ДопЗаголовки) Тогда
        ДопЗаголовки = Новый Соответствие;
    Иначе
        ТекстОшибки  = "Передана некорректная коллекция доп. заголовков!";
        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ДопЗаголовки, ТекстОшибки);
    КонецЕсли;

КонецПроцедуры

#КонецОбласти
