﻿#Использовать cmdline
#Использовать oint
#Использовать "../../tools"
#Использовать "../../help"
#Использовать "../../data"

Перем Версия;            // Версия программы
Перем Отладка;           // Флаг вывода отладочной информации
Перем Тестирование;      // Флаг отключения отправки данных после обработки

Перем Парсер;            // Объект парсера входящих данных 
Перем ОбъектОПИ;         // Объект работы с методами ОПИ

Перем ФайлВывода;        // Путь перенаправления вывода в файл

Перем ТаблицаПараметров; // Таблица параметров текущей библиотеки
Перем ТекущаяКоманда;    // Имя текущей команды
Перем Команды;           // Список всех доступных команд

#Область СлужебныеПроцедурыИФункции

#Область Основные

Процедура ОсновнойОбработчик()
	
	Отладка        = Ложь;
	Тестирование   = Ложь;

	Парсер         = Новый ПарсерАргументовКоманднойСтроки();
	ОбъектОПИ      = Новый СоставБиблиотеки();
	Версия         = ОбъектОПИ.ПолучитьВерсию();
	Команды        = ОбъектОПИ.ПолучитьСоответствиеКомандМодулей();
	
	ОпределитьТекущуюКоманду();
	СформироватьКоманду();

	Результат = Парсер.Разобрать(АргументыКоманднойСтроки);
	ВыполнитьОбработкуКоманды(Результат);

КонецПроцедуры

Процедура ОпределитьТекущуюКоманду()

	Если АргументыКоманднойСтроки.Количество() > 0 Тогда
		ТекущаяКоманда = АргументыКоманднойСтроки[0];
	Иначе
		ТекущаяКоманда = Неопределено;
	КонецЕсли;
	
КонецПроцедуры

Процедура СформироватьКоманду()

	Если ТекущаяКоманда = Неопределено Тогда
		Справка.ВывестиНачальнуюСтраницу(Команды, Версия);
		Возврат;
	КонецЕсли;
	
	Команда           = Парсер.ОписаниеКоманды(ТекущаяКоманда);
	ТаблицаПараметров = ОбъектОПИ.ПолучитьСостав(ТекущаяКоманда);

	Если Не ТаблицаПараметров = Неопределено Тогда

		Парсер.ДобавитьПозиционныйПараметрКоманды(Команда, "Метод");
		
		ДобавитьПараметрыКоманды(Парсер, Команда);
		Парсер.ДобавитьПараметрФлагКоманды(Команда, "--help");
		Парсер.ДобавитьПараметрФлагКоманды(Команда, "--debug");
		Парсер.ДобавитьПараметрФлагКоманды(Команда, "--test");

		Парсер.ДобавитьИменованныйПараметрКоманды(Команда, "--out");
		
		Парсер.ДобавитьКоманду(Команда);

	Иначе
		Справка.ВывестиСообщениеИсключения("Команда");
	КонецЕсли;
	
КонецПроцедуры

Процедура ВыполнитьОбработкуКоманды(Знач Данные)
	
	ТекущаяКоманда = Данные["Команда"];
	Параметры      = Данные["ЗначенияПараметров"];
	Вывод		   = "";

	УстановитьРежимОтладки(Параметры);
	УстановитьРежимТеста(Параметры);
	УстановитьФайлВывода(Параметры);
	ВывестиДопИнформацию(Параметры);

	Попытка
			
		Вывод = ПолучитьРезультатОбработки(ТекущаяКоманда, Параметры);

		ОбработатьВыводJSON(Вывод);
		СообщитьРезультат(Вывод, СтатусСообщения.Внимание);

	Исключение
		ОбработатьОшибочныйВывод(Вывод, ErrorInfo());
	КонецПопытки;
	
КонецПроцедуры

