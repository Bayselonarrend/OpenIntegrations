ПутьКСловарю  = "./service/dictionaries/en.json";

ЧтениеJSON = Новый ЧтениеJSON();
ЧтениеJSON.ОткрытьФайл(ПутьКСловарю);
Словарь = ПрочитатьJSON(ЧтениеJSON, Истина);
ЧтениеJSON.Закрыть();

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

ПутьДокозавра = "./docs/docusaurus/";
МассивФайлов = Новый Массив;
МассивФайлов.Добавить(Новый Файл(ПутьДокозавра + "src/components/HomepageFeatures/index.js"));
МассивФайлов.Добавить(Новый Файл(ПутьДокозавра + "src/components/AlternatingFeatures/index.js"));
МассивФайлов.Добавить(Новый Файл(ПутьДокозавра + "src/pages/index.js"));
МассивФайлов.Добавить(Новый Файл(ПутьДокозавра + "docusaurus.config.js"));

Для Каждого Файл Из МассивФайлов Цикл

	ТекущийПуть = Файл.ПолноеИмя;
	ТекущийДокумент = Новый ТекстовыйДокумент();
	ТекущийДокумент.Прочитать(ТекущийПуть, "UTF-8");

	ТекущийТекст = ТекущийДокумент.ПолучитьТекст();


	Для Каждого Слово Из ТаблицаСловаря Цикл
		ТекущийТекст = СтрЗаменить(ТекущийТекст, Слово.Ключ, Слово.Значение);
	КонецЦикла;

	ТекущийТекст = СтрЗаменить(ТекущийТекст, "English version", "Документация на русском языке");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "href: 'https://en.openintegrations.dev'", "href: 'https://openintegrations.dev'");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "defaultLocale: 'ru',", "defaultLocale: 'en',");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "locales: ['ru'],", "locales: ['en'],");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "url: 'https://openintegrations.dev',", "url: 'https://en.openintegrations.dev',");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "English", "Русский");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "Аддоны", "Addons");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "Поддержать проект", "Support us");

	ТекущийТекст = СтрЗаменить(ТекущийТекст, "Сотни методов для десятков сервисов", "Hundreds of methods for dozens of services");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "ОПИ состоит из большого набора разнообразных методов для множества известных API и технологий, будь то облачные Telegram, Bitrix24 и Google Drive, или же локальные S3, MySQL и PostgreSQL. Ознакомится с полным списком доступных сервисов можно на", "OpenIntegrations provides an extensive collection of methods supporting a wide range of APIs and technologies, including cloud platforms (Telegram, Bitrix24, Google Drive) and self-hosted solutions (S3, MySQL, PostgreSQL). For a complete list of integrated services, refer to the");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "вводной странице документации", "documentation introduction");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "Три платформы - одно решение", "Three Platforms — One Solution");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "Открытый пакет интеграций прдоставляет единый набор функций сразу в трех вариантах: как расширение для 1С:Предприятие 8, как пакет для OneScript и как полноценное приложение для командной строки. Это позволяет удобно использовать его методы для решения широкого спектра задач, выбирая форму поствки в зависимости от конкретного сценария работы. Заранее собранные файлы для каждого из этих вариантов всегда можно найти в", "Open Integration Package provides a unified set of functions in three variants: as an extension for 1C:Enterprise 8, as a package for OneScript, and as a full-fledged command-line application. This allows convenient use of its methods for solving a wide range of tasks by selecting the appropriate deployment format based on the specific use case. Pre-built files for each of these variants can always be found in the");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "релизах ОПИ на GitHub", "OpenIntegrations releases on GitHub");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "остается только скачать и запустить!", "just download and run!");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "Свобода открытого кода", "The Freedom of Open Source");
	ТекущийТекст = СтрЗаменить(ТекущийТекст, "Проект имеет открытый исходный коди и распространяется под лицензией MIT. Это означает, что вы можете использовать его в любых своих проектах, даже если они коммерческие и имеют закрытые исходники. Вся кодовая база проекта доступна публично в репозитории на GitHub и доступна для использования, а также полного или частичного изменения. Единственное условие - сохранение текста лицензии, который находится в каждом из файлов с кодом", "The project is open-source and distributed under the MIT License. This means you can freely use it in any projects—including commercial and proprietary ones. The entire codebase is publicly available in the GitHub repository and can be used, modified (in whole or in part), with one condition: preserving the license text included in every code file");

	ТекущийДокумент.УстановитьТекст(ТекущийТекст);
	ТекущийДокумент.Записать(Файл.ПолноеИмя);

КонецЦикла;