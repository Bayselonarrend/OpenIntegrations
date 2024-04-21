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

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область УправлениеИНастройки

// Получить информацию о боте
// Получает основную информацию о боте
// 
// Параметры:
//  Токен - Строка - Токен бота - token
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack 
Функция ПолучитьИнформациюОБоте(Знач Токен) Экспорт
    
    URL       = "https://slack.com/api/auth.test";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Ответ = OPI_Инструменты.Get(URL, , Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить список рабочих областей
// Получает список рабочих областей, в которых подключен бот
// 
// Параметры:
//  Токен - Строка - Токен бота - token
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокРабочихОбластей(Знач Токен) Экспорт
    
    URL       = "https://slack.com/api/auth.teams.list";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Ответ = OPI_Инструменты.Get(URL, , Заголовки);
    
    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаССообщениями

// Отправить сообщение
// Отправляет сообщение в выбранный час
// 
// Параметры:
//  Токен        - Строка - Токен бота                              - token
//  Канал        - Строка - Идентификатор канала                    - channel
//  Текст        - Строка - Текст сообщения                         - text
//  ДатаОтправки - Дата   - Дата отправки для отложенного сообщения - date 
//  Блоки        - Массив Из Структура - Массив описаний блоков     - blocks - JSON массива описаний блоков
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ОтправитьСообщение(Знач Токен, Знач Канал, Знач Текст = "", Знач ДатаОтправки = "", Знач Блоки = "") Экспорт
      
    ЕстьДата  = ЗначениеЗаполнено(ДатаОтправки); 
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Если ЗначениеЗаполнено(Блоки) И Не ТипЗнч(Блоки) = Тип("Строка") Тогда
        OPI_ПреобразованиеТипов.ПолучитьМассив(Блоки);
    КонецЕсли;

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал, "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("text"   , Текст, "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("blocks" , Блоки, "Коллекция", Параметры);

    Если ЕстьДата Тогда
        
        URL      = "https://slack.com/api/chat.scheduleMessage";
        OPI_Инструменты.ДобавитьПоле("post_at", ДатаОтправки, "Дата", Параметры); 
        
    Иначе
        
        URL = "https://slack.com/api/chat.postMessage";
        
    КонецЕсли;
          
    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Отправить эфимерное сообщение
// Отправляет сообщение, которое приходит в канал, но видно 
// только конкретному пользователю
// 
// Параметры:
//  Токен        - Строка - Токен бота                              - token
//  Канал        - Строка - Идентификатор канала                    - channel
//  Текст        - Строка - Текст сообщения                         - text
//  Пользователь - Строка - ID пользователя                         - user 
//  Блоки        - Массив Из Структура - Массив описаний блоков     - blocks - JSON массива описаний блоков
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ОтправитьЭфимерноеСообщение(Знач Токен
    , Знач Канал
    , Знач Текст = ""
    , Знач Пользователь = ""
    , Знач Блоки = "") Экспорт
    
    Если ЗначениеЗаполнено(Блоки) И Не ТипЗнч(Блоки) = Тип("Строка") Тогда
        OPI_ПреобразованиеТипов.ПолучитьМассив(Блоки);
    КонецЕсли;
    
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал       , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("text"   , Текст       , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("user"   , Пользователь, "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("blocks" , Блоки       , "Коллекция", Параметры);
        
    URL = "https://slack.com/api/chat.postEphemeral";
        
    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Изменить сообщение
// Изменяет состав существующего сообщения
// 
// Параметры:
//  Токен        - Строка - Токен бота                  - token
//  Канал        - Строка - Идентификатор канала        - channel
//  Отметка      - Строка - Временная отметка сообщения - stamp
//  Текст        - Строка - Новый текст сообщения       - text
//  МассивБлоков - Массив Из Структура - Массив описаний блоков     - blocks - JSON массива описаний блоков
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ИзменитьСообщение(Знач Токен, Знач Канал, Знач Отметка, Знач Текст = "", Знач МассивБлоков = "") Экспорт
    
    Строка_   = "Строка";
    URL       = "https://slack.com/api/chat.update";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал       , Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("text"   , Текст       , Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("ts"     , Отметка     , Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("blocks" , МассивБлоков, "Коллекция", Параметры);
        
    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

// Удалить сообщение
// Удаляет сообщение канала по timestamp
// 
// Параметры:
//  Токен         - Строка - Токен бота                             - token
//  Канал         - Строка - Идентификатор канала                   - channel
//  Отметка       - Строка - Временная отметка или ID сообщения     - stamp
//  ЭтоОтложенное - Булево - Признак удаления отложенного сообщения - issheduled
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция УдалитьСообщение(Знач Токен, Знач Канал, Знач Отметка, Знач ЭтоОтложенное = Ложь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьБулево(ЭтоОтложенное);
    
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
        
    Если ЭтоОтложенное Тогда
        URL         = "https://slack.com/api/chat.deleteScheduledMessage";
        ПолеОтметки = "scheduled_message_id";       
    Иначе
        URL         = "https://slack.com/api/chat.delete";
        ПолеОтметки = "ts";
    КонецЕсли;
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel"  , Канал  , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле(ПолеОтметки, Отметка, "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить список отложенных сообщений
// Получает список отложенных сообщений канала
// 
// Параметры:
//  Токен - Строка - Токен бота           - token
//  Канал - Строка - Идентификатор канала - channel
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокОтложенныхСообщений(Знач Токен, Знач Канал) Экспорт
    
    URL       = "https://slack.com/api/chat.scheduledMessages.list";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
   
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал, "Строка", Параметры);
    
    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

// Получить ссылку на сообщение
// Получает постоянный UTL к сообщению канала
// 
// Параметры:
//  Токен         - Строка - Токен бота                             - token
//  Канал         - Строка - Идентификатор канала                   - channel
//  Отметка       - Строка - Временная отметка или ID сообщения     - stamp
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСсылкуНаСообщение(Знач Токен, Знач Канал, Знач Отметка) Экспорт
    
    URL       = "https://slack.com/api/chat.getPermalink";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel"   , Канал  , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("message_ts", Отметка, "Строка", Параметры);

    Ответ = OPI_Инструменты.Get(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСОбсуждениями

// Создать обсуждение
// Создает новое обсуждение
// 
// Параметры:
//  Токен    - Строка - Токен бота              - token
//  Название - Строка - Наименование обсуждения - title
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция СоздатьОбсуждение(Знач Токен, Знач Название) Экспорт
    
    URL       = "https://slack.com/api/conversations.create";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("name", Название, "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;
     
КонецФункции

// Архивировать обсуждение
// Архивирует активное обсуждение
// 
// Параметры:
//  Токен      - Строка - Токен бота    - token
//  Обсуждение - Строка - ID обсуждения - conv
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция АрхивироватьОбсуждение(Знач Токен, Знач Обсуждение) Экспорт
    
    URL       = "https://slack.com/api/conversations.archive";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Обсуждение, "Строка", Параметры);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти

#Область ФормированиеБлоков

// Сформировать блок картинку
// Формирует блок с картинкой для добавления в массив блоков сообщения
// 
// Параметры:
//  URL                 - Строка - URL картинки
//  АльтернативныйТекст - Строка - Альтернативный текст картинки
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение -  Блок картинки
Функция СформироватьБлокКартинку(Знач URL, Знач АльтернативныйТекст = "") Экспорт
    
    Блок = Новый Соответствие;
    OPI_Инструменты.ДобавитьПоле("type"     , "image"              , "Строка", Блок);
    OPI_Инструменты.ДобавитьПоле("image_url", URL                  , "Строка", Блок);
    OPI_Инструменты.ДобавитьПоле("alt_text" , АльтернативныйТекст  , "Строка", Блок);
    
    Возврат Блок;
    
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьЗаголовокАвторизации(Знач Токен)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    
    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "Bearer " + Токен);
    Возврат Заголовки;
        
КонецФункции

#КонецОбласти