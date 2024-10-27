Перем ТаблицаСловаря;
Перем КаталогОригинала;

Процедура ПеревестиПроект(Знач КаталогСловарей, Знач Корень, Знач ОсновнойЯзык, Знач Языки, Знач ФайлыПеревода) Экспорт

	ТаблицаСловаря = Новый ТаблицаЗначений();
	ТаблицаСловаря.Колонки.Добавить("Ключ");
	ТаблицаСловаря.Колонки.Добавить("Значение");
	ТаблицаСловаря.Колонки.Добавить("Длина");
	ТаблицаСловаря.Колонки.Добавить("ИмяМодуля");

	ПутьОригинала    = Корень + ОсновнойЯзык;
	КаталогОригинала = Новый Файл(ПутьОригинала);
	КаталогОригинала = КаталогОригинала.ПолноеИмя;

	Для Каждого Язык Из Языки Цикл

		ПеревестиПоСловарю(КаталогСловарей, Язык, ФайлыПеревода, Корень);

	КонецЦикла;

КонецПроцедуры

Процедура ПеревестиПоСловарю(Знач КаталогСловарей, Знач Язык, Знач Файлы, Знач Корень);

	ПутьПеревода = Корень + Язык;
	ПутьСловаря  = КаталогСловарей + Язык + ".json";
	Словарь      = Новый Файл(ПутьСловаря);

	Если Не Словарь.Существует() Тогда
		Возврат;
	КонецЕсли;

	КаталогПриемник = Новый Файл(ПутьПеревода);
	ПутьКСловарю    = Словарь.ПолноеИмя;
	Язык            = Словарь.ИмяБезРасширения;

	ПолучитьТаблицуСловаря(ПутьКСловарю);

	СкопироватьФайлы(Файлы, КаталогПриемник);

	ФайлыМодулей  = НайтиФайлы(ПутьПеревода, "*", Истина);

	Для Каждого ФайлМодуля Из ФайлыМодулей Цикл

		Если ФайлМодуля.ЭтоКаталог() Или ФайлМодуля.Имя = "packagedef" Тогда
			Продолжить;
		КонецЕсли;

		ПеревестиМодуль(ФайлМодуля.ПолноеИмя);

	КонецЦикла;

	ПеревестиИменаФайлов(ФайлыМодулей);

КонецПроцедуры

Процедура ПеревестиИменаФайлов(ВсеФайлыЛокализации)

	ОтборИменМодулей        = Новый Структура("ИмяМодуля", Истина);
	СтрокиИмен              = ТаблицаСловаря.НайтиСтроки(ОтборИменМодулей);
	УдаляемыеКаталоги       = Новый Массив;

	Для Каждого ФайлЛокализации Из ВсеФайлыЛокализации Цикл

		Если Не ФайлЛокализации.ЭтоКаталог() Тогда
			Продолжить;
		КонецЕсли;

		ТекущийПуть = ФайлЛокализации.ПолноеИмя;
		НовыйПуть   = ТекущийПуть;

		Для Каждого Имя Из СтрокиИмен Цикл
			НовыйПуть = СтрЗаменить(НовыйПуть, Имя.Ключ, Имя.Значение);
		КонецЦикла;

		ФайлНовогоПути = Новый Файл(НовыйПуть);

		Если Не ФайлНовогоПути.Существует() Тогда
			УдаляемыеКаталоги.Добавить(ТекущийПуть);
			СоздатьКаталог(НовыйПуть);
		КонецЕсли;

	КонецЦикла;
	
	Для Каждого ФайлЛокализации Из ВсеФайлыЛокализации Цикл

		Если ФайлЛокализации.ЭтоКаталог() Тогда
			Продолжить;
		КонецЕсли;

		ТекущийПуть = ФайлЛокализации.ПолноеИмя;
		НовыйПуть   = ТекущийПуть;

		Для Каждого Имя Из СтрокиИмен Цикл
			НовыйПуть = СтрЗаменить(НовыйПуть, Имя.Ключ, Имя.Значение);
		КонецЦикла;

		ФайлНовогоПути = Новый Файл(НовыйПуть);

		Если Не ФайлНовогоПути.Существует() Тогда
			ПереместитьФайл(ТекущийПуть, НовыйПуть);
		КонецЕсли;

	КонецЦикла;

	Для Каждого Каталог Из УдаляемыеКаталоги Цикл
		УдалитьФайлы(Каталог);
	КонецЦикла;

КонецПроцедуры

Процедура ПеревестиМодуль(ПутьКМодулю)

	ДокументМодуля = Новый ТекстовыйДокумент();
	ДокументМодуля.Прочитать(ПутьКМодулю, "UTF-8");

	Для Н = 1 По ДокументМодуля.КоличествоСтрок() Цикл

		ТекущаяСтрока = СокрЛП(ДокументМодуля.ПолучитьСтроку(Н));

		Если Не ЗначениеЗаполнено(ТекущаяСтрока) Тогда
			Продолжить;
		КонецЕсли;

		Пока СтрНайти(ТекущаяСтрока, "  ") <> 0 Цикл
			ТекущаяСтрока = СтрЗаменить(ТекущаяСтрока, "  ", " ");
		КонецЦикла;

		ВыводимаяСтрока = СтрЗаменить(ДокументМодуля.ПолучитьСтроку(Н), СокрЛП(ДокументМодуля.ПолучитьСтроку(Н)), ТекущаяСтрока);
		ДокументМодуля.ЗаменитьСтроку(Н, ВыводимаяСтрока);

	КонецЦикла;

	ТекстМодуля = ДокументМодуля.ПолучитьТекст();

	Для Каждого Элемент Из ТаблицаСловаря Цикл

		ТекущееЗначение = Элемент.Значение;

		Пока СтрДлина(ТекущееЗначение) < Элемент.Длина Цикл
			ТекущееЗначение = ТекущееЗначение + " ";
		КонецЦикла;

		ТекстМодуля = СтрЗаменить(ТекстМодуля, Элемент.Ключ, Элемент.Значение);
	КонецЦикла;

	ОбработатьНесовпаденияOneScript(ТекстМодуля, ПутьКМодулю);

	ДокументМодуля.УстановитьТекст(ТекстМодуля);
	ДокументМодуля.Записать(ПутьКМодулю);