Функция ПолучитьРезультатОбработки(Знач Команда, Знач Параметры)

	Модуль    = Команды[Команда];
	Метод     = Параметры["Метод"];
	Ответ     = "The function returned an empty value.";

	ЧислоСтандартныхПараметров = 4;

	Если Не ЗначениеЗаполнено(Метод) Или Метод = "--help" Тогда
		Справка.ВывестиСправкуПоМетодам(Команда, ТаблицаПараметров);
	КонецЕсли;

	ОтборКоманды      = Новый Структура("МетодПоиска", вРег(Метод));
	ПараметрыМетода   = ТаблицаПараметров.НайтиСтроки(ОтборКоманды);

	Если Не ЗначениеЗаполнено(ПараметрыМетода) Тогда
		Справка.ВывестиСообщениеИсключения("Метод");
	КонецЕсли;

	Если Параметры.Количество() = ЧислоСтандартныхПараметров Или Параметры["--help"] Тогда
		Справка.ВывестиСправкуПоПараметрам(ПараметрыМетода);
	КонецЕсли;

	ТекстВыполнения = СформироватьСтрокуВызоваМетода(Параметры, ПараметрыМетода, Модуль, Метод);

	Если Отладка Или Тестирование Тогда
		Сообщить(ТекстВыполнения, СтатусСообщения.Внимание);
	КонецЕсли;

	Если Не Тестирование Тогда
		Выполнить(ТекстВыполнения);
	КонецЕсли;

	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область Вспомогательные

Процедура ДобавитьПараметрыКоманды(Парсер, Команда);
	
	Параметр_ = "Параметр";

	ТаблицаДляИспользования = ТаблицаПараметров.Скопировать(, Параметр_);
	ТаблицаДляИспользования.Свернуть(Параметр_);

	МассивПараметров = ТаблицаДляИспользования.ВыгрузитьКолонку(Параметр_);
	
	Для Каждого Параметр Из МассивПараметров Цикл
		Парсер.ДобавитьИменованныйПараметрКоманды(Команда, Параметр);
	КонецЦикла;
	
КонецПроцедуры

Процедура ОбработатьВыводJSON(Вывод)
	
	Если ПустойВывод(Вывод) Тогда
		Вывод = Новый Структура;
	КонецЕсли;

	Если ТипЗнч(Вывод) = Тип("Структура")
		Или ТипЗнч(Вывод) = Тип("Соответствие")
		Или ТипЗнч(Вывод) = Тип("Массив") Тогда
	
		Вывод = OPI_Tools.JSONString(Вывод, , , Ложь);

	КонецЕсли;

КонецПроцедуры

