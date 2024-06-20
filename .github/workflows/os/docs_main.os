#Использовать osparser
#Использовать cmdline

Перем ТекущийМодуль;
Перем Парсер;
Перем Расположение;
Перем СПодкаталогами;
Перем КаталогДокументации;
Перем КаталогЛокализации;
Перем КаталогЛогов;
Перем КаталогПримеров;
Перем КаталогЗначений;
Перем КаталогCLI;
Перем СписокОбластей;
Перем ТекущаяОбласть;
Перем СчетчикОбласти;
Перем Словарь;
Перем Транслитация;
Перем СчетчикБиблиотеки;
Перем СоответствиеЗаголовков;

Процедура ПриСозданииОбъекта()  

	Расположение        = "./src/ru/OInt";
	СПодкаталогами      = Истина;
	КаталогДокументации = "./docs/ru/md";
	КаталогЛокализации  = "./docs/en/md";
	КаталогЛогов        = "./docs/ru/results/";
	КаталогПримеров     = "./docs/ru/examples/";
	КаталогЗначений     = "./docs/ru/data/";
	КаталогCLI          = "./docs/ru/cli/";
	ПутьКСловарю        = "./service/dictionaries/en.json";
	СписокОбластей      = Новый СписокЗначений();
	ТекущаяОбласть      = "";
	СчетчикОбласти      = 0;

	СоответствиеЗаголовков = Новый Соответствие();

	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.ОткрытьФайл(ПутьКСловарю);
	Словарь = ПрочитатьJSON(ЧтениеJSON, Истина);
	ЧтениеJSON.Закрыть();

	ПолучитьТаблицуТранслитации();
	ПроверитьСоздатьКаталог(КаталогДокументации);
    СоздатьФайлыДокументации();
	
	ПеревестиДокументацию();


КонецПроцедуры

#Область СлужебныеПроцедурыИФункции

#Область ФормированиеДокументации

Процедура СоздатьФайлыДокументации()

    ОбщийМассивМодулей = Новый Массив;
	ФайлыМодулей       = НайтиФайлы(Расположение, "*.os", СПодкаталогами);

	Для Каждого Модуль Из ФайлыМодулей Цикл

		Если Модуль.ИмяБезРасширения = "OPI_YandexID" 
			Или Модуль.ИмяБезРасширения = "OPI_GoogleWorkspace" Тогда
			Продолжить;
		КонецЕсли;
		
		ОбщийМассивМодулей.Добавить(Модуль);
	КонецЦикла;

    Для Каждого Модуль Из ОбщийМассивМодулей Цикл

        ТекущийМодуль = Новый ТекстовыйДокумент();
		ТекущийМодуль.Прочитать(Модуль.ПолноеИмя);
        РазобратьМодуль(ТекущийМодуль, Модуль.ИмяБезРасширения);
	  
    КонецЦикла;

КонецПроцедуры

