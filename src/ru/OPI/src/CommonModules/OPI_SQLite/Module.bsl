// OneScript: ./OInt/core/Modules/OPI_SQLite.os
// Lib: SQLite
// CLI: sqlite

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

Функция СоздатьПодключение(Знач База = "") Экспорт
	
	Если Строка(ТипЗнч(База)) = "AddIn.OPI_SQLite.Main" Тогда
		Возврат База;
	КонецЕсли;
		
	OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
	
	Коннектор = ПодключитьКомпонентуНаСервере("OPI_SQLite");

    Коннектор.Database = База;

    Результат = Коннектор.Connect();
	Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Возврат ?(Результат["result"], Коннектор, Результат);

КонецФункции

Функция ВыполнитьЗапрос(Знач ТекстЗапроса, Знач Параметры = "", Знач Соединение = "") Экспорт
	
	OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекстЗапроса);
	
	Параметры_ = ОбработатьПараметры(Параметры);
	Коннектор  = СоздатьПодключение(Соединение);
	
	Если ТипЗнч(Коннектор) <> Тип("AddIn.OPI_SQLite.Main") Тогда
		Возврат Коннектор;
	КонецЕсли;
	
	Результат = Коннектор.Execute(ТекстЗапроса, Параметры_);
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПодключитьКомпонентуНаСервере(Знач ИмяКомпоненты, Знач Класс = "Main")

    Если OPI_Инструменты.ЭтоOneScript() Тогда
        ИмяМакета = OPI_Инструменты.КаталогКомпонентOS() + ИмяКомпоненты + ".zip";
    Иначе
        ИмяМакета = "ОбщийМакет." + ИмяКомпоненты;
    КонецЕсли;

    ПодключитьВнешнююКомпоненту(ИмяМакета, ИмяКомпоненты, ТипВнешнейКомпоненты.Native);

    Компонента = Новый("AddIn." + ИмяКомпоненты + "." + Класс);
    Возврат Компонента;

КонецФункции

Функция ОбработатьПараметры(Знач Параметры)
	
	Если ЗначениеЗаполнено(Параметры) Тогда
		
		OPI_ПреобразованиеТипов.ПолучитьМассив(Параметры);
		
		Для Н = 0 По Параметры.ВГраница() Цикл
			
			ТекущийПараметр = Параметры[Н];
			
			Если Не OPI_Инструменты.ЭтоПримитивныйТип(ТекущийПараметр) Тогда
				OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущийПараметр);
			КонецЕсли;
			
			Параметры[Н] = ТекущийПараметр;
			
		КонецЦикла;
		
		Параметры_ = OPI_Инструменты.JSONСтрокой(Параметры, , Ложь);
		
	Иначе
		
		Параметры_ = "[]";
		
	КонецЕсли;
	
	Возврат Параметры_;

КонецФункции

#КонецОбласти
