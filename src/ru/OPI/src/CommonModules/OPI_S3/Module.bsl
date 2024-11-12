﻿// OneScript: ./OInt/core/Modules/OPI_S3.os
// Lib: S3
// CLI: s3

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

Функция ПолучитьСтруктуруАвторизации(Знач URL, Знач AccessKey, Знач SecretKey, Знач Region, Знач Service = "s3") Экспорт
   
    СтруктураАвторизации = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("URL"      , URL      , "Строка", СтруктураАвторизации); 
    OPI_Инструменты.ДобавитьПоле("AccessKey", AccessKey, "Строка", СтруктураАвторизации);
    OPI_Инструменты.ДобавитьПоле("SecretKey", SecretKey, "Строка", СтруктураАвторизации);
    OPI_Инструменты.ДобавитьПоле("Region"   , Region   , "Строка", СтруктураАвторизации);
    OPI_Инструменты.ДобавитьПоле("Service"  , Service  , "Строка", СтруктураАвторизации);
    
    Возврат СтруктураАвторизации;

КонецФункции

Функция ОтправитьЗапросБезТела(Знач URL, Знач Авторизация, Знач Метод) Экспорт
	
	СтруктураURL = OPI_Инструменты.РазбитьURL(URL);
    Сервер       = СтруктураURL["Сервер"];
    Адрес        = СтруктураURL["Адрес"];

    Запрос     = OPI_Инструменты.СоздатьЗапрос(Адрес);
    Соединение = OPI_Инструменты.СоздатьСоединение(Сервер);
    
    ЗаголовокАвторизации = СоздатьЗаголовокАвторизации(Авторизация, Запрос, Соединение, Метод);
    Запрос.Заголовки.Вставить("Authorization", ЗаголовокАвторизации);
    
    Ответ = OPI_Инструменты.ВыполнитьЗапрос(Запрос, Соединение, Метод);
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти

#Область РаботаСБакетами

Функция СоздатьБакет(Знач Имя, Знач Авторизация) Экспорт

	OPI_ПреобразованиеТипов.ПолучитьСтроку(Имя);
	
	URL   = ПолучитьURLСервиса(Авторизация);
	URL   = URL + Имя;
	
	Ответ = ОтправитьЗапросБезТела(URL, Авторизация, "PUT");
	
	Возврат Ответ;
	 
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СоздатьЗаголовокАвторизации(Знач СтруктураДанных, Знач Запрос, Знач Соединение, Знач Метод)
	
	OPI_ПреобразованиеТипов.ПолучитьКоллекцию(СтруктураДанных);
	
	Если ТипЗнч(СтруктураДанных) = Тип("Массив") Тогда
		ВызватьИсключение "Ошибка получения авторизационных данных из структуры";
	КонецЕсли;
	
	МассивНеобходимыхПолей   = Новый Массив;
	МассивНеобходимыхПолей.Добавить("AccessKey");
	МассивНеобходимыхПолей.Добавить("SecretKey");
	МассивНеобходимыхПолей.Добавить("Region");
	МассивНеобходимыхПолей.Добавить("Service");
	
	ОтсутствующиеПоля = OPI_Инструменты.НайтиОтсутствующиеПоляКоллекции(СтруктураДанных, МассивНеобходимыхПолей);
	
	Если ОтсутствующиеПоля.Количество() > 0 Тогда
		ВызватьИсключение "Отсутствуют необходимые данные авторизации: " + СтрСоединить(ОтсутствующиеПоля, ", ");
	КонецЕсли;
		
	AccessKey = СтруктураДанных["AccessKey"];
	SecretKey = СтруктураДанных["SecretKey"];
	Region    = СтруктураДанных["Region"];
	Service   = СтруктураДанных["Service"];
	
	ТекущаяДата = OPI_Инструменты.ПолучитьТекущуюДату();
	
	КлючПодписи        = ПолучитьКлючПодписи(SecretKey, Region, Service, ТекущаяДата);
	КаноническийЗапрос = СоздатьКаноническийЗапрос(Запрос, Соединение, Метод);
	Скоуп              = СоздатьСкоуп(Region, Service, ТекущаяДата);
	СтрокаДляПодписи   = СоздатьСтрокуПодписи(КаноническийЗапрос, Скоуп, ТекущаяДата);
	
	Сигнатура = OPI_Криптография.HMACSHA256(КлючПодписи, СтрокаДляПодписи);
	Сигнатура = ПолучитьHexСтрокуИзДвоичныхДанных(Сигнатура);
	
	КлючиЗаголовков = ПолучитьСтрокуКлючейЗаголовков(Запрос);
	
	ЗаголовокАвторизации = СформироватьЗаголовокАвторизации(AccessKey, Скоуп, Сигнатура, КлючиЗаголовков);
	
	Возврат ЗаголовокАвторизации;
	
