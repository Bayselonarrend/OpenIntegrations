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

// Получить структуру данных
// Возвращает основные данные запроса в структурированном виде
// 
// Параметры:
//  URL       - Строка - URL: домен для обычных методов или полный URL с параметрами для методов прямой отправки запросов - url  
//  AccessKey - Строка - Access key для авторизации       - access
//  SecretKey - Строка - Secret key для авторизации       - secret
//  Region    - Строка - Регион сервиса                   - region
//  Service   - Строка - Вид сервиса, если отличен от s3  - service
// 
// Возвращаемое значение:
//  Структура Из КлючИЗначение -  Структура основных данных запроса
Функция ПолучитьСтруктуруДанных(Знач URL, Знач AccessKey, Знач SecretKey, Знач Region, Знач Service = "s3") Экспорт

    СтруктураАвторизации = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("URL"      , URL      , "Строка", СтруктураАвторизации);
    OPI_Инструменты.ДобавитьПоле("AccessKey", AccessKey, "Строка", СтруктураАвторизации);
    OPI_Инструменты.ДобавитьПоле("SecretKey", SecretKey, "Строка", СтруктураАвторизации);
    OPI_Инструменты.ДобавитьПоле("Region"   , Region   , "Строка", СтруктураАвторизации);
    OPI_Инструменты.ДобавитьПоле("Service"  , Service  , "Строка", СтруктураАвторизации);

    Возврат СтруктураАвторизации;

КонецФункции

// Отправить запрос без тела
// Отправляет простой http запрос без тела
// 
// Параметры:
//  Метод          - Строка - HTTP метод                                                          - method
//  ОсновныеДанные - Строка - Основные данные запроса (c полным URL). См. ПолучитьСтруктуруДанных - data
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от хранилища
Функция ОтправитьЗапросБезТела(Знач Метод, Знач ОсновныеДанные) Экспорт

	ПроверитьОсновныеДанные(ОсновныеДанные);
	
	URL = ОсновныеДанные["URL"];
	
    СтруктураURL = OPI_Инструменты.РазбитьURL(URL);
    Сервер       = СтруктураURL["Сервер"];
    Адрес        = СтруктураURL["Адрес"];

    Запрос     = OPI_Инструменты.СоздатьЗапрос(Адрес);
    Соединение = OPI_Инструменты.СоздатьСоединение(Сервер);

    ЗаголовокАвторизации = СоздатьЗаголовокАвторизации(ОсновныеДанные, Запрос, Соединение, Метод);
    Запрос.Заголовки.Вставить("Authorization", ЗаголовокАвторизации);

    Ответ  = OPI_Инструменты.ВыполнитьЗапрос(Запрос, Соединение, Метод, , Истина);
    Ответ  = ОформитьОтвет(Ответ);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСБакетами

// Создать бакет
// Создает новый бакет с выбранным именем
// 
// Параметры:
//  Наименование   - Строка - Наименование бакета                                  - name
//  ОсновныеДанные - Строка - Основные данные запроса. См. ПолучитьСтруктуруДанных - data
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от хранилища
Функция СоздатьБакет(Знач Наименование, Знач ОсновныеДанные) Экспорт

    Ответ = УправлениеБакетом(Наименование, ОсновныеДанные, "PUT");
    Возврат Ответ;

КонецФункции

// Удалить бакет
// Удаляет бакет с выбранным именем
// 
// Параметры:
//  Наименование   - Строка - Наименование бакета                                  - name
//  ОсновныеДанные - Строка - Основные данные запроса. См. ПолучитьСтруктуруДанных - data
// 
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от хранилища
Функция УдалитьБакет(Знач Наименование, Знач ОсновныеДанные) Экспорт

    Ответ = УправлениеБакетом(Наименование, ОсновныеДанные, "DELETE");
    Возврат Ответ;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область Авторизация

Функция СоздатьЗаголовокАвторизации(Знач СтруктураДанных, Знач Запрос, Знач Соединение, Знач Метод)

    AccessKey = СтруктураДанных["AccessKey"];
    SecretKey = СтруктураДанных["SecretKey"];
    Region    = СтруктураДанных["Region"];
    Service   = СтруктураДанных["Service"];

    ТекущаяДата = ТекущаяУниверсальнаяДата();

    Запрос.Заголовки.Вставить("x-amz-date", OPI_Инструменты.ВременнаяМеткаISO(ТекущаяДата));
    Запрос.Заголовки.Вставить("Host"      , Соединение.Сервер);

    КлючПодписи        = ПолучитьКлючПодписи(SecretKey, Region, Service, ТекущаяДата);
    КаноническийЗапрос = СоздатьКаноническийЗапрос(Запрос, Соединение, Метод);
    Скоуп              = СоздатьСкоуп(Region, Service, ТекущаяДата);
    СтрокаДляПодписи   = СоздатьСтрокуПодписи(КаноническийЗапрос, Скоуп, ТекущаяДата);

    Сигнатура = OPI_Криптография.HMACSHA256(КлючПодписи, СтрокаДляПодписи);
    Сигнатура = нРег(ПолучитьHexСтрокуИзДвоичныхДанных(Сигнатура));

    КлючиЗаголовков = ПолучитьСтрокуКлючейЗаголовков(Запрос);

    ЗаголовокАвторизации = СформироватьЗаголовокАвторизации(AccessKey, Скоуп, Сигнатура, КлючиЗаголовков);

    Возврат ЗаголовокАвторизации;

