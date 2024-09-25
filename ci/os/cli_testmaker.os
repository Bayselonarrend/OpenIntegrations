#Использовать "../../src/ru/cli/data"

Перем Версия;
Перем ТекущийФайл;
Перем ТаблицаПараметров;
Перем Модули;

#Область Основа

Процедура ПриСозданииОбъекта()
	
	ТекущийСоставБиблиотеки = Новый СоставБиблиотеки();

	ТаблицаПараметров = ТекущийСоставБиблиотеки.ПолучитьПолныйСостав();
	Версия            = ТекущийСоставБиблиотеки.ПолучитьВерсию();
	Модули            = ТекущийСоставБиблиотеки.ПолучитьСоответствиеКомандМодулей();

	СоздатьОсновнойФайл();

КонецПроцедуры

Процедура СоздатьОсновнойФайл()

	ТекущийФайл = Новый ТекстовыйДокумент();

	СообщитьНачалоФайлаПроцесса();
	СформироватьЗапуск();
	СообщитьОкончаниеФайлаПроцесса();

	ТекущийФайл.Записать("./ci/clitestru");

КонецПроцедуры

#КонецОбласти

#Область ФормированиеФайлов

Процедура СообщитьНачалоФайлаПроцесса()

	Язык = "ru";

	ТекущийФайл.ДобавитьСтроку(
	"pipeline {
	|   agent any
	|   stages {
	|      stage('Prepare'){
	|         steps{
	|            powershell encoding: 'UTF-8', script:'cd ./src/" + Язык + "/OInt; opm build; opm install oint-1.14.0.ospx; del oint-1.14.0.ospx'
	|            powershell encoding: 'UTF-8', script:'oscript -make ./src/" + Язык + "/cli/core/Classes/app.os oint.exe'          
	|         }
	|      }
	|
	|");

КонецПроцедуры

Процедура СформироватьЗапуск()
	
	Для Каждого Модуль Из Модули Цикл

		ТекущаяКоманда = Модуль.Ключ;

		ТекстРаботы = "
		|    def test_" + ТекущаяКоманда + "() {
		|        stage('" + ТекущаяКоманда + "') {
		|			steps {
		|					
		|";

		Отбор            = Новый Структура("Библиотека", ТекущаяКоманда);
		СтрокиБиблиотеки = ТаблицаПараметров.НайтиСтроки(Отбор);
		ТекущийМетод     = "";

		Для Каждого СтрокаПараметра Из СтрокиБиблиотеки Цикл

			Если ТекущийМетод <> СтрокаПараметра.Метод Тогда

				ТекущийМетод  = СтрокаПараметра.Метод;
				СтрокаЗапуска = ТекущийМетод;
				Отбор.Вставить("Метод", ТекущийМетод);	

				СтрокиМетода = ТаблицаПараметров.НайтиСтроки(Отбор);

				Для Каждого СтрокаМетода Из СтрокиМетода Цикл
					СтрокаЗапуска = СтрокаЗапуска 
						+ " "
						+ СтрокаМетода.Параметр
						+ " ""test"""
				КонецЦикла;

				ТекстРаботы = ТекстРаботы + "
				|               catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {   
				|					powershell encoding: 'UTF-8', script:'./oint.exe " + ТекущаяКоманда + " " + СтрокаЗапуска + " --debug --test '
				|               }
				|";

			КонецЕсли;

		КонецЦикла;

		ТекстРаботы = ТекстРаботы + "
		|			}
		|		}
		|	}  
		|test_" + ТекущаяКоманда + "()";


		ТекущийФайл.ДобавитьСтроку(ТекстРаботы);

	КонецЦикла;

КонецПроцедуры

Процедура СообщитьОкончаниеФайлаПроцесса()

	ТекущийФайл.ДобавитьСтроку("
	|   }
	|      post{
	|         always{
	|            script {
    |               bat encoding: 'UTF-8', script:'del ""./oint.exe""'      
	|            }
	|         }
	|      }
	|    
	|}");

КонецПроцедуры

#КонецОбласти
