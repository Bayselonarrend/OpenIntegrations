Функция ПолучитьСопоставлениеФайлов()

	Сопоставление = Новый Соответствие();
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_GoogleCalendar/Module.bsl"			, "./OInt/core/Modules/OPI_GoogleCalendar.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_GoogleDrive/Module.bsl"			, "./OInt/core/Modules/OPI_GoogleDrive.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_GoogleWorkspace/Module.bsl"			, "./OInt/core/Modules/OPI_GoogleWorkspace.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_Notion/Module.bsl"				, "./OInt/core/Modules/OPI_Notion.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_Telegram/Module.bsl"			, "./OInt/core/Modules/OPI_Telegram.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_Twitter/Module.bsl"				, "./OInt/core/Modules/OPI_Twitter.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_Viber/Module.bsl"				, "./OInt/core/Modules/OPI_Viber.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_VK/Module.bsl"				, "./OInt/core/Modules/OPI_VK.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_YandexDisk/Module.bsl"			, "./OInt/core/Modules/OPI_YandexDisk.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_YandexID/Module.bsl"			, "./OInt/core/Modules/OPI_YandexID.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_Тесты/Module.bsl"			    	, "./OInt/tests/Modules/internal/OPI_Тесты.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_ПолучениеДанныхТестов/Module.bsl"		, "./OInt/tools/Modules/OPI_ПолучениеДанныхТестов.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_Инструменты/Module.bsl"			, "./OInt/tools/Modules/internal/Modules/OPI_Инструменты.os");
	Сопоставление.Вставить("./OPI/src/CommonModules/OPI_Криптография/Module.bsl"			, "./OInt/tools/Modules/internal/Modules/OPI_Криптография.os");
	
	Возврат Сопоставление;
КонецФункции 

Функция ПолучитьСоответствиеЗамен()

	СоответствиеЗамен = Новый Соответствие();
	СоответствиеЗамен.Вставить("// #Использовать"			, "#Использовать");
	СоответствиеЗамен.Вставить("//#Использовать" 			, "#Использовать");
	СоответствиеЗамен.Вставить("УстановитьБезопасныйРежим(Истина);"	, "");
	СоответствиеЗамен.Вставить("УстановитьБезопасныйРежим(Ложь);"	, "");

	Возврат СоответствиеЗамен;

КонецФункции

Процедура ВыполнитьОбработку()

	Сообщить("Начало конвертации OPI -> OInt");
	Сообщить("------------------------------");
	
	Начало = ТекущаяДата();

	СоответствиеМодулей = ПолучитьСопоставлениеФайлов();

	Для Каждого ПараМодулей Из СоответствиеМодулей Цикл

		Сообщить(Символы.ПС);
		ПортироватьФайл(ПараМодулей.Ключ, ПараМодулей.Значение);

	КонецЦикла;

	Сообщить("------------------------------");
	Сообщить("Обработка завершена! Длительность - " + Строка(ТекущаяДата() - Начало));

КонецПроцедуры

#Область СлужебныеПроцедурыИФункции

Процедура ПортироватьФайл(Знач Файл1С, Знач ФайлОС)
	
	ФайлМодуля = Новый Файл(Файл1С);

	МодульОС   = Новый Файл(ФайлОС);
	ИмяМодуля  = МодульОС.Имя;

	Если ФайлМодуля.Существует() Тогда
		ВыводСообщенияПроцесса(ИмяМодуля, "Начало обработки файла");
	Иначе
		ВыводСообщенияПроцесса(ИмяМодуля, "Файл не существует. Пропускаем");
		Возврат;
	КонецЕсли;

	Модуль = ПрочитатьМодуль(Файл1С, ИмяМодуля);

	Если СтрДлина(Модуль) = 0 Тогда
		ВыводСообщенияПроцесса(ИмяМодуля, "Модуль пустой. Пропускаем");
		Возврат;
	КонецЕсли;

	ОбработатьЗаменыМодуля(ИмяМодуля, Модуль);
	ЗаписатьМодуль(ФайлОС, Модуль, ИмяМодуля);
	
КонецПроцедуры

Функция ПрочитатьМодуль(Знач ФайлМодуля, Знач ИмяМодуля)

	ВыводСообщенияПроцесса(ИмяМодуля, "Начало чтения текста модуля");

	ЧтениеТекста = Новый ЧтениеТекста(ФайлМодуля);
	Модуль       = ЧтениеТекста.Прочитать();
	ЧтениеТекста.Закрыть();
	
	ВыводСообщенияПроцесса(ИмяМодуля, "Модуль прочитан. Длина - " + Строка(СтрДлина(Модуль)));
	
	Возврат Модуль;

КонецФункции

Процедура ЗаписатьМодуль(Знач ФайлМодуля, Знач Модуль, Знач ИмяМодуля)

	ВыводСообщенияПроцесса(ИмяМодуля, "Начало записи модуля");

	ТекстовыйДокумент = Новый ТекстовыйДокумент();
	ТекстовыйДокумент.УстановитьТекст(Модуль);
	ТекстовыйДокумент.Записать(ФайлМодуля);

	ВыводСообщенияПроцесса(ИмяМодуля, "Модуль записан");

КонецПроцедуры

Процедура ВыводСообщенияПроцесса(Знач ИмяФайла, Знач Действие)

	Длина = 30;

	Пока СтрДлина(ИмяФайла) < Длина Цикл
		ИмяФайла = ИмяФайла + " ";
	КонецЦикла;

	Сообщить("Конвертация | " + ИмяФайла + " | " + Действие);

КонецПроцедуры

Процедура ОбработатьЗаменыМодуля(Знач ИмяМодуля, Модуль)

	ВыводСообщенияПроцесса(ИмяМодуля, "Начало произведения замен");

	СоответствиеЗамен = ПолучитьСоответствиеЗамен();

	Для Каждого Замена Из СоответствиеЗамен Цикл
		Модуль = СтрЗаменить(Модуль, Замена.Ключ, Замена.Значение);
	КонецЦикла;

	ВыводСообщенияПроцесса(ИмяМодуля, "Окончание произведения замен");

КонецПроцедуры

#КонецОбласти

ВыполнитьОбработку();
