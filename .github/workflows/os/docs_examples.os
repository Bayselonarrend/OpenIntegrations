#Использовать osparser
#использовать "../../../src/ru/OInt/tools/"

Перем МодульТестов;
Перем Парсер;
Перем ОбластьТестов;
Перем КаталогСохранения;
Перем КаталогЗаписиЗначений;
Перем ТекущаяСтруктураЗначений;

Процедура ПриСозданииОбъекта()
	
	ПутьКТестам           = "./src/ru/OInt/tests/Modules/internal/OPI_Тесты.os";
	ОбластьТестов         = "АтомарныеТесты";
	КаталогСохранения     = "./docs/ru/examples/";
	КаталогЗаписиЗначений = "./docs/ru/data/";

	Парсер            = Новый ПарсерВстроенногоЯзыка;

	МодульТестов = Новый ТекстовыйДокумент();
	МодульТестов.Прочитать(ПутьКТестам);

	Начало    = 0;
	Окончание = 0;

	ПолучитьГраницыОбластиТестов(Начало, Окончание);

	ДокументАтомарныхТестов = Новый ТекстовыйДокумент();

	Для Н = Начало По Окончание Цикл
		ДокументАтомарныхТестов.ДобавитьСтроку(МодульТестов.ПолучитьСтроку(Н));
	КонецЦикла;

	МодульТестов = ДокументАтомарныхТестов;

	РазобратьТесты();

КонецПроцедуры

Процедура ПолучитьГраницыОбластиТестов(Начало, Окончание)

	ТекстМодуля = МодульТестов.ПолучитьТекст();
	СтруктураМодуля = Парсер.Разобрать(ТекстМодуля);

	ВложенныеОбласти = 0;

	Для Каждого Объявление Из СтруктураМодуля.Объявления Цикл

		Если Строка(Объявление.Тип) = "ИнструкцияПрепроцессораОбласть" Тогда

			Если Объявление.Имя = ОбластьТестов Тогда
				Начало = Объявление.Начало.НомерСтроки;
			КонецЕсли;

			Если ЗначениеЗаполнено(Начало) Тогда
				ВложенныеОбласти = ВложенныеОбласти + 1;
			КонецЕсли;

		КонецЕсли;

		Если Строка(Объявление.Тип) = "ИнструкцияПрепроцессораКонецОбласти" И ЗначениеЗаполнено(Начало) Тогда

			Если ВложенныеОбласти = 0 Тогда
				Окончание = Объявление.Начало.НомерСтроки;
				Прервать;
			Иначе
				ВложенныеОбласти = ВложенныеОбласти - 1;
			КонецЕсли;

		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

Процедура РазобратьТесты()
	
	ТекстМодуля     = МодульТестов.ПолучитьТекст();
	СтруктураМодуля = Парсер.Разобрать(ТекстМодуля);

	Для Каждого Объявление Из СтруктураМодуля.Объявления Цикл

		Если Строка(Объявление.Тип) = "ОбъявлениеМетода" Тогда
			РазобратьМетод(Объявление.Начало.НомерСтроки, Объявление.Сигнатура.Имя);
		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

