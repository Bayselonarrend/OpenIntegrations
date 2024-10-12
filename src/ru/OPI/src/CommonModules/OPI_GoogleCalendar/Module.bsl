﻿// OneScript: ./OInt/core/Modules/OPI_GoogleCalendar.os
// Lib: Google Calendar
// CLI: gcalendar

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
// BSLLS:UsingServiceTag-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область РаботаСМетаданнымиКалендарей

// Создать календарь
// Создает пустой календарь
//
// Параметры:
//  Токен        - Строка - Токен                                - token
//  Наименование - Строка - Наименование создаваемого календаря  - title
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция СоздатьКалендарь(Знач Токен, Знач Наименование) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/calendars";

    Параметры = Новый Структура;
    Параметры.Вставить("summary" , Наименование);
    Параметры.Вставить("timeZone", "Europe/Moscow");

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить календарь
// Получает информацию о календаре по ID
//
// Параметры:
//  Токен     - Строка - Токен        - token
//  Календарь - Строка - ID календаря - calendar
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьМетаданныеКалендаря(Знач Токен, Знач Календарь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/calendars/" + Календарь;
    Ответ     = OPI_Инструменты.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить календарь
// Изменяет свойства существуещего календаря
//
// Параметры:
//  Токен        - Строка - Токен                      - token
//  Календарь    - Строка - ID календаря               - calendar
//  Наименование - Строка - Новое наименование         - title
//  Описание     - Строка - Новое описание календаря   - description
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ИзменитьМетаданныеКалендаря(Знач Токен
    , Знач Календарь
    , Знач Наименование = ""
    , Знач Описание = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Описание);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/calendars/" + Календарь;

    Параметры = Новый Структура;

    Если ЗначениеЗаполнено(Наименование) Тогда
        Параметры.Вставить("summary", Наименование);
    КонецЕсли;

    Если ЗначениеЗаполнено(Описание) Тогда
        Параметры.Вставить("description", Описание);
    КонецЕсли;

    Ответ = OPI_Инструменты.Patch(URL, Параметры, Заголовки, Истина);

    Возврат Ответ;

КонецФункции

// Очистить основной календарь
// Очищает список событий основного календаря
//
// Параметры:
//  Токен - Строка - Токен - token
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ОчиститьОсновнойКалендарь(Знач Токен) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/calendars/primary/clear";
    Ответ     = OPI_Инструменты.Post(URL, , Заголовки, Ложь);

    Возврат Ответ;

КонецФункции

// Удалить календарь
// Удаляет календарь по ID
//
// Параметры:
//  Токен     - Строка - Токен         - token
//  Календарь - Строка - ID календаря  - calendar
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция УдалитьКалендарь(Знач Токен, Знач Календарь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/calendars/" + Календарь;
    Ответ     = OPI_Инструменты.Delete(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСоСпискомКалендарей

// Получить список календарей
// Получает массив календарей аккаунта
//
// Параметры:
//  Токен - Строка - Токен - token
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Массив соответствий данных календарей
Функция ПолучитьСписокКалендарей(Знач Токен) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);

    Заголовки        = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    МассивКалендарей = Новый Массив;

    ПолучитьСписокКалендарейРекурсивно(Заголовки, МассивКалендарей);

    Возврат МассивКалендарей;

КонецФункции

// Добавить календарь в список
// Добавляет существующий календарь в список пользователя
//
// Параметры:
//  Токен     - Строка - Токен        - token
//  Календарь - Строка - ID календаря - calendar
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ДобавитьКалендарьВСписок(Знач Токен, Знач Календарь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/users/me/calendarList";

    Параметры = Новый Структура;
    Параметры.Вставить("id", Календарь);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить календарь списка
// Получает календарь из списка пользователя по ID
//
// Параметры:
//  Токен     - Строка - Токен        - token
//  Календарь - Строка - ID календаря - calendar
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьКалендарьСписка(Знач Токен, Знач Календарь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/users/me/calendarList/" + Календарь;
    Ответ     = OPI_Инструменты.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Удалить календарь из списка
// Удаляет календарь из списка пользователя
//
// Параметры:
//  Токен     - Строка - Токен         - token
//  Календарь - Строка - ID календаря  - calendar
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция УдалитьКалендарьИзСписка(Знач Токен, Знач Календарь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/users/me/calendarList/" + Календарь;
    Ответ     = OPI_Инструменты.Delete(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить календарь списка
// Изменяет свойства календаря из списка пользователей
//
// Параметры:
//  Токен              - Строка - Токен                                   - token
//  Календарь          - Строка - ID календаря                            - calendar
//  ОсновнойЦвет       - Строка - HEX основного цвета (#ffffff)           - primary
//  ДополнительныйЦвет - Строка - HEX дополнительного цвета (#ffffff)     - secondary
//  Скрытый            - Булево - Скрытый календарь                       - hidden
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ИзменитьКалендарьСписка(Знач Токен
    , Знач Календарь
    , Знач ОсновнойЦвет
    , Знач ДополнительныйЦвет
    , Знач Скрытый = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ОсновнойЦвет);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ДополнительныйЦвет);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Скрытый);

    Заголовки = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL       = "https://www.googleapis.com/calendar/v3/users/me/calendarList/" + Календарь + "?colorRgbFormat=true";

    Параметры = Новый Соответствие;
    Параметры.Вставить("hidden"         , Скрытый);
    Параметры.Вставить("foregroundColor", ОсновнойЦвет);
    Параметры.Вставить("backgroundColor", ДополнительныйЦвет);

    Ответ = OPI_Инструменты.Put(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаССобытиями

// Получить описание события
// Получает пустой макет для создания события
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
// Соответствие Из КлючИЗначение - Пустой макет события
Функция ПолучитьОписаниеСобытия(Знач Пустая = Ложь) Экспорт

    ТекущаяДата = OPI_Инструменты.ПолучитьТекущуюДату();
    Час         = 3600;
    Событие     = Новый Соответствие;

    Событие.Вставить("Описание"               , "");                          // Описание события
    Событие.Вставить("Заголовок"              , "Новое событие");             // Заголовок события
    Событие.Вставить("МестоПроведения"        , "");                          // Строка описание места проведения
    Событие.Вставить("ДатаНачала"             , ТекущаяДата);                 // Дата начала события
    Событие.Вставить("ДатаОкончания"          , ТекущаяДата + Час);           // Дата окончания события
    Событие.Вставить("МассивURLФайловВложений", Новый Соответствие);          // Ключ - название, Значение - URL к файлу
    Событие.Вставить("ОтправлятьУведомления"  , Истина);                      // Признак отправки уведомлений участникам

    Если Пустая Тогда

        Событие_ = Новый Соответствие;

        Для Каждого Поле Из Событие Цикл
            Событие_.Вставить(Поле.Ключ, "");
        КонецЦикла;

        Событие_ = Событие_;

    КонецЕсли;

    Возврат Событие;

КонецФункции

// Получить список событий
// Получает список всех событий календаря
//
// Параметры:
//  Токен     - Строка - Токен         - token
//  Календарь - Строка - ID календаря  - calendar
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Массив соответствий событий
Функция ПолучитьСписокСобытий(Знач Токен, Знач Календарь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);

    Заголовки     = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    МассивСобытий = Новый Массив;

    ПолучитьСписокСобытийРекурсивно(Заголовки, Календарь, МассивСобытий);

    Возврат МассивСобытий;

КонецФункции

// Получить событие
// Получает событие по ID
//
// Параметры:
//  Токен     - Строка - Токен        - token
//  Календарь - Строка - ID календаря - calendar
//  Событие   - Строка - ID события   - event
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьСобытие(Знач Токен, Знач Календарь, Знач Событие) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Событие);

    Заголовки   = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL         = "https://www.googleapis.com/calendar/v3/calendars/"
        + Календарь
        + "/events/"
        + Событие;

    Ответ = OPI_Инструменты.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Создать событие
// Создает новое событие
//
// Параметры:
//  Токен           - Строка                        - Токен            - token
//  Календарь       - Строка                        - ID календаря     - calendar
//  ОписаниеСобытия - Соответствие Из КлючИЗначение - Описание события - props
//
// Возвращаемое значение:
//  Строка, Произвольный, HTTPОтвет, ДвоичныеДанные, Неопределено - ответ сервера Google
Функция СоздатьСобытие(Знач Токен, Знач Календарь, Знач ОписаниеСобытия) Экспорт

    Возврат УправлениеСобытием(Токен, Календарь, ОписаниеСобытия);

КонецФункции

// Переместить событие
// Перемещает событие в другой календарь
//
// Параметры:
//  Токен             - Строка - Токен                            - token
//  КалендарьИсточник - Строка - ID календаря источника           - from
//  КалендарьПриемник - Строка - ID календаря приемника           - to
//  Событие           - Строка - ID события календаря источника   - event
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПереместитьСобытие(Знач Токен, Знач КалендарьИсточник, Знач КалендарьПриемник, Знач Событие) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(КалендарьИсточник);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(КалендарьПриемник);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Событие);

    Заголовки               = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL                     = "https://www.googleapis.com/calendar/v3/calendars/"
        + КалендарьИсточник
        + "/events/"
        + Событие
        + "/move?destination="
        + КалендарьПриемник;

    Ответ = OPI_Инструменты.Post(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить событие
// Изменяет существующее событие
//
// Параметры:
//  Токен           - Строка - Токен                    - token
//  Календарь       - Строка - ID календаря             - calendar
//  ОписаниеСобытия - Строка - Новое описание события   - props
//  Событие         - Строка - ID события               - event
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ИзменитьСобытие(Знач Токен, Знач Календарь, Знач ОписаниеСобытия, Знач Событие) Экспорт

    Возврат УправлениеСобытием(Токен, Календарь, ОписаниеСобытия, Событие);

КонецФункции

// Удалить событие
// Удаляет событие по ID
//
// Параметры:
//  Токен     - Строка - Токен         - token
//  Календарь - Строка - ID календаря  - calendar
//  Событие   - Строка - ID события    - event
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция УдалитьСобытие(Знач Токен, Знач Календарь, Знач Событие) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Событие);

    Заголовки   = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    URL         = "https://www.googleapis.com/calendar/v3/calendars/"
        + Календарь
        + "/events/"
        + Событие;

    Ответ = OPI_Инструменты.Delete(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПреобразоватьДату(Знач Дата)

    OPI_ПреобразованиеТипов.ПолучитьДату(Дата);

    СтруктураДаты = Новый Структура;

    Если Не ТипЗнч(Дата) = Тип("Дата") Тогда
        Возврат Неопределено;
    КонецЕсли;

    Если Дата      = НачалоДня(Дата) Тогда
        ФорматДаты = "ДФ=yyyy-MM-dd";
        Поле       = "date";
    Иначе
        ФорматДаты = "ДФ=yyyy-MM-ddTHH:mm:ssZ";
        Поле       = "dateTime";
    КонецЕсли;

    Дата = Формат(Дата, ФорматДаты);
    СтруктураДаты.Вставить(Поле      , Дата);
    СтруктураДаты.Вставить("timeZone", "Europe/Moscow");

    Возврат СтруктураДаты;

КонецФункции

Функция ПреобразоватьВложения(Знач Вложения)

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(Вложения);

    МассивВложений = Новый Массив;

    Если ТипЗнч(Вложения) = Тип("Соответствие") Или ТипЗнч(Вложения) = Тип("Структура") Тогда

        Для Каждого Вложение Из Вложения Цикл

            ТекущеВложение = Новый Структура;
            ТекущеВложение.Вставить("title"  , Вложение.Ключ);
            ТекущеВложение.Вставить("fileUrl", Вложение.Значение);

            МассивВложений.Добавить(ТекущеВложение);

        КонецЦикла;

    КонецЕсли;

    Если МассивВложений.Количество() > 0 Тогда
        Возврат МассивВложений;
    Иначе
        Возврат Неопределено;
    КонецЕсли;

КонецФункции

Функция УправлениеСобытием(Знач Токен, Знач Календарь, Знач ОписаниеСобытия, Знач Событие = "")

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Календарь);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Событие);
    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(ОписаниеСобытия);

    Заголовки    = OPI_GoogleWorkspace.ПолучитьЗаголовокАвторизации(Токен);
    Существующее = ЗначениеЗаполнено(Событие);
    URL          = "https://www.googleapis.com/calendar/v3/calendars/"
        + Календарь
        + "/events"
        + ?(Существующее, "/" + Событие, "");

    Дата0       = ОписаниеСобытия["ДатаНачала"];
    Дата1       = ОписаниеСобытия["ДатаОкончания"];
    Вложения    = ОписаниеСобытия["МассивURLФайловВложений"];
    Вложения    = ПреобразоватьВложения(Вложения);
    Уведомления = ?(ОписаниеСобытия["ОтправлятьУведомления"] = Неопределено
        , Ложь
        , ОписаниеСобытия["ОтправлятьУведомления"]);

    Параметры   = Новый Структура;
    Параметры.Вставить("summary"    , ОписаниеСобытия["Заголовок"]);
    Параметры.Вставить("description", ОписаниеСобытия["Описание"]);
    Параметры.Вставить("location"   , ОписаниеСобытия["МестоПроведения"]);
    Параметры.Вставить("start"      , ПреобразоватьДату(Дата0));
    Параметры.Вставить("end"        , ПреобразоватьДату(Дата1));
    Параметры.Вставить("attachments", Вложения);

    ПараметрыURL = Новый Структура;
    ПараметрыURL.Вставить("sendUpdates"         , ?(Уведомления                , "all" , "none"));
    ПараметрыURL.Вставить("supportsAttachments" , ?(ЗначениеЗаполнено(Вложения), "true", "false"));

    URL   = URL + OPI_Инструменты.ПараметрыЗапросаВСтроку(ПараметрыURL);

    OPI_Инструменты.УдалитьПустыеПоляКоллекции(Параметры);

    Если Существующее Тогда
        Ответ = OPI_Инструменты.Patch(URL, Параметры, Заголовки, Истина);
    Иначе
        Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки, Истина);
    КонецЕсли;

    Возврат Ответ;

КонецФункции

Процедура ПолучитьСписокКалендарейРекурсивно(Знач Заголовки, МассивКалендарей, Страница = "")

    Items     = "items";
    NPT       = "nextPageToken";
    Параметры = Новый Структура;

    Если ЗначениеЗаполнено(Страница) Тогда
        Параметры.Вставить("pageToken", Страница);
    КонецЕсли;

    Результат = OPI_Инструменты.Get("https://www.googleapis.com/calendar/v3/users/me/calendarList"
        , Параметры
        , Заголовки);

    Календари = Результат[Items];
    Страница  = Результат[NPT];

    Для Каждого Календарь Из Календари Цикл
        МассивКалендарей.Добавить(Календарь);
    КонецЦикла;

    Если Календари.Количество() > 0 И ЗначениеЗаполнено(Страница) Тогда
        ПолучитьСписокКалендарейРекурсивно(Заголовки, МассивКалендарей, Страница);
    КонецЕсли;

КонецПроцедуры

Процедура ПолучитьСписокСобытийРекурсивно(Знач Заголовки, Знач Календарь, МассивСобытий, Страница = "")

    Items     = "items";
    NPT       = "nextPageToken";
    Параметры = Новый Структура;

    Если ЗначениеЗаполнено(Страница) Тогда
        Параметры.Вставить("pageToken", Страница);
    КонецЕсли;

    Результат = OPI_Инструменты.Get("https://www.googleapis.com/calendar/v3/calendars/" + Календарь + "/events"
        , Параметры
        , Заголовки);

    События  = Результат[Items];
    Страница = Результат[NPT];

    Для Каждого Событие Из События Цикл
        МассивСобытий.Добавить(Событие);
    КонецЦикла;

    Если События.Количество() > 0 И ЗначениеЗаполнено(Страница) Тогда
        ПолучитьСписокСобытийРекурсивно(Заголовки, МассивСобытий, Страница);
    КонецЕсли;

КонецПроцедуры

#КонецОбласти
