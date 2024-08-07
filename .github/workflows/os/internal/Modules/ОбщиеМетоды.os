#Использовать "./internal"

Функция ПолучитьДанныеПроекта() Экспорт

	ФайлДанныхПроекта = "./service/project.json";

	ДанныеПроекта = Инструменты.ПрочитатьФайлJSON(ФайлДанныхПроекта);
	ОбновитьНомерВерсии(ДанныеПроекта);

	Инструменты.ЗаписатьФайлJSON(ФайлДанныхПроекта, ДанныеПроекта);

	Возврат ДанныеПроекта;

КонецФункции

Процедура ОбновитьНомерВерсии(ДанныеПроекта)

	Корень                 = ДанныеПроекта["root"];
	ОсновнойЯзык           = ДанныеПроекта["mainLang"];
	КаталогКонфигурации    = ДанныеПроекта["configurationSrc"];

	ОсновнойПутьИсходников = Корень + ОсновнойЯзык + "/";
	ПутьКонфигурации       = ОсновнойПутьИсходников + КаталогКонфигурации;
	ПутьMDO                = ПутьКонфигурации + "Configuration/Configuration.mdo";

	Версия = "";

	ЧтениеДанныхКонфигурации = Новый ЧтениеXML();
	ЧтениеДанныхКонфигурации.ОткрытьФайл(ПутьMDO);

	Пока ЧтениеДанныхКонфигурации.Прочитать() Цикл
		Если Строка(ЧтениеДанныхКонфигурации.Имя) = "version" Тогда
			ЧтениеДанныхКонфигурации.Прочитать();
			Версия = Строка(ЧтениеДанныхКонфигурации.Значение);
			Прервать;
		КонецЕсли;
	КонецЦикла;

	ДанныеПроекта.Вставить("version", Версия);

КонецПроцедуры