Процедура СоздатьСтраницуДокументации(СтруктураМетода, Счетчик = 1)

	Раздел    = СтрЗаменить(СтруктураМетода["Каталог"], "_", "");
	Результат = ПолучитьРезультатМетода(Раздел, СтруктураМетода["ИмяМетода"]);
	Область   = СтруктураМетода["Область"];

	Если ТекущаяОбласть <> Область Тогда
		ТекущаяОбласть = Область;
		СчетчикОбласти = 1;
		СчетчикБиблиотеки = СчетчикБиблиотеки + 1;
	КонецЕсли;

	ТранслитированноеИмя     = ПеревестиИмя(СтруктураМетода["ИмяМетода"]);
	ТранслитированнаяОбласть = ПеревестиИмя(Область);

	ТранслитированноеИмя     = СтрЗаменить(Синонимайзер(ТранслитированноеИмя), " ", "-");
	ТранслитированнаяОбласть = СтрЗаменить(Синонимайзер(ТранслитированнаяОбласть), " ", "-");

	СинонимОбласти   = СтрЗаменить(ТранслитированнаяОбласть, "-", " ");
	ЗаголовокОбласти = Синонимайзер(Область);

	СоответствиеЗаголовков.Вставить(ЗаголовокОбласти, СинонимОбласти);
	
	ИмяМодуляБезПрефикса     = СтрЗаменить(СтруктураМетода["ИмяМодуля"], "OPI_", "");

	КаталогБиблиотеки = КаталогДокументации + "/" + СтруктураМетода["Каталог"];
	КаталогОбласти    = КаталогБиблиотеки + "/" + ТранслитированнаяОбласть;
	КаталогКартинок   = КаталогОбласти + "/" + "img";
	ПутьДанных        = КаталогЗначений + ИмяМодуляБезПрефикса + "/" + СтруктураМетода["ИмяМетода"] + ".json";
	ФайлДанных        = Новый Файл(ПутьДанных);

	Если ФайлДанных.Существует() Тогда
		ЧтениеJSON = Новый ЧтениеJSON();
		ЧтениеJSON.ОткрытьФайл(ПутьДанных);
		СтруктураЗначений = ПрочитатьJSON(ЧтениеJSON, Истина);
		ЧтениеJSON.Закрыть();
	Иначе
		СтруктураЗначений = Новый Соответствие();
	КонецЕсли;

	ПроверитьСоздатьКаталог(КаталогБиблиотеки);
	ПроверитьСоздатьКаталог(КаталогОбласти);
	ПроверитьСоздатьКаталог(КаталогКартинок);

	СтруктураКатегории = Новый Структура("label,position", ЗаголовокОбласти, Строка(СчетчикБиблиотеки));
	ФайлКатегории      = КаталогОбласти + "/_category_.json";

	Запись = Новый ЗаписьJSON;
	ПараметрыЗаписиJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Авто);
	Запись.ОткрытьФайл(ФайлКатегории, , , ПараметрыЗаписиJSON);
	ЗаписатьJSON(Запись, СтруктураКатегории);
	Запись.Закрыть();
	
	Макет = Новый ТекстовыйДокумент();
	Макет.Прочитать("./.github/workflows/os/template.md", "UTF-8");

	Макет = Макет.ПолучитьТекст();

	Макет = СтрЗаменить(Макет, "@Счетчик"             , Строка(СчетчикОбласти));
	Макет = СтрЗаменить(Макет, "@Заголовок"           , СтруктураМетода["Заголовок"]);
	Макет = СтрЗаменить(Макет, "@Описание"            , СтруктураМетода["Описание"]);
	Макет = СтрЗаменить(Макет, "@Объявление"          , СтруктураМетода["Объявление"]);
	Макет = СтрЗаменить(Макет, "@ВозвращаемоеЗначение", СтруктураМетода["ВозвращаемоеЗначение"]);
	Макет = СтрЗаменить(Макет, "@Результат"           , Результат);

	ТаблицаПараметров = "";
	Вызов1С           = ПолучитьВызов1С(СтруктураМетода["ИмяМодуля"], СтруктураМетода["ИмяМетода"]);

	ПутьCLI  = КаталогCLI + ИмяМодуляБезПрефикса + "/" + СтруктураМетода["ИмяМетода"] + ".txt";
	ФайлCLI  = Новый Файл(ПутьCLI);
	ВызовCLI = "";

	Если Не ФайлCLI.Существует() Тогда
		
		КаталогТекущиегоCLI  = КаталогCLI + ИмяМодуляБезПрефикса;
		ФайлКаталога = Новый Файл(КаталогТекущиегоCLI);

		Если Не ФайлКаталога.Существует() Тогда
			СоздатьКаталог(КаталогТекущиегоCLI);
		КонецЕсли;

		ВызовCLI = "oint " + СтруктураМетода["Команда"] + " " + СтруктураМетода["ИмяМетода"];

		Для каждого ПараметрМетода Из СтруктураМетода["Параметры"] Цикл
			
			Если Не ЗначениеЗаполнено(ПараметрМетода.Опция) Или Не СтруктураМетода["ЕстьCLI"] Тогда
				Сообщить("Метод не имеет опции: " + СтруктураМетода["Заголовок"]);
				Возврат;
			КонецЕсли;

			ТаблицаПараметров = ТаблицаПараметров + "  | " 
				+ ПараметрМетода.Имя + " | "
				+ ПараметрМетода.Опция + " | "
				+ ПараметрМетода.Типы  + " | "
				+ ПараметрМетода.Описание + " |"
				+ Символы.ПС;

			ВызовCLI = ВызовCLI + " " + ПараметрМетода.Опция + " ";
			ВызовCLI = ВызовCLI + ОпределитьЗначениеОпции(ПараметрМетода.Опция, СтруктураЗначений[ПараметрМетода.Имя]);

		КонецЦикла;
	
		ВызовCLI = СокрЛП(ВызовCLI);
		ТекстCLI = Новый ТекстовыйДокумент();
		ТекстCLI.УстановитьТекст(ВызовCLI);
		ТекстCLI.Записать(ПутьCLI);
		
	Иначе

		Для каждого ПараметрМетода Из СтруктураМетода["Параметры"] Цикл
			
			Если Не ЗначениеЗаполнено(ПараметрМетода.Опция) Или Не СтруктураМетода["ЕстьCLI"] Тогда
				Сообщить("Метод не имеет опции: " + СтруктураМетода["Заголовок"]);
				Возврат;
			КонецЕсли;

			ТаблицаПараметров = ТаблицаПараметров + "  | " 
				+ ПараметрМетода.Имя + " | "
				+ ПараметрМетода.Опция + " | "
				+ ПараметрМетода.Типы  + " | "
				+ ПараметрМетода.Описание + " |"
				+ Символы.ПС;
		КонецЦикла;

		ТекстCLI = Новый ТекстовыйДокумент();
		ТекстCLI.Прочитать(ПутьCLI);

		Для Н = 1 По ТекстCLI.КоличествоСтрок() Цикл
			ТекущаяСтрока = СокрЛП(ТекстCLI.ПолучитьСтроку(Н));
			Если ЗначениеЗаполнено(ТекущаяСтрока) Тогда
				ВызовCLI = ВызовCLI + "  " + ТекущаяСтрока + Символы.ПС;
			КонецЕсли;
		КонецЦикла;

		Если ЗначениеЗаполнено(ВызовCLI) Тогда
			ВызовCLI = Лев(ВызовCLI, СтрДлина(ВызовCLI) - 1);
		КонецЕсли;
	
	КонецЕсли;

	Макет = СтрЗаменить(Макет, "@Вызов1С"          , Вызов1С);
	Макет = СтрЗаменить(Макет, "@ВызовCLI"         , ВызовCLI);
	Макет = СтрЗаменить(Макет, "@ТаблицаПараметров", ТаблицаПараметров); 

	НовыйДокумент = Новый ТекстовыйДокумент();
	НовыйДокумент.УстановитьТекст(Макет);
	НовыйДокумент.Записать(КаталогОбласти + "/" + ТранслитированноеИмя + ".md");

	СчетчикОбласти = СчетчикОбласти + 1;

