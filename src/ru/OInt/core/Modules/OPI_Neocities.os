﻿// OneScript: ./OInt/core/Modules/OPI_Neocities.os
// Lib: Neocities
// CLI: neocities

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

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область ПолучениеДанных

// Получить данные о сайте
// Получает информацию о сайте по его имени или токену
//
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
//
// Параметры:
//  Токен - Строка - Токен авторизации                                                      - token
//  Сайт  - Строка - Имя сайта (логин) для получения информации. Текущий, если не заполнено - sitename
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция ПолучитьДанныеОСайте(Знач Токен, Знач Сайт = "") Экспорт

    URL = "https://neocities.org/api/info";

    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("sitename", Сайт, "Строка", Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить токен
// Получает токен авторизации по логину и паролю
//
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
//
// Параметры:
//  Логин  - Строка - Логин пользователя  - login
//  Пароль - Строка - Пароль пользователя - password
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция ПолучитьТокен(Знач Логин, Знач Пароль) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Логин);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Пароль);

    ЗащищенноеСоединение = Новый ЗащищенноеСоединениеOpenSSL();
    БезопасноеСоединение = Новый HTTPСоединение("neocities.org",443, Логин, Пароль, , , ЗащищенноеСоединение);

    Ответ = БезопасноеСоединение.Получить(Новый HTTPЗапрос("/api/key"));

    ЧтениеJSON = Новый ЧтениеJSON();
    ЧтениеJSON.ОткрытьПоток(Ответ.ПолучитьТелоКакПоток());
    Ответ      = ПрочитатьJSON(ЧтениеJSON);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСФайлами

// Загрузить файл
// Загружает одиночный файл на сервер Neocities
//
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
//
// Параметры:
//  Токен  - Строка                 -  Токен авторизации                       - token
//  Путь   - Строка                 -  Целевой путь файла на Neocities         - path
//  Данные - Строка, ДвоичныеДанные -  URL, путь или данные файла для загрузки - file
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция ЗагрузитьФайл(Знач Токен, Знач Путь, Знач Данные) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Данные);

    URL        = "https://neocities.org/api/upload";
    Заголовки  = СоздатьЗаголовкиЗапроса(Токен);

    СоответствиеФайла = Новый Соответствие;
    СоответствиеФайла.Вставить(Путь + "|" + Путь, Данные);

    Ответ = OPI_Инструменты.PostMultipart(URL, , СоответствиеФайла, "multipart/form-data", Заголовки);

    Возврат Ответ;

КонецФункции

// Загрузить файлы
// Загружает несколько файлов на сервер Neocities
//
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
//
// Параметры:
//  Токен              - Строка                        - Токен авторизации                                      - token
//  СоответствиеФайлов - Соответствие Из КлючИЗначение - Файлы для загрузки: Ключ > путь на NC, Значение - Файл - files
//  ПоОдному           - Булево                        - Истина > отправляет файлы отдельными запросами         - singly
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция ЗагрузитьФайлы(Знач Токен, Знач СоответствиеФайлов, Знач ПоОдному = Ложь) Экспорт

    КонечныйОтвет            = Новый Массив;
    ОбработанноеСоответствие = Новый Соответствие;

    Для Каждого ФайлОтправки Из СоответствиеФайлов Цикл

        Если ПоОдному Тогда

            Ответ = ЗагрузитьФайл(Токен, ФайлОтправки.Ключ, ФайлОтправки.Значение);
            КонечныйОтвет.Добавить(Ответ);

        Иначе

            ТекущийПуть   = ФайлОтправки.Ключ;
            ТекущиеДанные = ФайлОтправки.Значение;

            OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущийПуть);
            OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(ТекущиеДанные);

            ОбработанноеСоответствие.Вставить(ТекущийПуть + "|" + ТекущийПуть, ТекущиеДанные);

        КонецЕсли;

    КонецЦикла;

    Если Не ПоОдному Тогда

        URL        = "https://neocities.org/api/upload";
        Заголовки  = СоздатьЗаголовкиЗапроса(Токен);

        КонечныйОтвет = OPI_Инструменты.PostMultipart(URL
            ,
            , ОбработанноеСоответствие
            , "multipart/form-data"
            , Заголовки);

    КонецЕсли;

    Возврат КонечныйОтвет;

КонецФункции

// Удалить выбранные файлы
// Удаляет файл или несколько файлов с сервера Neocities
//
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
//
// Параметры:
//  Токен - Строка                   - Токен авторизации                         - token
//  Пути  - Строка, Массив Из Строка - Путь или несколько путей удаляемых файлов - paths
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция УдалитьВыбранныеФайлы(Знач Токен, Знач Пути) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьМассив(Пути);

    URL       = "https://neocities.org/api/delete";
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Для Н = 0 По Пути.ВГраница() Цикл

        ТекущееЗначение = Пути[Н];

        OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущееЗначение);

        Пути.Установить(Н, "filenames[]=" + ТекущееЗначение);

    КонецЦикла;

    ПутиСтрокой = СтрСоединить(Пути, "&");
    Ответ       = OPI_Инструменты.Post(URL, ПутиСтрокой, Заголовки, Ложь);

    Возврат Ответ;

КонецФункции

// Получить список файлов
// Получает список файлов с отбором каталога или без
//
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
//
// Параметры:
//  Токен - Строка - Токен авторизации                                - token
//  Путь  - Строка - Отбор файлов по каталогу. Все, если не заполнено - path
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция ПолучитьСписокФайлов(Знач Токен, Знач Путь = "") Экспорт

    URL       = "https://neocities.org/api/list";
    Заголовки = СоздатьЗаголовкиЗапроса(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("path", Путь, "Строка", Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СоздатьЗаголовкиЗапроса(Знач Токен)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);

    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "Bearer " + Токен);
    Возврат Заголовки;

КонецФункции

#КонецОбласти
