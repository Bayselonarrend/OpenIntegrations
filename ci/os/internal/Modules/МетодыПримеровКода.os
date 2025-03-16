#Использовать osparser
#использовать "../../../../src/ru/OInt/tools/"

Перем МодульТестов;
Перем Парсер;
Перем ОбластьТестов;
Перем КаталогСохранения;
Перем КаталогЗаписиЗначений;
Перем ТекущаяСтруктураЗначений;

Процедура ПолучитьПримерыКодаДокументации(Знач ПутьТестов, Знач ПутьПримеров, Знач ПутьЗначений, ИмяОбласти) Экспорт
	
	ОбластьТестов         = ИмяОбласти;
	КаталогСохранения     = ПутьПримеров;
	КаталогЗаписиЗначений = ПутьЗначений;

	Парсер  = Новый ПарсерВстроенногоЯзыка;

	МодульТестов = Новый ТекстовыйДокумент();
	МодульТестов.Прочитать(ПутьТестов);

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

	ТекущаяСтруктураЗначений = Новый Соответствие();

	ПрошлаяПустая = Ложь;
	Пока СтрНайти(ТекстТекущейСтроки, "// END") = 0
		И СтрНайти(ТекстТекущейСтроки, "//END") = 0 
		И СтрНайти(ТекстТекущейСтроки, "КонецПроцедуры") = 0
		И СтрНайти(ТекстТекущейСтроки, "EndProcedure") = 0 Цикл

		ТекущаяПустая = Ложь;
		ЭтоСкип = СтрНайти(ТекстТекущейСтроки, "SKIP") <> 0;
		ЭтоЛог  = СтрНайти(ТекстТекущейСтроки, "ЗаписатьЛог") <> 0 Или СтрНайти(ТекстТекущейСтроки, "WriteLog") <> 0;

		Если Не ЗначениеЗаполнено(СокрЛП(ТекстТекущейСтроки))
			Или ЭтоСкип Или ЭтоЛог Тогда
			ТекущаяПустая = Истина;
		КонецЕсли;

		Если Не ЭтоСкип	И Не ЭтоЛог Тогда
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
	ТекстПримера = СтрЗаменить(ТекстПримера, "    " + Символы.ПС + "    " + Символы.ПС, Символы.ПС);
	ТекстПримера = СтрЗаменить(ТекстПримера, Символы.ПС + "  " + Символы.ПС, Символы.ПС);

	ПутьПримера = Каталог + "/" + РазбитоеИмя[1] + ".txt";

	ФайлПримера = Новый ТекстовыйДокумент();
	ФайлПримера.УстановитьТекст(ТекстПримера);
	ФайлПримера.Записать(ПутьПримера);

	Если ЗначениеЗаполнено(ТекущаяСтруктураЗначений) Тогда

		КаталогЗначений = КаталогЗаписиЗначений + РазбитоеИмя[0];
		ОбъектКаталога  = Новый Файл(КаталогЗначений);

		Если Не ОбъектКаталога.Существует() Тогда
			СоздатьКаталог(КаталогЗначений);
		КонецЕсли;

		ПутьДанных = КаталогЗначений + "/" + РазбитоеИмя[1] + ".json";
		ФайлДанных = Новый Файл(ПутьДанных);

		Если ФайлДанных.Существует() Тогда

			ЧтениеJSON = Новый ЧтениеJSON();
			ЧтениеJSON.ОткрытьФайл(ПутьДанных, "UTF-8");

			СтараяСтруктураЗначений = ПрочитатьJSON(ЧтениеJSON, Истина);
			ЧтениеJSON.Закрыть();

			Для Каждого ЭлементСтруктуры Из СтараяСтруктураЗначений Цикл
				ТекущаяСтруктураЗначений.Вставить(ЭлементСтруктуры.Ключ, ЭлементСтруктуры.Значение);
			КонецЦикла;

		КонецЕсли;

		ЗаписьJSON = Новый ЗаписьJSON;
		ЗаписьJSON.ОткрытьФайл(ПутьДанных, , , Новый ПараметрыЗаписиJSON());
		ЗаписатьJSON(ЗаписьJSON, ТекущаяСтруктураЗначений);
		ЗаписьJSON.Закрыть();

	КонецЕсли;