КонецПроцедуры

#КонецОбласти

#Область РазборМодуля

Процедура РазобратьМодуль(ТекущийМодуль, ИмяМодуля)

	СчетчикБиблиотеки    = 1;
	ТекстМодуля          = ТекущийМодуль.ПолучитьТекст();
	СтруктураОбщихДанных = Новый Структура();
	СтруктураОбщихДанных.Вставить("ИмяМодуля", ИмяМодуля);

	ПолучитьДанныеМодуля(СтруктураОбщихДанных, ТекущийМодуль);

	Если Не ЗначениеЗаполнено(СтруктураОбщихДанных["Библиотека"]) Тогда
		Возврат;
	КонеЦесли;

	Парсер          = Новый ПарсерВстроенногоЯзыка;
	СтруктураМодуля = Парсер.Разобрать(ТекстМодуля);

	Для Каждого Метод Из СтруктураМодуля.Объявления Цикл

		Если Метод.Тип = "ОбъявлениеМетода" И Метод.Сигнатура.Экспорт = Истина Тогда
			РазобратьМетод(ТекущийМодуль, Метод, СтруктураОбщихДанных);	
		КонецЕсли;

		Если Метод.Тип = "ИнструкцияПрепроцессораОбласть" Тогда
			СписокОбластей.Добавить(Метод.Начало.НомерСтроки, Метод.Имя);
	    КонецЕсли;

	КонецЦикла;

	СписокОбластей.СортироватьПоЗначению();

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

