﻿#Использовать "./internal"

Функция ПолучитьВерсию() Экспорт
  Возврат "1.21.0";
КонецФункции

Функция ПолучитьСоответствиеКомандМодулей() Экспорт
СоответствиеКомандМодулей  = Новый Соответствие();
СоответствиеКомандМодулей.Вставить("tools", "Утилиты");
СоответствиеКомандМодулей.Вставить("airtable", "OPI_Airtable");
СоответствиеКомандМодулей.Вставить("bitrix24", "OPI_Bitrix24");
СоответствиеКомандМодулей.Вставить("cdek", "OPI_CDEK");
СоответствиеКомандМодулей.Вставить("dropbox", "OPI_Dropbox");
СоответствиеКомандМодулей.Вставить("gcalendar", "OPI_GoogleCalendar");
СоответствиеКомандМодулей.Вставить("gdrive", "OPI_GoogleDrive");
СоответствиеКомандМодулей.Вставить("gsheets", "OPI_GoogleSheets");
СоответствиеКомандМодулей.Вставить("google", "OPI_GoogleWorkspace");
СоответствиеКомандМодулей.Вставить("greenapi", "OPI_GreenAPI");
СоответствиеКомандМодулей.Вставить("neocities", "OPI_Neocities");
СоответствиеКомандМодулей.Вставить("notion", "OPI_Notion");
СоответствиеКомандМодулей.Вставить("ozon", "OPI_Ozon");
СоответствиеКомандМодулей.Вставить("postgres", "OPI_PostgreSQL");
СоответствиеКомандМодулей.Вставить("rcon", "OPI_RCON");
СоответствиеКомандМодулей.Вставить("s3", "OPI_S3");
СоответствиеКомандМодулей.Вставить("slack", "OPI_Slack");
СоответствиеКомандМодулей.Вставить("sqlite", "OPI_SQLite");
СоответствиеКомандМодулей.Вставить("tcp", "OPI_TCP");
СоответствиеКомандМодулей.Вставить("telegram", "OPI_Telegram");
СоответствиеКомандМодулей.Вставить("twitter", "OPI_Twitter");
СоответствиеКомандМодулей.Вставить("viber", "OPI_Viber");
СоответствиеКомандМодулей.Вставить("vk", "OPI_VK");
СоответствиеКомандМодулей.Вставить("vkteams", "OPI_VKTeams");
СоответствиеКомандМодулей.Вставить("yadisk", "OPI_YandexDisk");
СоответствиеКомандМодулей.Вставить("yandex", "OPI_YandexID");
СоответствиеКомандМодулей.Вставить("yamarket", "OPI_YandexMarket");
СоответствиеКомандМодулей.Вставить("metrika", "OPI_YandexMetrika");
Возврат СоответствиеКомандМодулей;
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
