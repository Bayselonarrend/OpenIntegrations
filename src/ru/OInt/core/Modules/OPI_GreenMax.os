// OneScript: ./OInt/core/Modules/OPI_GreenMax.os
// Lib: Green Max
// CLI: greenmax
// Keywords: greenapi, max

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check bsl-legacy-check-string-literal

#Область ПрограммныйИнтерфейс

#Область Аккаунт

// Сформировать параметры доступа
// Формирует структуру основных авторизационных данных
//
// Примечание:
// Подробнее в документации API: [Получить параметры доступа к инстансу](@green-api.com/v3/docs/before-start/#parameters)
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
// Метод в документации API: [GetWaSettings](@green-api.com/v3/docs/api/account/GetAccountSettings/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьИнформациюОбАккаунте(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "getAccountSettings");
    Ответ = OPI_ЗапросыHTTP.Get(URL);

    Возврат Ответ;

КонецФункции

// Получить настройки инстанса
// Получает текущие настройки инстанса
//
// Примечание:
// Метод в документации API: [GetSettings](@green-api.com/v3/docs/api/account/GetSettings/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьНастройкиИнстанса(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "getSettings");
    Ответ = OPI_ЗапросыHTTP.Get(URL);

    Возврат Ответ;

КонецФункции

// Установить настройки инстанса
// Устанавливает настройки инстанса
//
// Примечание
// Метод в документации API: [SetSettings](@green-api.com/v3/docs/api/account/SetSettings/)
//
// Параметры:
//  Настройки        - Структура Из КлючИЗначение - Настройки инстанса. См. ПолучитьСтруктуруНастроекИнстанса - settings
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа       - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция УстановитьНастройкиИнстанса(Знач Настройки, Знач ПараметрыДоступа) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Настройки);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "setSettings");
    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Настройки);

    Возврат Ответ;

КонецФункции

// Получить код авторизации
// Отправляет SMS по указанному номеру для получения кода подтверждения
//
// Примечание:
// Метод в документации API: [StartAuthorization](@green-api.com/v3/docs/api/account/StartAuthorization/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа  - access
//  НомерТелефона    - Строка, Число              - Номер телефона без знака +                           - phone
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьКодАвторизации(Знач ПараметрыДоступа, Знач НомерТелефона) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(НомерТелефона);

    НомерТелефона = СтрЗаменить(НомерТелефона, "+", "");

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("phoneNumber", НомерТелефона, "Число", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "startAuthorization");
    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Отправить код авторизации
// Авторизует инстанс по коду доступа из SMS
//
// Примечание:
// Метод в документации API: [SendAuthorizationCode](@green-api.com/v3/docs/api/account/SendAuthorizationCode/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  КодАвторизации   - Строка                     - Код авторизации                                     - code
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ОтправитьКодАвторизации(Знач ПараметрыДоступа, Знач КодАвторизации) Экспорт

    Параметры = Новый Структура;

    OPI_Инструменты.ДобавитьПоле("code", КодАвторизации, "Строка", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "sendAuthorizationCode");
    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры);

    Возврат Ответ;

КонецФункции

// Получить состояние инстанса
// Получает состояние инстанса
//
// Примечание:
// Метод в документации API: [GetStateInstance](@green-api.com/v3/docs/api/account/GetStateInstance/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПолучитьСостояниеИнстанса(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "getStateInstance");
    Ответ = OPI_ЗапросыHTTP.Get(URL);

    Возврат Ответ;

КонецФункции

// Установить картинку профиля
// Устанавливает новую картинку профиля
//
// Примечание:
// Метод в документации API: [SetProfilePicture](@green-api.com/v3/docs/api/account/SetProfilePicture/)
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
    Ответ = OPI_ЗапросыHTTP.PostMultipart(URL, , СоответствиеКартинки);

    Возврат Ответ;

КонецФункции