#КонецОбласти

#Область РазборМетода

Процедура РазобратьМетод(ТекстовыйДокумент, Метод, СтруктураДанных)

	НомерСтроки         = Метод.Начало.НомерСтроки;
	ИмяМетода           = Метод.Сигнатура.Имя;
	Объявление          = "";

	Для Н = НомерСтроки По Метод.Конец.НомерСтроки Цикл

		Часть      = СокрЛП(ТекстовыйДокумент.ПолучитьСтроку(Н));
		Объявление = Объявление + Часть;

		Если Не ЗначениеЗаполнено(Часть) Тогда
			Прервать;
		КонецЕсли;

	КонецЦикла;
	
	Для Каждого Область Из СписокОбластей Цикл
		Если НомерСтроки > Область.Значение Тогда
			СтруктураДанных.Вставить("Область", Область.Представление);
		КонецЕсли;
	КонецЦикла;

	МассивКомментария        = ПарсингКомментария(ТекстовыйДокумент, НомерСтроки, СтруктураДанных);
	МассивПараметров         = Новый Массив;
	МассивОписанийПараметров = Новый Массив;

	Если МассивКомментария.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	СформироватьСтруктуруМетода(МассивКомментария, МассивПараметров, СтруктураДанных);
	СформироватьМассивОписанийПараметров(МассивПараметров, Метод, МассивОписанийПараметров);

	СтруктураДанных.Вставить("ИмяМетода" , ИмяМетода);
	СтруктураДанных.Вставить("Объявление", Объявление);
	СтруктураДанных.Вставить("Параметры" , МассивОписанийПараметров);

	СоздатьСтраницуДокументации(СтруктураДанных);

КонецПроцедуры

Функция ПарсингКомментария(Знач ТекстовыйДокумент, Знач НомерСтроки, СтруктураДанных)

	ТекущаяСтрока       = ТекстовыйДокумент.ПолучитьСтроку(НомерСтроки - 1);
	ТекстКомментария    = ТекущаяСтрока;
	
	Счетчик	= 1;
	Пока СтрНайти(ТекущаяСтрока, "//") > 0 Цикл

		Счетчик = Счетчик + 1;

		ТекущаяСтрока    = ТекстовыйДокумент.ПолучитьСтроку(НомерСтроки - Счетчик);
		ТекстКомментария = ТекущаяСтрока + Символы.ПС + ТекстКомментария;

	КонецЦикла;

    Если СтрНайти(ТекстКомментария, "!NOCLI") > 0 Тогда
        СтруктураДанных.Вставить("ЕстьCLI", Ложь);
	Иначе
		СтруктураДанных.Вставить("ЕстьCLI", Истина);
    КонецЕсли;

    МассивКомментария = СтрРазделить(ТекстКомментария, "//", Ложь);

    Если МассивКомментария.Количество() = 0 Тогда
		Возврат Новый Массив;
    Иначе
        МассивКомментария.Удалить(0);
    КонецЕсли;

    Возврат МассивКомментария;

КонецФункции

