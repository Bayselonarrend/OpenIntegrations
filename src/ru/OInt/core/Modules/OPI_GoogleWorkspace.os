// OneScript: ./OInt/core/Modules/OPI_GoogleWorkspace.os
// Lib: GoogleWorkspace
// CLI: google

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Область ПрограммныйИнтерфейс

// Сформировать ссылку получения кода
// Возвращает URL для авторизации в браузере
//
// Параметры:
//  ClientID - Строка - Client ID                     - id
//  Calendar - Булево - разрешение на методы Calendar - calendar
//  Drive    - Булево - разрешение на методы Drive    - drive
//  Sheets   - Булево - разрешение на методы Sheets   - sheets
//
// Возвращаемое значение:
//  Строка - Ссылка получения кода
Функция СформироватьСсылкуПолученияКода(Знач ClientID
    , Знач Calendar = Истина
    , Знач Drive = Истина
    , Знач Sheets = Истина) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientID);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Calendar);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Sheets);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Drive);

    URL = "https://accounts.google.com/o/oauth2/auth";

    ПараметрыURL = Новый Структура;
    ПараметрыURL.Вставить("response_type", "code");
    ПараметрыURL.Вставить("client_id"    , ClientID);
    ПараметрыURL.Вставить("redirect_uri" , "http://localhost");
    ПараметрыURL.Вставить("access_type"  , "offline");
    ПараметрыURL.Вставить("scope"        , ПолучитьСписокРазрешений(Calendar, Drive, Sheets));

    URL = URL + OPI_Инструменты.ПараметрыЗапросаВСтроку(ПараметрыURL);

    Возврат URL;

КонецФункции

// Получить токен по коду
// Получает токен по коду из авторизации в браузере
//
// Параметры:
//  ClientID     - Строка - Client ID        - id
//  ClientSecret - Строка - Client secret    - secret
//  Code         - Строка - Code из браузера - code
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьТокенПоКоду(Знач ClientID, Знач ClientSecret, Знач Code) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientID);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientSecret);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Code);

    URL = "https://accounts.google.com/o/oauth2/token";

    ПараметрыURL = Новый Структура;
    ПараметрыURL.Вставить("grant_type"   , "authorization_code");
    ПараметрыURL.Вставить("client_id"    , ClientID);
    ПараметрыURL.Вставить("client_secret", ClientSecret);
    ПараметрыURL.Вставить("redirect_uri" , "http://localhost");
    ПараметрыURL.Вставить("code"         , Code);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, ПараметрыURL, , Ложь);

    Возврат Ответ;

КонецФункции

// Обновить токен
// Обновляет токен по Refresh token
//
// Параметры:
//  ClientID     - Строка - Client ID     - id
//  ClientSecret - Строка - Client secret - secret
//  RefreshToken - Строка - Refresh token - refresh
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ОбновитьТокен(Знач ClientID, Знач ClientSecret, Знач RefreshToken) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientID);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientSecret);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(RefreshToken);

    URL = "https://accounts.google.com/o/oauth2/token";

    ПараметрыURL = Новый Структура;
    ПараметрыURL.Вставить("grant_type"   , "refresh_token");
    ПараметрыURL.Вставить("client_id"    , ClientID);
    ПараметрыURL.Вставить("client_secret", ClientSecret);
    ПараметрыURL.Вставить("refresh_token", RefreshToken);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, ПараметрыURL, , Ложь);

    Возврат Ответ;

КонецФункции

