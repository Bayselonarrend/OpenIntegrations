// OneScript: ./OInt/tools/Modules/OPI_ЗапросыHTTP.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check use-non-recommended-method

// Раскомментировать, если выполняется OneScript
#Использовать "./internal"

#Область ПрограммныйИнтерфейс

// Новый запрос
// Создает новый объект для работы с HTTP
//
// Возвращаемое значение:
//  ОбработкаОбъект.OPI_HTTPКлиент -  Объект обработки
Функция НовыйЗапрос() Экспорт

    Если OPI_Инструменты.ЭтоOneScript() Тогда

        //@skip-check property-not-writable
        //@skip-check bsl-legacy-check-static-feature-access
        Обработки  = Неопределено;

        ИмяТипа    = "OPI_HTTPКлиент";
        HTTPКлиент = Новый(ИмяТипа);

    Иначе
        HTTPКлиент = Обработки.OPI_HTTPКлиент.Создать();
    КонецЕсли;

    Возврат HTTPКлиент;

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапросыБезТела

Функция Get(Знач URL
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач ФайлОтвета   = Неопределено
    , Знач ПолныйОтвет  = Ложь) Экспорт

    Возврат ВыполнитьЗапросБезТела(URL, "GET", Параметры, ДопЗаголовки, ФайлОтвета, ПолныйОтвет);

КонецФункции

Функция Head(Знач URL
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач ФайлОтвета   = Неопределено
    , Знач ПолныйОтвет  = Ложь) Экспорт

    Возврат ВыполнитьЗапросБезТела(URL, "HEAD", Параметры, ДопЗаголовки, ФайлОтвета, ПолныйОтвет);

КонецФункции

Функция Delete(Знач URL
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач ФайлОтвета   = Неопределено
    , Знач ПолныйОтвет  = Ложь) Экспорт

    Возврат ВыполнитьЗапросБезТела(URL, "DELETE", Параметры, ДопЗаголовки, ФайлОтвета, ПолныйОтвет);

КонецФункции

#КонецОбласти

#Область ЗапросыСТелом

Функция PostСТелом(Знач URL
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач JSON         = Истина
    , Знач ПолныйОтвет  = Ложь
    , Знач ФайлОтвета   = Неопределено) Экспорт

    Возврат ВыполнитьЗапросСТелом(URL, "POST", Параметры, ДопЗаголовки, JSON, ПолныйОтвет, ФайлОтвета);

КонецФункции

Функция PatchСТелом(Знач URL
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач JSON         = Истина
    , Знач ПолныйОтвет  = Ложь
    , Знач ФайлОтвета   = Неопределено) Экспорт

    Возврат ВыполнитьЗапросСТелом(URL, "PATCH", Параметры, ДопЗаголовки, JSON, ПолныйОтвет, ФайлОтвета);

КонецФункции

Функция PutСТелом(Знач URL
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач JSON         = Истина
    , Знач ПолныйОтвет  = Ложь
    , Знач ФайлОтвета   = Неопределено) Экспорт

    Возврат ВыполнитьЗапросСТелом(URL, "PUT", Параметры, ДопЗаголовки, JSON, ПолныйОтвет, ФайлОтвета);

КонецФункции

Функция DeleteСТелом(Знач URL
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач JSON         = Истина
    , Знач ПолныйОтвет  = Ложь
    , Знач ФайлОтвета   = Неопределено) Экспорт

    Возврат ВыполнитьЗапросСТелом(URL, "DELETE", Параметры, ДопЗаголовки, JSON, ПолныйОтвет, ФайлОтвета);

КонецФункции

#КонецОбласти

#Область ЗапросыMultipart