Процедура СформироватьСтруктуруМетода(Знач МассивКомментария, МассивПараметров, СтруктураДанных)

	ОписаниеМетода      = "";
	ЗаписыватьПараметры = Ложь;
    ЗаписыватьОписание  = Истина;

	Счетчик = 0;
	Для Каждого СтрокаКомментария Из МассивКомментария Цикл

        Счетчик = Счетчик + 1;

        Если Не ЗначениеЗаполнено(СокрЛП(СтрокаКомментария)) Тогда
            ЗаписыватьОписание = Ложь;
        КонецЕсли;
            
        Если ЗаписыватьОписание = Истина И Счетчик > 1 Тогда
            ОписаниеМетода = СокрЛП(ОписаниеМетода) + " " + СокрЛП(СтрокаКомментария);
        КонецЕсли;

        Если СтрНайти(СтрокаКомментария, "Параметры:") > 0 Тогда
            ЗаписыватьПараметры = Истина;
            ЗаписыватьОписание  = Ложь;

        ИначеЕсли СтрНайти(СтрокаКомментария, "Возвращаемое значение:") > 0 Тогда
			СтруктураДанных.Вставить("ВозвращаемоеЗначение", МассивКомментария[Счетчик]);
            Прервать;

        ИначеЕсли ЗаписыватьПараметры = Истина 
            И ЗначениеЗаполнено(СокрЛП(СтрокаКомментария)) 
            И Не СтрНачинаетсяС(СокрЛП(СтрокаКомментария), "*") = 0 Тогда
            
            МассивПараметров.Добавить(СтрокаКомментария);

        Иначе
            Продолжить;
        КонецЕсли;

    КонецЦикла;

	СтруктураДанных.Вставить("Описание" , ОписаниеМетода);
	СтруктураДанных.Вставить("Заголовок", СтрЗаменить(СокрЛП(МассивКомментария[0]), "!NOCLI", ""));

КонецПроцедуры

Процедура СформироватьМассивОписанийПараметров(Знач МассивПараметров, Знач Метод, МассивОписанийПараметров)

	Разделитель = "-";

	Для Каждого ПараметрМетода Из МассивПараметров Цикл

		МассивЭлементовПараметра = СтрРазделить(ПараметрМетода, Разделитель, Ложь);
		КоличествоЭлементов      = МассивЭлементовПараметра.Количество();
	
		Для Н = 0 По МассивЭлементовПараметра.ВГраница() Цикл
			МассивЭлементовПараметра[Н] = СокрЛП(МассивЭлементовПараметра[Н]);
		КонецЦикла;
	
        Имя1С     = МассивЭлементовПараметра[0];

		Если КоличествоЭлементов >= 4 Тогда
			Имя  = "--" + МассивЭлементовПараметра[3];
		Иначе 
			Имя = "";
		Конецесли;
		Типы      = МассивЭлементовПараметра[1];

		Описание  = ?(КоличествоЭлементов >= 5, МассивЭлементовПараметра[4], МассивЭлементовПараметра[2]);	
		
		СтруктураПараметра = Новый Структура;
		СтруктураПараметра.Вставить("Имя"                , Имя1С);
		СтруктураПараметра.Вставить("Опция"              , Имя);
		СтруктураПараметра.Вставить("Типы"               , Типы);
		СтруктураПараметра.Вставить("Описание"           , Описание);
		СтруктураПараметра.Вставить("ЗначениеПоУмолчанию", ПолучитьЗначениеПараметраПоУмолчанию(Имя1С, Метод));

		МассивОписанийПараметров.Добавить(СтруктураПараметра);
         
    КонецЦикла;

КонецПроцедуры

#КонецОбласти

#Область Инструменты

Функция ПолучитьВызов1С(Модуль, Метод)

	Результат = "";

	ИмяКаталога = СтрЗаменить(Модуль, "OPI_", "");
	ИмяФайла    = Метод + ".txt";

	ПутьПримера = КаталогПримеров + ИмяКаталога + "/" + ИмяФайла;
	ФайлПримера = Новый Файл(ПутьПримера);

	Если ФайлПримера.Существует() Тогда
		ТекстПримера = Новый ТекстовыйДокумент();
		ТекстПримера.Прочитать(ПутьПримера);

		Результат = "";

		Для Н = 1 По ТекстПримера.КоличествоСтрок() Цикл
	
			ТекущаяСтрока = СокрЛП(ТекстПримера.ПолучитьСтроку(Н));
			Результат = Результат + "  " + ТекущаяСтрока + Символы.ПС;
	
		КонецЦикла;
	
		Если ЗначениеЗаполнено(Результат) Тогда
			Результат = Лев(Результат, СтрДлина(Результат) - 1);

			Пока СтрНайти(Результат, Символы.ПС + Символы.ПС) <> 0 Цикл
				Результат = СтрЗаменить(Результат, Символы.ПС + Символы.ПС, Символы.ПС);
			КонецЦикла;
			
		КонецЕсли;

	КонецЕсли;

	Возврат Результат;

