#Использовать oint
#Использовать "../../tools"
#Использовать "../../help"
#Использовать "../../data"
#Использовать "../../env"

Перем Отладка;           // Флаг вывода отладочной информации
Перем Тестирование;      // Флаг отключения отправки данных после обработки

Перем Парсер;            // Объект парсера входящих данных 
Перем ОбъектОПИ;         // Объект работы с методами ОПИ

Перем ФайлВывода;        // Путь перенаправления вывода в файл

Перем ТаблицаПараметров; // Таблица параметров текущей библиотеки
Перем ТекущаяКоманда;    // Имя текущей команды

#Область СлужебныеПроцедурыИФункции

#Область Основные

Процедура ОсновнойОбработчик()
	
	Отладка        = Ложь;
	Тестирование   = Ложь;

	Парсер         = Новый CommandLineArgumentParser();
	ОбъектОПИ      = Новый LibraryComposition();
	
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

		ВсеКоманды = ОбъектОПИ.ПолучитьСоответствиеКомандМодулей();
		Версия     = ОбъектОПИ.ПолучитьВерсию();

		Help.ВывестиНачальнуюСтраницу(ВсеКоманды, Версия);

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
		Help.ВывестиСообщениеИсключения("Команда", ФайлВывода);
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
		ОбработатьОшибочныйВывод(Вывод, ИнформацияОбОшибке());
	КонецПопытки;
	
КонецПроцедуры

Функция ПолучитьРезультатОбработки(Знач Команда, Знач Параметры)

	Метод     = Параметры["Метод"];
	Ответ     = "Функция вернула пустое значение";

	ЧислоСтандартныхПараметров = 4;

	Если Не ЗначениеЗаполнено(Метод) Или Метод = "--help" Тогда
		Help.ВывестиСправкуПоМетодам(Команда, ТаблицаПараметров);
	КонецЕсли;

	Если Параметры.Количество() = ЧислоСтандартныхПараметров Или Параметры["--help"] Тогда

		ОтборКоманды      = Новый Структура("МетодПоиска", вРег(Метод));
		ПараметрыМетода   = ТаблицаПараметров.НайтиСтроки(ОтборКоманды);
	
		Если Не ЗначениеЗаполнено(ПараметрыМетода) Тогда
			Help.ВывестиСообщениеИсключения("Метод", ФайлВывода);
		КонецЕсли;

		Help.ВывестиСправкуПоПараметрам(ПараметрыМетода);
	КонецЕсли;

	СтруктураВыполнения = ОбъектОПИ.СформироватьСтрокуВызоваМетода(Параметры, Команда, Метод);

	Если СтруктураВыполнения["Ошибка"] Тогда
		Help.ВывестиСообщениеИсключения(СтруктураВыполнения["Результат"], ФайлВывода);
	Иначе
		ТекстВыполнения = СтруктураВыполнения["Результат"];
	КонецЕсли;

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
	
		Вывод = OPI_Инструменты.JSONСтрокой(Вывод, , , Ложь);

	КонецЕсли;

КонецПроцедуры

Процедура УстановитьРежимОтладки(Знач Параметры)

	Если Параметры["--debug"] Тогда
		Отладка         = Истина;
		ПеременнаяСреды = "YES";
	Иначе
		Отладка         = Ложь;
		ПеременнаяСреды = "NO"
	КонецЕсли;

	УстановитьПеременнуюСреды("OINT_DEBUG", ПеременнаяСреды);

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

Процедура ОбработатьОшибочныйВывод(Вывод, ИнформацияОбОшибке)

	Информация = "";
	Если ЗначениеЗаполнено(Вывод) Тогда

		Если Отладка Или Тестирование Тогда
			Информация = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке);
		КонецЕсли;

		СообщитьРезультат(Вывод);
	Иначе

		Если Отладка Или Тестирование Тогда
			Информация = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке);
		Иначе
			Информация = КраткоеПредставлениеОшибки(ИнформацияОбОшибке);
		КонецЕсли;
	
	КонецЕсли;
	
	Help.ВывестиСообщениеИсключения(Информация, ФайлВывода);
	
КонецПроцедуры

Процедура СообщитьРезультат(Знач Текст, Знач Статус = "")

	Если Не ЗначениеЗаполнено(Статус) Тогда
		Статус = СтатусСообщения.БезСтатуса;
	КонецЕсли;

	Если ЗначениеЗаполнено(ФайлВывода) Тогда
		Текст = ЗаписатьЗначениеВФайл(Текст, ФайлВывода);
	ИначеЕсли ТипЗнч(Текст) = Тип("ДвоичныеДанные") Тогда
		Текст = "Похоже, что в ответе пришли двоичные данные! "
		    + "В следующий раз используйте опцию --out для указания пути их сохранения";
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
		Возврат "Файл размером " 
		    + Строка(Окр(ЗаписанныйФайл.Размер() / ЕдиницаДанных, 3)) 
			+ " МБ был записан в " 
			+ ЗаписанныйФайл.ПолноеИмя;
	Иначе
		ВызватьИсключение "Файл не был записан! Используйте флаг --debug для получения дополнительной информации";
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
		Информация = ОписаниеОшибки();
	Иначе
		Информация = КраткоеПредставлениеОшибки(ИнформацияОбОшибке());
	КонецЕсли;

	Help.ВывестиСообщениеИсключения(Информация, ФайлВывода);

КонецПопытки;

