﻿// OneScript: ./OInt/core/Modules/OPI_CDEK.os
// Lib: CDEK
// CLI: cdek

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

#Область ОбщиеМетоды

// Получить токен
// Получает токен на основе идентификатора аккаунта и пароля
// 
// Примечание:
// Метод в документации API: [Авторизация клиентов](@api-docs.cdek.ru/29923918.html)
// 
// Параметры:
//  Аккаунт     - Строка - Идентификатор клиента (Account)              - account
//  Пароль      - Строка - Секретный ключ (Password)                    - pass
//  ТестовыйAPI - Булево - Флаг использования API для тестовых запросов - testapi
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK
Функция ПолучитьТокен(Знач Аккаунт, Знач Пароль, ТестовыйAPI = Ложь) Экспорт
		
	URL = СформироватьURL("/oauth/token", ТестовыйAPI);
	
	Параметры = Новый Структура;
	OPI_Инструменты.ДобавитьПоле("grant_type"   , "client_credentials", "Строка", Параметры);
	OPI_Инструменты.ДобавитьПоле("client_id"    , Аккаунт             , "Строка", Параметры);
	OPI_Инструменты.ДобавитьПоле("client_secret", Пароль              , "Строка", Параметры);
	
	Ответ = OPI_Инструменты.Post(URL, Параметры, , Ложь);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СформироватьURL(Знач Метод, Знач ТестовыйAPI)
	
	OPI_ПреобразованиеТипов.ПолучитьБулево(ТестовыйAPI);
	
	Если ТестовыйAPI Тогда
		URL = "https://api.edu.cdek.ru/v2";
	Иначе
		URL = "https://api.cdek.ru";
	КонецЕсли;
	
	URL = URL + Метод;
	
	Возврат URL;
	
КонецФункции

#КонецОбласти