КонецФункции

Функция ОпределитьЗначениеОпции(Опция, Значение = "")

	Если ЗначениеЗаполнено(Значение) Тогда
		Опция = """" + Строка(Значение) + """";
	Иначе
		Опция = "%" + СтрЗаменить(Опция, "-", "") + "%";
	КонецЕсли;

	Возврат Опция;

КонецФункции

Процедура ПроверитьСоздатьКаталог(Путь)

	Каталог = Новый Файл(Путь);

	Если Не Каталог.Существует() Тогда
		СоздатьКаталог(Путь);
    КонецЕсли;

КонецПроцедуры

Функция ПолучитьЗначениеПараметраПоУмолчанию(Знач Имя, Знач Метод)

    Значение = "";

    Для Каждого ПараметрМетода Из Метод.Сигнатура.Параметры Цикл

        Если ПараметрМетода.Имя = Имя Тогда

            ЗначениеПараметра = ПараметрМетода.Значение;
            Если ЗначениеЗаполнено(ЗначениеПараметра) Тогда
                Попытка
                    Значение = ЗначениеПараметра["Элементы"][0]["Значение"];
                Исключение 
                    Значение = ЗначениеПараметра.Значение;
                КонецПопытки;
                Значение = ?(ЗначениеЗаполнено(Значение), Значение, "Пустое значение");
            КонецЕсли;

        КонецЕсли;

    КонецЦикла;

    Возврат Значение;

КонецФункции

Функция ТранслитироватьСтроку(Знач Значение)

	Значение     = нРег(Значение);

	Для Каждого ЗаменяемыйСимвол Из Транслитация Цикл
		Значение = СтрЗаменить(Значение, ЗаменяемыйСимвол.Ключ, ЗаменяемыйСимвол.Значение);
	КонецЦикла;

	Значение = ВРег(Лев(Значение,1)) + Сред(Значение,2);
	Возврат Значение;

КонецФункции

Функция ПеревестиИмя(Значение)

	ПереведенноеИмя = Словарь[Значение];

	Если Не ЗначениеЗаполнено(ПереведенноеИмя) Тогда
		ПереведенноеИмя = ТранслитироватьСтроку(Значение);
		ПереведенноеИмя = СтрЗаменить(ПереведенноеИмя, "(", "");
		ПереведенноеИмя = СтрЗаменить(ПереведенноеИмя, ")", "");
		ПереведенноеИмя = СтрЗаменить(ПереведенноеИмя, "-", " ");
	КонецЕсли;

	Возврат ПереведенноеИмя;

КонецФункции

 Функция Синонимайзер(ИмяРеквизита)
    
    Перем Синоним, ъ, Символ, ПредСимвол, СледСимвол, Прописная, ПредПрописная, СледПрописная, ДлинаСтроки;
    
    Синоним = ВРег(Сред(ИмяРеквизита, 1, 1));
    ДлинаСтроки = СтрДлина(ИмяРеквизита);
    Для ъ=2 По ДлинаСтроки Цикл
        Символ = Сред(ИмяРеквизита, ъ, 1);
        ПредСимвол = Сред(ИмяРеквизита, ъ-1, 1);
        СледСимвол = Сред(ИмяРеквизита, ъ+1, 1);
        Прописная = Символ = ВРег(Символ);
        ПредПрописная = ПредСимвол = ВРег(ПредСимвол);
        СледПрописная = СледСимвол = ВРег(СледСимвол);
        
        // Варианты:
        Если НЕ ПредПрописная И Прописная Тогда
            Синоним = Синоним + " " + Символ;
        ИначеЕсли Прописная И НЕ СледПрописная Тогда
            Синоним = Синоним + " " + Символ;
        Иначе
            Синоним = Синоним + Символ;
        Конецесли;
    КонецЦикла;

	Синоним = ВРег(Лев(Синоним,1)) + нРег(Сред(Синоним,2));
    
    Возврат Синоним;
    