КонецФункции

Функция ПолучитьКлючПодписи(Знач СекретныйКлюч, Знач Регион, Знач Сервис, Знач ТекущаяДата)

    СекретныйКлюч    = ПолучитьДвоичныеДанныеИзСтроки("AWS4" + СекретныйКлюч);
    ДанныеДата    = ПолучитьДвоичныеДанныеИзСтроки(Формат(ТекущаяДата, "ДФ=yyyyMMdd;"));
    Регион        = ПолучитьДвоичныеДанныеИзСтроки(Регион);
    Сервис        = ПолучитьДвоичныеДанныеИзСтроки(Сервис);
    AWSЗапрос     = ПолучитьДвоичныеДанныеИзСтроки("aws4_request");

    КлючДанных  = OPI_Криптография.HMACSHA256(СекретныйКлюч, ДанныеДата);
    КлючРегиона = OPI_Криптография.HMACSHA256(КлючДанных, Регион);
    КлючСервиса = OPI_Криптография.HMACSHA256(КлючРегиона, Сервис);

    ФинальныйКлюч = OPI_Криптография.HMACSHA256(КлючСервиса, AWSЗапрос);

    Возврат ФинальныйКлюч;

КонецФункции

Функция СоздатьКаноническийЗапрос(Знач Запрос, Знач Соединение, Знач Метод)

    ТелоЗапроса  = Запрос.ПолучитьТелоКакДвоичныеДанные();

    Если Не ЗначениеЗаполнено(ТелоЗапроса) Тогда
        ТелоЗапроса = ПолучитьДвоичныеДанныеИзСтроки("");
    КонецЕсли;

    ХешСумма = OPI_Криптография.Хеш(ТелоЗапроса, ХешФункция.SHA256);
    Запрос.Заголовки.Вставить("x-amz-content-sha256", нРег(ПолучитьHexСтрокуИзДвоичныхДанных(ХешСумма)));

    ШаблонЗапроса = "";

    Для Н          = 1 По 6 Цикл
        ШаблонЗапроса = ШаблонЗапроса + "%" + Строка(Н) + ?(Н = 6, "", Символы.ПС);
    КонецЦикла;

    Метод            = вРег(Метод);
    СтрокаURI        = ПолучитьСтрокуURI(Запрос);
    СтрокаПараметров = ПолучитьСтрокуПараметров(СтрокаURI);
    СтрокаЗаголовков = ПолучитьСтрокуЗаголовков(Запрос);
    СтрокаКлючей     = ПолучитьСтрокуКлючейЗаголовков(Запрос);

    СтрокаХэша = нРег(ПолучитьHexСтрокуИзДвоичныхДанных(ХешСумма));

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

    ШаблонСтроки       = "";
    Алгоритм           = "AWS4-HMAC-SHA256";
    ДатаISO            = OPI_Инструменты.ВременнаяМеткаISO(ТекущаяДата);

    КаноническийЗапрос = ПолучитьДвоичныеДанныеИзСтроки(КаноническийЗапрос);
    КаноническийЗапрос = OPI_Криптография.Хеш(КаноническийЗапрос, ХешФункция.SHA256);
    КаноническийЗапрос = нРег(ПолучитьHexСтрокуИзДвоичныхДанных(КаноническийЗапрос));

    Для Н         = 1 По 4 Цикл
        ШаблонСтроки = ШаблонСтроки + "%" + Строка(Н) + ?(Н = 4, "", Символы.ПС);
    КонецЦикла;

    СтрокаПодписи    = СтрШаблон(ШаблонСтроки, Алгоритм, ДатаISO, Скоуп, КаноническийЗапрос);
    СтрокаПодписи = ПолучитьДвоичныеДанныеИзСтроки(СтрокаПодписи);

    Возврат СтрокаПодписи;

КонецФункции

Функция ПолучитьСтрокуURI(Знач Запрос)

    URI   = Запрос.АдресРесурса;
    URI   = ?(СтрНачинаетсяС(URI, "/"), URI, "/" + URI);

    НачалоПараметров = СтрНайти(URI, "?");

    Если НачалоПараметров <> 0 Тогда
        URI = Лев(URI, НачалоПараметров - 1);
    КонецЕсли;

    Возврат URI;

КонецФункции