КонецПроцедуры

Функция ПреобразоватьТекст(Текст)

	ЕстьRU = СтрНайти(Текст, "ПараметрыФункции") <> 0;
	ЕстьEN = СтрНайти(Текст, "FunctionParameters") <> 0;

	Если ЕстьRU Или ЕстьEN Тогда

		Если ЕстьEN Тогда
			А = 1;
		КонецЕсли;

		РазбитоеЗначение  = СтрРазделить(Текст, "=", Ложь);

		ИмяПараметра = ОпределитьИмяПараметра(Текст, ?(ЕстьRU, "ПараметрыФункции", "FunctionParameters"));

		Попытка
			Значение = OPI_ПолучениеДанныхТестов.ПолучитьПараметр(ИмяПараметра);
		Исключение
			ОО = ОписаниеОшибки();
			Возврат Текст;
		КонецПопытки;

		ЗакрытьСекретныеДанные(Значение, ИмяПараметра);

		Если РазбитоеЗначение.Количество() = 2 Тогда
			ТекущаяСтруктураЗначений.Вставить(СокрЛП(РазбитоеЗначение[0]), Значение);
		КонецЕсли;
		
		ОпределениеПараметра = "ПараметрыФункции[""" + ИмяПараметра + """]";
		Текст = СтрЗаменить(Текст, ОпределениеПараметра, """" + Строка(Значение) + """");

		ОпределениеПараметра = "FunctionParameters[""" + ИмяПараметра + """]";
		Текст = СтрЗаменить(Текст, ОпределениеПараметра, """" + Строка(Значение) + """");

	КонецЕсли;

	Возврат Текст;

КонецФункции

Функция ОпределитьИмяПараметра(Текст, Коллекция)

	НачалоПараметра = СтрНайти(Текст, Коллекция + "[""") + СтрДлина(Коллекция) + 2; 
	КонецПараметра  = СтрНайти(Текст, """]");
	Имя             = Сред(Текст, НачалоПараметра, КонецПараметра - НачалоПараметра);

	Возврат Имя;

КонецФункции

Процедура ЗакрытьСекретныеДанные(Значение, ИмяПараметра)

	СоответствиеПризнаковСекретов = Новый Соответствие();
	СоответствиеПризнаковСекретов.Вставить("Secret"      , 2);
	СоответствиеПризнаковСекретов.Вставить("Token"       , 2);
	СоответствиеПризнаковСекретов.Вставить("Key"         , 2);
	СоответствиеПризнаковСекретов.Вставить("Refresh"     , 2);
	СоответствиеПризнаковСекретов.Вставить("IdInstance"  , 2);
	СоответствиеПризнаковСекретов.Вставить("Password"    , 3);
	СоответствиеПризнаковСекретов.Вставить("Bitrix24_URL", 1.3);

	СоответствиеЗамен = Новый Соответствие;
    СоответствиеЗамен.Вставить("MDB_CString", "mongodb://bayselonarrend:***@127.0.0.1:27017");
	СоответствиеЗамен.Вставить("PG_Connection", "postgresql://bayselonarrend:***@127.0.0.1:5432/");
	СоответствиеЗамен.Вставить("PG_IP", "127.0.0.1");
	СоответствиеЗамен.Вставить("RCON_URL", "127.0.0.1:25565");

	Для Каждого Признак Из СоответствиеПризнаковСекретов Цикл

		Если СтрНайти(нРег(ИмяПараметра), нРег(Признак.Ключ)) <> 0 Тогда
			Значение = Лев(Значение, Цел(СтрДлина(Значение) / Признак.Значение)) + "...";
			Прервать;
		КонецЕсли;

	КонецЦикла;
	
	Для Каждого Признак Из СоответствиеЗамен Цикл

		Если СтрНайти(нРег(ИмяПараметра), нРег(Признак.Ключ)) <> 0 Тогда
			Значение = Признак.Значение;
			Прервать;
		КонецЕсли;

	КонецЦикла;

КонецПроцедуры