Функция PostMultipart(Знач URL
    , Знач Параметры    = ""
    , Знач Файлы        = ""
    , Знач ТипКонтента  = "image/jpeg"
    , Знач ДопЗаголовки = ""
    , Знач ФайлОтвета   = Неопределено) Экспорт

    HttpКлиент = НовыйЗапрос()
        .Инициализировать(URL)
        .УстановитьЗаголовки(ДопЗаголовки)
        .УстановитьФайлОтвета(ФайлОтвета)
        .НачатьЗаписьТелаMultipart();

    Если ЗначениеЗаполнено(Файлы) Тогда

        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Файлы);

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        Для Каждого Файл Из Файлы Цикл

            СтруктураИнформации = РазобратьКлючФайла(Файл.Ключ, ТипКонтента);

            ИмяПоля  = СтруктураИнформации["ИмяПоля"];
            ИмяФайла = СтруктураИнформации["ИмяФайла"];

            HttpКлиент.ДобавитьФайлMultipartFormData(ИмяПоля, ИмяФайла, Файл.Значение, ТипКонтента);

        КонецЦикла;
    КонецЕсли;

    Если ЗначениеЗаполнено(Параметры) Тогда

        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Параметры);

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        Для Каждого Параметр Из Параметры Цикл
            HttpКлиент.ДобавитьПолеMultipartFormData(Параметр.Ключ, Параметр.Значение);
        КонецЦикла;
    КонецЕсли;

    HttpКлиент.ОбработатьЗапрос("POST");

    Результат = HttpКлиент.ВернутьОтветКакJSONКоллекцию(Истина, Истина);

    Если HttpКлиент.Ошибка Тогда
        ВызватьИсключение HttpКлиент.ПолучитьЛог(Истина);
    Иначе
        Возврат Результат;
    КонецЕсли;

КонецФункции

Функция PutMultipart(Знач URL
    , Знач Параметры    = ""
    , Знач Файлы        = ""
    , Знач ТипКонтента  = "image/jpeg"
    , Знач ДопЗаголовки = ""
    , Знач ФайлОтвета   = Неопределено) Экспорт

    Возврат ВыполнитьЗапросМультипарт(URL, "PUT", Параметры, Файлы, ТипКонтента, ДопЗаголовки, ФайлОтвета);

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ВыполнитьЗапросСТелом(Знач URL
    , Знач Вид
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач JSON         = Истина
    , Знач ПолныйОтвет  = Ложь
    , Знач ФайлОтвета   = Неопределено)

    ЧислоПопыток = 5;

    HttpКлиент = НовыйЗапрос()
        .Инициализировать(URL)
        .УстановитьЗаголовки(ДопЗаголовки)
        .УстановитьФайлОтвета(ФайлОтвета)
        .МаксимумПопыток(ЧислоПопыток);

    Если JSON Тогда
        HttpКлиент.УстановитьJsonТело(Параметры);
    Иначе
        HttpКлиент.УстановитьFormТело(Параметры);
    КонецЕсли;

    HttpКлиент.ОбработатьЗапрос(Вид);

    Если ПолныйОтвет Тогда
        Результат = HttpКлиент.ВернутьОтвет(Ложь, Истина);
    Иначе
        Результат = HttpКлиент.ВернутьОтветКакJSONКоллекцию(Истина, Истина);
    КонецЕсли;

    Возврат Результат;

КонецФункции

Функция ВыполнитьЗапросБезТела(Знач URL
    , Знач Вид
    , Знач Параметры    = ""
    , Знач ДопЗаголовки = ""
    , Знач ФайлОтвета   = Неопределено
    , Знач ПолныйОтвет  = Ложь)

    ЧислоПопыток = 5;

    HttpКлиент = НовыйЗапрос()
        .Инициализировать(URL)
        .УстановитьПараметрыURL(Параметры)
        .УстановитьЗаголовки(ДопЗаголовки)
        .УстановитьФайлОтвета(ФайлОтвета)
        .МаксимумПопыток(ЧислоПопыток)
        .ОбработатьЗапрос(Вид);

    Если ПолныйОтвет Тогда
        Результат = HttpКлиент.ВернутьОтвет(Ложь, Истина);
    Иначе
        Результат = HttpКлиент.ВернутьОтветКакJSONКоллекцию(Истина, Истина);
    КонецЕсли;

    Возврат Результат;

