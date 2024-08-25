#Использовать "./internal"

Перем МассивСимволов;
Перем ЕстьНовыеСлова;

#Область СлужебныйПрограммныйИнтерфейс

Функция СоздатьНаборСловарей(Знач ФайлыМодулей, Знач Языки, Знач КаталогСловарей) Экспорт

	ЕстьНовыеСлова = Ложь;
	
	Для Каждого Язык Из Языки Цикл

		ПутьСловаря = КаталогСловарей + Язык + ".json";
		ФайлСловаря = Новый Файл(ПутьСловаря);

		Если ФайлСловаря.Существует() Тогда
			СоздатьСловарь(ФайлыМодулей, ПутьСловаря);
		КонецЕсли;

	КонецЦикла;

	Возврат ЕстьНовыеСлова;

КонецФункции

Процедура СоздатьСловарь(Знач ФайлыМодулей, Знач ПутьСловаря) Экспорт

	МассивСимволов = Инструменты.ПолучитьМассивСимволов();

	СоответствиеСловаря = Инструменты.ПрочитатьФайлJSON(ПутьСловаря);
	СписокСлов                       = Новый СписокЗначений();
	
	Для Каждого Модуль Из ФайлыМодулей Цикл

		ПолучитьМассивСловОригинала(Модуль.ПолноеИмя, СписокСлов);

	КонецЦикла;

	Для Каждого Слово Из СписокСлов Цикл

		СловоОригинал       = Слово.Значение;
		СуществующийПеревод = СоответствиеСловаря[СловоОригинал];

		Если Не ЗначениеЗаполнено(СуществующийПеревод) Тогда
			СоответствиеСловаря.Вставить(СловоОригинал, "");
			ЕстьНовыеСлова = Истина;
		КонецЕсли;

	КонецЦикла;

	ЗаписатьJSONСловаря(СоответствиеСловаря, ПутьСловаря);

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЗаписатьJSONСловаря(СоответствиеСловаря, ПутьСловаря)

	ТЗ = Новый ТаблицаЗначений();
	ТЗ.Колонки.Добавить("Ключ");
	ТЗ.Колонки.Добавить("Значение");
	ТЗ.Колонки.Добавить("ДлинаКлюча");
	ТЗ.Колонки.Добавить("Заполнено");

	Для Каждого Элемент Из СоответствиеСловаря Цикл

		НоваяСтрока = ТЗ.Добавить();
		НоваяСтрока.Ключ = Элемент.Ключ;
		НоваяСтрока.Значение = Элемент.Значение;
		НоваяСтрока.ДлинаКлюча = СтрДлина(Элемент.Ключ);
		НоваяСтрока.Заполнено = ЗначениеЗаполнено(Элемент.Значение);

	КонецЦикла;

	ТЗ.Сортировать("Заполнено УБЫВ, ДлинаКлюча");

	JSON = Новый ЗаписьJSON;

	JSON.ОткрытьФайл(ПутьСловаря);
	JSON.ЗаписатьНачалоОбъекта();

	Для Каждого СтрокаТЗ Из ТЗ Цикл

		JSON.ЗаписатьИмяСвойства(СтрокаТЗ["Ключ"]);
		JSON.ЗаписатьЗначение(СтрокаТЗ["Значение"]);

	КонецЦикла;

	JSON.ЗаписатьКонецОбъекта();
	JSON.Закрыть();

КонецПроцедуры

Процедура ПолучитьМассивСловОригинала(Знач ПутьКФайлу, СписокСлов)

	Документ = Новый ТекстовыйДокумент();
	Документ.Прочитать(ПутьКФайлу, "UTF-8");

	Для Н = 1 По Документ.КоличествоСтрок() Цикл

		ТекущаяСтрока = СокрЛП(Документ.ПолучитьСтроку(Н));

		РазобратьСтрокуНаСлова(ТекущаяСтрока, СписокСлов);
		
	КонецЦикла;

КонецПроцедуры

