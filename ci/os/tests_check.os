#Использовать osparser

Перем ТекстТестов;
Перем МассивМетодов;

Процедура ПроверитьТесты()

	Расположение = "./src/ru/OInt";
	ФайлТестов   = Расположение + "/tests/Modules/internal/OPI_Тесты.os";

	МассивМетодов = Новый Массив;

	МодульТестов = Новый ТекстовыйДокумент();
	МодульТестов.Прочитать(ФайлТестов);
	
	ТекстТестов = МодульТестов.ПолучитьТекст();

	ОбщийМассивМодулей = Новый Массив;
	ФайлыМодулей       = НайтиФайлы(Расположение, "*.os", Истина);

	Для Каждого Модуль Из ФайлыМодулей Цикл
		ОбщийМассивМодулей.Добавить(Модуль);
	КонецЦикла;

	Для Каждого Модуль Из ОбщийМассивМодулей Цикл

        ТекущийМодуль = Новый ТекстовыйДокумент();
		ТекущийМодуль.Прочитать(Модуль.ПолноеИмя);
        РазобратьМодуль(ТекущийМодуль, Модуль.ИмяБезРасширения);
	  
    КонецЦикла;

	Для Каждого Метод Из МассивМетодов Цикл
		Вхождения = СтрЧислоВхождений(ТекстТестов, Метод);

		Если Вхождения = 0 Тогда
			Сообщить("Тест не реализован: " + Метод);
		ИначеЕсли Вхождения = 1 Тогда
			Сообщить("Тест встречается один раз. Возможно он реализован, но не вызван: " + Метод);
		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

Процедура РазобратьМодуль(ТекущийМодуль, ИмяМодуля)

	ТекстМодуля = ТекущийМодуль.ПолучитьТекст();

	СтруктураОбщихДанных = Новый Структура;
	ПолучитьДанныеМодуля(СтруктураОбщихДанных, ТекущийМодуль);

	Если Не ЗначениеЗаполнено(СтруктураОбщихДанных["Библиотека"]) Тогда
		Возврат;
	КонеЦесли;

	ТекущаяБиблиотека = СтруктураОбщихДанных["Библиотека"];
	
	Парсер          = Новый ПарсерВстроенногоЯзыка;
	СтруктураМодуля = Парсер.Разобрать(ТекстМодуля);

	Для Каждого Метод Из СтруктураМодуля.Объявления Цикл

		Если Метод.Тип = "ОбъявлениеМетода" И Метод.Сигнатура.Экспорт = Истина Тогда

			ДокКом = СтрПолучитьСтроку(ТекстМодуля, Метод.Сигнатура.Начало.НомерСтроки - 1);
			Первая = СтрПолучитьСтроку(ТекстМодуля, Метод.Сигнатура.Начало.НомерСтроки);

			Если СтрНайти(ДокКом, "//") <> 0 И СтрНайти(Первая, "// Service") = 0 Тогда 
				МассивМетодов.Добавить(СтрЗаменить(ТекущаяБиблиотека, " ", "") + "_" + Метод.Сигнатура.Имя);
			КонецЕсли;
			
		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

Процедура ПолучитьДанныеМодуля(СтруктураОбщихДанных, ТекущийМодуль)

	Имя = ТекущийМодуль.ПолучитьСтроку(2);
	CLI = ТекущийМодуль.ПолучитьСтроку(3);

	Если СтрНайти(Имя, "Lib") = 0 Тогда
		Имя = "";
	Иначе 
		Имя = СтрЗаменить(Имя, "// Lib:", "");
		Имя = СокрЛП(Имя);
	КонецЕсли;

	Если СтрНайти(CLI, "CLI") = 0 Тогда
		CLI = "none";
	Иначе
		CLI = СтрЗаменить(CLI, "// CLI:", "");
		CLI = СокрЛП(CLI);
	КонецЕсли;

	Каталог = СтрЗаменить(Имя, " ", "_");

	СтруктураОбщихДанных.Вставить("Библиотека", Имя);
	СтруктураОбщихДанных.Вставить("Команда"   , CLI);
	СтруктураОбщихДанных.Вставить("Каталог"   , Каталог);

КонецПроцедуры

ПроверитьТесты();