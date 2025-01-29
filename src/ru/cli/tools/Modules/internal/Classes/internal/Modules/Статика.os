Процедура ВернутьСтатику(Контекст, Путь) Экспорт

	ПутьКФайлу = Прав(Путь, СтрДлина(Путь) - 4);
	ПутьКФайлу = ?(Не ЗначениеЗаполнено(ПутьКФайлу) Или ПутьКФайлу = "/", "/index.html", ПутьКФайлу);

	ПутьКФайлуСтатики = КаталогСтатики() + ПутьКФайлу;
	ФайлСтатики       = Новый Файл(ПутьКФайлуСтатики);

	Если ФайлСтатики.Существует() Тогда
		Данные = Новый ФайловыйПоток(ПутьКФайлуСтатики, РежимОткрытияФайла.Открыть);
		Данные.КопироватьВ(Контекст.Ответ.Тело);
		Данные.Закрыть();
	Иначе 
		Контекст.Ответ.КодСостояния = 404;
	КонецЕсли;

КонецПроцедуры

Функция КаталогСтатики() 

	КаталогОбработчика =  СтрЗаменить(ТекущийСценарий().Каталог, "\", "/");

	ЭлементыПути = СтрРазделить(КаталогОбработчика, "/");

	Для Н = 1 По 6 Цикл
    	ЭлементыПути.Удалить(ЭлементыПути.ВГраница());
	КонецЦикла;

	ЭлементыПути.Добавить("web");

	ПутьСтатики = СтрСоединить(ЭлементыПути, "/");
	ПутьСтатики = ПутьСтатики + "/";

	Возврат ПутьСтатики;

КонецФункции