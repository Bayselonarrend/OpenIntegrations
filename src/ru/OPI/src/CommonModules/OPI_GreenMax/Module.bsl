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
