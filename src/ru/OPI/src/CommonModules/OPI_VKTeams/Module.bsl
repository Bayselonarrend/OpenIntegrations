// OneScript: ./OInt/core/Modules/OPI_VKTeams.os
// Lib: VKTeams
// CLI: vkteams

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

#Область ОбщиеМетоды

// Проверить токен
// Проверяет работоспособность токена бота
//
// Примечание:
// Метод в документации API: [GET /self/get](@teams.vk.com/botapi/#/self/get_self_get)
//
// Параметры:
//  Токен - Строка - Токен бота - token
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams
Функция ПроверитьТокен(Знач Токен) Экспорт

    URL       = "/self/get";
    Параметры = НормализоватьОснову(URL, Токен);

    Ответ = OPI_Инструменты.Get(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Получить события
// Получает события бота в Polling режиме
//
// Примечание:
// Метод в документации API: [GET /events/get](@teams.vk.com/botapi/#/events/get_events_get)
//
// Параметры:
//  Токен        - Строка        - Токен бота                                   - token
//  IDПоследнего - Строка, Число - ID последнего обработанного до этого события - last
//  Таймаут      - Строка, Число - Время удержания соединения для Long Polling  - timeout
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams
Функция ПолучитьСобытия(Знач Токен, Знач IDПоследнего, Знач Таймаут = 0) Экспорт

    URL             = "/events/get";
    Параметры       = НормализоватьОснову(URL, Токен);
    IDПоследнего    = OPI_Инструменты.ЧислоВСтроку(IDПоследнего);

    OPI_Инструменты.ДобавитьПоле("lastEventId", IDПоследнего, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("pollTime"   , Таймаут     , "Строка", Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область ОтправкаСообщений

// Отправить текстовое сообщение
// Отправляет текстовое сообщение в чат
//
// Примечание:
// Можно упомянуть пользователя, добавив в текст его userId в следующем формате @[userId]
// Метод в документации API: [GET /messages/sendText](@teams.vk.com/botapi/#/messages/get_messages_sendText)
//
// Параметры:
//  Токен         - Строка           - Токен бота                                             - token
//  IDЧата        - Строка, Число    - ID чата для отправки сообщения                         - chatid
//  Текст         - Строка           - Текст сообщения                                        - text
//  IDЦитируемого - Строка, Число    - ID цитируемого сообщения, если необходимо              - reply
//  Клавиатура    - Массив Из Строка - Кнопки к сообщению, если необходимо                    - keyboard
//  Разметка      - Строка           - Вид разметки для текста сообщения: MarkdownV2 или HTML - parsemod
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams
Функция ОтправитьТекстовоеСообщение(Знач Токен
    , Знач IDЧата
    , Знач Текст
    , Знач IDЦитируемого = 0
    , Знач Клавиатура = ""
    , Знач Разметка = "MarkdownV2") Экспорт

    URL       = "/messages/sendText";
    Параметры = НормализоватьОснову(URL, Токен);

    OPI_Инструменты.ДобавитьПоле("chatId"              , IDЧата       , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("text"                , Текст        , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("replyMsgId"          , IDЦитируемого, "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("inlineKeyboardMarkup", Клавиатура   , "Коллекция", Параметры);
    OPI_Инструменты.ДобавитьПоле("parseMode"           , Разметка     , "Строка"   , Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция НормализоватьОснову(URL, Знач Токен)

    URL       = "https://myteam.mail.ru/bot/v1" + URL;
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("token", Токен, "Строка", Параметры);

    Возврат Параметры;

КонецФункции

#КонецОбласти
