// OneScript: ./OInt/tools/main/Modules/internal/Modules/OPI_Криптография.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// #Использовать "./internal"

#Область СлужебныйПрограммныйИнтерфейс

Функция СоздатьПодпись(Знач КлючПодписи, Знач ДанныеПодписи, Знач Алгоритм, Знач ФункцияХеша) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(КлючПодписи);
    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(ДанныеПодписи);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Алгоритм);

    Алгоритм    = вРег(Алгоритм);
    ФункцияХеша = вРег(ФункцияХеша);

    Если Алгоритм = "HMAC" Тогда
        Результат = HMAC(КлючПодписи, ДанныеПодписи, ФункцияХеша);
    ИначеЕсли Алгоритм = "RSA" Тогда
        Результат = RSA(КлючПодписи, ДанныеПодписи, ФункцияХеша);
    Иначе
        ВызватьИсключение "Ошибка работы с криптографией: неподдерживаемый метод";
    КонецЕсли;

    Возврат Результат;

КонецФункции

Функция RSA(Знач Ключ, Знач Данные, Знач ФункцияХеша) Экспорт

    Компонента = OPI_Компоненты.ПолучитьКомпоненту("Cryptography");

    Если ФункцияХеша = "SHA256" Тогда
        Результат = Компонента.RsaSha256(Ключ, Данные);
    ИначеЕсли ФункцияХеша = "SHA1" Тогда
        Результат = Компонента.RsaSha1(Ключ, Данные);
    Иначе
        Результат = "неподдерживаемый метод хеширования";
    КонецЕсли;

    Если ТипЗнч(Результат) = Тип("Строка") Тогда
        ВызватьИсключение СтрШаблон("Ошибка работы с криптографией: %1", Результат);
    Иначе
        Возврат Результат;
    КонецЕсли;

КонецФункции

Функция JWT(Знач Payload, Знач КлючПодписи, Знач Метод, Знач ДопЗаголовки = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Метод);
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Payload);
    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(КлючПодписи, Истина, Ложь);

    Метод = вРег(Метод);

    Если Метод = "HS256" Тогда

        Алгоритм    = "HMAC";
        ФункцияХеша = "SHA256";

    ИначеЕсли Метод = "RS256" Тогда

        Алгоритм    = "RSA";
        ФункцияХеша = "SHA256";

    Иначе
        ВызватьИсключение "JWT: Неподдерживаемый метод";
    КонецЕсли;

    Заголовки = Новый Структура("alg,typ", Метод, "JWT");

    Если ЗначениеЗаполнено(ДопЗаголовки) Тогда

        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(ДопЗаголовки);

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        Для Каждого КлючЗначение Из ДопЗаголовки Цикл
            Заголовки.Вставить(КлючЗначение.Ключ, КлючЗначение.Значение);
        КонецЦикла;

    КонецЕсли;

    PayloadСтрокой   = OPI_Инструменты.JSONСтрокой(Payload, , Ложь);
    ЗаголовкиСтрокой = OPI_Инструменты.JSONСтрокой(Заголовки, , Ложь);

    PayloadДвоичные   = ПолучитьДвоичныеДанныеИзСтроки(PayloadСтрокой);
    ЗаголовкиДвоичные = ПолучитьДвоичныеДанныеИзСтроки(ЗаголовкиСтрокой);

    PayloadBase64   = Base64UrlEncode(PayloadДвоичные);
    ЗаголовкиBase64 = Base64UrlEncode(ЗаголовкиДвоичные);

    Токен         = СтрШаблон("%1.%2", ЗаголовкиBase64, PayloadBase64);
    ТокенДвоичные = ПолучитьДвоичныеДанныеИзСтроки(Токен);

    Подпись       = СоздатьПодпись(КлючПодписи, ТокенДвоичные, Алгоритм, ФункцияХеша);
    ПодписьBase64 = Base64UrlEncode(Подпись);

    Токен = СтрШаблон("%1.%2", Токен, ПодписьBase64);

    Возврат Токен;

КонецФункции

#Область Заимствованные

///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

Функция HMAC(Знач Ключ, Знач Данные, Знач ФункцияХеша) Экспорт

    Дважды      = 2;
    РазмерБлока = 64;
    ТипХеша     = ХешФункция[ФункцияХеша];

    Если Ключ.Размер() > РазмерБлока Тогда
        Ключ = Хеш(Ключ, ТипХеша);
    КонецЕсли;

    Если Ключ.Размер() <= РазмерБлока Тогда
        Ключ = ПолучитьHexСтрокуИзДвоичныхДанных(Ключ);
        Ключ = Лев(Ключ + ПовторитьСтроку("00", РазмерБлока), РазмерБлока * Дважды);
    КонецЕсли;

    Ключ = ПолучитьБуферДвоичныхДанныхИзДвоичныхДанных(ПолучитьДвоичныеДанныеИзHexСтроки(Ключ));

    Ipad = ПолучитьБуферДвоичныхДанныхИзHexСтроки(ПовторитьСтроку("36", РазмерБлока));
    Opad = ПолучитьБуферДвоичныхДанныхИзHexСтроки(ПовторитьСтроку("5c", РазмерБлока));

    Ipad.ЗаписатьПобитовоеИсключительноеИли(0, Ключ);
    Ikeypad = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(ipad);

    Opad.ЗаписатьПобитовоеИсключительноеИли(0, Ключ);
    Okeypad = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(opad);

    Возврат Хеш(СклеитьДвоичныеДанные(okeypad, Хеш(СклеитьДвоичныеДанные(ikeypad, Данные), ТипХеша)), ТипХеша);

КонецФункции

Функция Хеш(ДвоичныеДанные, Тип) Экспорт

    Хеширование = Новый ХешированиеДанных(Тип);
    Хеширование.Добавить(ДвоичныеДанные);

    Возврат Хеширование.ХешСумма;

КонецФункции

Функция СклеитьДвоичныеДанные(ДвоичныеДанные1, ДвоичныеДанные2) Экспорт

    МассивДвоичныхДанных = Новый Массив;
    МассивДвоичныхДанных.Добавить(ДвоичныеДанные1);
    МассивДвоичныхДанных.Добавить(ДвоичныеДанные2);

    Возврат СоединитьДвоичныеДанные(МассивДвоичныхДанных);

КонецФункции

Функция ПовторитьСтроку(Строка, Количество) Экспорт

    Части = Новый Массив(Количество);

    Для К = 1 По Количество Цикл
        Части.Добавить(Строка);
    КонецЦикла;

    Возврат СтрСоединить(Части, "");

КонецФункции

// The MIT License (MIT)
//
// Copyright (c) 2017 Vasily Pintov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/pintov/1c-jwt

Функция Base64UrlEncode(Знач Значение) Экспорт

    Вывод = Base64Строка(Значение);
    Вывод = СтрРазделить(Вывод, "=")[0];
    Вывод = СтрЗаменить(Вывод, Символы.ВК + Символы.ПС, "");

    Вывод = СтрЗаменить(Вывод, "+", "-");
    Вывод = СтрЗаменить(Вывод, "/", "_");
    Возврат Вывод;

КонецФункции

#КонецОбласти

#КонецОбласти
