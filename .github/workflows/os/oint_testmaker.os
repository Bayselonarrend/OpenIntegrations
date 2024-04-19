#Использовать "../../../OInt/tools/"

Перем СоответствияПараметровЗначениям;
Перем СоответствияПараметровПредобработкам;

Процедура ПриСозданииОбъекта()
	
	ТаблицаТестов   = OPI_ПолучениеДанныхТестов.ПолучитьТаблицуТестов();
	СписокБиблиотек = OPI_ПолучениеДанныхТестов.ПолучитьСоответствиеРазделовТестирования();

	СообщитьНачалоФайлаПроцесса();
	СформироватьЗапуск(ТаблицаТестов, СписокБиблиотек);
	СообщитьОкончаниеФайлаПроцесса();

КонецПроцедуры

Процедура СформироватьЗапуск(Знач ТаблицаТестов, Знач СписокБиблиотек)
	
    Раннер  = "/home/runner/.local/share/ovm/current/lib/1testrunner/src/main.os";
	ФайлТестов = "./OInt/tests/Modules/internal/OPI_Тесты.os";

	Для Каждого Библиотека Из СписокБиблиотек Цикл

		Раздел      = Библиотека.Ключ;
		Зависимости = Библиотека.Значение;

		ТекстРаботы = "
		|
		|Testing-" + Раздел + ":
        |  runs-on: ubuntu-latest
        |  needs: " + Зависимости + "
        |  steps:
		|
        |    - uses: actions/checkout@v2 
        |    - uses: otymko/setup-onescript@v1.4
        |      with:
        |        version: 1.9.0 
        |      
        |    - name: Получить тестовые данные из кэша
        |      uses: actions/cache/restore@v3
        |      with:
        |        key: test-data
        |        path: ./data.json
        |      
        |    - name: Установить asserts и 1testrunner
        |      run: |
        |        opm install asserts
        |        opm install 1testrunner
		|
        |    - name: Установить OInt
        |      run: |
        |        cd ./OInt
        |        opm build
        |        opm install *.ospx
		|
	 |";

	    Отбор = Новый Структура("Раздел", Раздел);
	 ТестыТекущегоРаздела = ТаблицаТестов.НайтиСтроки(Отбор);

        Для Каждого Тест Из ТестыТекущегоРаздела Цикл

			Метод   = Тест.Метод;
			Синоним = Тест.Синоним;

			ТекстРаботы = ТекстРаботы + "
			|
			|          - name: " + Синоним + "
            |          if: ${{ cancelled() }} == false
            |          run: oscript " + Раннер + " -run " + ФайлТестов + " """ + Метод + """";

		КонецЦикла;

		Сообщить(ТекстРаботы);

	КонецЦикла;

КонецПроцедуры

Процедура СообщитьНачалоФайлаПроцесса()

	Сообщить(
	"
	|name: OINT | Сборка и тестирование
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

Процедура СообщитьОкончаниеФайлаПроцесса()

	Сообщить("
	|Encode:
	|runs-on: ubuntu-latest
	|needs: Testing-Twitter
	|if: ${{ always() }}
	|permissions:
	|  contents: write
	|  
	|steps:
	|
	|- uses: actions/checkout@v2 
	|
	|- name: Обновить данные в репозитории
	|  run: git pull https://github.com/Bayselonarrend/OpenIntegrations
	|
	|- name: Получить тестовые данные из кэша
	|  uses: actions/cache/restore@v3
	|  with:
	|    key: test-data_new
	|    path: ./data.json
	|
	|- name: Зашифровать данные обратно
	|  continue-on-error: false
	|  
	|  run: |
	|    rm -f ./data.json.gpg
	|    gpg --batch --symmetric --cipher-algo AES256 --passphrase=""$ENC_JSON"" data.json
	|    rm -f ./data.json
	|  env:
	|    ENC_JSON: ${{ secrets.ENC_JSON }}
	|
	|- name: Записать данные    
	|  uses: stefanzweifel/git-auto-commit-action@v5   
	|  with:
	|    commit_user_name: Vitaly the Alpaca (bot) 
	|    commit_user_email: vitaly.the.alpaca@gmail.com
	|    commit_author: Vitaly the Alpaca <vitaly.the.alpaca@gmail.com>
	|    commit_message: Обновление зашифрованных данных по результатам тестов (workflow)
	|
	|
	|Clear-Cache:
	|runs-on: ubuntu-latest
	|needs: [Testing-Telegram, Testing-VK, Testing-YandexDisk, Testing-Viber, Testing-Notion, Testing-GoogleCalendar, Testing-GoogleDrive, Encode]
	|if: ${{ always() }}
	|steps:
	|- name: Очистка основного кэша
	|  run: |
	|    curl -L \
	|    -X DELETE \
	|    -H ""Accept: application/vnd.github+json"" \
	|    -H ""Authorization: Bearer ${{ secrets.TOKEN }}"" \
	|    -H ""X-GitHub-Api-Version: 2022-11-28"" \
	|    ""https://api.github.com/repos/Bayselonarrend/OpenIntegrations/actions/caches?key=test-data""
	|
	|- name: Очистка кэша Google
	|  run: |
	|    curl -L \
	|    -X DELETE \
	|    -H ""Accept: application/vnd.github+json"" \
	|    -H ""Authorization: Bearer ${{ secrets.TOKEN }}"" \
	|    -H ""X-GitHub-Api-Version: 2022-11-28"" \
	|    ""https://api.github.com/repos/Bayselonarrend/OpenIntegrations/actions/caches?key=test-data_google""
	|
	|- name: Очистка кэша Twitter
	|  run: |
	|    curl -L \
	|    -X DELETE \
	|    -H ""Accept: application/vnd.github+json"" \
	|    -H ""Authorization: Bearer ${{ secrets.TOKEN }}"" \
	|    -H ""X-GitHub-Api-Version: 2022-11-28"" \
	|    ""https://api.github.com/repos/Bayselonarrend/OpenIntegrations/actions/caches?key=test-data_new""");

КонецПроцедуры;