КонецФункции

Функция ПолучитьРезультатМетода(Знач Раздел, Знач Метод)

	Результат           = "";
	ПутьКаталогаРаздела = КаталогЛогов + Раздел;
	КаталогРаздела      = Новый Файл(ПутьКаталогаРаздела);

	Если Не КаталогРаздела.Существует() Тогда
		Возврат Результат;
	КонецЕсли;

	ПутьЛога = ПутьКаталогаРаздела + "/" + Метод + ".log";
	ФайлЛога = Новый Файл(ПутьЛога);

	Если Не ФайлЛога.Существует() Тогда
		Возврат Результат;
	КонецЕсли;

	ДокументЛога = Новый ТекстовыйДокумент();
	ДокументЛога.Прочитать(ПутьЛога);

	Результат = "";

	Для Н = 1 По ДокументЛога.КоличествоСтрок() Цикл

		ТекущаяСтрока = ДокументЛога.ПолучитьСтроку(Н);

		Если ЗначениеЗаполнено(ТекущаяСтрока) Тогда
			Результат = Результат + ТекущаяСтрока + Символы.ПС;
		КонецЕсли;

	КонецЦикла;

	Если ЗначениеЗаполнено(Результат) Тогда
		Результат = Лев(Результат, СтрДлина(Результат) - 1);
	КонецЕсли;

	Возврат СокрЛП(Результат);

КонецФункции

Процедура ПолучитьТаблицуТранслитации()

	Транслитация = Новый Соответствие();
	
	Транслитация.Вставить("а", "a");
	Транслитация.Вставить("б", "b");
	Транслитация.Вставить("в", "v");
	Транслитация.Вставить("г", "g");
	Транслитация.Вставить("д", "d");
	Транслитация.Вставить("е", "e");
	Транслитация.Вставить("ё", "e");
	Транслитация.Вставить("ж", "zh");
	Транслитация.Вставить("з", "z");
	Транслитация.Вставить("и", "i");
	Транслитация.Вставить("й", "y");
	Транслитация.Вставить("к", "k");
	Транслитация.Вставить("л", "l");
	Транслитация.Вставить("м", "m");
	Транслитация.Вставить("н", "n");
	Транслитация.Вставить("о", "o");
	Транслитация.Вставить("п", "p");
	Транслитация.Вставить("р", "r");
	Транслитация.Вставить("с", "s");
	Транслитация.Вставить("т", "t");
	Транслитация.Вставить("у", "u");
	Транслитация.Вставить("ф", "f");
	Транслитация.Вставить("х", "h");
	Транслитация.Вставить("ц", "ts");
	Транслитация.Вставить("ч", "ch");
	Транслитация.Вставить("ш", "sh");
	Транслитация.Вставить("щ", "sch");
	Транслитация.Вставить("ъ", "");
	Транслитация.Вставить("ы", "y");
	Транслитация.Вставить("ь", "");
	Транслитация.Вставить("э", "e");
	Транслитация.Вставить("ю", "u");
	Транслитация.Вставить("я", "ya");

КонецПроцедуры

Процедура СкопироватьФайлы(Знач КаталогИсточник, Знач КаталогПриемник)
	
	СоздатьКаталог(КаталогПриемник);
	
	МассивФайлов = НайтиФайлы(КаталогИсточник, "*.*", Истина);
	
	Для Каждого Файл Из МассивФайлов Цикл

		Если СтрНайти(Файл.ПолноеИмя, "cli") <> 0 Тогда
			Продолжить;
		КонецЕсли;

		ПолноеИмяИсточник = Файл.ПолноеИмя;
		ПолноеИмяПриемник = КаталогПриемник + СтрЗаменить(Файл.ПолноеИмя, КаталогИсточник, "");
		
		Если Файл.ЭтоКаталог() Тогда
			СоздатьКаталог(ПолноеИмяПриемник);	
		Иначе

			Если Файл.Расширение = ".gif" Или Файл.Расширение = ".png" Тогда
				ФайлПриемник = Новый Файл(ПолноеИмяПриемник);
				Если ФайлПриемник.Существует() Тогда
					Продолжить;
				КонецЕсли;
			КонецЕсли;

			
			КопироватьФайл(ПолноеИмяИсточник, ПолноеИмяПриемник);
		КонецЕсли;
	КонецЦикла;	
	
