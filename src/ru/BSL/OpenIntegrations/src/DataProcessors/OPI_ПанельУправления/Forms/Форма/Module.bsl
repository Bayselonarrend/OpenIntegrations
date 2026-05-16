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
// BSLLS:CognitiveComplexity-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

#Область ОбработчикиСобытийФормы

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	#Если Не ВебКлиент Тогда
		
		OPI_УправлениеРасширением.ПодключитьВсеКомпоненты();
		
	#Иначе
		
		Элементы.ГруппаВнешниеКомпонентыКлиент.Доступность = Ложь;
		Элементы.ГруппаГлавнаяКнопки.Видимость             = Ложь;
		Элементы.ГруппаГлавнаяGit.Видимость                = Ложь;
		
	#КонецЕсли
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
	Если ИмяСобытия = "OPI_ЗавершениеУстановки" Тогда
		
		ИмяКомпоненты    = Параметр["ИмяКомпоненты"];
		
		ОтборКомпонент   = Новый Структура("ИмяКомпоненты", ИмяКомпоненты);
		СтрокаКомпоненты = ВерсииКомпонент.НайтиСтроки(ОтборКомпонент);
		
		Если СтрокаКомпоненты.Количество() > 0 Тогда
			НужнаяСтрока = СтрокаКомпоненты[0];
		Иначе
			НужнаяСтрока = ВерсииКомпонент.Добавить();
		КонецЕсли;
		
		ЗаполнитьЗначенияСвойств(НужнаяСтрока, Параметр);
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыВерсииКомпонент

&НаКлиенте
Процедура ВерсииКомпонентПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	Отказ = Истина;
КонецПроцедуры

&НаКлиенте
Процедура ВерсииКомпонентПередУдалением(Элемент, Отказ)
	Отказ = Истина;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

#Если Не ВебКлиент Тогда
	
&НаКлиенте
Процедура ОткрытьSourceCraft(Команда)
	ЗапуститьПриложение("https://sourcecraft.dev/bayselonarrend/openintegrations");
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьGitHub(Команда)
	ЗапуститьПриложение("https://github.com/Bayselonarrend/OpenIntegrations");
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьСайт(Команда)
	ЗапуститьПриложение("https://openintegrations.dev");
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьЛицензиюEn(Команда)
	ТекстЛицензии = OPI_Инструменты.ПолучитьТекстовыйМакет("OPI_Text_LicenseEN");
	ПоказатьЗначение( , ТекстЛицензии);
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьЛицензиюRu(Команда)
	ТекстЛицензии = OPI_Инструменты.ПолучитьТекстовыйМакет("OPI_Text_LicenseRU");
	ПоказатьЗначение( , ТекстЛицензии);
КонецПроцедуры

&НаКлиенте
Процедура ВнешниеКомпонентыКлиентВыделитьВсе(Команда)  
	
	Для Каждого СтрокаТаблицы Из ВерсииКомпонент Цикл
		СтрокаТаблицы.Отметка = Истина;
	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Процедура ВнешниеКомпонентыКлиентСнятьВсе(Команда)  
	
	Для Каждого СтрокаТаблицы Из ВерсииКомпонент Цикл
		СтрокаТаблицы.Отметка = Ложь;
	КонецЦикла;       
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьКомпонентыНаКлиенте(Команда)  
	
	МассивИмен = Новый Массив;
	
	Для Каждого СтрокаТаблицы Из ВерсииКомпонент Цикл
		Если СтрокаТаблицы.Отметка Тогда
			МассивИмен.Добавить(СтрокаТаблицы.ИмяКомпоненты);	
		КонецЕсли;
	КонецЦикла;   
	
	#Если Не ВебКлиент Тогда
		
		OPI_УправлениеРасширением.ОбновитьКомпонентыНаКлиенте(МассивИмен);
		
	#КонецЕсли
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьКаталогКэша(Команда)
	
	ПутьКэша = ?(OPI_Инструменты.ЭтоWindows()
		, "%APPDATA%\1C\1Cv8\ExtCompT"
		, "~/.1cv8/1C/1Cv8/ExtCompT/");
		
	ЗапуститьПриложение(ПутьКэша);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьСписокКомпонент(Команда)  
	
	ОбновитьСписокВерсийКомпонент();
	
КонецПроцедуры

#КонецЕсли 

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Если Не ВебКлиент Тогда
	
&НаКлиенте
Процедура ОбновитьСписокВерсийКомпонент()
	
	ВерсииКомпонент.Очистить();
	
	СписокКомпонент = OPI_УправлениеРасширением.ПолучитьСписокВерсийКомпонент(); 
	
	Для Каждого ДанныеКомпоненты Из СписокКомпонент Цикл
		
		НоваяСтрока = ВерсииКомпонент.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, ДанныеКомпоненты);
		
	КонецЦикла;
		
КонецПроцедуры

#КонецЕсли // !OPI

#КонецОбласти
