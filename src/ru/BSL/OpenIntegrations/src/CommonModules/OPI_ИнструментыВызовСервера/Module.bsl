// OneScript: ./OInt/tools/main/Modules/internal/Modules/internal/Modules/OPI_ИнструментыВызовСервера.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:DeprecatedCurrentDate-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check use-non-recommended-method

// #Использовать "./internal"

#Область СлужебныйПрограммныйИнтерфейс

Процедура УстановитьПараметрСеанса(Знач Имя, Знач Значение) Экспорт
	 ПараметрыСеанса[Имя] =	Значение; // !OPI
КонецПроцедуры

Функция ПолучитьРаскодированнуюСтроку(Знач Значение, Знач Способ) Экспорт
	
	Если ТипЗнч(Способ) = Тип("Строка") Тогда
		СпособКодировки = СпособКодированияСтроки[Способ];
	Иначе
		СпособКодировки = Способ;
	КонецЕсли;
	
	Возврат РаскодироватьСтроку(Значение, СпособКодировки);	
	
КонецФункции

Функция ПолучитьКодированнуюСтроку(Знач Значение, Знач Способ) Экспорт

	Если ТипЗнч(Способ) = Тип("Строка") Тогда
		СпособКодировки = СпособКодированияСтроки[Способ];
	Иначе
		СпособКодировки = Способ;
	КонецЕсли;
	
	Возврат КодироватьСтроку(Значение, СпособКодировки);	
	
КонецФункции

Функция ПолучитьXMLСтроку(Знач Значение) Экспорт
	Возврат XMLСтрока(Значение);	
КонецФункции

Функция СортироватьСтруктуруПоКлючу(Знач Значение) Экспорт

    Таблица = Новый ТаблицаЗначений;
    Таблица.Колонки.Добавить("Ключ");
    Таблица.Колонки.Добавить("Значение");

    Для Каждого Данные Из Значение Цикл

        НоваяСтрока          = Таблица.Добавить();
        НоваяСтрока.Ключ     = Данные.Ключ;
        НоваяСтрока.Значение = Данные.Значение;

    КонецЦикла;

    Таблица.Сортировать("Ключ");
    
    ВозвращаемаяСтруктура = Новый Структура;
    
    Для Каждого СтрокаТаблицы Из Таблица Цикл
    	
    	ВозвращаемаяСтруктура.Вставить(СтрокаТаблицы.Ключ, СтрокаТаблицы.Значение);
    	
    КонецЦикла;
    
    Возврат ВозвращаемаяСтруктура;
    	
КонецФункции

Функция ПолучитьТекущуюУниверсальнуюДату() Экспорт
	Возврат ТекущаяУниверсальнаяДата();
КонецФункции

Функция ПолучитьТекущуюДатуСеанса() Экспорт
	Возврат ТекущаяДатаСеанса();
КонецФункции

Функция ПолучитьТекстОбщегоМакета(Знач ИмяМакета) Экспорт
	
    Макет    = Неопределено;
    Макет    = ПолучитьОбщийМакет(ИмяМакета); // !OPI
    Значение = Макет.ПолучитьТекст();
    
    Возврат Значение;
    
КонецФункции
	
Функция ПолучитьПараметрСеанса(Знач Имя) Экспорт
	Возврат ПараметрыСеанса[Имя]; // !OPI
КонецФункции

Функция Хеш(ДвоичныеДанные, Тип) Экспорт

	Если ТипЗнч(Тип) = Тип("Строка") Тогда
		ТипХеша = ХешФункция[Тип];
	Иначе
		ТипХеша = Тип;
	КонецЕсли;
	
    Хеширование = Новый ХешированиеДанных(ТипХеша);
    Хеширование.Добавить(ДвоичныеДанные);

    Возврат Хеширование.ХешСумма;

КонецФункции

#КонецОбласти