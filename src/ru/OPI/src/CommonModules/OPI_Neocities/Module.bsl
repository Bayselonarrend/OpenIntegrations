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
// #Использовать "../../tools"

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

    URL     = "neocities.org";
    Таймаут = 120;

    Попытка

        ЗащищенноеСоединение = Новый ЗащищенноеСоединениеOpenSSL();
        БезопасноеСоединение = Новый HTTPСоединение(URL, 443, Логин, Пароль, , Таймаут, ЗащищенноеСоединение);

    Исключение

        URL = "https://" + URL;
        БезопасноеСоединение = Новый HTTPСоединение(URL, 443, Логин, Пароль, , Таймаут);

    КонецПопытки;

    Ответ = БезопасноеСоединение.Получить(Новый HTTPЗапрос("/api/key"));

    ЧтениеJSON = Новый ЧтениеJSON();
    ЧтениеJSON.УстановитьСтроку(Ответ.ПолучитьТелоКакСтроку());

    Ответ = ПрочитатьJSON(ЧтениеJSON);

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
//  СоответствиеФайлов - Соответствие Из КлючИЗначение - Файлы для загрузки: Ключ > путь на NC, Значение > Файл - files
//  ПоОдному           - Булево                        - Истина > отправляет файлы отдельными запросами         - singly
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция ЗагрузитьФайлы(Знач Токен, Знач СоответствиеФайлов, Знач ПоОдному = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(ПоОдному);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(СоответствиеФайлов);

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

// Синхронизировать каталоги
// Создает копию локального каталога по выбранному пути на сервере
//
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
// Метод удаляет файлы на сервере, если они отсутствуют в локальном каталоге
//
// Параметры:
//  Токен            - Строка - Токен авторизации                                      - token
//  ЛокальныйКаталог - Строка - Локальный каталог источник                             - local
//  УдаленныйКаталог - Строка - Удаленный каталог приемника. Корень, если не заполнено - remote
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - информация об ошибках синхронизации
Функция СинхронизироватьКаталоги(Знач Токен, Знач ЛокальныйКаталог, Знач УдаленныйКаталог = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(ЛокальныйКаталог);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(УдаленныйКаталог);

    // !OInt Сообщить("Начало синхронизации...");

    Если ЗначениеЗаполнено(УдаленныйКаталог) Тогда
        УдаленныйКаталог = ?(СтрЗаканчиваетсяНа(УдаленныйКаталог, "/"), УдаленныйКаталог, УдаленныйКаталог + "/");
    КонецЕсли;

    УдаленныеФайлы = ПолучитьСписокФайлов(Токен, УдаленныйКаталог);

    Если Не УдаленныеФайлы["result"] = "success" Тогда
        //@skip-check constructor-function-return-section
        Возврат УдаленныеФайлы;
    КонецЕсли;

    ЛокальныеПути        = Новый Соответствие;
    ЛокальныеПодкаталоги = Новый Соответствие;

    ПолучитьНаборыЛокальныхПутей(ЛокальныйКаталог, УдаленныйКаталог, ЛокальныеПути, ЛокальныеПодкаталоги);

    МассивУдаляемых = ПолучитьУдаляемыеФайлы(УдаленныеФайлы, ЛокальныеПути, ЛокальныеПодкаталоги);
    Результат       = ВыполнитьСинхронизацию(Токен, МассивУдаляемых, ЛокальныеПути);

    //@skip-check constructor-function-return-section
    Возврат Результат;

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

Функция ПолучитьУдаляемыеФайлы(УдаленныеФайлы, ЛокальныеПути, ЛокальныеПодкаталоги)

    МассивУдаляемых = Новый Массив;

    Для Каждого УдаленныйФайл Из УдаленныеФайлы["files"] Цикл

        ПутьУдаленного = УдаленныйФайл["path"];

        Если УдаленныйФайл["is_directory"] Тогда
            СуществующийУдаленный = ЛокальныеПодкаталоги[ПутьУдаленного];
        Иначе
            СуществующийУдаленный = ЛокальныеПути[ПутьУдаленного];
        КонецЕсли;

        Если СуществующийУдаленный = Неопределено Тогда
            МассивУдаляемых.Добавить(ПутьУдаленного);
        КонецЕсли;

    КонецЦикла;

    Возврат МассивУдаляемых;

КонецФункции

Функция ВыполнитьСинхронизацию(Токен, МассивУдаляемых, ЛокальныеПути)

    МассивОшибок = Новый Массив;

    Если Не МассивУдаляемых.Количество() = 0 Тогда

        Ответ = УдалитьВыбранныеФайлы(Токен, МассивУдаляемых);

        Если Не Ответ["result"] = "success" Тогда
            МассивОшибок.Добавить(Ответ);

        Иначе

            //@skip-check module-unused-local-variable
            СообщениеУдаления   = СтрШаблон("Удалено %1 лишних файлов", Строка(МассивУдаляемых.Количество()));
            // !OInt Сообщить(СообщениеУдаления);

        КонецЕсли;

    КонецЕсли;

    Всего   = OPI_Инструменты.ЧислоВСтроку(ЛокальныеПути.Количество());
    Счетчик = 0;

    Для Каждого ЛокальныйПуть Из ЛокальныеПути Цикл

        Ответ = ЗагрузитьФайл(Токен, ЛокальныйПуть.Ключ, ЛокальныйПуть.Значение);

        Если Не Ответ["result"] = "success" Тогда

            МассивОшибок.Добавить(Ответ);

        Иначе

            //@skip-check module-unused-local-variable
            Прогресс = "[" + OPI_Инструменты.ЧислоВСтроку(Счетчик) + "/" + Всего + "] ";
            // !OInt Сообщить(Прогресс + ЛокальныйПуть.Ключ + Символы.ПС + Ответ["message"] + Символы.ПС);

        КонецЕсли;


        Счетчик = Счетчик + 1;

    КонецЦикла;

    Возврат Новый Структура("errors,items", МассивОшибок.Количество(), МассивОшибок);

КонецФункции

Процедура ПолучитьНаборыЛокальныхПутей(ЛокальныйКаталог, УдаленныйКаталог, ЛокальныеПути, ЛокальныеПодкаталоги)

    ЛокальныйКаталог    = СтрЗаменить(ЛокальныйКаталог, "\", "/");
    ЛокальныйКаталог    = ?(СтрЗаканчиваетсяНа(ЛокальныйКаталог, "/"), ЛокальныйКаталог, ЛокальныйКаталог + "/");

    ЛокальныеФайлы = НайтиФайлы(ЛокальныйКаталог, "*", Истина);

    Для Каждого ЛокальныйФайл Из ЛокальныеФайлы Цикл

        ТекущийАбсПуть = ЛокальныйФайл.ПолноеИмя;
        ТекущийОтнПуть = Прав(ТекущийАбсПуть, СтрДлина(ТекущийАбсПуть) - СтрДлина(ЛокальныйКаталог));
        ТекущийОтнПуть = УдаленныйКаталог + ТекущийОтнПуть;

        ТекущийОтнПуть = СтрЗаменить(ТекущийОтнПуть, "\", "/");

        Если ЛокальныйФайл.ЭтоКаталог() Тогда
            ЛокальныеПодкаталоги.Вставить(ТекущийОтнПуть, ТекущийАбсПуть);
        Иначе
            ЛокальныеПути.Вставить(ТекущийОтнПуть, ТекущийАбсПуть);
        КонецЕсли;

    КонецЦикла;

КонецПроцедуры

#КонецОбласти
