// OneScript: ./OInt/tools/main/Modules/OPI_УниверсальныйАрхиватор.os

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:QueryParseError-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:NumberOfParams-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

// #Использовать "./internal"

#Если Не ВебКлиент Тогда // !OPI

#Область СлужебныйПрограммныйИнтерфейс

#Область Архивация

Функция Архивировать(Знач Архиватор, Знач Данные, Знач ПутьАрхива = "", Знач Настройки = Неопределено) Экспорт

    ДанныеЭтоОписание = НормализоватьДанныеАрхивации(Данные);

    ОбъектАрхиватора = СоздатьАрхиватор(Архиватор);

    Если Настройки <> Неопределено Тогда

        ТекстОшибки = "Настройки должны быть валидной структурой ключ-значение!";
        OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Настройки, ТекстОшибки);

    КонецЕсли;

    НастройкиJanx = OPI_Компоненты.СериализоватьJanx(Настройки);

    Если ДанныеЭтоОписание Тогда
        ДанныеСериализованные = OPI_Компоненты.СериализоватьJanx(Данные);
    Иначе
        ДанныеСериализованные = Данные;
    КонецЕсли;

    Если ЗначениеЗаполнено(ПутьАрхива) Тогда

        OPI_ПреобразованиеТипов.ПолучитьСтроку(ПутьАрхива);

        Если ДанныеЭтоОписание Тогда
            Результат = ОбъектАрхиватора.PackToFileFromDescription(ДанныеСериализованные, ПутьАрхива, НастройкиJanx);
        Иначе
            Результат = ОбъектАрхиватора.PackToFileFromFile(ДанныеСериализованные, ПутьАрхива, НастройкиJanx);
        КонецЕсли;

        Результат = OPI_Компоненты.ДесериализоватьJanx(Результат);

    Иначе

        Если ДанныеЭтоОписание Тогда
            Результат = ОбъектАрхиватора.PackToBufferFromDescription(ДанныеСериализованные, НастройкиJanx);
        Иначе
            Результат = ОбъектАрхиватора.PackToBufferFromFile(ДанныеСериализованные, НастройкиJanx);
        КонецЕсли;

        Если ТипЗнч(Результат) = Тип("ДвоичныеДанные") Тогда
            Возврат Результат;
        КонецЕсли;

        СоответствиеОшибки = Новый Соответствие;
        СоответствиеОшибки.Вставить("result", Ложь);
        СоответствиеОшибки.Вставить("error" , Строка(Результат));
        Возврат СоответствиеОшибки;

    КонецЕсли;

    Возврат Результат;

КонецФункции

Функция Разархивировать(Знач Архиватор, Знач Архив, Знач КаталогНазначения = "", Знач Пароль = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Пароль);

    АрхивКакДвоичные = ТипЗнч(Архив) = Тип("ДвоичныеДанные");

    Если Не АрхивКакДвоичные Тогда

        OPI_ПреобразованиеТипов.ПолучитьСтроку(Архив);

        ФайлАрхива = Новый Файл(Архив);

        Если Не ФайлАрхива.Существует() Тогда

            СоответствиеОшибки = Новый Соответствие;
            СоответствиеОшибки.Вставить("result", Ложь);
            СоответствиеОшибки.Вставить("error" , "Archive file not found!");
            Возврат СоответствиеОшибки;

        Иначе
            Архив = ФайлАрхива.ПолноеИмя;
        КонецЕсли;

    КонецЕсли;

    ОбъектАрхиватора = СоздатьАрхиватор(Архиватор);

    Если ЗначениеЗаполнено(КаталогНазначения) Тогда

        OPI_ПреобразованиеТипов.ПолучитьСтроку(КаталогНазначения);

        Если АрхивКакДвоичные Тогда
            Результат = ОбъектАрхиватора.UnpackToFileFromBuffer(Архив, КаталогНазначения, Пароль);
        Иначе
            Результат = ОбъектАрхиватора.UnpackToFileFromFile(Архив, КаталогНазначения, Пароль);
        КонецЕсли;

    Иначе

        Если АрхивКакДвоичные Тогда
            Результат = ОбъектАрхиватора.UnpackToDescriptionFromBuffer(Архив, Пароль);
        Иначе
            Результат = ОбъектАрхиватора.UnpackToDescriptionFromFile(Архив, Пароль);
        КонецЕсли;

    КонецЕсли;

    Если ТипЗнч(Результат) = Тип("Строка") Тогда

        СоответствиеОшибки = Новый Соответствие;
        СоответствиеОшибки.Вставить("result", Ложь);
        СоответствиеОшибки.Вставить("error" , Результат);
        Возврат СоответствиеОшибки;

    КонецЕсли;

    Результат = OPI_Компоненты.ДесериализоватьJanx(Результат);

    Возврат Результат;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СоздатьАрхиватор(Знач Вид)

    Если Вид = "7z" Тогда
        Компонента = OPI_Компоненты.ПолучитьКомпоненту(Вид);
    Иначе
        ВызватьИсключение СтрШаблон("Неподдерживаемый архиватор %1", Вид);
    КонецЕсли;

    Возврат Компонента;

КонецФункции

Функция НормализоватьДанныеАрхивации(Данные)

    Если ТипЗнч(Данные) = Тип("Строка") Тогда

        ДанныеНаДиске = Новый Файл(Данные);

        Если ДанныеНаДиске.Существует() И ДанныеНаДиске.ЭтоКаталог() Тогда
            Данные = ДанныеНаДиске.ПолноеИмя;
            Возврат Ложь;
        КонецЕсли;

    КонецЕсли;

    ТекстОшибки = "Данные для архивации должны быть представлены как путь к каталогу на диске или в виде коллекции";
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Данные, ТекстОшибки);

    Возврат Истина;

КонецФункции

#КонецОбласти

#КонецЕсли // !OPI
