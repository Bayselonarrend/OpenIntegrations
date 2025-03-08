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

// Получить информацию об аккаунте
// Получает информацию об аккаунте
//
// Примечание:
// Метод в документации API: [GetWaSettings](@green-api.com/docs/api/account/GetWaSettings/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьИнформациюОбАккаунте(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "getWaSettings");
    Ответ = OPI_Инструменты.Get(URL);

    Возврат Ответ;

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
// Метод в документации API: [SetSettings](@green-api.com/docs/api/account/SetSettings/)
//
// Параметры:
//  Настройки        - Структура Из КлючИЗначение - Настройки инстанса. См. ПолучитьСтруктуруНастроекИнстанса - settings
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа       - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция УстановитьНастройкиИнстанса(Знач Настройки, Знач ПараметрыДоступа) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ПараметрыДоступа);
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Настройки);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "setSettings");
    Ответ = OPI_Инструменты.Post(URL, Настройки);

    Возврат Ответ;

КонецФункции

// Получить состояние инстанса
// Получает состояние инстанса
//
// Примечание:
// Метод в документации API: [GetStateInstance](@green-api.com/docs/api/account/GetStateInstance/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьСостояниеИнстанса(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "getStateInstance");
    Ответ = OPI_Инструменты.Get(URL);

    Возврат Ответ;

КонецФункции

// Перезапустить инстанс
// Перезапускает инстанс
//
// Примечание:
// Метод в документации API: [Reboot](@green-api.com/docs/api/account/Reboot/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПерезапуститьИнстанс(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "reboot");
    Ответ = OPI_Инструменты.Get(URL);

    Возврат Ответ;

КонецФункции

// Разлогинить инстанс
// Разлогинивает инстанс
//
// Примечание:
// Метод в документации API: [Logout](@green-api.com/docs/api/account/Logout/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция РазлогинитьИнстанс(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "logout");
    Ответ = OPI_Инструменты.Get(URL);

    Возврат Ответ;

КонецФункции

// Получить QR
// Получает QR-код авторизации
//
// Примечание:
// Метод в документации API: [QR](@green-api.com/docs/api/account/QR/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  ДвоичныеДанные, Соответствие Из КлючИЗначение - QR код или информация об ошибке
Функция ПолучитьQR(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "qr");
    Ответ = OPI_Инструменты.Get(URL);

    Попытка

        Если Ответ["type"] = "qrCode" Тогда
            Результат = Base64Значение(Ответ["message"]);
        КонецЕсли;

    Исключение
        Результат = Ответ;
    КонецПопытки;

    Возврат Результат;

КонецФункции

// Получить код авторизации
// Получает код авторизации для связи по номеру телефона
//
// Примечание:
// Метод в документации API: [GetAuthorizationCode](@green-api.com/docs/api/account/GetAuthorizationCode/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  НомерТелефона    - Строка, Число              - Номер телефона в международном формате без + и 00   - phone
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьКодАвторизации(Знач ПараметрыДоступа, Знач НомерТелефона) Экспорт

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("phoneNumber", НомерТелефона, "Число", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "getAuthorizationCode");
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Установить картинку профиля
// Устанавливает новую картинку профиля
//
// Примечание:
// Метод в документации API: [SetProfilePicture](@green-api.com/docs/api/account/SetProfilePicture/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  Картинка         - ДвоичныеДанные, Строка     - Картинка профиля                                    - picture
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция УстановитьКартинкуПрофиля(Знач ПараметрыДоступа, Знач Картинка) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Картинка);

    СоответствиеКартинки = Новый Соответствие();
    СоответствиеКартинки.Вставить("file|file.jpg", Картинка);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "setProfilePicture");
    Ответ = OPI_Инструменты.PostMultipart(URL, , СоответствиеКартинки);

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

#Область УправлениеГруппами