// Получить токен service аккаунта
// Получает токен авторизации по данным service аккаунта
//
// Примечание:
// Список доступных областей действия: [developers.google.com](https://developers.google.com/identity/protocols/oauth2/scopes)
//
// Параметры:
//  Данные          - Произвольный     - JSON данные авторизации как файл, коллекция или двоичные данные - auth
//  ОбластиДействия - Массив Из Строка - Область действия (scope) или массив областей                    - scope
//  ВремяЖизни      - Число            - Время жизни токена в секундах                                   - exp
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google
Функция ПолучитьТокенServiceАккаунта(Знач Данные, Знач ОбластиДействия, Знач ВремяЖизни = 3600) Экспорт

    ТекстОшибки = "Переданные данные service аккаунта не являются валидным JSON";
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Данные, ТекстОшибки);
    OPI_ПреобразованиеТипов.ПолучитьЧисло(ВремяЖизни);
    OPI_ПреобразованиеТипов.ПолучитьМассив(ОбластиДействия);

    МассивОбязательныхПолей = Новый Массив;
    МассивОбязательныхПолей.Добавить("token_uri");
    МассивОбязательныхПолей.Добавить("client_email");
    МассивОбязательныхПолей.Добавить("private_key");
    МассивОбязательныхПолей.Добавить("private_key_id");

    ОтсутствующиеПоля = OPI_Инструменты.НайтиОтсутствующиеПоляКоллекции(Данные, МассивОбязательныхПолей);

    Если ЗначениеЗаполнено(ОтсутствующиеПоля) Тогда

        ШаблонОшибкиПолей = "В данных service аккаунта отсутствуют обязательные поля: %1";
        ТекстОшибкиПолей  = СтрШаблон(ШаблонОшибкиПолей, СтрСоединить(ОтсутствующиеПоля, ", "));
        ВызватьИсключение ТекстОшибкиПолей;

    КонецЕсли;

    ОбластиДействияСтрокой = СтрСоединить(ОбластиДействия, " ");
    КлючПодписи            = Данные["private_key"];
    URL                    = Данные["token_uri"];

    ТекущаяДата  = ТекущаяУниверсальнаяДата();
    ДатаСгорания = ТекущаяДата + ВремяЖизни;

    UnixTime = OPI_Инструменты.UnixTime(ТекущаяДата);
    ExpTime  = OPI_Инструменты.UnixTime(ДатаСгорания);

    Payload = Новый Структура;

    Payload.Вставить("iss"  , Данные["client_email"]);
    Payload.Вставить("scope", ОбластиДействияСтрокой);
    Payload.Вставить("aud"  , URL);
    Payload.Вставить("exp"  , Число(ExpTime));
    Payload.Вставить("iat"  , Число(UnixTime));

    ДопЗаголовки = Новый Структура("kid", Данные["private_key_id"]);

    JWT = OPI_Криптография.JWT(Payload, КлючПодписи, "RS256", ДопЗаголовки);

    Грант         = "urn:ietf:params:oauth:grant-type:jwt-bearer";
    СтруктураТела = Новый Структура("grant_type,assertion", Грант, JWT);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, СтруктураТела, , Ложь);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Функция ПолучитьЗаголовокАвторизации(Знач Токен) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);

    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "Bearer " + Токен);

    Возврат Заголовки;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСписокРазрешений(Calendar, Drive, Sheets)

    МассивРазрешений = Новый Массив;

    Если Calendar Тогда
        МассивРазрешений.Добавить("https://www.googleapis.com/auth/calendar");
    КонецЕсли;

    Если Drive Тогда
        МассивРазрешений.Добавить("https://www.googleapis.com/auth/drive");
    КонецЕсли;

    Если Sheets Тогда
        МассивРазрешений.Добавить("https://www.googleapis.com/auth/spreadsheets");
    КонецЕсли;

    Возврат СтрСоединить(МассивРазрешений, " ");

КонецФункции

#КонецОбласти

#Region Alternate

Function FormCodeRetrievalLink(Val ClientID, Val Calendar = True, Val Drive = True, Val Sheets = True) Export
    Return СформироватьСсылкуПолученияКода(ClientID, Calendar, Drive, Sheets);
EndFunction

Function GetTokenByCode(Val ClientID, Val ClientSecret, Val Code) Export
    Return ПолучитьТокенПоКоду(ClientID, ClientSecret, Code);
EndFunction

Function RefreshToken(Val ClientID, Val ClientSecret, Val RefreshToken) Export
    Return ОбновитьТокен(ClientID, ClientSecret, RefreshToken);
EndFunction

Function GetServiceAccountToken(Val Data, Val Scope, Val Expire = 3600) Export
    Return ПолучитьТокенServiceАккаунта(Data, Scope, Expire);
EndFunction

Function GetAuthorizationHeader(Val Token) Export
    Return ПолучитьЗаголовокАвторизации(Token);
EndFunction

#EndRegion