КонецФункции

Функция ПолучитьКлючПодписи(Знач СекретныйКлюч, Знач Регион, Знач Сервис, Знач ТекущаяДата)

	СекретныйКлюч = ПолучитьДвоичныеДанныеИзСтроки("AWS4" + СекретныйКлюч);
	ДанныеДата    = ПолучитьДвоичныеДанныеИзСтроки(Формат(ТекущаяДата, "ДФ=yyyyMMdd;"));
	
    КлючДанных  = OPI_Криптография.HMACSHA256(СекретныйКлюч, ДанныеДата);
    КлючРегиона = OPI_Криптография.HMACSHA256(КлючДанных, Регион);
    КлючСервиса = OPI_Криптография.HMACSHA256(КлючРегиона, Сервис);

    ФинальныйКлюч = OPI_Криптография.HMACSHA256(КлючСервиса, "aws4_request");

    Возврат ФинальныйКлюч;

КонецФункции

Функция СоздатьКаноническийЗапрос(Знач Запрос, Знач Соединение, Знач Метод)
	
	ТелоЗапроса   = Запрос.ПолучитьТелоКакДвоичныеДанные();
	ШаблонЗапроса = "";
	
	Для Н = 1 По 6 Цикл
		ШаблонЗапроса = "%" + Строка(Н) + ?(Н = 6, "", Символы.ПС);
	КонецЦикла;
	
	Метод            = вРег(Метод);		
	СтрокаURI        = ПолучитьСтрокуURI(Запрос);
	СтрокаПараметров = ПолучитьСтрокуПараметров(СтрокаURI);
	СтрокаЗаголовков = ПолучитьСтрокуЗаголовков(Запрос);
	СтрокаКлючей     = ПолучитьСтрокуКлючейЗаголовков(Запрос);
	
	ХэшСумма   = OPI_Криптография.Хеш(ТелоЗапроса, ХешФункция.SHA256);
	СтрокаХэша = ПолучитьHexСтрокуИзДвоичныхДанных(ХэшСумма);

	КаноническийЗапрос = СтрШаблон(ШаблонЗапроса
		, Метод
		, СтрокаURI
		, СтрокаПараметров
		, СтрокаЗаголовков
		, СтрокаКлючей
		, СтрокаХэша);
		
	Возврат КаноническийЗапрос;
	
КонецФункции

Функция СоздатьСкоуп(Знач Регион, Знач Сервис, Знач ТекущаяДата)

	ДатаОбычная = Формат(ТекущаяДата, "ДФ=yyyyMMdd;");
	
	Скоуп = Новый Массив;
	Скоуп.Добавить(ДатаОбычная);
	Скоуп.Добавить(Регион);
	Скоуп.Добавить(Сервис);
	Скоуп.Добавить("aws4_request");
	
	СкоупСтрокой = СтрСоединить(Скоуп, "/");
	
	Возврат СкоупСтрокой;
		
КонецФункции

