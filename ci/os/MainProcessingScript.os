#Использовать "./internal"
#Использовать "./internal/Classes/internal"

Процедура ПриСозданииОбъекта()

	ДанныеПроекта = Новый ProjectData;

	Обработчик = Новый DictionariesMethods(ДанныеПроекта);
	Обработчик = Новый SpellCheckMethods(ДанныеПроекта);
	Обработчик = Новый Versioning(ДанныеПроекта);
	Обработчик = Новый ConversionMethods(ДанныеПроекта);
	Обработчик = Новый LocalizationMethods(ДанныеПроекта);
	Обработчик = Новый CodeFormatingMethods(ДанныеПроекта);
	Обработчик = Новый CodeExamplesMethods(ДанныеПроекта);
	Обработчик = Новый CLIMethods(ДанныеПроекта);
	Обработчик = Новый AlternativeNamesMethods(ДанныеПроекта);
	Обработчик = Новый CLITestsMethods(ДанныеПроекта);
	Обработчик = Новый JenkinsTestsMethods(ДанныеПроекта);
	Обработчик = Новый APICatalogGenerator(ДанныеПроекта);
	Обработчик = Новый TestIndexGenerator(ДанныеПроекта);
	Обработчик = Новый HashSumGenerator(ДанныеПроекта);
	Обработчик = Новый SonarQubeMethods(ДанныеПроекта);
	Обработчик = Новый DocsGenerator(ДанныеПроекта);
	Обработчик = Новый AILocalizationMethods(ДанныеПроекта);
	Обработчик = Новый LocalUpdater(ДанныеПроекта);

	CommonTools.СообщитьПроцесс("Processing complete!");

КонецПроцедуры

