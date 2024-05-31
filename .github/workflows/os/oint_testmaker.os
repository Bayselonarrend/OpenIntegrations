#Использовать "../../../src/ru/OInt/tools/"

Перем СоответствияПараметровЗначениям;
Перем СоответствияПараметровПредобработкам;
Перем СписокРабот;
Перем ТекущийДокумент;
Перем ПутьКФайлам;


Процедура ПриСозданииОбъекта()
	
	СписокРабот     = "";
	ТаблицаТестов   = OPI_ПолучениеДанныхТестов.ПолучитьТаблицуТестов();
	СписокБиблиотек = OPI_ПолучениеДанныхТестов.ПолучитьСоответствиеРазделовТестирования();
	ПутьКФайлам     = "./.github/workflows/";

	МассивВлияющих = Новый Массив;

	Для Каждого Библиотека Из СписокБиблиотек Цикл
		МассивВлияющих.Добавить("Testing-" + Библиотека.Ключ);
	КонецЦикла;


	ТекущийДокумент = Новый ТекстовыйДокумент();

	СообщитьНачалоФайлаПроцесса();
	СформироватьЗапуск(ТаблицаТестов, СписокБиблиотек);
	СообщитьОкончаниеФайлаПроцесса(МассивВлияющих, СписокБиблиотек);

	ТекущийДокумент.Записать(ПутьКФайлам + "oint_test_full.yml");

	Для Каждого ТекущаяБиблиотека Из СписокБиблиотек Цикл

		ТекущийДокумент = Новый ТекстовыйДокумент();
		Библиотека      = ТекущаяБиблиотека.Ключ;
		СписокРабот     = "";

		СписокОдной = Новый Соответствие();
		Зависимости = СписокБиблиотек[Библиотека];
		СписокОдной.Вставить(Библиотека, Зависимости);

		СообщитьНачалоФайлаПроцесса("Тестирование " + Библиотека);

		СформироватьЗапуск(ТаблицаТестов, СписокОдной);

		ТекущийДокумент.ДобавитьСтроку("
		|
		|      - name: Записать измененные данные
		|        if: ${{ cancelled() }} == false
		|        uses: actions/cache/save@v3
	    |        with:
		|          key: test-data_new
		|          path: ./data.json
		|");

		СообщитьОкончаниеФайлаПроцесса("Testing-" + Библиотека, СписокОдной);

		ТекущийДокумент.Записать(ПутьКФайлам + "oint_test_" + Библиотека + ".yml");

	КонецЦикла;

КонецПроцедуры

Процедура СформироватьЗапуск(Знач ТаблицаТестов, Знач СписокБиблиотек)
	
    Раннер  = "/home/runner/.local/share/ovm/current/lib/1testrunner/src/main.os";
	ФайлТестов = "./OInt/tests/Modules/internal/OPI_Тесты.os";

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
        |          cd ./OInt
        |          opm build
        |          opm install *.ospx
		|
	    |";

	Отбор = Новый Структура("Раздел", Раздел);
	ТестыТекущегоРаздела = ТаблицаТестов.НайтиСтроки(Отбор);

        Для Каждого Тест Из ТестыТекущегоРаздела Цикл

			Метод   = Тест.Метод;
			Синоним = Тест.Синоним;

			ТекстРаботы = ТекстРаботы + "
			|
			|      - name: " + Синоним + "
            |        if: ${{ cancelled() }} == false
            |        run: oscript " + Раннер + " -run " + ФайлТестов + " """ + Метод + """";

		КонецЦикла;

		ДополнитьТекстРаботы(Раздел, ТекстРаботы);
		ТекущийДокумент.ДобавитьСтроку(ТекстРаботы);

	КонецЦикла;

КонецПроцедуры

Процедура СообщитьНачалоФайлаПроцесса(Знач ИмяРаботы = "Полное тестирование")

	ТекущийДокумент.ДобавитьСтроку(
	"
	|name: OINT | " + ИмяРаботы + "
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
	|          cd ./OInt
	|          opm build
	|          opm install *.ospx    
	|
	|      - name: Записать артефакт
	|        uses: actions/upload-artifact@v4
	|        with:
	|          name: oint
	|          path: ./OInt/*.ospx
	|");

КонецПроцедуры

Процедура СообщитьОкончаниеФайлаПроцесса(Знач СписокВлияний = "", Знач СписокБиблиотек)

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
		|          path: ./docs/results/" + ТекущаяБиблиотека + "
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
		|          ""https://api.github.com/repos/Bayselonarrend/OpenIntegrations/actions/caches?key=logs-" + ТекущаяБиблиотека + """
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

Процедура ДополнитьТекстРаботы(Знач Раздел, ТекстРаботы)

	ТекстРаботы = ТекстРаботы + "
	|
	|      - name: Записать логи
	|        if: ${{ cancelled() }} == false
	|        uses: actions/cache/save@v3
	|        with:
	|          key: logs-" + Раздел + "
	|          path: ./docs/results/" + Раздел + "
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