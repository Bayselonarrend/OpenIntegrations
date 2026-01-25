#Использовать "./internal"
#Использовать fs

Перем Репозиторий;
Перем Версия;
Перем Режим;
Перем Файл1С;
Перем Сервер;
Перем ПутьВыгрузки;
Перем Оскрипт;
Перем ПутьДвижка;
Перем ПутьGHCLI;
Перем ПутьInnoSetup;
Перем ХешСумма;
Перем НеобходимоеЧислоАртефактов;


Процедура ПриСозданииОбъекта(Знач ДанныеПроекта_ = Неопределено)
	
	Если ДанныеПроекта_ = Неопределено Тогда
		ДанныеПроекта = Новый ProjectData;
	Иначе
		ДанныеПроекта = ДанныеПроекта_;
	КонецЕсли;
	
	CommonTools.СообщитьПроцесс("Creating release artifacts");
	
	НеобходимоеЧислоАртефактов = ДанныеПроекта.ПолучитьЗначениеНастройки("release.artifactsCount");
	Репозиторий                = ДанныеПроекта.ПолучитьЗначениеНастройки("primary.repoUrl");
	Версия                     = ДанныеПроекта.ПолучитьЗначениеНастройки("primary.version");
	
	Режим = "CONFIG";
	
	//Локальные данные
	Файл1С            = СтрШаблон("""%1""",  ДанныеПроекта.ПолучитьЗначениеНастройки("local.onecPath"));
	Сервер            = ДанныеПроекта.ПолучитьЗначениеНастройки("local.serverName");
	ОСкрипт           = ДанныеПроекта.ПолучитьЗначениеНастройки("local.osPath");
	ПутьДвижка        = ДанныеПроекта.ПолучитьЗначениеНастройки("local.engineLinuxWsl");
	ПутьGHCLI         = ДанныеПроекта.ПолучитьЗначениеНастройки("local.ghcliPath");
	ПутьInnoSetup     = ДанныеПроекта.ПолучитьЗначениеНастройки("local.innoPath");
	
	ПутьВыгрузки      = СтрШаблон("./%1/", Версия);
	ХешСумма          = ПолучитьСтрокуИзДвоичныхДанных(Новый ДвоичныеДанные("./service/last_build_hash.txt"));
	
	ОбъектПутьВыгрузки = Новый Файл(ПутьВыгрузки);
	
	Если Не ОбъектПутьВыгрузки.Существует() Тогда
		СоздатьКаталог(ПутьВыгрузки);
	КонецЕсли;
	
	ЗапуститьПриложение("git clone https://github.com/bayselonarrend/Melezh");
	
	МассивЛокализаций = Новый Массив();
	
	СтруктураРус = Новый Структура();
	СтруктураРус.Вставить("База"    , "OpenIntegrations");
	СтруктураРус.Вставить("ПутьКEDT", "./src/ru/OPI");
	СтруктураРус.Вставить("ПутьOS"  , "./src/ru/OInt");
	СтруктураРус.Вставить("ПутьCLI" , "./src/ru/cli/core/Classes/app.os");
	СтруктураРус.Вставить("ПутьCLIP", "./src/ru/cli");
	СтруктураРус.Вставить("ПутьISS" , "./service/iss/ru.iss");
	СтруктураРус.Вставить("Описание", "OInt CLI - приложение для работы с API различных онлайн-сервисов из командной строки");
	СтруктураРус.Вставить("Префикс" , "ru");
	
	СтруктураАнг = Новый Структура();
	СтруктураАнг.Вставить("База"    , "OpenIntegrationsEng");
	СтруктураАнг.Вставить("ПутьКEDT", "./src/en/OPI");
	СтруктураАнг.Вставить("ПутьOS"  , "./src/en/OInt");
	СтруктураАнг.Вставить("ПутьCLI" , "./src/en/cli/core/Classes/app.os");
	СтруктураАнг.Вставить("ПутьCLIP", "./src/en/cli");
	СтруктураАнг.Вставить("ПутьISS" , "./service/iss/en.iss");
	СтруктураАнг.Вставить("Описание", "OInt CLI - CLI toolkit for integrating with APIs of popular online services");
	СтруктураАнг.Вставить("Префикс" , "en");
	
	МассивЛокализаций.Добавить(СтруктураАнг); 
	МассивЛокализаций.Добавить(СтруктураРус);
	
	КаталогВыгрузки = Новый Файл(ПутьВыгрузки);
	Если КаталогВыгрузки.Существует() Тогда 
		УдалитьФайлы(ПутьВыгрузки);
	КонецЕсли;

	ПутьВыгрузки = КаталогВыгрузки.ПолноеИмя;
	
	СоздатьКаталог(ПутьВыгрузки);
	Приостановить(2000);
	
	Для Каждого Локализация Из МассивЛокализаций Цикл
		
		СоздатьXML(Локализация);
		СоздатьCFE(Локализация);
		СоздатьEDT(Локализация);   
		СоздатьOSPX(Локализация);
		СоздатьПакеты(Локализация);
		СоздатьУстановщик(Локализация);
		
		УдалитьФайлы("./ci/installer_set/share/oint/lib/oint");
		УдалитьФайлы("./ci/installer_set/share/oint/lib/oint-cli");
		
	КонецЦикла;
	
	ФайлыРелиза          = НайтиФайлы(ПутьВыгрузки, "*", Истина);
	КоличествоАртефактов = ФайлыРелиза.Количество();
	
	Если КоличествоАртефактов <> НеобходимоеЧислоАртефактов Тогда
		
		CommonTools.СообщитьПроцесс(СтрШаблон("Incorrect number of artifacts for export: required %1, found %2"
		, НеобходимоеЧислоАртефактов
		, КоличествоАртефактов));
		
	КонецЕсли;
	
	CommonTools.СообщитьПроцесс("Start GHCLI");
	
	Для Каждого ФайлРелиза Из ФайлыРелиза Цикл
		
		СтрокаЗапуска = СтрШаблон("""%1"" release delete-asset draft --yes --repo %2 ""%3""", ПутьGHCLI, Репозиторий, ФайлРелиза.Имя);
		CommonTools.ЗапуститьВнешнееПриложение(СтрокаЗапуска);
		
		СтрокаЗапуска = СтрШаблон("""%1"" release upload draft --repo %2 ""%3""", ПутьGHCLI, Репозиторий, ФайлРелиза.ПолноеИмя);
		CommonTools.ЗапуститьВнешнееПриложение(СтрокаЗапуска);
		
	КонецЦикла;

	CommonTools.СообщитьПроцесс("Release creating complete!");
		
