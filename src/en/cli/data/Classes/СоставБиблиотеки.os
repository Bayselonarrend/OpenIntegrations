﻿#Использовать "./internal"

Перем СоответствиеКоманд;

Процедура ПриСозданииОбъекта()
СоответствиеКоманд  = Новый Соответствие();
СоответствиеКоманд.Вставить("tools", "Утилиты");
СоответствиеКоманд.Вставить("airtable", "OPI_Airtable");
СоответствиеКоманд.Вставить("bitrix24", "OPI_Bitrix24");
СоответствиеКоманд.Вставить("cdek", "OPI_CDEK");
СоответствиеКоманд.Вставить("dropbox", "OPI_Dropbox");
СоответствиеКоманд.Вставить("gcalendar", "OPI_GoogleCalendar");
СоответствиеКоманд.Вставить("gdrive", "OPI_GoogleDrive");
СоответствиеКоманд.Вставить("gsheets", "OPI_GoogleSheets");
СоответствиеКоманд.Вставить("google", "OPI_GoogleWorkspace");
СоответствиеКоманд.Вставить("proxy", "OPI_IntegrationProxy");
СоответствиеКоманд.Вставить("mongodb", "OPI_MongoDB");
СоответствиеКоманд.Вставить("neocities", "OPI_Neocities");
СоответствиеКоманд.Вставить("notion", "OPI_Notion");
СоответствиеКоманд.Вставить("ozon", "OPI_Ozon");
СоответствиеКоманд.Вставить("s3", "OPI_S3");
СоответствиеКоманд.Вставить("slack", "OPI_Slack");
СоответствиеКоманд.Вставить("sqlite", "OPI_SQLite");
СоответствиеКоманд.Вставить("tcp", "OPI_TCP");
СоответствиеКоманд.Вставить("telegram", "OPI_Telegram");
СоответствиеКоманд.Вставить("twitter", "OPI_Twitter");
СоответствиеКоманд.Вставить("viber", "OPI_Viber");
СоответствиеКоманд.Вставить("vk", "OPI_VK");
СоответствиеКоманд.Вставить("vkteams", "OPI_VKTeams");
СоответствиеКоманд.Вставить("yadisk", "OPI_YandexDisk");
СоответствиеКоманд.Вставить("yandex", "OPI_YandexID");
СоответствиеКоманд.Вставить("yamarket", "OPI_YandexMarket");
СоответствиеКоманд.Вставить("metrika", "OPI_YandexMetrika");
КонецПроцедуры

Функция ПолучитьВерсию() Экспорт
  Возврат "1.18.0";
КонецФункции

Функция ПолучитьСоответствиеКомандМодулей() Экспорт
Возврат СоответствиеКоманд;
КонецФункции


Функция ПолучитьСостав(Знач Команда) Экспорт
    ТекущийСостав = Новый(Команда);
    Возврат ТекущийСостав.ПолучитьСостав();
КонецФункции
Функция ПолучитьПолныйСостав() Экспорт
    
    ОбщаяТаблица = Неопределено;
    
    Для Каждого Команда Из ПолучитьСоответствиеКомандМодулей() Цикл
        
        ТекущаяТаблица = ПолучитьСостав(Команда.Ключ);
        
        Если ОбщаяТаблица = Неопределено Тогда
            ОбщаяТаблица = ТекущаяТаблица;
        Иначе
            Для Каждого СтрокаТаблицы Из ТекущаяТаблица Цикл
                ЗаполнитьЗначенияСвойств(ОбщаяТаблица.Добавить(), СтрокаТаблицы);
            КонецЦикла;
        КонецЕсли;
        
    КонецЦикла;
    
    Возврат ОбщаяТаблица;
    
КонецФункции

Функция СформироватьСтрокуВызоваМетода(Знач ПереданныеПараметры, Знач Команда, Знач Метод) Экспорт
    
    Модуль = СоответствиеКоманд.Получить(Команда);
    
    Если Не ЗначениеЗаполнено(Модуль) Тогда
        Возврат Новый Структура("Ошибка,Результат", Истина, "Команда");
    КонецЕсли;
    
    ОтборКоманды      = Новый Структура("МетодПоиска", вРег(Метод));
    ПараметрыМетода   = ПолучитьСостав(Команда).НайтиСтроки(ОтборКоманды);
    
    Если Не ЗначениеЗаполнено(ПараметрыМетода) Тогда
        Возврат Новый Структура("Ошибка,Результат", Истина, "Метод");
    КонецЕсли;
    
    ТекстВыполнения = "";
    СтрокаВызова    = Модуль + "." + Метод + "(";
    Счетчик         = 0;
    
    Для Каждого НеобходимыйПараметр Из ПараметрыМетода Цикл
        
        ИмяПараметра      = НеобходимыйПараметр.Параметр;
        ЗначениеПараметра = ПереданныеПараметры.Получить(ИмяПараметра);
        
        Если ЗначениеЗаполнено(ЗначениеПараметра) Тогда
            
            ИмяПараметра = "Параметр" + СтрЗаменить(ИмяПараметра, "--", "_");
            
            ТекстВыполнения = ТекстВыполнения 
            + Символы.ПС 
            + ИмяПараметра
            + " = """ 
            + СтрЗаменить(ЗначениеПараметра, """", """""")
            + """;";
            
            Если ТребуетсяОбработкаУправляющихПоследовательностей(ИмяПараметра, ЗначениеПараметра) Тогда
                
                ТекстВыполнения = ТекстВыполнения + "
                |OPI_Инструменты.ЗаменитьУправляющиеПоследовательности(" + ИмяПараметра + ");
                |";
                
            КонецЕсли;
            
            СтрокаВызова = СтрокаВызова + ИмяПараметра + ", ";
            Счетчик      = Счетчик + 1;
            
        Иначе
            СтрокаВызова = СтрокаВызова + " , ";
        КонецЕсли;
        
    КонецЦикла;
    
    ЛишниеСимволы   = 2;
    СтрокаВызова    = Лев(СтрокаВызова, СтрДлина(СтрокаВызова) - ЛишниеСимволы);
    СтрокаВызова    = СтрокаВызова + ");";
    СтрокаВызова    = "Ответ = " + СтрокаВызова;
    ТекстВыполнения = ТекстВыполнения + Символы.ПС + СтрокаВызова;
    
    Возврат Новый Структура("Ошибка,Результат", Ложь, ТекстВыполнения);
    
КонецФункции

Функция ТребуетсяОбработкаУправляющихПоследовательностей(Знач ИмяПараметра, Знач ЗначениеПараметра)
    
    ЗначениеПараметраСокр = СокрЛП(ЗначениеПараметра);
    ФайлПараметра         = Новый Файл(ЗначениеПараметраСокр);
    
    Возврат Не СтрНачинаетсяС(ЗначениеПараметраСокр, "{")
    И Не СтрНачинаетсяС(ЗначениеПараметраСокр, "[") 
    И Не ФайлПараметра.Существует() 
    И Не ИмяПараметра = "Параметр_out";
    
КонецФункции
