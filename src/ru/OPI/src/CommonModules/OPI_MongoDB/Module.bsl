﻿// OneScript: ./OInt/core/Modules/OPI_MongoDB.os
// Lib: MongoDB
// CLI: mongodb

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
//@skip-check constructor-function-return-section

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область УправлениеБазамиДанных

// Получить список баз
// Получает список баз
//
// Примечание:
// Метод в документации MongoDB: [listDatabases](@mongodb.com/docs/manual/reference/command/listDatabases/)
//
// Параметры:
//  СтрокаПодключения - Строка - Строка подключения к серверу MongoDB - connect
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - сериализованный JSON ответа от сервера MongoDB
Функция ПолучитьСписокБаз(Знач СтрокаПодключения) Экспорт

    Клиент = КлиентMongoDB(СтрокаПодключения);

    Ответ = Клиент.ListDatabases();
    Ответ = OPI_Инструменты.JsonВСтруктуру(Ответ, Ложь);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция КлиентMongoDB(Знач СтрокаПодключения)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(СтрокаПодключения);

    Клиент                  = OPI_Инструменты.ПолучитьКомпоненту("MongoDB");
    Клиент.ConnectionString = СтрокаПодключения;

    Возврат Клиент;

КонецФункции

#КонецОбласти