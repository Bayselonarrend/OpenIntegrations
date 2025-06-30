#Использовать "../../src/en/cli/data"

Перем Версия;
Перем ТекущийФайл;
Перем ТаблицаПараметров;
Перем Модули;

#Область Основа

Процедура ПриСозданииОбъекта()

	ТекущийСоставБиблиотеки = Новый LibraryComposition();

	ТаблицаПараметров = ТекущийСоставБиблиотеки.GetFullComposition();
	Версия            = ТекущийСоставБиблиотеки.GetVersion();
	Модули            = ТекущийСоставБиблиотеки.GetCommandModuleMapping();

	СоздатьОсновнойФайл();

КонецПроцедуры

Процедура СоздатьОсновнойФайл()

	ТекущийФайл = Новый ТекстовыйДокумент();

	СформироватьОпределения();
	СформироватьПроцесс();

	Текст = ТекущийФайл.ПолучитьТекст();
	ПолучитьДвоичныеДанныеИзСтроки(Текст).Записать("./ci/clitesten");

КонецПроцедуры

#КонецОбласти

#Область ФормированиеФайлов

Процедура СформироватьПроцесс()

	Язык = "en";

	ТекущийФайл.ДобавитьСтроку(
	"pipeline {
	|   agent windows
	|   stages {
	|      stage('Prepare'){
	|         steps{
	|			powershell encoding: 'UTF-8', script: '''
	|				$batFile = ""C:\\Program Files\\OneScript\\bin\\oint.bat""
	|				if (Test-Path $batFile) {
	|					Remove-Item -Path $batFile -Force
	|					Write-Host ""Файл oint.bat удален.""
	|				} else {
	|					Write-Host ""Файл oint.bat не найден, пропускаем удаление.""
	|				}
	|			'''
	|
	|			// Создание директории для загрузки, если её нет
	|			bat 'if not exist ""%USERPROFILE%\\Downloads"" mkdir ""%USERPROFILE%\\Downloads""'
	|
	|			// Скачивание инсталлера
	|			powershell encoding: 'UTF-8', script: '''
	|				$url = ""https://jenkins.openintegrations.dev/job/OpiRelease/lastSuccessfulBuild/artifact/1.26.0/oint_1.26.0_installer_en.exe ""
	|				$output = ""$env:USERPROFILE\\Downloads\\oint_installer.exe""
	|				Invoke-WebRequest -Uri $url -OutFile $output
	|				Write-Host ""Инсталлер скачан в: $output""
	|			'''
	|
	|			// Запуск инсталляции (тихий режим для Inno Setup)
	|			powershell encoding: 'UTF-8', script: '''
	|				$installerPath = ""$env:USERPROFILE\\Downloads\\oint_installer.exe""
	|				Write-Host ""Запускаем установку: $installerPath""
	|				Start-Process -FilePath $installerPath -ArgumentList ""/VERYSILENT /NORESTART"" -Wait
	|				Write-Host ""Установка завершена.""
	|			'''        
	|         }
	|      }
	|      stage('Run'){
	|         steps{");  

	Для Каждого Модуль Из Модули Цикл

		ТекущийФайл.ДобавитьСтроку("test_" + Модуль.Ключ + "()");

	КонецЦикла;

	ТекущийФайл.ДобавитьСтроку("
	|         }
	|      }
	|   }
	|}
	|
	|");

КонецПроцедуры

Процедура СформироватьОпределения()
	
	Язык = "en";

	ТекстРаботы = "
	|pipeline {
	|   agent any
	|   	stages {
	|          stage('Prepare'){
	|             steps{
	|                powershell encoding: 'UTF-8', script:'cd ./src/" + Язык + "/OInt; opm build; opm install oint-1.26.0.ospx; del oint-1.26.0.ospx'
	|                powershell encoding: 'UTF-8', script:'oscript -make ./src/" + Язык + "/cli/core/Classes/app.os oint.exe'          
	|             }
	|          }
	|          stage('Run Tests') {
    |             parallel {
	|";

	Для Каждого Модуль Из Модули Цикл

		ТекущаяКоманда = Модуль.Ключ;

		ТекстРаботы = ТекстРаботы + "
	    |          stage('" + ТекущаяКоманда + "'){
	    |             steps{
		|                test_" + ТекущаяКоманда + "()
		|             }
		|          }";

	КонецЦикла;
	
	ТекстРаботы = ТекстРаботы + "
	|   } 
	|  }    
	| }
	|}
	|";

	ТекущийФайл.ДобавитьСтроку(ТекстРаботы);

	Для Каждого Модуль Из Модули Цикл

		ТекущаяКоманда = Модуль.Ключ;

		ТекстФункции = "
		|
		|def test_" + ТекущаяКоманда + "(){
		|					
		|";

		Отбор            = Новый Структура("Library", ТекущаяКоманда);
		СтрокиБиблиотеки = ТаблицаПараметров.НайтиСтроки(Отбор);
		ТекущийМетод     = "";

		Для Каждого СтрокаПараметра Из СтрокиБиблиотеки Цикл

			Если ТекущийМетод <> СтрокаПараметра.Method Тогда

				ТекущийМетод  = СтрокаПараметра.Method;
				СтрокаЗапуска = ТекущийМетод;
				Отбор.Вставить("Method", ТекущийМетод);	

				СтрокиМетода = ТаблицаПараметров.НайтиСтроки(Отбор);

				Для Каждого СтрокаМетода Из СтрокиМетода Цикл
					СтрокаЗапуска = СтрокаЗапуска 
						+ " "
						+ СтрокаМетода.Parameter
						+ " ""test"""
				КонецЦикла;

				ТекстФункции = ТекстФункции + "
				|               catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {   
				|					powershell encoding: 'UTF-8', script:'./oint.exe " + ТекущаяКоманда + " " + СтрокаЗапуска + " --debug --test '
				|               }
				|";

			КонецЕсли;

		КонецЦикла;

		ТекстФункции = ТекстФункции + "
		|}
		|";


		ТекущийФайл.ДобавитьСтроку(ТекстФункции);

	КонецЦикла;

КонецПроцедуры

#КонецОбласти
