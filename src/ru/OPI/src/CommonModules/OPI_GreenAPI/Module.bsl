﻿// OneScript: ./OInt/core/Modules/OPI_GreenAPI.os
// Lib: Green API
// CLI: greenapi

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

#Область Аккаунт

// Сформировать параметры доступа
// Формирует структуру основных авторизационных данных
// 
// Примечание:
// Подробнее в документации API: [Получить параметры доступа к инстансу](@green-api.com/docs/before-start/#parameters)
// 
// Параметры:
//  ApiUrl           - Строка - Ссылка на хост API                     - api
//  MediaUrl         - Строка - Ссылка на хост API для отправки файлов - media
//  IdInstance       - Строка - Уникальный номер инстанса              - id
//  ApiTokenInstance - Строка - Ключ доступа инстанса                  - token
// 
// Возвращаемое значение:
//  Структура -  Структура параметров доступа
Функция СформироватьПараметрыДоступа(Знач ApiUrl, Знач MediaUrl, Знач IdInstance, Знач ApiTokenInstance) Экспорт
    
    Строка_ = "Строка";
    
    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("apiUrl"          , ApiUrl          , Строка_, Параметры);
    OPI_Инструменты.ДобавитьПоле("mediaUrl"        , MediaUrl        , Строка_, Параметры);
    OPI_Инструменты.ДобавитьПоле("idInstance"      , IdInstance      , Строка_, Параметры);
    OPI_Инструменты.ДобавитьПоле("apiTokenInstance", ApiTokenInstance, Строка_, Параметры);
    
    Возврат Параметры;
    
КонецФункции

// Получить настройки инстанса
// Получает текущие настройки инстанса
// 
// Примечание:
// Метод в документации API: [GetSettings](@green-api.com/docs/api/account/GetSettings/)
// 
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьНастройкиИнстанса(Знач ПараметрыДоступа) Экспорт
    
    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "getSettings");
    Ответ = OPI_Инструменты.Get(URL);
    
    Возврат Ответ;
       
КонецФункции

// Установить настройки инстанса
// Устанавливает настройки инстанса
// 
// Примечание
// Метод в документации API: [GetSettings](@green-api.com/docs/api/account/SetSettings/)
// 
// Параметры:
//  Настройки        - Структура Из КлючИЗначение - Настройки инстанса. См. ПолучитьСтруктуруНастроекИнстанса - settings
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа       - access
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция УстановитьНастройкиИнстанса(Знач Настройки, Знач ПараметрыДоступа) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ПараметрыДоступа);
    
    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "setSettings");
    Ответ = OPI_Инструменты.Post(URL, Настройки);
    
    Возврат Ответ;
    
КонецФункции

// Получить структуру настроек инстанса
// Получает шаблон структуры для установки настроек инстанса
// 
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
// 
// Возвращаемое значение:
//  Структура Из КлючИЗначение -  Структура настроек инстанса
Функция ПолучитьСтруктуруНастроекИнстанса(Знач Пустая = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);
        
    СтруктураНастроек = Новый Структура;

    СтруктураНастроек.Вставить("webhookUrl"                       , "<URL для отправки уведомлений>");
    СтруктураНастроек.Вставить("webhookUrlToken"                  , "<токен для доступа к вашему серверу уведомлений, если требуется>");
    СтруктураНастроек.Вставить("delaySendMessagesMilliseconds"    , "<интервал отправки сообщений в миллисекундах>");
    СтруктураНастроек.Вставить("markIncomingMessagesReaded"       , "<отмечать входящие сообщения прочитанными: yes, no>");
    СтруктураНастроек.Вставить("markIncomingMessagesReadedOnReply", "<отмечать входящие сообщения прочитанными при отправке сообщения в чат: yes, no>");
    СтруктураНастроек.Вставить("outgoingWebhook"                  , "<получать уведомления о статусах отправки/доставки/прочтении исходящих сообщений: yes, no>");
    СтруктураНастроек.Вставить("outgoingMessageWebhook"           , "<получать уведомления о сообщениях, отправленных с телефона: yes, no>");
    СтруктураНастроек.Вставить("outgoingAPIMessageWebhook"        , "<получать уведомления о сообщениях, отправленных через API: yes, no>");
    СтруктураНастроек.Вставить("stateWebhook"                     , "<получать уведомления об изменении состояния авторизации инстанса: yes, no>");
    СтруктураНастроек.Вставить("incomingWebhook"                  , "<получать уведомления о входящих сообщениях и файлах: yes, no>");
    СтруктураНастроек.Вставить("deviceWebhook"                    , "<получать уведомления об устройстве (телефоне) и уровне заряда батареи: yes, no>");
    СтруктураНастроек.Вставить("keepOnlineStatus"                 , "<выставляет статус 'В сети' для вашего аккаунта>");
    СтруктураНастроек.Вставить("pollMessageWebhook"               , "<получать уведомления о создании опроса и голосовании в опросе: yes, no>");
    СтруктураНастроек.Вставить("incomingBlockWebhook"             , "<получать уведомления о добавлении чата в список заблокированных контактов: yes, no>");
    СтруктураНастроек.Вставить("incomingCallWebhook"              , "<получать уведомления о статусах входящего звонка: yes, no>");   
    СтруктураНастроек.Вставить("editedMessageWebhook"             , "<получать уведомления о факте того, что сообщение было отредактировано: yes, no>");
    СтруктураНастроек.Вставить("deletedMessageWebhook"            , "<получать уведомления о факте того, что сообщение было удалено: yes, no>");
  

    Если Пустая Тогда
        СтруктураНастроек = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураНастроек);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураНастроек;
    
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СформироватьОсновнойURL(Знач ПараметрыДоступа, Знач Метод)
    
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ПараметрыДоступа);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Метод);
    
    ОбязательныеПоля = СтрРазделить("apiUrl,idInstance,apiTokenInstance", ",");
    ОтсутствующиеПоля = OPI_Инструменты.НайтиОтсутствующиеПоляКоллекции(ПараметрыДоступа, ОбязательныеПоля);
    
    Если ОтсутствующиеПоля.Количество() > 0 Тогда
        ВызватьИсключение "Отсутствуют обязательные поля в параметрах доступа!";
    КонецЕсли;
    
    ApiUrl           = ПараметрыДоступа["apiUrl"];
    IdInstance       = ПараметрыДоступа["idInstance"];
    ApiTokenInstance = ПараметрыДоступа["apiTokenInstance"];
    
    URL = СтрШаблон("%1/waInstance%2/%3/%4", ApiUrl, IdInstance, Метод, ApiTokenInstance);
    
    Возврат URL;
    
КонецФункции

#КонецОбласти