// Разлогинить инстанс
// Разлогинивает инстанс
//
// Примечание:
// Метод в документации API: [Logout](@green-api.com/v3/docs/api/account/Logout/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция РазлогинитьИнстанс(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "logout");
    Ответ = OPI_ЗапросыHTTP.Get(URL);

    Возврат Ответ;

КонецФункции

// Перезапустить инстанс
// Перезапускает инстанс
//
// Примечание:
// Метод в документации API: [Reboot](@green-api.com/v3/docs/api/account/Reboot/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПерезапуститьИнстанс(Знач ПараметрыДоступа) Экспорт

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "reboot");
    Ответ = OPI_ЗапросыHTTP.Get(URL);

    Возврат Ответ;

КонецФункции

// Проверить аккаунт
// Проверяет существование аккаунта Max по номеру телефона
//
// Примечание:
// Метод в документации API: [CheckAccount](@green-api.com/v3/docs/api/account/CheckAccount/)
//
// Параметры:
//  ПараметрыДоступа - Структура Из КлючИЗначение - Параметры доступа. См. СформироватьПараметрыДоступа - access
//  НомерТелефона    - Строка, Число              - Номер телефона для проверки без знака +             - phone
//  ИгнорироватьКэш  - Булево                     - Игнорировать кэш при повторном запросе проверки     - force
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Green API
Функция ПроверитьАккаунт(Знач ПараметрыДоступа, Знач НомерТелефона, Знач ИгнорироватьКэш = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(НомерТелефона);

    НомерТелефона = СтрЗаменить(НомерТелефона, "+", "");

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("phoneNumber", НомерТелефона  , "Число" , Параметры);
    OPI_Инструменты.ДобавитьПоле("force"      , ИгнорироватьКэш, "Булево", Параметры);

    URL   = СформироватьОсновнойURL(ПараметрыДоступа, "checkAccount");
    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры);

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


#КонецОбласти

#Region Alternate

Function FormAccessParameters(Val ApiUrl, Val MediaUrl, Val IdInstance, Val ApiTokenInstance) Export
	Return СформироватьПараметрыДоступа(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
EndFunction

Function GetAccountInformation(Val AccessParameters) Export
	Return ПолучитьИнформациюОбАккаунте(AccessParameters);
EndFunction

Function GetInstanceSettings(Val AccessParameters) Export
	Return ПолучитьНастройкиИнстанса(AccessParameters);
EndFunction

Function SetInstanceSettings(Val Settings, Val AccessParameters) Export
	Return УстановитьНастройкиИнстанса(Settings, AccessParameters);
EndFunction

Function GetAuthorizationCode(Val AccessParameters, Val PhoneNumber) Export
	Return ПолучитьКодАвторизации(AccessParameters, PhoneNumber);
EndFunction

Function SendAuthorizationCode(Val AccessParameters, Val AuthCode) Export
	Return ОтправитьКодАвторизации(AccessParameters, AuthCode);
EndFunction

Function GetInstanceStatus(Val AccessParameters) Export
	Return ПолучитьСостояниеИнстанса(AccessParameters);
EndFunction

Function SetProfilePicture(Val AccessParameters, Val Image) Export
	Return УстановитьКартинкуПрофиля(AccessParameters, Image);
EndFunction

Function LogoutInstance(Val AccessParameters) Export
	Return РазлогинитьИнстанс(AccessParameters);
EndFunction

Function RebootInstance(Val AccessParameters) Export
	Return ПерезапуститьИнстанс(AccessParameters);
EndFunction

Function CheckAccount(Val AccessParameters, Val PhoneNumber, Val IgnoreCache = False) Export
	Return ПроверитьАккаунт(AccessParameters, PhoneNumber, IgnoreCache);
EndFunction

Function GetInstanceSettingsStructure(Val Clear = False) Export
	Return ПолучитьСтруктуруНастроекИнстанса(Clear);
EndFunction

#EndRegion