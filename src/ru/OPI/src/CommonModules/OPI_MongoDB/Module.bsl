// OneScript: ./OInt/core/Modules/OPI_MongoDB.os
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
// Получает список баз данных
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

// Получить статистику базы
// Получает информацию о базе данных
// 
// Примечание:
// Метод в документации MongoDB: [dbStats](@mongodb.com/docs/manual/reference/command/dbStats/)
//
// Параметры:
//  СтрокаПодключения - Строка - Строка подключения к серверу MongoDB - connect
//  БазаДанных        - Строка - Имя базы данных                      - db 
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - сериализованный JSON ответа от сервера MongoDB
Функция ПолучитьСтатистикуБазы(Знач СтрокаПодключения, Знач БазаДанных) Экспорт
	
	OPI_ПреобразованиеТипов.ПолучитьСтроку(БазаДанных);
	
	Клиент = КлиентMongoDB(СтрокаПодключения);
	
	Ответ = Клиент.DatabaseStats(БазаДанных);
    Ответ = OPI_Инструменты.JsonВСтруктуру(Ответ, Ложь);

    Возврат Ответ;
    
КонецФункции

// База данных существует
// Проверяет существование базы данных по имени
//
// Параметры:
//  СтрокаПодключения - Строка - Строка подключения к серверу MongoDB - connect
//  БазаДанных        - Строка - Имя базы данных                      - db 
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - сериализованный JSON ответа от сервера MongoDB
Функция БазаДанныхСуществует(Знач СтрокаПодключения, Знач БазаДанных) Экспорт
	
	OPI_ПреобразованиеТипов.ПолучитьСтроку(БазаДанных);
	
	Клиент = КлиентMongoDB(СтрокаПодключения);
	
	Ответ = Клиент.DatabaseExists(БазаДанных);
    Ответ = OPI_Инструменты.JsonВСтруктуру(Ответ, Ложь);

    Возврат Ответ;
    
КонецФункции

// Удалить базу
// Удаляет базу данных
// 
// Примечание:
// Метод в документации MongoDB: [db.dropDatabase](@mongodb.com/docs/manual/reference/method/db.dropDatabase/)
//
// Параметры:
//  СтрокаПодключения - Строка - Строка подключения к серверу MongoDB - connect
//  БазаДанных        - Строка - Имя базы данных                      - db 
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - сериализованный JSON ответа от сервера MongoDB
Функция УдалитьБазу(Знач СтрокаПодключения, Знач БазаДанных) Экспорт
	
	OPI_ПреобразованиеТипов.ПолучитьСтроку(БазаДанных);
	
	Клиент = КлиентMongoDB(СтрокаПодключения);
	
	Ответ = Клиент.DropDatabase(БазаДанных);
    Ответ = OPI_Инструменты.JsonВСтруктуру(Ответ, Ложь);

    Возврат Ответ;
    
КонецФункции

#КонецОбласти

#Область УправлениеКоллекциями

// Создать коллекцию
// Создает пустую коллекцию в выбранной базе
// 
// Примечание:
// Если база с именем, указанным в параметре БазаДанных, отсутствует, то она будет создана
// Метод в документации MongoDB: [db.createCollection](@mongodb.com/docs/manual/reference/method/db.createCollection/)
//
// Параметры:
//  СтрокаПодключения - Строка - Строка подключения к серверу MongoDB - connect
//  БазаДанных        - Строка - Имя базы данных                      - db 
//  Наименование      - Строка - Имя коллекции                        - cl
// 
// Возвращаемое значение:
//  Структура Из КлючИЗначение - сериализованный JSON ответа от сервера MongoDB
Функция СоздатьКоллекцию(Знач СтрокаПодключения, Знач БазаДанных, Знач Наименование) Экспорт
	
	OPI_ПреобразованиеТипов.ПолучитьСтроку(БазаДанных);
	OPI_ПреобразованиеТипов.ПолучитьСтроку(Наименование);
	
	Клиент = КлиентMongoDB(СтрокаПодключения);
	
	Ответ = Клиент.CreateCollection(БазаДанных, Наименование);
    Ответ = OPI_Инструменты.JsonВСтруктуру(Ответ, Ложь);

    Возврат Ответ;
    
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция КлиентMongoDB(Знач СтрокаПодключения)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(СтрокаПодключения);

    Клиент = OPI_Инструменты.ПолучитьКомпоненту("MongoDB");
    
    Клиент.ConnectionString = СтрокаПодключения;

    Возврат Клиент;

КонецФункции

#КонецОбласти
