// OneScript: ./OInt/core/Modules/OPI_YandexID.os
// Lib: Yandex ID
// CLI: yandex

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

// Получить код подтверждения
// Получает код подтверждения и адрес страницы, на которой его необходимо ввести
// 
// Параметры:
//  ClientId - Строка - Client id - id
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ПолучитьКодПодтверждения(Знач ClientId) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientId);
    
    Параметры = Новый Структура("client_id", ClientId);
    Ответ     = OPI_Инструменты.Post("https://oauth.yandex.ru/device/code", Параметры, , Ложь);
    
    Возврат Ответ;
    
КонецФункции

// Преобразовать код в токен
// Преобразовывает код в токен после ввода кода при выполнении ПолучитьКодПодтверждения
// 
// Параметры:
//  ClientId      - Строка - Client id                                 - id
//  ClientSecret  - Строка - Client secret                             - secret
//  КодУстройства - Строка - device_code из ПолучитьКодПодтверждения() - device
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ПреобразоватьКодВТокен(Знач ClientId, Знач ClientSecret, Знач КодУстройства) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientId);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientSecret);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(КодУстройства);
    
    Параметры = Новый Структура;
    Параметры.Вставить("grant_type"    , "device_code");
    Параметры.Вставить("code"          , КодУстройства);
    Параметры.Вставить("client_id"     , ClientId);
    Параметры.Вставить("client_secret" , ClientSecret);
    
    Ответ = OPI_Инструменты.Post("https://oauth.yandex.ru/token", Параметры, , Ложь);
    
    Возврат Ответ;
    
КонецФункции

// Обновить токен
// Обновляет токен по Refresh token
// 
// Параметры:
//  ClientId     - Строка - Client id      - id
//  ClientSecret - Строка - Client secret  - secret
//  RefreshToken - Строка - Refresh token  - refresh
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex
Функция ОбновитьТокен(Знач ClientId, Знач ClientSecret, Знач RefreshToken) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientId);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ClientSecret);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(RefreshToken);
    
    Параметры = Новый Структура;
    Параметры.Вставить("grant_type"    , "refresh_token");
    Параметры.Вставить("refresh_token" , RefreshToken);
    Параметры.Вставить("client_id"     , ClientId);
    Параметры.Вставить("client_secret" , ClientSecret);
    
    Ответ = OPI_Инструменты.Post("https://oauth.yandex.ru/token", Параметры, , Ложь);
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти
