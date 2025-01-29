#Использовать "internal"

Процедура ВернутьДанные(Контекст, Проект) Экспорт

	Параметры     = Инструменты.ПолучитьПараметры(Контекст);
	Идентификатор = Параметры["id"];

	Если Идентификатор = Неопределено Тогда
		
		Инструменты.ВернутьНеНайдено(Контекст);
		Возврат;

	ИначеЕсли Идентификатор = "new" Тогда

		Страница = СтраницаНового();

	Иначе

		Страница = СтраницаОбработчика(Идентификатор, Идентификатор);

	КонецЕсли;

	Контекст.Ответ.Записать(Страница);

КонецПроцедуры

Функция СтраницаОбработчика(Заголовок, Описание)

	Шаблон = "<h1 class=""title"">%1</h1>
	|<p>%2</p>";

	Возврат СтрШаблон(Шаблон, Заголовок, Описание);

КонецФункции

Функция СтраницаНового()

	Возврат
	"<form id=""new-item-form"" hx-post=""/api/handler"" hx-target=""#main-content"" hx-swap=""innerHTML"">
	|    <div class=""field"">
	|        <label class=""label"">Название</label>
	|        <div class=""control"">
	|            <input class=""input"" type=""text"" name=""name"" required>
	|        </div>
	|    </div>
	|    <div class=""field"">
	|        <label class=""label"">Секрет</label>
	|        <div class=""control"">
	|            <input class=""input"" type=""text"" name=""secret"" required>
	|        </div>
	|    </div>
	|    <div class=""field is-grouped"">
	|        <div class=""control"">
	|            <button class=""button is-link"" type=""submit"">Сохранить</button>
	|        </div>
	|    </div>
	|</form>";


КонецФункции
