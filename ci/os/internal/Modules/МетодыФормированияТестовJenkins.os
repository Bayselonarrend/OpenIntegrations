#Использовать "./../../../../src/en/OInt/tools/"
#Использовать "./../../../../src/ru/OInt/tools/"
#Использовать "./internal"

Перем СписокРабот;
Перем ТекущийДокумент;

Процедура СоздатьНаборWorkflow(Знач Языки, Знач КаталогПараметров, Знач КаталогWorkflow) Экспорт

	Для Каждого Язык Из Языки Цикл

		ФайлПараметров = КаталогПараметров + Язык + ".json";
		ЛокальныеПараметры = Инструменты.ПрочитатьФайлJSON(ФайлПараметров);
		СформироватьWorflow(ЛокальныеПараметры, КаталогWorkflow, Язык);

	КонецЦикла;

КонецПроцедуры

Процедура СформироватьWorflow(Знач Параметры, Знач КаталогWorkflow, Знач Язык)
	
	СписокРабот     = "";
	СписокБиблиотек = Неопределено;
	ТаблицаТестов   = Неопределено;
	МассивВлияющих  = Новый Массив;

	Выполнить("ТаблицаТестов   = " + Параметры["testsTableMethod"]);
	Выполнить("СписокБиблиотек = " + Параметры["testsSectionsMethod"]);

	Для Каждого Библиотека Из СписокБиблиотек Цикл
		МассивВлияющих.Добавить("Testing-" + Библиотека.Ключ);
	КонецЦикла;

	ФайлJenkins     = КаталогWorkflow + "ostest" + Язык;
	ТекущийДокумент = Новый ТекстовыйДокумент();

	СообщитьНачалоФайлаПроцесса(Язык);
	СформироватьЗапуск(ТаблицаТестов, СписокБиблиотек, Язык, Параметры);
	СообщитьОкончаниеФайлаПроцесса(СписокБиблиотек, Язык, МассивВлияющих);

	ТекущийДокумент.Записать(ФайлJenkins, "UTF-8");

	тДанные = Новый ДвоичныеДанные(ФайлJenkins);
 
	тСтрока = Base64Строка(тДанные);
	тСтрока=Прав(тСтрока, СтрДлина(тСтрока)-4);
	Base64Значение(тСтрока).Записать(ФайлJenkins);

КонецПроцедуры

Процедура СформироватьЗапуск(Знач ТаблицаТестов, Знач СписокБиблиотек, Знач Язык, Знач Параметры)
	
	МодульТестов    = Параметры["testsModule"];
	СтрокаРаздел    = Параметры["sectionsString"];
	СтрокаМетод     = Параметры["methodString"];
	СтрокаСиноним   = Параметры["synonymString"];

	ФайлТестов = "./src/" + Язык + "/OInt/tests/Modules/internal/" + МодульТестов + ".os";

	Для Каждого Библиотека Из СписокБиблиотек Цикл

		Раздел      = Библиотека.Ключ;
		Зависимости = Библиотека.Значение;

		НазваниеРаботы = "Testing-" + Раздел;
		СписокРабот = СписокРабот + НазваниеРаботы + ", ";

		ТекстРаботы = "
		|        stage('" + НазваниеРаботы + "') {
		|			steps {
		|					
		|";

	Отбор = Новый Структура(СтрокаРаздел, Раздел);
	ТестыТекущегоРаздела = ТаблицаТестов.НайтиСтроки(Отбор);

        Для Каждого Тест Из ТестыТекущегоРаздела Цикл

			Метод   = Тест[СтрокаМетод];
			Синоним = Тест[СтрокаСиноним];

			ТекстРаботы = ТекстРаботы + "
			|					bat encoding: 'UTF-8', script:'1testrunner -run """ + ФайлТестов + """ """ + Метод + """'
			|
			|";

		КонецЦикла;

		ТекстРаботы = ТекстРаботы + "
		|			}
		|		}";

		ТекущийДокумент.ДобавитьСтроку(ТекстРаботы);

	КонецЦикла;

КонецПроцедуры

Процедура СообщитьНачалоФайлаПроцесса(Знач Язык, Знач ИмяРаботы = "Полное тестирование")

	ТекущийДокумент.ДобавитьСтроку(
	"pipeline {
	|   agent any
	|   stages {
	|      stage('Prepare'){
	|         steps{
	|            powershell encoding: 'UTF-8', script:'cd ./src/" + Язык + "/OInt; opm build; opm install oint-1.13.0.ospx; del oint-1.13.0.ospx'
	|            withCredentials([string(credentialsId: 'gpgkey', variable: 'GPGKEY')]) {
    |               powershell encoding: 'UTF-8', script:'""C:/Program Files (x86)/GnuPG/bin/gpg.exe"" --quiet --batch --yes --decrypt --passphrase=""${GPGKEY}"" --output ./data.json ./data.json.gpg'
    |            }
	|            
	|         }
	|      }
	|");

КонецПроцедуры

Процедура СообщитьОкончаниеФайлаПроцесса(Знач СписокБиблиотек, Знач Язык, Знач СписокВлияний = "")

	ТекущийДокумент.ДобавитьСтроку("
	|
	|      stage('Finish'){
	|         steps{
	|            script {
	|               withCredentials([string(credentialsId: 'gpgkey', variable: 'GPGKEY')]) {
	|                  bat encoding: 'UTF-8', script:'del ./data.json.gpg'
    |                  bat encoding: 'UTF-8', script:'""C:/Program Files (x86)/GnuPG/bin/gpg.exe"" --batch --symmetric --cipher-algo AES256 --passphrase=""${GPGKEY}"" ./data.json'
    |                  bat encoding: 'UTF-8', script:'del ./data.json'
    |               }
	|            }
	|         }
	|      }
	|      stage('Update GIT') {
    |         steps {
    |            script {
    |                
    |                withCredentials([gitUsernamePassword(credentialsId: 'gitmain', gitToolName: 'Default')]) {
    |                    bat ""git config user.email vitaly.the.alpaca@gmail.com""
    |                    bat 'git config user.name ""Vitaly the Alpaca (bot)""'
    |                    bat ""git config --global core.ignorecase true""
    |                    bat ""git add .""
    |                    bat 'git commit -m ""Test data update (Jenkins)""'
    |                    bat ""git push origin HEAD:main""
    |                }
    |                    
    |                
    |            }
    |        }
    |    }
	|
	|    }
	|}");

КонецПроцедуры

