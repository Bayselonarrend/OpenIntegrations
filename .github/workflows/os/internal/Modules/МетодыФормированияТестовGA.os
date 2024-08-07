#Использовать "../../../../../src/en/OInt/tools/"
#Использовать "../../../../../src/ru/OInt/tools/"
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


	ТекущийДокумент = Новый ТекстовыйДокумент();

	СообщитьНачалоФайлаПроцесса(Язык);
	СформироватьЗапуск(ТаблицаТестов, СписокБиблиотек, Язык, Параметры);
	СообщитьОкончаниеФайлаПроцесса(СписокБиблиотек, Язык, МассивВлияющих);

	ТекущийДокумент.Записать(КаталогWorkflow + "oint_test_full_" + Язык + ".yml");

КонецПроцедуры

Процедура СформироватьЗапуск(Знач ТаблицаТестов, Знач СписокБиблиотек, Знач Язык, Знач Параметры)
	
	МодульТестов    = Параметры["testsModule"];
	СтрокаРаздел    = Параметры["sectionsString"];
	СтрокаМетод     = Параметры["methodString"];
	СтрокаСиноним   = Параметры["synonymString"];

    Раннер  = "/home/runner/.local/share/ovm/current/lib/1testrunner/src/main.os";
	ФайлТестов = "./src/" + Язык + "/OInt/tests/Modules/internal/" + МодульТестов + ".os";

	Для Каждого Библиотека Из СписокБиблиотек Цикл

		Раздел      = Библиотека.Ключ;
		Зависимости = Библиотека.Значение;

		НазваниеРаботы = "Testing-" + Раздел;
		СписокРабот = СписокРабот + НазваниеРаботы + ", ";

		ТекстРаботы = "
		|
		|  " + НазваниеРаботы + ":
        |    runs-on: ubuntu-latest
        |    needs: " + Зависимости + "
        |    steps:
		|
        |      - uses: actions/checkout@v2 
        |      - uses: otymko/setup-onescript@v1.4
        |        with:
        |          version: 1.9.0 
        |      
        |      - name: Получить тестовые данные из кэша
        |        uses: actions/cache/restore@v3
        |        with:
        |          key: " + КлючКэша(Раздел) + "
        |          path: ./data.json
        |      
        |      - name: Установить asserts и 1testrunner
        |        run: |
        |          opm install asserts
        |          opm install 1testrunner
		|
        |      - name: Установить OInt
        |        run: |
        |          cd ./src/" + Язык + "/OInt
        |          opm build
        |          opm install *.ospx
		|
	    |";

	Отбор = Новый Структура(СтрокаРаздел, Раздел);
	ТестыТекущегоРаздела = ТаблицаТестов.НайтиСтроки(Отбор);

        Для Каждого Тест Из ТестыТекущегоРаздела Цикл

			Метод   = Тест[СтрокаМетод];
			Синоним = Тест[СтрокаСиноним];

			ТекстРаботы = ТекстРаботы + "
			|
			|      - name: " + Синоним + "
            |        if: ${{ cancelled() }} == false
            |        run: oscript " + Раннер + " -run " + ФайлТестов + " """ + Метод + """";

		КонецЦикла;

		ДополнитьТекстРаботы(Раздел, Язык, ТекстРаботы);
		ТекущийДокумент.ДобавитьСтроку(ТекстРаботы);

	КонецЦикла;

КонецПроцедуры

