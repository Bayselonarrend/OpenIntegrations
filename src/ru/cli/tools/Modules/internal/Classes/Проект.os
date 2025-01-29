Перем ПутьКБазе;

#Область СлужеюныйПрограммныйИнтерфейс

Процедура ПриСозданииОбъекта(Проект)
	ПутьКБазе = Проект;
КонецПроцедуры

Процедура Инициализировать() Экспорт
	НормализоватьПроект();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура НормализоватьПроект()

	ФайлБазы   = Новый Файл(ПутьКБазе);
	
	Если ФайлБазы.ЭтоКаталог() Тогда

		Счетчик = 1;

		Пока ФайлБазы.Существует() Цикл
		
			ПутьКБазе   = ПутьКБазе + "/new_project_" + Строка(Счетчик) + ".oint";
			ФайлБазы = Новый Файл(ПутьКБазе);

			Счетчик = Счетчик + 1;

		КонецЦикла;

	КонецЕсли;

	Если Не ФайлБазы.Существует() Тогда
		СоздатьНовыйПроект();
	КонецЕсли;

КонецПроцедуры

Процедура СоздатьНовыйПроект()
	
	СоздатьТаблицуОбработчиков();

КонецПроцедуры

Процедура СоздатьТаблицуОбработчиков()

	СтруктураТаблицы = Новый Структура();
	СтруктураТаблицы.Вставить("id"    , "INTEGER PRIMARY KEY");
	СтруктураТаблицы.Вставить("name"  , "TEXT");
	СтруктураТаблицы.Вставить("secret", "TEXT");

	Результат = OPI_SQLite.СоздатьТаблицу("handlers", СтруктураТаблицы, ПутьКБазе);

КонецПроцедуры

#КонецОбласти