Процедура РазобратьСтрокуНаСлова(Знач ТекущаяСтрока, СписокСлов)
	
	Если СтрНачинаетсяС(ТекущаяСтрока, "// !OInt OPI_ПолучениеДанныхТестов.ЗаписатьЛог") Тогда
		Возврат;
	КонецЕсли;

	Если СтрНачинаетсяС(ТекущаяСтрока, "//") Тогда

		РазобратьСтрокуКомментария(ТекущаяСтрока, СписокСлов);

	Иначе

		ЭтоВыражение = СтрНайти(ТекущаяСтрока, """") <> 0 
		Или СтрНайти(ТекущаяСтрока, "|") <> 0
		Или СтрНайти(ТекущаяСтрока, "<") <> 0
		Или СтрНайти(ТекущаяСтрока, ">") <> 0;

		Если ЭтоВыражение Тогда
			РазобратьВыражение(ТекущаяСтрока, СписокСлов);
		Иначе
			РазобратьОбычнуюСтроку(ТекущаяСтрока, СписокСлов);
		КонецЕсли;

	КонецЕсли;

КонецПроцедуры

Процедура РазобратьСтрокуКомментария(ТекущаяСтрока, СписокСлов)

	ТекущаяСтрока = СокрЛП(СтрЗаменить(ТекущаяСтрока, "//", ""));
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, " - ", "$");
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, ": [", "$");
	МассивСтроки  = СтрРазделить(ТекущаяСтрока, "$", Ложь);

	Для Г = 0 По МассивСтроки.ВГраница() Цикл
		ДобавитьСлово(СписокСлов, МассивСтроки[Г]);
	КонецЦикла;

КонецПроцедуры

Процедура РазобратьВыражение(ТекущаяСтрока, СписокСлов)

	ТекущаяСтрока = " " + ТекущаяСтрока;
		
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, """<", "$");
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, ">""", "$");
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, """", "$");
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, "|", "$");
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, "<", "$");
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, ">", "$");
	ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, "$$", """""");

	МассивСтроки = СтрРазделить(ТекущаяСтрока, "$", Истина);

	Цельный = Ложь;
	Для Каждого Элемент Из МассивСтроки Цикл

		Если Не ЗначениеЗаполнено(СокрЛП(Элемент)) Тогда
			Продолжить;
		КонецЕсли;

		Если Цельный Тогда
			ДобавитьСлово(СписокСлов, Элемент);
		Иначе
			РазобратьОбычнуюСтроку(Элемент, СписокСлов);
		КонецЕсли;

		Цельный = Не Цельный;
	КонецЦикла;

КонецПроцедуры

Процедура РазобратьОбычнуюСтроку(ТекущаяСтрока, СписокСлов)

	Для Каждого Символ Из МассивСимволов Цикл
		ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, Символ, "$");
	КонецЦикла;

	Пока СтрНайти(ТекущаяСтрока, "$$") <> 0 Цикл
		ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, "$$", "$");
	КонецЦикла;

	МассивЭлемента = СтрРазделить(ТекущаяСтрока, "$", Ложь);
	Для Каждого Дробный Из МассивЭлемента Цикл
		ДобавитьСлово(СписокСлов, Дробный);
	КонецЦикла;
	
КонецПроцедуры

Процедура ДобавитьСлово(Список, Слово)
	
	НормализоватьСлово(Слово);

	Если Не ЗначениеЗаполнено(Слово) Или Не НайтиКириллицу(Слово) Тогда
		Возврат;
	КонецЕсли;

	СуществующееЗначение = Список.НайтиПоЗначению(Слово);

	Если СуществующееЗначение = Неопределено Тогда
		Список.Добавить(Слово, СтрДлина(Слово));
	КонецЕсли;

КонецПроцедуры

Процедура НормализоватьСлово(Слово)
	
	Слово = СокрЛП(Слово);

	Нормализовано = Ложь;
	
	Пока Не Нормализовано Цикл

		ПервыйСимвол    = Ложь;
		ПоследнийСимвол = Ложь;

		Для Каждого Символ Из МассивСимволов Цикл

			ПервыйСимвол    = СтрНачинаетсяС(Слово, Символ);
			ПоследнийСимвол = СтрЗаканчиваетсяНа(Слово, Символ);

			Если ПервыйСимвол Или ПоследнийСимвол Тогда
				Прервать;
			КонецЕсли;

		КонецЦикла;

		Если ПервыйСимвол Тогда
			Слово = Прав(Слово, СтрДлина(Слово) - 1);
		КонецЕсли;

		Если ПоследнийСимвол Тогда
			Слово = Лев(Слово, СтрДлина(Слово) - 1);
		КонецЕсли;

		Если Не ПервыйСимвол И Не ПоследнийСимвол Тогда
			Нормализовано = Истина;
		КонецЕсли;

	КонецЦикла;

	Слово = СокрЛП(Слово);

КонецПроцедуры

Функция НайтиКириллицу(Знач Слово)

	Алфавит   = Инструменты.ПолучитьАлфавит();
	СловоНРег = НРег(Слово);

	Для Каждого Буква Из Алфавит Цикл
		Если СтрНайти(СловоНРег, Буква) <> 0 Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;

	Возврат Ложь;

КонецФункции

#КонецОбласти