// Получить информацию о группе
// Получает данные группового чата
//
// Примечание:
// Метод в документации API: [GetGroupData](@green-api.com/docs/api/groups/GetGroupData/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDГруппы         - Строка                     - Идентификатор группового чата                       - group
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьИнформациюОГруппе(Знач ПараметрыДоступа, Знач IDГруппы) Экспорт

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("groupId", IDГруппы, "Строка", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "getGroupData");
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Создать группу
// Создает новый групповой чат
//
// Примечание:
// Метод в документации API: [CreateGroup](@green-api.com/docs/api/groups/CreateGroup/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  Имя              - Строка                     - Наименование группового чата                        - name
//  Участники        - Массив Из Строка           - Массив участников чата                              - members
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция СоздатьГруппу(Знач ПараметрыДоступа, Знач Имя, Знач Участники = Неопределено) Экспорт

    Если Не ЗначениеЗаполнено(Участники) Тогда
        Участники = Новый Массив;
    КонецЕсли;

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("groupName", Имя      , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("chatIds"  , Участники, "Коллекция", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "createGroup");
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Изменить имя группы
// Изменяет имя существующей группы
//
// Примечание:
// Метод в документации API: [UpdateGroupName](@green-api.com/docs/api/groups/UpdateGroupName/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDГруппы         - Строка                     - Идентификатор группового чата                       - group
//  Имя              - Строка                     - Новое наименование группового чата                  - name
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ИзменитьИмяГруппы(Знач ПараметрыДоступа, Знач IDГруппы, Знач Имя) Экспорт

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("groupId"  , IDГруппы, "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("groupName", Имя     , "Строка", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "updateGroupName");
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Добавить участника в группу
// Добавляет участника в групповой чат
//
// Примечание:
// Метод в документации API: [AddGroupParticipant](@green-api.com/docs/api/groups/AddGroupParticipant/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDГруппы         - Строка                     - Идентификатор группового чата                       - group
//  IDПользователя   - Строка                     - ID пользователя для добавления                      - user
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ДобавитьУчастникаВГруппу(Знач ПараметрыДоступа, Знач IDГруппы, Знач IDПользователя) Экспорт

    Ответ = ДействиеСУчастникомГруппы(ПараметрыДоступа, IDГруппы, IDПользователя, "addGroupParticipant");

    Возврат Ответ;

КонецФункции

// Исключить участника группы
// Исключает участника из группы
//
// Примечание:
// Метод в документации API: [RemoveGroupParticipant](@green-api.com/docs/api/groups/RemoveGroupParticipant/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDГруппы         - Строка                     - Идентификатор группового чата                       - group
//  IDПользователя   - Строка                     - ID пользователя для добавления                      - user
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ИсключитьУчастникаГруппы(Знач ПараметрыДоступа, Знач IDГруппы, Знач IDПользователя) Экспорт

    Ответ = ДействиеСУчастникомГруппы(ПараметрыДоступа, IDГруппы, IDПользователя, "removeGroupParticipant");

    Возврат Ответ;

КонецФункции

// Назначить права администратора
// Назначает пользователя администратором группы
//
// Примечание:
// Метод в документации API: [SetGroupAdmin](@green-api.com/docs/api/groups/SetGroupAdmin/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDГруппы         - Строка                     - Идентификатор группового чата                       - group
//  IDПользователя   - Строка                     - ID пользователя для добавления                      - user
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция НазначитьПраваАдминистратора(Знач ПараметрыДоступа, Знач IDГруппы, Знач IDПользователя) Экспорт

    Ответ = ДействиеСУчастникомГруппы(ПараметрыДоступа, IDГруппы, IDПользователя, "setGroupAdmin");

    Возврат Ответ;

КонецФункции

// Отозвать права администратора
// Отзывает права администратора у пользователя
//
// Примечание:
// Метод в документации API: [RemoveAdmin](@green-api.com/docs/api/groups/RemoveAdmin/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDГруппы         - Строка                     - Идентификатор группового чата                       - group
//  IDПользователя   - Строка                     - ID пользователя для добавления                      - user
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ОтозватьПраваАдминистратора(Знач ПараметрыДоступа, Знач IDГруппы, Знач IDПользователя) Экспорт

    Ответ = ДействиеСУчастникомГруппы(ПараметрыДоступа, IDГруппы, IDПользователя, "removeAdmin");

    Возврат Ответ;

КонецФункции

// Покинуть группу
// Производит выход текущего аккаунта из группового чата
//
// Примечание:
// Метод в документации API: [LeaveGroup](@green-api.com/docs/api/groups/LeaveGroup/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDГруппы         - Строка                     - Идентификатор группового чата                       - group
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПокинутьГруппу(Знач ПараметрыДоступа, Знач IDГруппы) Экспорт

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("groupId", IDГруппы, "Строка", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "leaveGroup");
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Установить картинку группы
// Устанавливает картинку группового чата
//
// Примечание:
// Метод в документации API: [SetGroupPicture](@green-api.com/docs/api/groups/SetGroupPicture/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDГруппы         - Строка                     - Идентификатор группового чата                       - group
//  Картинка         - ДвоичныеДанные, Строка     - Картинка профиля                                    - picture
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция УстановитьКартинкуГруппы(Знач ПараметрыДоступа, Знач IDГруппы, Знач Картинка) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Картинка);

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("groupId", IDГруппы, "Строка", Параметры);

    СоответствиеКартинки = Новый Соответствие();
    СоответствиеКартинки.Вставить("file|file.jpg", Картинка);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "setGroupPicture");
    Ответ = OPI_Инструменты.PostMultipart(URL, Параметры, СоответствиеКартинки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область ОтправкаСообщений

// Отправить текстовое сообщение
// Отправляет текстовое сообщение в выбранный чат
//
// Примечание:
// Метод в документации API: [SendMessage](@green-api.com/docs/api/sending/SendMessage/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDЧата           - Строка                     - Идентификатор чата                                  - chat
//  Текст            - Строка                     - Текст сообщения                                     - text
//  IDЦитируемого    - Строка                     - ID цитируемого сообщения, если необходимо           - quoted
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ОтправитьТекстовоеСообщение(Знач ПараметрыДоступа, Знач IDЧата, Знач Текст, Знач IDЦитируемого = "") Экспорт

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("chatId"         , IDЧата       , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("message"        , Текст        , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("quotedMessageId", IDЦитируемого, "Строка", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "sendMessage");
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Отправить файл
// Отправляет файл в выбранный чат
//
// Примечание:
// Метод в документации API: [SendFileByUpload](@green-api.com/docs/api/sending/SendFileByUpload/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDЧата           - Строка                     - Идентификатор чата                                  - chat
//  Файл             - Строка, ДвоичныеДанные     - Данные или путь к файлу                             - file
//  ИмяФайла         - Строка                     - Имя загружаемого файла с раширением                 - filename
//  Описание         - Строка                     - Текст сообщения под файлом                          - caption
//  IDЦитируемого    - Строка                     - ID цитируемого сообщения, если необходимо           - quoted
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ОтправитьФайл(Знач ПараметрыДоступа
    , Знач IDЧата
    , Знач Файл
    , Знач ИмяФайла
    , Знач Описание = ""
    , Знач IDЦитируемого = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Файл);

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("chatId"         , IDЧата       , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("fileName"       , ИмяФайла     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("caption"        , Описание     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("quotedMessageId", IDЦитируемого, "Строка", Параметры);

    СоответствиеФайла = Новый Соответствие();
    СоответствиеФайла.Вставить(СтрШаблон("file|%1", ИмяФайла), Файл);

    URL   = СформироватьМедиаURL(ПараметрыДоступа, "SendFileByUpload");
    Ответ = OPI_Инструменты.PostMultipart(URL, Параметры, СоответствиеФайла);

    Возврат Ответ;

КонецФункции

// Отправить файл по URL
// Отправляет файл по URL в выбранный чат
//
// Примечание:
// Метод в документации API: [SendFileByUrl](@green-api.com/docs/api/sending/SendFileByUrl/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDЧата           - Строка                     - Идентификатор чата                                  - chat
//  URLФайла         - Строка,                    - URL файла для отправки                              - url
//  ИмяФайла         - Строка                     - Имя загружаемого файла с раширением                 - filename
//  Описание         - Строка                     - Текст сообщения под файлом                          - caption
//  IDЦитируемого    - Строка                     - ID цитируемого сообщения, если необходимо           - quoted
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ОтправитьФайлПоURL(Знач ПараметрыДоступа
    , Знач IDЧата
    , Знач URLФайла
    , Знач ИмяФайла
    , Знач Описание = ""
    , Знач IDЦитируемого = "") Экспорт

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("chatId"         , IDЧата       , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("urlFile"        , URLФайла     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("fileName"       , ИмяФайла     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("caption"        , Описание     , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("quotedMessageId", IDЦитируемого, "Строка", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "sendFileByUrl");
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Отправить опрос
// Отправляет опрос с вариантами ответов в выбранный чат
//
// Примечание:
// Метод в документации API: [SendPoll](@green-api.com/docs/api/sending/SendPoll/)
//
// Параметры:
//  ПараметрыДоступа   - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDЧата             - Строка                     - Идентификатор чата                                  - chat
//  Текст              - Строка                     - Текст сообщения                                     - text
//  Варианты           - Массив Из Строка           - Варианты ответов                                    - options
//  МножественныйВыбор - Булево                     - Позволяет выбирать несколько вариантов ответа       - multi
//  IDЦитируемого      - Строка                     - ID цитируемого сообщения, если необходимо           - quoted
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ОтправитьОпрос(Знач ПараметрыДоступа
    , Знач IDЧата
    , Знач Текст
    , Знач Варианты
    , Знач МножественныйВыбор = Ложь
    , Знач IDЦитируемого = "") Экспорт

    Параметры       = Новый Структура;
    МассивВариантов = Новый Массив;

    OPI_ПреобразованиеТипов.ПолучитьМассив(Варианты);

    Для Каждого Вариант Из Варианты Цикл
        МассивВариантов.Добавить(Новый Структура("optionName", Вариант));
    КонецЦикла;

    OPI_Инструменты.ДобавитьПоле("chatId"         , IDЧата            , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("message"        , Текст             , "Строка"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("options"        , МассивВариантов   , "Коллекция", Параметры);
    OPI_Инструменты.ДобавитьПоле("multipleAnswers", МножественныйВыбор, "Булево"   , Параметры);
    OPI_Инструменты.ДобавитьПоле("quotedMessageId", IDЦитируемого     , "Строка"   , Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "sendPoll");
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Отправить локацию
// Отправляет данные о местоположении в указанный чат
// 
// Примечание:
// Метод в документации API: [SendPoll](@green-api.com/docs/api/sending/SendPoll/)
//
// Параметры:
//  ПараметрыДоступа   - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  IDЧата             - Строка                     - Идентификатор чата                                  - chat
//  Локация            - Структура Из КлючИЗначение - Описание локации. См. ПолучитьОписаниеЛокации       - loc
//  IDЦитируемого      - Строка                     - ID цитируемого сообщения, если необходимо           - quoted
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ОтправитьЛокацию(Знач ПараметрыДоступа, Знач IDЧата, Знач Локация, Знач IDЦитируемого = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Локация);
    
    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("chatId"         , IDЧата       , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("quotedMessageId", IDЦитируемого, "Строка", Параметры);
    
    Для Каждого Элемент Из Локация Цикл
        Параметры.Вставить(Элемент.Ключ, Элемент.Значение);    
    КонецЦикла;

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "sendLocation");
    Ответ = OPI_Инструменты.Post(URL, Параметры);
    
    Возврат Ответ;
       
КонецФункции

// Получить описание локации
// Получает описание локации для отправки в ОтправитьЛокацию
// 
// Параметры:
//  Широта   - Число  - Географическая широта  - lat
//  Долгота  - Число  - Географическая долгота - long
//  Адрес    - Строка - Адрес локации          - addr
//  Название - Строка - Название локации       - name
// 
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Описание локации
Функция ПолучитьОписаниеЛокации(Знач Широта, Знач Долгота, Знач Адрес = "", Знач Название = "") Экспорт

    Локация = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("latitude"    , Широта  , "Число", Локация);
    OPI_Инструменты.ДобавитьПоле("longitude"   , Долгота , "Число", Локация);
    OPI_Инструменты.ДобавитьПоле("address"     , Адрес   , "Строка", Локация);
    OPI_Инструменты.ДобавитьПоле("nameLocation", Название, "Строка", Локация);
    
    Возврат Локация;
        
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СформироватьОсновнойURL(Знач ПараметрыДоступа, Знач Метод)

        Возврат СформироватьURL(ПараметрыДоступа, Метод, "apiUrl");

КонецФункции

Функция СформироватьМедиаURL(Знач ПараметрыДоступа, Знач Метод)

        Возврат СформироватьURL(ПараметрыДоступа, Метод, "mediaUrl");

КонецФункции

Функция СформироватьURL(ПараметрыДоступа, Метод, ПолеURL)

    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ПараметрыДоступа);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Метод);

    ОбязательныеПоля  = СтрРазделить(ПолеURL + ",idInstance,apiTokenInstance", ",");
    ОтсутствующиеПоля = OPI_Инструменты.НайтиОтсутствующиеПоляКоллекции(ПараметрыДоступа, ОбязательныеПоля);

    Если ОтсутствующиеПоля.Количество() > 0 Тогда
        ВызватьИсключение "Отсутствуют обязательные поля в параметрах доступа!";
    КонецЕсли;

    Url              = ПараметрыДоступа[ПолеURL];
    IdInstance       = ПараметрыДоступа["idInstance"];
    ApiTokenInstance = ПараметрыДоступа["apiTokenInstance"];

    URL = СтрШаблон("%1/waInstance%2/%3/%4", Url, IdInstance, Метод, ApiTokenInstance);

    Возврат URL;

КонецФункции

Функция ДействиеСУчастникомГруппы(Знач ПараметрыДоступа, Знач IDГруппы, Знач IDПользователя, Знач Метод)

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("groupId"          , IDГруппы      , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("participantChatId", IDПользователя, "Строка", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, Метод);
    Ответ = OPI_Инструменты.Post(URL, Параметры);

    Возврат Ответ;

КонецФункции

#КонецОбласти
