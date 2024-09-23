// OneScript: ./OInt/core/Modules/OPI_Neocities.os
// Lib: Neocities
// CLI: neocities

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

#Область РаботаСФайлами

// Загрузить файл
// Загружает одиночный файл на сервер Neocities
// 
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
// 
// Параметры:
//  Токен  - Строка                 -  Токен авторизации                       - token
//  Путь   - Строка                 -  Целевой путь файла на Neocities         - path
//  Данные - Строка, ДвоичныеДанные -  URL, путь или данные файла для загрузки - file
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция ЗагрузитьФайл(Знач Токен, Знач Путь, Знач Данные) Экспорт
	
	OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
	OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Данные);
	
	URL        = "https://neocities.org/api/upload";
	Заголовки  = СоздатьЗаголовкиЗапроса(Токен);

	СоответствиеФайла = Новый Соответствие;
	СоответствиеФайла.Вставить(Путь + "|" + Путь, Данные);
	
	Ответ = OPI_Инструменты.PostMultipart(URL, , СоответствиеФайла, "multipart/form-data", Заголовки);
	
	Возврат Ответ;
	
КонецФункции

// Загрузить файлы
// Загружает несколько файлов на сервер Neocities
// 
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
// 
// Параметры:
//  Токен              - Строка                        - Токен авторизации                                      - token
//  СоответствиеФайлов - Соответствие Из КлючИЗначение - Файлы для загрузки: Ключ > путь на NC, Значение - Файл - files 
//  ПоОдному           - Булево                        - Истина > отправляет файлы отдельными запросами         - singly
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция ЗагрузитьФайлы(Знач Токен, Знач СоответствиеФайлов, Знач ПоОдному = Ложь) Экспорт

	КонечныйОтвет            = Новый Массив;
	ОбработанноеСоответствие = Новый Соответствие;
	
	Для Каждого ФайлОтправки Из СоответствиеФайлов Цикл

		Если ПоОдному Тогда
		
			Ответ = ЗагрузитьФайл(Токен, ФайлОтправки.Ключ, ФайлОтправки.Значение);
			КонечныйОтвет.Добавить(Ответ);
			
		Иначе
			
			ТекущийПуть   = ФайлОтправки.Ключ;
			ТекущиеДанные = ФайлОтправки.Значение;
			
			OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущийПуть);
			OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(ТекущиеДанные);
			
			ОбработанноеСоответствие.Вставить(ТекущийПуть + "|" + ТекущийПуть, ТекущиеДанные);
			
		КонецЕсли;
			
	КонецЦикла;
	 
	Если Не ПоОдному Тогда
		
		URL        = "https://neocities.org/api/upload";
		Заголовки  = СоздатьЗаголовкиЗапроса(Токен);
	
		КонечныйОтвет = OPI_Инструменты.PostMultipart(URL
			, 
			, ОбработанноеСоответствие
			, "multipart/form-data"
			, Заголовки);
			
	КонецЕсли;
	
	Возврат КонечныйОтвет;
		
КонецФункции

// Удалить выбранные файлы
// Удаляет файл или несколько файлов с сервера Neocities
// 
// Примечание:
// Документация Neocities API: [neocities.org/api](@neocities.org/api)
// 
// Параметры:
//  Токен - Строка                   - Токен авторизации                         - token
//  Пути  - Строка, Массив Из Строка - Путь или несколько путей удаляемых файлов - paths
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities
Функция УдалитьВыбранныеФайлы(Знач Токен, Знач Пути) Экспорт
	
	URL        = "https://neocities.org/api/delete";
	Заголовки  = СоздатьЗаголовкиЗапроса(Токен);
	Параметры  = Новый Структура;
	
	OPI_Инструменты.ДобавитьПоле("filenames", Пути, "Массив", Параметры);
	
	Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки, Ложь);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СоздатьЗаголовкиЗапроса(Знач Токен)

	OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
	
	Заголовки = Новый Соответствие;
	Заголовки.Вставить("Authorization", "Bearer " + Токен);
	Возврат Заголовки;
		
КонецФункции

#КонецОбласти