КонецФункции

Функция ВыполнитьЗапросМультипарт(Знач URL
    , Знач Вид
    , Знач Параметры    = ""
    , Знач Файлы        = ""
    , Знач ТипКонтента  = "image/jpeg"
    , Знач ДопЗаголовки = ""
    , Знач ФайлОтвета   = Неопределено)

    ЧислоПопыток = 5;

    HttpКлиент = НовыйЗапрос()
        .Инициализировать(URL)
        .УстановитьЗаголовки(ДопЗаголовки)
        .УстановитьФайлОтвета(ФайлОтвета)
        .МаксимумПопыток(ЧислоПопыток)
        .НачатьЗаписьТелаMultipart();

    //@skip-check bsl-legacy-check-for-each-statetement-collection
    Для Каждого Файл Из Файлы Цикл

        СтруктураИнформации = РазобратьКлючФайла(Файл.Ключ, ТипКонтента);

        ИмяПоля  = СтруктураИнформации["ИмяПоля"];
        ИмяФайла = СтруктураИнформации["ИмяФайла"];

        HttpКлиент.ДобавитьФайлMultipartFormData(ИмяПоля, ИмяФайла, Файл.Значение, ТипКонтента);

    КонецЦикла;

    //@skip-check bsl-legacy-check-for-each-statetement-collection
    Для Каждого Параметр Из Параметры Цикл
        HttpКлиент.ДобавитьПолеMultipartFormData(Параметр.Ключ, Параметр.Значение);
    КонецЦикла;

    Результат = HttpКлиент.ОбработатьЗапрос("POST").ВернутьОтветКакJSONКоллекцию(Истина, Истина);

    Возврат Результат;

КонецФункции

Функция РазобратьКлючФайла(Знач ДанныеФайла, Знач ТипКонтента)

    ЗаменаТочки = "___";
    ИмяФайла    = СтрЗаменить(ДанныеФайла, ЗаменаТочки, ".");
    МассивИмени = СтрРазделить(ИмяФайла, "|", Ложь);
    ЧастейИмени = 2;

    Если МассивИмени.Количество() = ЧастейИмени Тогда
        ИмяПоля  = МассивИмени[0];
        ИмяФайла = МассивИмени[1];
    Иначе

        Если ТипКонтента = "image/jpeg" Тогда

            ИмяПоля = "photo";

        Иначе

            ИмяПоля = Лев(ИмяФайла, СтрНайти(ИмяФайла, ".") - 1);
            ИмяПоля = ?(ЗначениеЗаполнено(ИмяПоля), ИмяПоля, СтрЗаменить(ДанныеФайла, ЗаменаТочки, "."));

        КонецЕсли;

    КонецЕсли;

    СтруктураВозврата = Новый Структура("ИмяПоля,ИмяФайла", ИмяПоля, ИмяФайла);

    Возврат СтруктураВозврата;

КонецФункции

#КонецОбласти

#Region Alternate

Function NewRequest() Export
	Return НовыйЗапрос();
EndFunction

Function PostWithBody(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val JSON = True, Val FullResponse = False, Val ResponseFile = Undefined) Export
	Return PostСТелом(URL, Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);
EndFunction

Function PatchWithBody(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val JSON = True, Val FullResponse = False, Val ResponseFile = Undefined) Export
	Return PatchСТелом(URL, Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);
EndFunction

Function PutWithBody(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val JSON = True, Val FullResponse = False, Val ResponseFile = Undefined) Export
	Return PutСТелом(URL, Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);
EndFunction

Function DeleteWithBody(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val JSON = True, Val FullResponse = False, Val ResponseFile = Undefined) Export
	Return DeleteСТелом(URL, Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);
EndFunction

#EndRegion