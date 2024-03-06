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

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

// Сформировать ссылку получения кода.
// 
// Параметры:
//  ClientID - Строка - Client ID
// 
// Возвращаемое значение:
//  Строка - Сформировать ссылку получения кода
Функция СформироватьСсылкуПолученияКода(Знач ClientID) Экспорт
    
    URL = "https://accounts.google.com/o/oauth2/auth";
    
    ПараметрыURL = Новый Структура;
    ПараметрыURL.Вставить("response_type", "code");
    ПараметрыURL.Вставить("client_id"    , ClientID);
    ПараметрыURL.Вставить("redirect_uri" , "http://localhost");
    ПараметрыURL.Вставить("access_type"  , "offline");
    ПараметрыURL.Вставить("scope"        , ПолучитьСписокРазрешений());
    
    URL = URL + OPI_Инструменты.ПараметрыЗапросаВСтроку(ПараметрыURL);
    
    Возврат URL;
    
КонецФункции

// Получить токен по коду.
// 
// Параметры:
//  ClientID - Строка - Client ID
//  ClientSecret - Строка - Client secret
//  Code - Строка - Code из браузера
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, Неопределено, HTTPОтвет - Получить токен по коду
Функция ПолучитьТокенПоКоду(Знач ClientID, Знач ClientSecret, Знач Code) Экспорт
    
    URL = "https://accounts.google.com/o/oauth2/token";
           
    ПараметрыURL = Новый Структура;
    ПараметрыURL.Вставить("grant_type"   , "authorization_code");
    ПараметрыURL.Вставить("client_id"    , ClientID);
    ПараметрыURL.Вставить("client_secret", ClientSecret);
    ПараметрыURL.Вставить("redirect_uri" , "http://localhost");  
    ПараметрыURL.Вставить("code"         , Code);
    
    Ответ = OPI_Инструменты.Post(URL, ПараметрыURL, , Ложь);
    
    Возврат Ответ;

КонецФункции

// Обновить токен.
// 
// Параметры:
//  ClientID - Строка - Client ID
//  ClientSecret - Строка - Client secret
//  RefreshToken - Строка - Refresh token
// 
// Возвращаемое значение:
//  Строка, Произвольный, ДвоичныеДанные, Неопределено, HTTPОтвет - Обновить токен
Функция ОбновитьТокен(Знач ClientID, Знач ClientSecret, Знач RefreshToken) Экспорт
    
    URL = "https://accounts.google.com/o/oauth2/token";
           
    ПараметрыURL = Новый Структура;
    ПараметрыURL.Вставить("grant_type"   , "refresh_token");
    ПараметрыURL.Вставить("client_id"    , ClientID);
    ПараметрыURL.Вставить("client_secret", ClientSecret);  
    ПараметрыURL.Вставить("refresh_token", RefreshToken);
    
    Ответ = OPI_Инструменты.Post(URL, ПараметрыURL, , Ложь);
    
    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИфункции

Функция ПолучитьСписокРазрешений()
    
    МассивРазрешений = Новый Массив;
    МассивРазрешений.Добавить("https://www.googleapis.com/auth/calendar");
    
    Возврат СтрСоединить(МассивРазрешений, " ");
    
КонецФункции

#КонецОбласти