Функция СоздатьСтрокуПодписи(Знач КаноническийЗапрос, Знач Скоуп, Знач ТекущаяДата)
	
	ШаблонСтроки  = "";
	Алгоритм      = "AWS4-HMAC-SHA256";
	ДатаISO       = Лев(XMLСтрока(ТекущаяДата), 19) + "Z";
	
	Для Н = 1 По 4 Цикл
		ШаблонСтроки = "%" + Строка(Н) + ?(Н = 4, "", Символы.ПС);
	КонецЦикла;
	
	СтрокаПодписи = СтрШаблон(ШаблонСтроки, Алгоритм, ДатаISO, Скоуп, КаноническийЗапрос);
	
	Возврат СтрокаПодписи;
	
КонецФункции

Функция ПолучитьСтрокуURI(Знач Запрос)

	URI   = Запрос.АдресРесурса;
	URI   = ?(СтрНачинаетсяС(URI, "/"), URI, "/" + URI);
		
	НачалоПараметров = СтрНайти(URI, "?");
	
	URI = Лев(URI, НачалоПараметров - 1);
	
	Возврат URI;
	
КонецФункции

Функция ПолучитьСтрокуПараметров(Знач URI)
	
	НачалоПараметров = СтрНайти(URI, "?");
	
	Если НачалоПараметров = 0 Тогда
		СтрокаПараметров = Символы.ПС;
	Иначе
		ДлинаURI         = СтрДлина(URI);
		СтрокаПараметров = Прав(URI, ДлинаURI - НачалоПараметров);
	КонецЕсли;
	
	МассивПараметров = СтрРазделить(СтрокаПараметров, "&");
	СписокПараметров = Новый СписокЗначений();
	СписокПараметров.ЗагрузитьЗначения(МассивПараметров);
	
	СписокПараметров.СортироватьПоЗначению();
	
	СтрокаПараметров = СтрСоединить(СписокПараметров.ВыгрузитьЗначения(), "&");
	
	Возврат СтрокаПараметров;
	
КонецФункции

Функция ПолучитьСтрокуЗаголовков(Знач Запрос)
	
	СписокЗаголовков = Новый СписокЗначений;	
	Заголовки        = Запрос.Заголовки;
	
	Для Каждого Заголовок Из Заголовки Цикл
		
		СтрокаЗаголовка = нРег(Заголовок.Ключ + ":" + Заголовок.Значение);
		СписокЗаголовков.Добавить(СтрокаЗаголовка);
		
	КонецЦикла;
	
	СписокЗаголовков.СортироватьПоЗначению();
	
	СтрокаЗаголовков = СтрСоединить(СписокЗаголовков.ВыгрузитьЗначения(), Символы.ПС);
	
	Возврат СтрокаЗаголовков;
		
КонецФункции

Функция ПолучитьСтрокуКлючейЗаголовков(Знач Запрос)
	
	СписокЗаголовков = Новый СписокЗначений;	
	Заголовки        = Запрос.Заголовки;
	
	Для Каждого Заголовок Из Заголовки Цикл
		
		СтрокаЗаголовка = нРег(Заголовок.Ключ);
		СписокЗаголовков.Добавить(СтрокаЗаголовка);
		
	КонецЦикла;
	
	СписокЗаголовков.СортироватьПоЗначению();
	
	СтрокаЗаголовков = СтрСоединить(СписокЗаголовков.ВыгрузитьЗначения(), ";");
	
	Возврат СтрокаЗаголовков;
		
КонецФункции

Функция ПолучитьURLСервиса(Знач Авторизация)

	URL = Авторизация["URL"];
	
	Если Не СтрЗаканчиваетсяНа(URL, "/") Тогда
		URL = URL + "/";
	КонецЕсли;
		
	Возврат URL;
	
КонецФункции

Функция СформироватьЗаголовокАвторизации(Знач AccessKey, Знач Скоуп, Знач Сигнатура, Знач КлючиЗаголовков)
	
	ШаблонЗаголовка = "Authorization: AWS4-HMAC-SHA256 "
		+ "Credential=%1/%2, "
		+ "SignedHeaders=%3, "
		+ "Signature=%4";
		
	ЗаголовокАвторизации = СтрШаблон(ШаблонЗаголовка, AccessKey, Скоуп, КлючиЗаголовков, Сигнатура);
	
	Возврат ЗаголовокАвторизации;
		
КонецФункции

#КонецОбласти
