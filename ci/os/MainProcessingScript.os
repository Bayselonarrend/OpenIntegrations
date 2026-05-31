#Использовать "./internal"
#Использовать "./internal/Classes/internal"

Процедура ПриСозданииОбъекта()

	ДанныеПроекта = Новый ProjectData;

	Попытка
		Обработчик = Новый Dependencies(ДанныеПроекта);
	Исключение
		CommonTools.СообщитьПроцесс("Dependencies skip...");
	КонецПопытки;
	
	Обработчик = Новый DictionariesMethods(ДанныеПроекта);
	Обработчик = Новый SpellCheckMethods(ДанныеПроекта);
	
	КаталогРепозиторияMelezh = "./Melezh";
	ОбъектКаталогРепозиторияMelezh = Новый Файл(КаталогРепозиторияMelezh);
	Если ОбъектКаталогРепозиторияMelezh.Существует() Тогда
		CommonTools.СообщитьПроцесс("Updating Melezh...");
		CommonTools.ЗапуститьВнешнееПриложение("git fetch --all", КаталогРепозиторияMelezh);
		CommonTools.ЗапуститьВнешнееПриложение("git reset --hard origin/master", КаталогРепозиторияMelezh);
	Иначе
		CommonTools.СообщитьПроцесс("Cloning Melezh...");
		CommonTools.ЗапуститьВнешнееПриложение("git clone https://github.com/bayselonarrend/Melezh.git");
	КонецЕсли;

	Приостановить(10000);

	Обработчик = Новый Versioning(ДанныеПроекта);
	Обработчик = Новый HttpToClientConverter(ДанныеПроекта);
	Обработчик = Новый MdoProcessor(ДанныеПроекта);
	Обработчик = Новый IntermediateResultProcessingCheck(ДанныеПроекта);
	Обработчик = Новый ConversionMethods(ДанныеПроекта);
	Обработчик = Новый ACIndexGenerator(ДанныеПроекта);
	Обработчик = Новый LocalizationMethods(ДанныеПроекта);
	Обработчик = Новый CodeFormattingMethods(ДанныеПроекта);
	Обработчик = Новый CodeExamplesMethods(ДанныеПроекта);
	Обработчик = Новый CLIMethods(ДанныеПроекта);
	Обработчик = Новый AlternativeNamesMethods(ДанныеПроекта);
	Обработчик = Новый CLITestsMethods(ДанныеПроекта);
	Обработчик = Новый JenkinsTestsMethods(ДанныеПроекта);
	Обработчик = Новый APICatalogGenerator(ДанныеПроекта);
	//Обработчик = Новый TestIndexGenerator(ДанныеПроекта);
	Обработчик = Новый HashSumGenerator(ДанныеПроекта);
	Обработчик = Новый SonarQubeMethods(ДанныеПроекта);
	Обработчик = Новый DocsGenerator(ДанныеПроекта);
	Обработчик = Новый AILocalizationMethods(ДанныеПроекта);
	Обработчик = Новый LocalUpdater(ДанныеПроекта);
	Обработчик = Новый DraftMethods(ДанныеПроекта);
	Обработчик = Новый McpTesting(ДанныеПроекта);

	CommonTools.СообщитьПроцесс("Processing complete!");

КонецПроцедуры