КонецПроцедуры


Процедура СоздатьCFE(Данные)
	
	CommonTools.СообщитьПроцесс("Start CFE");
	
	База          = Данные["База"];
	Префикс       = Данные["Префикс"];
	ВыгрузкаВФайл = СтрШаблон("%1 %2 /S %3\%4 /DumpCfg ""%5OpenIntegrations_%6_%7.cfe"" -Extension OpenIntegrations"
	, Файл1С
	, Режим
	, Сервер
	, База
	, ПутьВыгрузки
	, Версия
	, Префикс);
	
	CommonTools.ЗапуститьВнешнееПриложение(ВыгрузкаВФайл);
	
КонецПроцедуры

Процедура СоздатьXML(Данные)
	
	CommonTools.СообщитьПроцесс("Start XML");
	
	Префикс = вРег(Данные["Префикс"]); 
	База    = Данные["База"];  
	
	ПапкаXML   = СтрШаблон("%1XML_%2", ПутьВыгрузки, Префикс);
	ПутьZIP    = СтрШаблон("%1.zip", ПапкаXML);
	КаталогXML = Новый Файл(ПапкаXML);
	
	Если Не КаталогXML.Существует() Тогда
		СоздатьКаталог(ПапкаXML);
	КонецЕсли;
	
	ВыгрузкаВXML = СтрШаблон("%1 %2 /S %3\%4 /DumpConfigToFiles ""%5"" -Extension OpenIntegrations"
	, Файл1С
	, Режим
	, Сервер
	, База
	, ПапкаXML);
	
	CommonTools.ЗапуститьВнешнееПриложение(ВыгрузкаВXML);
	
	ZipXML = Новый ЗаписьZipФайла(ПутьZIP);
	
	ZipXML.Добавить(ПапкаXML + "\*.*" 
	, РежимСохраненияПутейZIP.СохранятьОтносительныеПути
	, РежимОбработкиПодкаталоговZIP.ОбрабатыватьРекурсивно);
	
	ZipXML.Записать();
	
	УдалитьФайлы(ПапкаXML);
	
