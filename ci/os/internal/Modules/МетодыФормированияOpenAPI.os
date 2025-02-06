Перем ОсновнойКаталог;
Перем ОсновнойФайл;
Перем СоставОПИ;
Перем Язык;


Процедура СформироватьСпецификацию(Знач Языки) Экспорт

	Для Каждого Язык Из Языки Цикл
		СформироватьСпецификациюЯзыка(Язык);
	КонецЦикла

КонецПроцедуры

Процедура СформироватьСпецификациюЯзыка(ТекущийЯзык)

	ОсновнойКаталог = "./docs/" + Язык + "/openapi/";
	ОсновнойФайл    = ОсновнойКаталог + "main.json";
	СоставОПИ       = ЗагрузитьСценарий("./src/" + Язык + "/OInt/data/Classes/LibraryComposition.os");
	КомандыМодули   = СоставОПИ.ПолучитьСоответствиеКомандМодулей();
	Язык            = ТекущийЯзык;
	
	СформироватьОсновнойФайл(КомандыМодули)
КонецПроцедуры

Функция СформироватьОсновнойФайл(КомандыМодули)

	Основа = Новый Структура;
	Основа.Вставить("openapi", "3.0.0");
	Основа.Вставить("info"   , Новый Структура("title, version", "OInt Proxy API", "1.0.0"));

	СоответствиеПутей = Новый Соответствие;
	МассивТэгов       = Новый Массив;
	ШаблонОписания    = "Методы для работы с библиотекой %1";

	Для Каждого Элемент Из КомандыМодули Цикл

		Ключ   = Элемент.Ключ;
		Модуль = Элемент.Значение;

		Если Не СтрНачинаетсяС(Модуль, "OPI_") Тогда
			Продолжить;
		Иначе
			Модуль = СтрЗаменить(Модуль, "OPI_", "");
		КонецЕсли;

		МассивТэгов.Добавить(Новый Структура("name,description", ТРег(Ключ), СтрШаблон(ШаблонОписания, Модуль)));

		СформироватьПути(Ключ, СоответствиеПутей);

	КонецЦикла;

	Основа.Вставить("tags", МассивТэгов);
	Основа.Вставить("paths", СоответствиеПутей);

	ЗаписатьJSONФайл(Основа, ОсновнойФайл);

КонецФункции

Процедура СформироватьПути(Команда, СоответствиеПутей)

	ТаблицаМетодов = СоставОПИ.ПолучитьСостав(Команда);

	ТаблицаМетодов.Свернуть("Метод");
	МассивМетодов  = ТаблицаМетодов.ВыгрузитьКолонку("Метод");
	ШаблонПути     = "/key_for_" + Команда + "_%1";

	КаталогКомандыОснова     = "paths/" + Команда + "/";
	КаталогКомандыМестный    = "./" + КаталогКомандыОснова;
	КаталогКомандыГлобальный = ОсновнойКаталог + КаталогКомандыОснова;

	ФайлКаталогКоманды = Новый Файл(КаталогКомандыГлобальный);

	Если Не ФайлКаталогКоманды.Существует() Тогда
		СоздатьКаталог(КаталогКомандыГлобальный);
	КонецЕсли;

	Для Каждого Метод Из МассивМетодов Цикл

		ТекущийПуть = СтрШаблон(ШаблонПути, Метод);

		СоответствиеРеф = Новый Соответствие();
		СоответствиеРеф.Вставить("$ref", КаталогКомандыМестный + Метод + ".json");
		СоответствиеПутей.Вставить(ТекущийПуть, СоответствиеРеф);
		
	КонецЦикла;

КонецПроцедуры

Процедура ЗаписатьJSONФайл(Данные, Путь)

	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.ОткрытьФайл(Путь, , , Новый ПараметрыЗаписиJSON(, Символы.Таб));

	ЗаписатьJSON(ЗаписьJSON, Данные);
	ЗаписьJSON.Закрыть();

КонецПроцедуры