КонецПроцедуры

#КонецОбласти

#Область Локализация

Процедура ПеревестиДокументацию()

	Сообщить("////////////////////////////////////////////////");
	Сообщить("");
	Сообщить("Начало перевода...");
	Сообщить("");

	СоответствиеЗаголовков.Вставить("Начало работы", "Getting started");
	
	ФайлКаталогаДокументации = Новый Файл(КаталогДокументации);
	ФайлКаталогаЛокализации  = Новый Файл(КаталогЛокализации);

	//УдалитьФайлы(ФайлКаталогаЛокализации.ПолноеИмя);
	СкопироватьФайлы(ФайлКаталогаДокументации.ПолноеИмя, ФайлКаталогаЛокализации.ПолноеИмя);

	ТаблицаСловаря = Новый ТаблицаЗначений();
	ТаблицаСловаря.Колонки.Добавить("Ключ");
	ТаблицаСловаря.Колонки.Добавить("Значение");
	ТаблицаСловаря.Колонки.Добавить("Длина");

	Для Каждого КлючевоеСлово Из Словарь Цикл
		НоваяСтрокаСловаря = ТаблицаСловаря.Добавить();
		НоваяСтрокаСловаря.Ключ      = КлючевоеСлово.Ключ;
		НоваяСтрокаСловаря.Значение  = КлючевоеСлово.Значение;
		НоваяСтрокаСловаря.Длина     = СтрДлина(КлючевоеСлово.Ключ);
	КонецЦикла;

	ТаблицаСловаря.Сортировать("Длина УБЫВ");

	ФайлыЛокализации = НайтиФайлы(ФайлКаталогаЛокализации.ПолноеИмя, "*.md", Истина);
	JsonЛокализации  = НайтиФайлы(ФайлКаталогаЛокализации.ПолноеИмя, "*.json", Истина);

	Для Каждого JSON из JsonЛокализации Цикл
		ФайлыЛокализации.Добавить(JSON);
	КонецЦикла;

	Для Каждого Файл Из ФайлыЛокализации Цикл

		Если Файл.ЭтоКаталог() Тогда
			Продолжить;
		КонецЕсли;

		ТекущийДокумент = Новый ТекстовыйДокумент();
		ТекущийДокумент.Прочитать(Файл.ПолноеИмя, "UTF-8");
		ТекстДокумента = ТекущийДокумент.ПолучитьТекст();

		Для Каждого Слово Из ТаблицаСловаря Цикл
			ТекстДокумента = СтрЗаменить(ТекстДокумента, Слово.Ключ, Слово.Значение);
		КонецЦикла;

		Пока СтрНайти(ТекстДокумента, "  ") <> 0 Цикл
			ТекстДокумента = СтрЗаменить(ТекстДокумента, "  ", " ");
		КонецЦикла;

		ТекстДокумента = СтрЗаменить(ТекстДокумента, " ,", ",");

		ТекущийДокумент.УстановитьТекст(ТекстДокумента);
		ТекущийДокумент.Записать(Файл.ПолноеИмя);

		Для Каждого Буква Из Транслитация Цикл
			Если СтрНайти(ТекстДокумента, Буква.Ключ) <> 0 Тогда
				Сообщить("Ошибка перевода | " + Файл.ПолноеИмя);
				Прервать;
			КонецЕсли;
		КонецЦикла;

	КонецЦикла;
	
	Сообщить("Перевод завершен!");

КонецПроцедуры

#КонецОбласти

#КонецОбласти

//ПриСозданииОбъекта();