КонецПроцедуры

Процедура СоздатьEDT(Данные)
	
	CommonTools.СообщитьПроцесс("Start EDT");
	
	Префикс  = вРег(Данные["Префикс"]);
	ПутьКEDT = Данные["ПутьКEDT"];
	
	ПутьZIP = СтрШаблон("%1EDT_%2.zip", ПутьВыгрузки, Префикс);
	ZipEDT  = Новый ЗаписьZipФайла(ПутьZIP);
	
	ZipEDT.Добавить(ПутьКEDT + "\*.*" 
	, РежимСохраненияПутейZIP.СохранятьОтносительныеПути
	, РежимОбработкиПодкаталоговZIP.ОбрабатыватьРекурсивно);
	
	ZipEDT.Записать();
	
КонецПроцедуры


Процедура СоздатьOSPX(Данные)
	
	CommonTools.СообщитьПроцесс("Start OSPX");
	
	ПутьOS   = Данные["ПутьOS"];
	ПутьCLIP = Данные["ПутьCLIP"];
	Префикс  = Данные["Префикс"];
	
	СтандартноеИмяOSPX = СтрШаблон("oint-%1.ospx", Версия);
	ИмяOSPX            = СтрШаблон("oint-%1_%2.ospx", Версия, Префикс);
	КонечныйПутьOSPX   = ПутьВыгрузки + ИмяOSPX;
	
	СтандартноеИмяCLI = СтрШаблон("oint-cli-%1.ospx", Версия);
	ИмяCLI            = СтрШаблон("oint-cli-%1_%2.ospx", Версия, Префикс);
	КонечныйПутьCLI   = ПутьВыгрузки + ИмяCLI;
	
	ВременныКаталог  = КаталогВременныхФайлов();
	СборкаOS         = СтрШаблон("""%2bin/opm.bat"" b -o %1", ВременныКаталог, ОСкрипт);
	
	CommonTools.ЗапуститьВнешнееПриложение(СборкаOS, ПутьOS);
	ПереместитьФайл(ОбъединитьПути(ВременныКаталог, СтандартноеИмяOSPX), КонечныйПутьOSPX);
	
	УдалитьФайлы(Оскрипт + "lib\oint");
	
	Приостановить(1000);
	СтрокаВызова = СтрШаблон("""%2bin/opm.bat"" install -f ""%1""", КонечныйПутьOSPX, ОСкрипт);
	CommonTools.ЗапуститьВнешнееПриложение(СтрокаВызова);
	Приостановить(1000);
	
	// CLI
	
	СборкаCLI = СтрШаблон("""%2bin/opm.bat"" b -o %1", ВременныКаталог, ОСкрипт);
	
	CommonTools.ЗапуститьВнешнееПриложение(СборкаCLI, ПутьCLIP);
	ПереместитьФайл(ОбъединитьПути(ВременныКаталог, СтандартноеИмяCLI), КонечныйПутьCLI);
	
	УдалитьФайлы(Оскрипт + "lib\oint-cli");
	
	Приостановить(1000);
	СтрокаВызова = СтрШаблон("""%2bin/opm.bat"" install -f ""%1""", КонечныйПутьCLI, Оскрипт);
	CommonTools.ЗапуститьВнешнееПриложение(СтрокаВызова);
	Приостановить(1000);
	
	НачальныйПутьOint = ОСкрипт + "lib\oint";
	НачальныйПутьCLI  = ОСкрипт + "lib\oint-cli";
	КонечныйПутьOint  = ".\ci\installer_set\share\oint\lib\oint";
	КонечныйПутьCLI   = ".\ci\installer_set\share\oint\lib\oint-cli";
		
	ФС.КопироватьСодержимоеКаталога(НачальныйПутьOint, КонечныйПутьOint);
	ФС.КопироватьСодержимоеКаталога(НачальныйПутьCLI , КонечныйПутьCLI);
	УдалитьФайлы(".\ci\installer_set\share\oint\lib\oint\tests");
	
	ХешOint = ПолучитьСтрокуИзДвоичныхДанных(Новый ДвоичныеДанные(КонечныйПутьOint + "\.versionhash"));
	ХешCli  = ПолучитьСтрокуИзДвоичныхДанных(Новый ДвоичныеДанные(КонечныйПутьCLI + "\.versionhash"));
	
	Если Не ХешOint = ХешСумма Тогда
		ВызватьИсключение "Хеш сумма Oint не совпадает с основной!";
	КонецЕсли;
	
	Если Не ХешCli = ХешСумма Тогда
		ВызватьИсключение "Хеш сумма CLI не совпадает с основной!";
	КонецЕсли;	
	
КонецПроцедуры

Процедура СоздатьПакеты(Данные)
	
	CommonTools.СообщитьПроцесс("Start linux packages");
	
	ХешУстановщика = ПолучитьСтрокуИзДвоичныхДанных(Новый ДвоичныеДанные(".\ci\installer_set\share\oint\.versionhash"));
	
	Если Не ХешУстановщика = ХешСумма Тогда
		ВызватьИсключение "Хеш сумма набора установщика не совпадает с основной!";
	КонецЕсли;

	Описание = Данные["Описание"];
	Префикс  = Данные["Префикс"];
	
	ПодготовитьДополнительныеФайлыПакета(Данные);
	ОписаниеПакета = СоздатьОписаниеПакета(Описание, Префикс);
	
	ТекстSh = "--name oint"
	+ " -s dir"
	+ " --license mit"
	+ СтрШаблон(" --version %1", Версия)
	+ " --architecture all"
	+ СтрШаблон(" --description ""%1""", ОписаниеПакета)
	+ " --url ""https://openintegrations.dev/"""
	+ " --maintainer ""Anton Titovets <bayselonarrend@gmail.com>"""
	+ " --category ""Development"""
	+ " --after-install ""../ci/package_extras/postinst.sh"""
	+ " --after-remove ""../ci/package_extras/postrm.sh"""
	+ " --verbose"
	+ СтрШаблон(" ../ci/installer_set/=/usr %1=/usr/lib/oint/bin", ПутьДвижка)
	+ " ../ci/package_extras/=/usr";
	
	ИмяDeb = СтрШаблон("oint_%1_all_%2.deb", Версия, Префикс);
	ИмяRpm = СтрШаблон("oint-%1-1.noarch_%2.rpm", Версия, Префикс);

	СоответствиеПакетов = Новый Соответствие();
	СоответствиеПакетов.Вставить("deb", ИмяDeb);
	СоответствиеПакетов.Вставить("rpm", ИмяRpm);
	
	СоответствиеДополнений = Новый Соответствие();
	СоответствиеДополнений.Вставить("deb", " --deb-priority optional --deb-field ""Bugs: https://github.com/Bayselonarrend/OpenIntegrations/issues"" --deb-field ""Homepage: https://openintegrations.dev/"" ");
	СоответствиеДополнений.Вставить("rpm", " --rpm-os linux --depends libicu --rpm-summary ""CLI toolkit for API integrations"" ");
	
	Для Каждого Пакет Из СоответствиеПакетов Цикл
		
		MakeSh  = ПутьВыгрузки + "make" + Пакет.Ключ + ".sh";
		MakeBat = ПутьВыгрузки + "make" + Пакет.Ключ + ".bat";
		
		Дистрибутив = ?(Пакет.Ключ = "deb", "Ubuntu", "OracleLinux_9_1");	
		
		FPM = СтрШаблон("chmod +x %1
		|chmod +x ./ci/installer_set/bin/oint
		|chmod +x ./ci/package_extras/share/applications/oint.desktop
		|chmod +x ./ci/package_extras/postinst.sh
		|chmod +x ./ci/package_extras/postrm.sh
		|fpm -t %2 -p %3 %4%5"
			, ПутьДвижка
			, Пакет.Ключ
			, Пакет.Значение
			, СоответствиеДополнений[Пакет.Ключ]
			, ТекстSh);

		FPM = ПолучитьДвоичныеДанныеИзСтроки(FPM);
		FPM.Записать(MakeSh);
		
		ТекстBat = СтрШаблон("wsl -d %1 ""./make%2.sh""", Дистрибутив, Пакет.Ключ);
		ТекстBat = ПолучитьДвоичныеДанныеИзСтроки(ТекстBat);
		ТекстBat.Записать(MakeBat);
		
		CommonTools.ЗапуститьВнешнееПриложение(СтрШаблон("%2make%1.bat", Пакет.Ключ, ПутьВыгрузки), ПутьВыгрузки, Истина);
		
		УдалитьФайлы(MakeBat);
		УдалитьФайлы(MakeSh);
		
	КонецЦикла;
	
	// Очищаем временные файлы
	УдалитьФайлы("./ci/package_extras", Истина);
	
КонецПроцедуры

Процедура СоздатьУстановщик(Данные)
	
	CommonTools.СообщитьПроцесс("Start ISS");
	
	ПутьISS = Данные["ПутьISS"];
	ПутьCLI = Данные["ПутьCLI"];
	Префикс = Данные["Префикс"];
	
	//Setup
	
	ТекстISS = Новый ТекстовыйДокумент();
	ТекстISS.Прочитать(ПутьISS);
	
	Для Н = 1 По ТекстISS.КоличествоСтрок() Цикл
		
		ТекущаяСтрока = СокрЛП(ТекстISS.ПолучитьСтроку(Н));
		
		Если СтрНайти(ТекущаяСтрока, "#define MyAppVersion") Тогда
			ТекстISS.ЗаменитьСтроку(Н, "#define MyAppVersion """ + Версия + """");
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	ТекстISS.Записать(ПутьISS);
	
	СборкаSetup = СтрШаблон("""%1"" /cc ""%2""", ПутьInnoSetup, ПутьISS);
	CommonTools.ЗапуститьВнешнееПриложение(СборкаSetup);
	
КонецПроцедуры

Процедура ПодготовитьДополнительныеФайлыПакета(Данные)
	
	Префикс = Данные["Префикс"];
	
	КаталогExtras = "./ci/package_extras";
	СоздатьКаталог(КаталогExtras);
	СоздатьКаталог(КаталогExtras + "/share");
	СоздатьКаталог(КаталогExtras + "/share/applications");
	СоздатьКаталог(КаталогExtras + "/share/pixmaps");
	СоздатьКаталог(КаталогExtras + "/share/man");
	СоздатьКаталог(КаталогExtras + "/share/man/man1");
	
	СоздатьDesktopФайл(КаталогExtras, Префикс);
	КопироватьИконку(КаталогExtras);
	СоздатьManСтраницу(КаталогExtras, Префикс);
	СоздатьPostInstallСкрипты(КаталогExtras);
	
КонецПроцедуры

Процедура СоздатьDesktopФайл(КаталогExtras, Префикс)
	
	ПутьDesktop = КаталогExtras + "/share/applications/oint.desktop";
	
	Если Префикс = "ru" Тогда
		ИмяПриложения = "OInt CLI";
		Описание = "Инструмент командной строки для интеграции с API популярных онлайн-сервисов";
		КомментарийDesktop = "Работа с API различных сервисов из командной строки";
		КлючевыеСлова = "api;integration;cli;development;онлайн-сервисы;интеграция;разработка;";
		ИмяТерминала = "OInt CLI";
	Иначе
		ИмяПриложения = "OInt CLI";
		Описание = "CLI toolkit for integrating with APIs of popular online services";
		КомментарийDesktop = "Work with various service APIs from command line";
		КлючевыеСлова = "api;integration;cli;development;online-services;";
		ИмяТерминала = "OInt CLI";
	КонецЕсли;
	
	// Создаем команду, которая запускает oint и оставляет терминал открытым
	КомандаЗапуска = "sh -c ""oint; exec bash""";
	
	ТекстDesktop = "[Desktop Entry]
	|Version=1.0
	|Type=Application
	|Name=" + ИмяПриложения + "
	|Comment=" + КомментарийDesktop + "
	|Exec=x-terminal-emulator -T """ + ИмяТерминала + """ -e " + КомандаЗапуска + "
	|Icon=oint
	|Terminal=false
	|Categories=Development;Utility;ConsoleOnly;
	|Keywords=" + КлючевыеСлова + "
	|StartupNotify=true
	|NoDisplay=false";
		
	ФайлDesktop = Новый ТекстовыйДокумент();
	ФайлDesktop.УстановитьТекст(ТекстDesktop);
	ФайлDesktop.Записать(ПутьDesktop, КодировкаТекста.UTF8);
	
КонецПроцедуры

Процедура КопироватьИконку(КаталогExtras)

	ИсходнаяИконка = "./media/icons/ex.png";
	ЦелеваяИконка = КаталогExtras + "/share/pixmaps/oint.png";
	
	Если Новый Файл(ИсходнаяИконка).Существует() Тогда
		КопироватьФайл(ИсходнаяИконка, ЦелеваяИконка);
	Иначе
		ИсходнаяИконка = "./media/icons/ex.ico";
		Если Новый Файл(ИсходнаяИконка).Существует() Тогда
			КопироватьФайл(ИсходнаяИконка, ЦелеваяИконка);
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

Функция СоздатьОписаниеПакета(Описание, Префикс)
	
	Если Префикс = "ru" Тогда
		ДлинноеОписание = "OInt CLI - мощный инструмент командной строки для интеграции с API популярных онлайн-сервисов.
		| .
		| Поддерживаемые сервисы:
		| • Telegram, VK, Twitter, Slack - мессенджеры и социальные сети
		| • Google Drive, Dropbox, Yandex Disk - облачные хранилища  
		| • Google Sheets, Airtable, Notion - таблицы и базы данных
		| • MySQL, PostgreSQL, MongoDB, SQLite - системы управления БД
		| • OpenAI, Ollama - AI и машинное обучение
		| • И многие другие сервисы
		| .
		| Особенности:
		| • Простой и интуитивный интерфейс командной строки
		| • Подробная документация и примеры использования
		| • Поддержка различных форматов данных (JSON, XML, CSV)
		| • Возможность автоматизации через скрипты";
	Иначе
		ДлинноеОписание = "OInt CLI - powerful command-line toolkit for integrating with APIs of popular online services.
		| .
		| Supported services:
		| • Telegram, VK, Twitter, Slack - messengers and social networks
		| • Google Drive, Dropbox, Yandex Disk - cloud storage
		| • Google Sheets, Airtable, Notion - spreadsheets and databases
		| • MySQL, PostgreSQL, MongoDB, SQLite - database management systems
		| • OpenAI, Ollama - AI and machine learning
		| • And many other services
		| .
		| Features:
		| • Simple and intuitive command-line interface
		| • Comprehensive documentation and usage examples
		| • Support for various data formats (JSON, XML, CSV)
		| • Automation capabilities through scripts";
	КонецЕсли;
	
	Возврат Описание + Символы.ПС + ДлинноеОписание;
	
КонецФункции

Процедура СоздатьPostInstallСкрипты(КаталогExtras)
	
	// Post-install скрипт
	ТекстPostInst = "#!/bin/bash
	|# Post-installation script for OInt CLI
	|
	|# Update desktop database
	|if command -v update-desktop-database >/dev/null 2>&1; then
	|    update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
	|fi
	|
	|# Update icon cache
	|if command -v gtk-update-icon-cache >/dev/null 2>&1; then
	|    gtk-update-icon-cache -f -t /usr/share/pixmaps >/dev/null 2>&1 || true
	|fi
	|
	|# Update man database
	|if command -v mandb >/dev/null 2>&1; then
	|    mandb -q >/dev/null 2>&1 || true
	|fi
	|
	|# Add /usr/bin to PATH if not already there (should be by default)
	|if ! echo $PATH | grep -q ""/usr/bin""; then
	|    echo ""export PATH=$PATH:/usr/bin"" >> /etc/environment
	|fi
	|
	|echo ""OInt CLI has been successfully installed!""
	|echo ""You can now run 'oint --help' from any terminal.""
	|echo ""The application is also available in your applications menu.""
	|echo ""For detailed documentation, visit: https://openintegrations.dev/""";
	
	ФайлPostInst = Новый ТекстовыйДокумент();
	ФайлPostInst.УстановитьТекст(ТекстPostInst);
	ФайлPostInst.Записать(КаталогExtras + "/postinst.sh", КодировкаТекста.UTF8);
	
	ТекстPostRm = "#!/bin/bash
	|# Post-removal script for OInt CLI
	|
	|# Update desktop database
	|if command -v update-desktop-database >/dev/null 2>&1; then
	|    update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
	|fi
	|
	|# Update icon cache
	|if command -v gtk-update-icon-cache >/dev/null 2>&1; then
	|    gtk-update-icon-cache -f -t /usr/share/pixmaps >/dev/null 2>&1 || true
	|fi
	|
	|# Update man database
	|if command -v mandb >/dev/null 2>&1; then
	|    mandb -q >/dev/null 2>&1 || true
	|fi
	|
	|echo ""OInt CLI has been removed.""";
	
	ФайлPostRm = Новый ТекстовыйДокумент();
	ФайлPostRm.УстановитьТекст(ТекстPostRm);
	ФайлPostRm.Записать(КаталогExtras + "/postrm.sh", КодировкаТекста.UTF8);
	
КонецПроцедуры
Процедура СоздатьManСтраницу(КаталогExtras, Префикс)
	
	ПутьMan = КаталогExtras + "/share/man/man1/oint.1";
	
	Если Префикс = "ru" Тогда
		ТекстMan = ".TH OINT 1 """ + ТекущаяДата() + """ ""OInt CLI " + Версия + """ ""User Commands""
		|.SH NAME
		|oint \- инструмент командной строки для интеграции с API популярных онлайн-сервисов
		|.SH SYNOPSIS
		|.B oint
		|[\fIOPTIONS\fR] [\fICOMMAND\fR] [\fIARGUMENTS\fR]
		|.SH DESCRIPTION
		|OInt CLI - это мощный инструмент командной строки для работы с API различных онлайн-сервисов.
		|Поддерживает интеграцию с мессенджерами, облачными хранилищами, базами данных, AI-сервисами и многими другими платформами.
		|.SH OPTIONS
		|.TP
		|.B \-h, \-\-help
		|Показать справку по использованию
		|.TP
		|.B \-v, \-\-version
		|Показать версию программы
		|.SH EXAMPLES
		|.TP
		|.B oint --help
		|Показать общую справку
		|.TP
		|.B oint telegram --help
		|Показать справку по работе с Telegram API
		|.SH SUPPORTED SERVICES
		|Telegram, VK, Twitter, Slack, Google Drive, Dropbox, Yandex Disk, Google Sheets, 
		|Airtable, Notion, MySQL, PostgreSQL, MongoDB, SQLite, OpenAI, Ollama и многие другие.
		|.SH FILES
		|.TP
		|.I /usr/lib/oint/
		|Каталог установки программы
		|.TP
		|.I /usr/share/oint/
		|Каталог с дополнительными файлами
		|.SH AUTHOR
		|Anton Titovets <bayselonarrend@gmail.com>
		|.SH SEE ALSO
		|Документация: https://openintegrations.dev/
		|.br
		|GitHub: https://github.com/Bayselonarrend/OpenIntegrations";
	Иначе
		ТекстMan = ".TH OINT 1 """ + ТекущаяДата() + """ ""OInt CLI " + Версия + """ ""User Commands""
		|.SH NAME
		|oint \- CLI toolkit for integrating with APIs of popular online services
		|.SH SYNOPSIS
		|.B oint
		|[\fIOPTIONS\fR] [\fICOMMAND\fR] [\fIARGUMENTS\fR]
		|.SH DESCRIPTION
		|OInt CLI is a powerful command-line toolkit for working with APIs of various online services.
		|Supports integration with messengers, cloud storage, databases, AI services and many other platforms.
		|.SH OPTIONS
		|.TP
		|.B \-h, \-\-help
		|Show usage help
		|.TP
		|.B \-v, \-\-version
		|Show program version
		|.SH EXAMPLES
		|.TP
		|.B oint --help
		|Show general help
		|.TP
		|.B oint telegram --help
		|Show help for Telegram API integration
		|.SH SUPPORTED SERVICES
		|Telegram, VK, Twitter, Slack, Google Drive, Dropbox, Yandex Disk, Google Sheets, 
		|Airtable, Notion, MySQL, PostgreSQL, MongoDB, SQLite, OpenAI, Ollama and many others.
		|.SH FILES
		|.TP
		|.I /usr/lib/oint/
		|Program installation directory
		|.TP
		|.I /usr/share/oint/
		|Additional files directory
		|.SH AUTHOR
		|Anton Titovets <bayselonarrend@gmail.com>
		|.SH SEE ALSO
		|Documentation: https://en.openintegrations.dev/
		|.br
		|GitHub: https://github.com/Bayselonarrend/OpenIntegrations";
	КонецЕсли;
	
	ФайлMan = Новый ТекстовыйДокумент();
	ФайлMan.УстановитьТекст(ТекстMan);
	ФайлMan.Записать(ПутьMan, КодировкаТекста.UTF8);
	
КонецПроцедуры