Функция ПолучитьСтрокуПараметров(Знач URI)

    НачалоПараметров = СтрНайти(URI, "?");

    Если НачалоПараметров = 0 Тогда
        СтрокаПараметров     = "";
    Иначе
        ДлинаURI             = СтрДлина(URI);
        СтрокаПараметров     = Прав(URI, ДлинаURI - НачалоПараметров);
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

        ТекущийКлюч  = Заголовок.Ключ;
        ТекущийКлючН = нРег(ТекущийКлюч);

        Если Не СтрНачинаетсяС(ТекущийКлючН, "host") И Не СтрНачинаетсяС(ТекущийКлючН, "x-amz") Тогда
            Продолжить;
        КонецЕсли;

        СтрокаЗаголовка = нРег(ТекущийКлюч) + ":" + Заголовок.Значение;
        СписокЗаголовков.Добавить(СтрокаЗаголовка);

    КонецЦикла;

    СписокЗаголовков.СортироватьПоЗначению();

    СтрокаЗаголовков = СтрСоединить(СписокЗаголовков.ВыгрузитьЗначения(), Символы.ПС);

    Возврат СтрокаЗаголовков + Символы.ПС;

КонецФункции

Функция ПолучитьСтрокуКлючейЗаголовков(Знач Запрос)

    СписокЗаголовков = Новый СписокЗначений;
    Заголовки        = Запрос.Заголовки;

    Для Каждого Заголовок Из Заголовки Цикл

        ТекущийКлюч  = Заголовок.Ключ;
        ТекущийКлючН = нРег(ТекущийКлюч);

        Если Не СтрНачинаетсяС(ТекущийКлючН, "host") И Не СтрНачинаетсяС(ТекущийКлючН, "x-amz") Тогда
            Продолжить;
        КонецЕсли;

        СтрокаЗаголовка = нРег(ТекущийКлюч);
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

    ШаблонЗаголовка = "AWS4-HMAC-SHA256 "
        + "Credential=%1/%2, "
        + "SignedHeaders=%3, "
        + "Signature=%4";

    ЗаголовокАвторизации = СтрШаблон(ШаблонЗаголовка, AccessKey, Скоуп, КлючиЗаголовков, Сигнатура);

    Возврат ЗаголовокАвторизации;

КонецФункции

#КонецОбласти

#Область Прочее

Функция УправлениеБакетом(Знач Имя, Знач Авторизация, Знач Метод)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Имя);

    URL   = ПолучитьURLСервиса(Авторизация);
    URL   = URL + Имя;

    Ответ = ОтправитьЗапросБезТела(Метод, Авторизация);

    Возврат Ответ;

КонецФункции

Функция ОформитьОтвет(Знач Ответ)

    ШаблонОтвета = Новый Структура();

    Статус = Ответ.КодСостояния;
    OPI_Инструменты.ОбработатьОтвет(Ответ);

    Если ТипЗнч(Ответ) = Тип("ДвоичныеДанные") Тогда
        Ответ          = ПолучитьСтрокуИзДвоичныхДанных(Ответ);
    КонецЕсли;

    Если ПоддерживаемыйОтвет(Ответ) Тогда
        ШаблонОтвета.Вставить("message", Ответ);
    Иначе
        ШаблонОтвета.Вставить("message", "Неподдерживаемое сообщение");
    КонецЕсли;

    ШаблонОтвета.Вставить("status", Статус);

    Возврат ШаблонОтвета;

КонецФункции

Функция ПоддерживаемыйОтвет(Знач Ответ)

    Возврат ТипЗнч(Ответ) = Тип("Строка")
        Или ТипЗнч(Ответ) = Тип("Структура")
        Или ТипЗнч(Ответ) = Тип("Соответствие")
        Или ТипЗнч(Ответ) = Тип("Массив");

КонецФункции

Процедура ПроверитьОсновныеДанные(ОсновныеДанные)

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(ОсновныеДанные);

    Если ТипЗнч(ОсновныеДанные) = Тип("Массив") Тогда
        ВызватьИсключение "Ошибка получения авторизационных данных из структуры";
    КонецЕсли;

    МассивНеобходимыхПолей = Новый Массив;
    МассивНеобходимыхПолей.Добавить("AccessKey");
    МассивНеобходимыхПолей.Добавить("SecretKey");
    МассивНеобходимыхПолей.Добавить("Region");
    МассивНеобходимыхПолей.Добавить("Service");
    МассивНеобходимыхПолей.Добавить("URL");

    ОтсутствующиеПоля = OPI_Инструменты.НайтиОтсутствующиеПоляКоллекции(ОсновныеДанные, МассивНеобходимыхПолей);

    Если ОтсутствующиеПоля.Количество() > 0 Тогда
        ВызватьИсключение "Отсутствуют необходимые данные авторизации: " + СтрСоединить(ОтсутствующиеПоля, ", ");
    КонецЕсли;
    	
КонецПроцедуры

#КонецОбласти

#КонецОбласти