Процедура СообщитьНачалоФайлаПроцесса(Знач Язык, Знач ИмяРаботы = "Полное тестирование")

	ТекущийДокумент.ДобавитьСтроку(
	"
	|name: 2. TEST | " + ИмяРаботы + " (" + вРег(Язык) + ")
    |
	|# Controls when the workflow will run
	|on:
	|  workflow_dispatch:
	|
	|jobs:
	|
	|  Decode:
	|    runs-on: ubuntu-latest
	|    if: ${{ always() }}
	|    steps:
	|
	|      - uses: actions/checkout@v4 
	|
	|      - name: Расшифровать тестовые данные
	|        run: gpg --quiet --batch --yes --decrypt --passphrase=""$ENC_JSON"" --output ./data.json ./data.json.gpg        
	|        env:
	|          ENC_JSON: ${{ secrets.ENC_JSON }}
	|      - name: Записать тестовые данные в кэш
	|        uses: actions/cache/save@v3
	|        with:
	|          key: test-data
	|          path: ./data.json
	|
	|  Build:
	|    runs-on: ubuntu-latest
	|    steps:
	|      - uses: actions/checkout@v4             
	|      - uses: otymko/setup-onescript@v1.4
	|        with:
	|          version: 1.9.0 
	|
	|      - name: Установить asserts и 1testrunner
	|        run: |
	|          opm install asserts
	|          opm install 1testrunner
	|
	|      - name: Установить OInt
	|        run: |
	|          cd ./src/" + Язык + "/OInt
	|          opm build
	|          opm install *.ospx    
	|
	|      - name: Записать артефакт
	|        uses: actions/upload-artifact@v4
	|        with:
	|          name: oint
	|          path: ./src/" + Язык + "/OInt/*.ospx
	|");

КонецПроцедуры

Процедура СообщитьОкончаниеФайлаПроцесса(Знач СписокБиблиотек, Знач Язык, Знач СписокВлияний = "")

	Если ТипЗнч(СписокВлияний) = Тип("Массив") Тогда
		СписокВлияний = СтрСоединить(СписокВлияний, ",");
	КонецЕсли;

	ТекущийДокумент.ДобавитьСтроку("
	|  Encode:
	|    runs-on: ubuntu-latest
	|    needs: [" + СписокВлияний + "]
	|    if: ${{ always() }}
	|    permissions:
	|      contents: write
	|  
	|    steps:
	|
	|      - uses: actions/checkout@v2 
	|
	|      - name: Обновить данные в репозитории
	|        run: git pull https://github.com/Bayselonarrend/OpenIntegrations
	|
	|      - name: Получить тестовые данные из кэша
	|        uses: actions/cache/restore@v3
	|        with:
	|          key: test-data_new
	|          path: ./data.json
	|
	|      - name: Зашифровать данные обратно
	|        continue-on-error: false
	|  
	|        run: |
	|          rm -f ./data.json.gpg
	|          gpg --batch --symmetric --cipher-algo AES256 --passphrase=""$ENC_JSON"" data.json
	|          rm -f ./data.json
	|        env:
	|          ENC_JSON: ${{ secrets.ENC_JSON }}");

	Для Каждого Библиотека Из СписокБиблиотек Цикл

		ТекущаяБиблиотека = Библиотека.Ключ;

		ТекущийДокумент.ДобавитьСтроку("
		|      - name: Получить логи " + ТекущаяБиблиотека + "
		|        uses: actions/cache/restore@v3
		|        with:
		|          key: logs-" + ТекущаяБиблиотека + "
		|          path: ./docs/" + Язык + "/results/" + ТекущаяБиблиотека + "
		|");

		ТекущийДокумент.ДобавитьСтроку("
		|
		|      - name: Очистка логов " + ТекущаяБиблиотека + "
		|        run: |
		|          curl -L \
		|          -X DELETE \
		|          -H ""Accept: application/vnd.github+json"" \
		|          -H ""Authorization: Bearer ${{ secrets.TOKEN }}"" \
		|          -H ""X-GitHub-Api-Version: 2022-11-28"" \
		|          ""https://api.github.com/repos/Bayselonarrend/OpenIntegrations/actions/caches?key=logs-" 
		+ ТекущаяБиблиотека + """
		|");

	КонецЦикла;

	ТекущийДокумент.ДобавитьСтроку("
	|
	|      - name: Записать данные    
	|        uses: stefanzweifel/git-auto-commit-action@v5   
	|        with:
	|          commit_user_name: Vitaly the Alpaca (bot) 
	|          commit_user_email: vitaly.the.alpaca@gmail.com
	|          commit_author: Vitaly the Alpaca <vitaly.the.alpaca@gmail.com>
	|          commit_message: Обновление зашифрованных данных по результатам тестов (workflow)
	|");

	ТекущийДокумент.ДобавитьСтроку("
	|
	|  Clear-Cache:
	|    runs-on: ubuntu-latest
	|    needs: [" + СписокРабот + "Encode]
	|    if: ${{ always() }}
	|    steps:
	|      - name: Очистка основного кэша
	|        run: |
	|          curl -L \
	|          -X DELETE \
	|          -H ""Accept: application/vnd.github+json"" \
	|          -H ""Authorization: Bearer ${{ secrets.TOKEN }}"" \
	|          -H ""X-GitHub-Api-Version: 2022-11-28"" \
	|          ""https://api.github.com/repos/Bayselonarrend/OpenIntegrations/actions/caches?key=test-data""
	|
	|      - name: Очистка кэша Google
	|        run: |
	|          curl -L \
	|          -X DELETE \
	|          -H ""Accept: application/vnd.github+json"" \
	|          -H ""Authorization: Bearer ${{ secrets.TOKEN }}"" \
	|          -H ""X-GitHub-Api-Version: 2022-11-28"" \
	|          ""https://api.github.com/repos/Bayselonarrend/OpenIntegrations/actions/caches?key=test-data_google""
	|
	|      - name: Очистка кэша Twitter
	|        run: |
	|          curl -L \
	|          -X DELETE \
	|          -H ""Accept: application/vnd.github+json"" \
	|          -H ""Authorization: Bearer ${{ secrets.TOKEN }}"" \
	|          -H ""X-GitHub-Api-Version: 2022-11-28"" \
	|          ""https://api.github.com/repos/Bayselonarrend/OpenIntegrations/actions/caches?key=test-data_new""
	|");

КонецПроцедуры

Процедура ДополнитьТекстРаботы(Знач Раздел, Знач Язык, ТекстРаботы)

	ТекстРаботы = ТекстРаботы + "
	|
	|      - name: Записать логи
	|        if: ${{ cancelled() }} == false
	|        uses: actions/cache/save@v3
	|        with:
	|          key: logs-" + Раздел + "
	|          path: ./docs/" + Язык + "/results/" + Раздел + "
	|";

	Если Раздел = "Twitter" Тогда
		ТекстРаботы = ТекстРаботы + "
		|
		|      - name: Записать измененные данные
		|        if: ${{ cancelled() }} == false
		|        uses: actions/cache/save@v3
	    |        with:
		|          key: test-data_new
		|          path: ./data.json
		|";
    ИначеЕсли Раздел = "GoogleWorkspace" Тогда
		ТекстРаботы = ТекстРаботы + "
		|
		|      - name: Записать измененные данные
		|        if: ${{ cancelled() }} == false
		|        uses: actions/cache/save@v3
	    |        with:
		|          key: test-data_google
		|          path: ./data.json
		|";
	Иначе
		Возврат;
	КонецЕсли;

КонецПроцедуры

Функция КлючКэша(Знач Раздел)

	СоответствиеОсобыхРазделов = Новый Соответствие();
	СоответствиеОсобыхРазделов.Вставить("GoogleDrive"   , "test-data_google");
	СоответствиеОсобыхРазделов.Вставить("GoogleCalendar", "test-data_google");
	СоответствиеОсобыхРазделов.Вставить("GoogleSheets"  , "test-data_google");

	Ключ = СоответствиеОсобыхРазделов.Получить(Раздел);

	Если Не ЗначениеЗаполнено(Ключ) Тогда
		Ключ = "test-data";
	КонецЕсли;

	Возврат Ключ;

КонецФункции