﻿// OneScript: ./OInt/tools/Modules/OPI_Компоненты.os

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingHardcodePath-off
// BSLLS:Typo-off
// BSLLS:DeprecatedMessage-off
// BSLLS:UsingServiceTag-off
// BSLLS:ExecuteExternalCodeInCommonModule-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:MagicNumber-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

// Раскомментировать, если выполняется OneScript
// #Использовать "./internal"

#Область СлужебныйПрограммныйИнтерфейс

Функция ПолучитьКомпоненту(Знач ИмяКомпоненты, Знач Класс = "Main") Экспорт

    Компонента    = Неопределено;
    Ошибка        = "";
    ИмяКомпоненты = "OPI_" + ИмяКомпоненты;

    Если Не ИнициализироватьВнешнююКомпоненту(ИмяКомпоненты, Класс, Компонента) Тогда

        Ошибка     = Неопределено;
        Компонента = ПодключитьКомпонентуНаСервере(ИмяКомпоненты, Класс, Ошибка);

        Если ЗначениеЗаполнено(Ошибка) Тогда
            СформироватьИсключениеКомпоненты(Ошибка);
        КонецЕсли;

    КонецЕсли;

    Возврат Компонента;

КонецФункции

Функция ЭтоКомпонента(Знач Значение) Экспорт

    ТипЗначения = Строка(ТипЗнч(Значение));
    Возврат СтрНачинаетсяС(ТипЗначения, "AddIn.");

КонецФункции

Функция УстановитьTls(Знач Компонета, Знач Tls) Экспорт

    Результат = Новый Структура("result", Истина);

    Если ЗначениеЗаполнено(Tls) Тогда

        СообщениеОшибки = "Переданы некорректные настройки Tls!";
        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Tls, СообщениеОшибки);

        ИспользоватьTls    = OPI_Инструменты.ПолучитьИли(Tls, "use_tls", Ложь);
        ОтключитьВалидацию = OPI_Инструменты.ПолучитьИли(Tls, "accept_invalid_certs", Ложь);
        ПутьКСертификату   = OPI_Инструменты.ПолучитьИли(Tls, "ca_cert_path", "");

        OPI_ПреобразованиеТипов.ПолучитьБулево(ИспользоватьTls);
        OPI_ПреобразованиеТипов.ПолучитьБулево(ОтключитьВалидацию);
        OPI_ПреобразованиеТипов.ПолучитьСтроку(ПутьКСертификату);

        Результат = Компонета.SetTLS(ИспользоватьTls, ОтключитьВалидацию, ПутьКСертификату);
        Результат = OPI_Инструменты.JsonВСтруктуру(Результат);

    КонецЕсли;

    Возврат Результат;

КонецФункции

Функция ПолучитьНастройкиTls(Знач ОтключитьПроверкуСертификатов, Знач ПутьКСертификату = "") Экспорт

    СтруктураСертификата = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("use_tls"             , Истина                       , "Булево", СтруктураСертификата);
    OPI_Инструменты.ДобавитьПоле("accept_invalid_certs", ОтключитьПроверкуСертификатов, "Булево", СтруктураСертификата);
    OPI_Инструменты.ДобавитьПоле("ca_cert_path"        , ПутьКСертификату             , "Строка", СтруктураСертификата);

    Возврат СтруктураСертификата;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ИнициализироватьВнешнююКомпоненту(Знач ИмяКомпоненты, Знач Класс, Компонента)

    Попытка
        Компонента = Новый("AddIn." + ИмяКомпоненты + "." + Класс);
        Возврат Истина;
    Исключение
        Возврат Ложь;
    КонецПопытки;

КонецФункции

Функция ПодключитьКомпонентуНаСервере(Знач ИмяКомпоненты, Знач Класс, Ошибка)

    Если OPI_Инструменты.ЭтоOneScript() Тогда
        ИмяМакета = КаталогКомпонентOS() + ИмяКомпоненты + ".zip";
    Иначе
        ИмяМакета = "ОбщийМакет." + ИмяКомпоненты;
    КонецЕсли;

    Попытка
        ПодключитьВнешнююКомпоненту(ИмяМакета, ИмяКомпоненты, ТипВнешнейКомпоненты.Native);
        Компонента = Новый("AddIn." + ИмяКомпоненты + "." + Класс);
        Ошибка     = Неопределено;
        Возврат Компонента;
    Исключение
        Ошибка     = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
        Возврат Неопределено;
    КонецПопытки;

КонецФункции

Функция КаталогКомпонентOS() Экспорт

    КаталогПрограммы = СтрЗаменить(КаталогПрограммы(), "\", "/");

    ЭлементыПути = СтрРазделить(КаталогПрограммы, "/");
    ЭлементыПути.Удалить(ЭлементыПути.ВГраница());

    // BSLLS:UsingHardcodePath-off

    КаталогКомпонент = СтрСоединить(ЭлементыПути, "/") + "/lib/oint/addins/";

    // BSLLS:UsingHardcodePath-on

    Возврат КаталогКомпонент;

КонецФункции

Процедура СформироватьИсключениеКомпоненты(Знач Ошибка)

    Текст = "Не удалось инициализировать внешнюю компоненту. Возможно, она несовместима с вашей операционной системой.";

    Если Не OPI_Инструменты.ЭтоWindows() Тогда

        Текст = Текст
            + Символы.ПС
            + Символы.ПС
            + "Важно: Для работы компоненты требуется GLIBC >=2.18"
            + " и OpenSSL версии 3.x"
            + Символы.ПС
            + "Проверьте, что данные зависимости удоволетворены в вашей системе!";

    КонецЕсли;

    Текст = Текст
        + Символы.ПС
        + Символы.ПС
        + "Подробнее: https://openintegrations.dev/docs/Start/Component-requirements"
        + Символы.ПС
        + Символы.ПС
        + "Системная информация:"
        + Ошибка;

    ВызватьИсключение Текст;

КонецПроцедуры

#КонецОбласти