Процедура РазобратьМетод(НомерСтроки, Имя)
	
	РазбитоеИмя = СтрРазделить(Имя, "_", Ложь);

	Если РазбитоеИмя.Количество() <> 2 Тогда
		Сообщить("Метод " + Имя + " был найден но не обработан", СтатусСообщения.ОченьВажное);
		Возврат;
	КонецЕсли;

	ТекстТекущейСтроки = МодульТестов.ПолучитьСтроку(НомерСтроки + 1);
	ТекстПримера       = "";

	ТекущаяСтруктураЗначений = Новый Структура();

	ПрошлаяПустая = Ложь;
	Пока СтрНайти(ТекстТекущейСтроки, "END") = 0 И СтрНайти(ТекстТекущейСтроки, "КонецПроцедуры") = 0 Цикл

		ТекущаяПустая = Ложь;

		Если Не ЗначениеЗаполнено(СокрЛП(ТекстТекущейСтроки)) Тогда
			ТекущаяПустая = Истина;
		КонецЕсли;

		Если Не СтрНайти(ТекстТекущейСтроки, "SKIP") <> 0 Тогда
			Если Не (ТекущаяПустая И ПрошлаяПустая) Тогда
				ТекстПримера = ТекстПримера + Символы.ПС + ПреобразоватьТекст(ТекстТекущейСтроки);
			КонецЕсли;
		КонецЕсли;

		НомерСтроки = НомерСтроки + 1;
		ТекстТекущейСтроки = МодульТестов.ПолучитьСтроку(НомерСтроки);

		ПрошлаяПустая = ТекущаяПустая;
		
	КонецЦикла;

	Каталог        = КаталогСохранения + РазбитоеИмя[0];
	ОбъектКаталога = Новый Файл(Каталог);

	Если Не ОбъектКаталога.Существует() Тогда
		СоздатьКаталог(Каталог);
	КонецЕсли;

	ТекстПримера = СтрЗаменить(ТекстПримера, Символы.Таб, "    ");
	ТекстПримера = "    " + СокрЛП(ТекстПримера);

	ФайлПримера = Новый ТекстовыйДокумент();
	ФайлПримера.УстановитьТекст(ТекстПримера);
	ФайлПримера.Записать(Каталог + "/" + РазбитоеИмя[1] + ".txt");

	Если ЗначениеЗаполнено(ТекущаяСтруктураЗначений) Тогда

		КаталогЗначений = КаталогЗаписиЗначений + РазбитоеИмя[0];
		ОбъектКаталога  = Новый Файл(КаталогЗначений);

		Если Не ОбъектКаталога.Существует() Тогда
			СоздатьКаталог(КаталогЗначений);
		КонецЕсли;

		ЗаписьJSON = Новый ЗаписьJSON;
        ЗаписьJSON.ОткрытьФайл(КаталогЗначений + "/" + РазбитоеИмя[1] + ".json", , , Новый ПараметрыЗаписиJSON());
        ЗаписатьJSON(ЗаписьJSON, ТекущаяСтруктураЗначений);
        ЗаписьJSON.Закрыть();

	КонецЕсли;

КонецПроцедуры

Функция ПреобразоватьТекст(Текст)

	Если СтрНайти(Текст, "ПараметрыФункции") Тогда

		РазбитоеЗначение  = СтрРазделить(Текст, "=", Ложь);

		ИмяПараметра = ОпределитьИмяПараметра(Текст);
		Значение     = OPI_ПолучениеДанныхТестов.ПолучитьПараметр(ИмяПараметра);

		ЗакрытьСекретныеДанные(Значение, ИмяПараметра);

		Если РазбитоеЗначение.Количество() = 2 Тогда
			ТекущаяСтруктураЗначений.Вставить(СокрЛП(РазбитоеЗначение[0]), Значение);
		КонецЕсли;
		
		ОпределениеПараметра = "ПараметрыФункции[""" + ИмяПараметра + """]";
		Текст = СтрЗаменить(Текст, ОпределениеПараметра, """" + Строка(Значение) + """");
	КонецЕсли;

	Возврат Текст;

КонецФункции

Функция ОпределитьИмяПараметра(Текст)

	НачалоПараметра = СтрНайти(Текст, "ПараметрыФункции[""") + 18; 
	КонецПараметра  = СтрНайти(Текст, """]");
	Имя             = Сред(Текст, НачалоПараметра, КонецПараметра - НачалоПараметра);

	Возврат Имя;

КонецФункции

Процедура ЗакрытьСекретныеДанные(Значение, ИмяПараметра)

	МассивПризнаковСекретов = Новый Массив;
	МассивПризнаковСекретов.Добавить("Secret");
	МассивПризнаковСекретов.Добавить("Token");
	МассивПризнаковСекретов.Добавить("Key");
	МассивПризнаковСекретов.Добавить("Refresh");

	Для Каждого Признак Из МассивПризнаковСекретов Цикл
		Если СтрНайти(нРег(ИмяПараметра), нРег(Признак)) <> 0 Тогда
			Значение = Лев(Значение, Цел(СтрДлина(Значение) / 2)) + "...";
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

ПриСозданииОбъекта();