Функция СформироватьСтрокуВызоваМетода(Знач ПереданныеПараметры, Знач ПараметрыМетода, Знач Модуль, Знач Метод)

	ТекстВыполнения = "";
	СтрокаВызова    = Модуль + "." + Метод + "(";
	Счетчик         = 0;

	Для Каждого НеобходимыйПараметр Из ПараметрыМетода Цикл

		ИмяПараметра      = НеобходимыйПараметр.Параметр;
		ЗначениеПараметра = ПереданныеПараметры.Получить(ИмяПараметра);

		Если ЗначениеЗаполнено(ЗначениеПараметра) Тогда

			ИмяПараметра    = "Параметр" + СтрЗаменить(ИмяПараметра, "--", "_");

			ТекстВыполнения = ТекстВыполнения 
				+ Символы.ПС 
				+ ИмяПараметра
				+ " = """ 
				+ СтрЗаменить(ЗначениеПараметра, """", """""")
				+ """;";

			СтрокаВызова = СтрокаВызова + ИмяПараметра + ", ";
			Счетчик      = Счетчик + 1;

		Иначе
			СтрокаВызова = СтрокаВызова + " , ";
		КонецЕсли;

	КонецЦикла;

	ЛишниеСимволы   = 2;
	СтрокаВызова    = Лев(СтрокаВызова, СтрДлина(СтрокаВызова) - ЛишниеСимволы);
	СтрокаВызова    = СтрокаВызова + ");";
	СтрокаВызова    = "Ответ = " + СтрокаВызова;
	ТекстВыполнения = ТекстВыполнения + Символы.ПС + СтрокаВызова;

	Возврат ТекстВыполнения;

КонецФункции

Процедура УстановитьРежимОтладки(Знач Параметры)

	Если Параметры["--debug"] Тогда
		Отладка = Истина;
	Иначе
		Отладка = Ложь;
	КонецЕсли;

КонецПроцедуры

Процедура УстановитьРежимТеста(Знач Параметры)

	Если Параметры["--test"] Тогда
		Тестирование = Истина;
	Иначе
		Тестирование = Ложь;
	КонецЕсли;

КонецПроцедуры

Процедура УстановитьФайлВывода(Знач Параметры)

	Вывод = Параметры["--out"];

	Если ЗначениеЗаполнено(Вывод) Тогда
		ФайлВывода = Вывод;
	КонецЕсли;

КонецПроцедуры

Процедура ВывестиДопИнформацию(Параметры)

	Если Отладка Или Тестирование Тогда

		Для каждого ВводныйПараметр Из Параметры Цикл
			Сообщить(ВводныйПараметр.Ключ + " : " + ВводныйПараметр.Значение);	
		КонецЦикла;

    КонецЕсли;
	
КонецПроцедуры

Процедура ОбработатьОшибочныйВывод(Вывод, ErrorInfo)

	Информация = "";
	Если ЗначениеЗаполнено(Вывод) Тогда

		Если Отладка Или Тестирование Тогда
			Информация = ПодробноеПредставлениеОшибки(ErrorInfo);
		КонецЕсли;

		СообщитьРезультат(Вывод);
	Иначе

		Если Отладка Или Тестирование Тогда
			Информация = ПодробноеПредставлениеОшибки(ErrorInfo);
		Иначе
			Информация = BriefErrorDescription(ErrorInfo);
		КонецЕсли;
	
	КонецЕсли;
	
	Справка.ВывестиСообщениеИсключения(Информация);
	
КонецПроцедуры

Процедура СообщитьРезультат(Знач Текст, Знач Статус = "")

	Если Не ЗначениеЗаполнено(Статус) Тогда
		Статус = СтатусСообщения.БезСтатуса;
	КонецЕсли;

	Если ЗначениеЗаполнено(ФайлВывода) Тогда
		Текст = ЗаписатьЗначениеВФайл(Текст, ФайлВывода);
	ИначеЕсли ТипЗнч(Текст) = Тип("ДвоичныеДанные") Тогда
		Текст = "It seems that binary data was returned in the response! "
		    + "Next time, use the --out option to specify the path for saving them";
		Статус = СтатусСообщения.Информация;
	Иначе 
		Текст = Строка(Текст);
	КонецЕсли;

    Сообщить(Текст, Статус);
	
КонецПроцедуры

Функция ЗаписатьЗначениеВФайл(Знач Значение, Знач Путь)
	
	СтандартнаяЕдиница = 1024;
	ЕдиницаДанных      = СтандартнаяЕдиница * СтандартнаяЕдиница;
	Значение           = ?(ТипЗнч(Значение) = Тип("ДвоичныеДанные"), Значение, Строка(Значение));

	Если ТипЗнч(Значение) = Тип("Строка") Тогда 

		ВозможныйФайл = Новый Файл(Значение);

		Если ВозможныйФайл.Существует() Тогда
			Путь = Значение;
		Иначе
			Значение = ПолучитьДвоичныеДанныеИзСтроки(Значение);
	    КонецЕсли;

	КонецЕсли;

	Если ТипЗнч(Значение) = Тип("ДвоичныеДанные") Тогда
        Значение.Записать(Путь);
	КонецЕсли;

	ЗаписанныйФайл = Новый Файл(Путь);

	Если ЗаписанныйФайл.Существует() Тогда
		Возврат "File (Size " 
		    + Строка(Окр(ЗаписанныйФайл.Размер() / ЕдиницаДанных, 3)) 
			+ " MB) has been written to " 
			+ ЗаписанныйФайл.ПолноеИмя;
	Иначе
		ВызватьИсключение "The file was not written! Use the --debug flag for additional information";
	КонецЕсли;

КонецФункции

Функция ПустойВывод(Вывод)

	Если ТипЗнч(Вывод) = Тип("ДвоичныеДанные") Тогда
		Возврат Вывод.Размер() = 0;
	Иначе
		Возврат Не ЗначениеЗаполнено(Вывод);
	КонецЕсли;
	
КонецФункции


#КонецОбласти

#КонецОбласти

Попытка
	ОсновнойОбработчик();	
Исключение
	
	Если Отладка Тогда
		Информация = ErrorDescription();
	Иначе
		Информация = BriefErrorDescription(ErrorInfo());
	КонецЕсли;

	Справка.ВывестиСообщениеИсключения(Информация);

КонецПопытки;