КонецПроцедуры

Процедура ПолучитьТаблицуСловаря(ПутьКСловарю)

	Сообщить("Чтение словаря " + ПутьКСловарю);
	ТаблицаСловаря.Очистить();

	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.ОткрытьФайл(ПутьКСловарю);
	ДанныеСловаря = ПрочитатьJSON(ЧтениеJSON, Истина);
	ЧтениеJSON.Закрыть();

	Для Каждого Элемент Из ДанныеСловаря Цикл

		НоваяСтрокаСловаря = ТаблицаСловаря.Добавить();
		НоваяСтрокаСловаря.Ключ      = Элемент.Ключ;
		НоваяСтрокаСловаря.Значение  = Элемент.Значение;
		НоваяСтрокаСловаря.Длина     = СтрДлина(Элемент.Ключ);
		НоваяСтрокаСловаря.ИмяМодуля = СтрНайти(Элемент.Ключ, "OPI_") <> 0;

	КонецЦикла;

	ТаблицаСловаря.Сортировать("Длина УБЫВ");

	ПутьКСловарюКлючевыхСлов = "./service/dictionaries/en_post.json";
	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.ОткрытьФайл(ПутьКСловарюКлючевыхСлов);
	СоответствиеКС = ПрочитатьJSON(ЧтениеJSON, Истина);
	ЧтениеJSON.Закрыть();

	Для Каждого КлючевоеСлово Из СоответствиеКС Цикл
		НоваяСтрокаСловаря = ТаблицаСловаря.Добавить();
		НоваяСтрокаСловаря.Ключ      = КлючевоеСлово.Ключ;
		НоваяСтрокаСловаря.Значение  = КлючевоеСлово.Значение;
		НоваяСтрокаСловаря.Длина     = СтрДлина(КлючевоеСлово.Ключ);
		НоваяСтрокаСловаря.ИмяМодуля = Ложь;
	КонецЦикла;

КонецПроцедуры

Процедура СкопироватьФайлы(Знач МассивФайлов, Знач КаталогПриемник)
	
	ПутьПриемник = КаталогПриемник.ПолноеИмя;

	Если КаталогПриемник.Существует() Тогда
		УдалитьФайлы(ПутьПриемник);
	КонецЕсли;

	СоздатьКаталог(ПутьПриемник);

	Для Каждого Файл Из МассивФайлов Цикл
		Если Файл.ЭтоКаталог() Тогда

			ПолноеИмяИсточник = Файл.ПолноеИмя;
			ПолноеИмяПриемник = ПутьПриемник + СтрЗаменить(Файл.ПолноеИмя, КаталогОригинала, "");
			
			СоздатьКаталог(ПолноеИмяПриемник);	

		КонецЕсли;
	КонецЦикла;	

	Для Каждого Файл Из МассивФайлов Цикл
		Если Не Файл.ЭтоКаталог() Тогда

			ПолноеИмяИсточник = Файл.ПолноеИмя;
			ПолноеИмяПриемник = ПутьПриемник + СтрЗаменить(Файл.ПолноеИмя, КаталогОригинала, "");
			
			КопироватьФайл(ПолноеИмяИсточник, ПолноеИмяПриемник);

		КонецЕсли;
	КонецЦикла;	
	
КонецПроцедуры

Процедура ОбработатьНесовпаденияOneScript(ТекстМодуля, ПутьКМодулю)

	СоответствиеОшибок = Новый Соответствие();
	СоответствиеОшибок.Вставить("ConcatBinaryData"          , "ConcatenateBinaryData");
	СоответствиеОшибок.Вставить("GetTestList"               , "ПолучитьСписокТестов");
	СоответствиеОшибок.Вставить("Exists"                    , "Exist");
	СоответствиеОшибок.Вставить("SetBodyFromBinaryData"     , "SetBodyFromBinary");
	СоответствиеОшибок.Вставить("GetBodyAsBinaryData"       , "ПолучитьТелоКакДвоичныеДанные");
	СоответствиеОшибок.Вставить("FileCopy"                  , "CopyFile");
	СоответствиеОшибок.Вставить("GetBinaryDataFromString"   , "ПолучитьДвоичныеДанныеИзСтроки");
	СоответствиеОшибок.Вставить("GetHexStringFromBinaryData", "ПолучитьHexСтрокуИзДвоичныхДанных");
	СоответствиеОшибок.Вставить("SplitBinaryData"           , "РазделитьДвоичныеДанные");

	ФайлМодуля = Новый Файл(ПутьКМодулю);

	Если СтрНайти(ФайлМодуля.Имя, ".os") <> 0 Тогда
		Для Каждого Ошибка Из СоответствиеОшибок Цикл
			ТекстМодуля = СтрЗаменить(ТекстМодуля, Ошибка.Ключ, Ошибка.Значение);
		КонецЦикла;
	КонецЕсли;

КонецПроцедуры

//ПриСозданииОбъекта();