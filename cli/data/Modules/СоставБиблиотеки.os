﻿Функция ПолучитьСостав() Экспорт

    ТаблицаСостава = Новый ТаблицаЗначений();
    ТаблицаСостава.Колонки.Добавить("Библиотека");
    ТаблицаСостава.Колонки.Добавить("Модуль");
    ТаблицаСостава.Колонки.Добавить("Метод");
    ТаблицаСостава.Колонки.Добавить("МетодПоиска");
    ТаблицаСостава.Колонки.Добавить("Параметр");
    ТаблицаСостава.Колонки.Добавить("Описание");
    ТаблицаСостава.Колонки.Добавить("Обработка");

    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПолучитьИнформациюБота";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬИНФОРМАЦИЮБОТА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПолучитьОбновления";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОБНОВЛЕНИЯ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "УстановитьWebhook";
    НоваяСтрока.МетодПоиска = "УСТАНОВИТЬWEBHOOK";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "УстановитьWebhook";
    НоваяСтрока.МетодПоиска = "УСТАНОВИТЬWEBHOOK";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "Адрес обработки запросов от Telegram (с https:)";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "УдалитьWebhook";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬWEBHOOK";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьТекстовоеСообщение";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬТЕКСТОВОЕСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьТекстовоеСообщение";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬТЕКСТОВОЕСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Текст сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьТекстовоеСообщение";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬТЕКСТОВОЕСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКартинку";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКАРТИНКУ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКартинку";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКАРТИНКУ";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Текст сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКартинку";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКАРТИНКУ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Файл картинки";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКартинку";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКАРТИНКУ";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьВидео";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬВИДЕО";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьВидео";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬВИДЕО";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Текст сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьВидео";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬВИДЕО";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Файл видео";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьВидео";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬВИДЕО";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьАудио";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬАУДИО";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьАудио";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬАУДИО";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Текст сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьАудио";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬАУДИО";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Файл аудио";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьАудио";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬАУДИО";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьДокумент";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬДОКУМЕНТ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьДокумент";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬДОКУМЕНТ";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Текст сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьДокумент";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬДОКУМЕНТ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Файл документа";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьДокумент";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬДОКУМЕНТ";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьГифку";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬГИФКУ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьГифку";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬГИФКУ";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Текст сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьГифку";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬГИФКУ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Файл гифки";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьГифку";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬГИФКУ";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьМедиагруппу";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬМЕДИАГРУППУ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьМедиагруппу";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬМЕДИАГРУППУ";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Текст сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьМедиагруппу";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬМЕДИАГРУППУ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "JSON вида { ""Путь"": ""Тип"", ...}:";
    НоваяСтрока.Обработка   = "JSON";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьМедиагруппу";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬМЕДИАГРУППУ";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьМестоположение";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬМЕСТОПОЛОЖЕНИЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьМестоположение";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬМЕСТОПОЛОЖЕНИЕ";
    НоваяСтрока.Параметр    = "--lat";
    НоваяСтрока.Описание    = "Географическая широта";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьМестоположение";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬМЕСТОПОЛОЖЕНИЕ";
    НоваяСтрока.Параметр    = "--long";
    НоваяСтрока.Описание    = "Географическая долгота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьМестоположение";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬМЕСТОПОЛОЖЕНИЕ";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКонтакт";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКОНТАКТ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКонтакт";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКОНТАКТ";
    НоваяСтрока.Параметр    = "--name";
    НоваяСтрока.Описание    = "Имя контакта";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКонтакт";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКОНТАКТ";
    НоваяСтрока.Параметр    = "--surname";
    НоваяСтрока.Описание    = "Фамилия контакта";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКонтакт";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКОНТАКТ";
    НоваяСтрока.Параметр    = "--phone";
    НоваяСтрока.Описание    = "Телефон контакта";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьКонтакт";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬКОНТАКТ";
    НоваяСтрока.Параметр    = "--keyboard";
    НоваяСтрока.Описание    = "См. СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.Обработка   = "Текст";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьОпрос";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬОПРОС";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьОпрос";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬОПРОС";
    НоваяСтрока.Параметр    = "--question";
    НоваяСтрока.Описание    = "Вопрос опроса";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьОпрос";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬОПРОС";
    НоваяСтрока.Параметр    = "--options";
    НоваяСтрока.Описание    = "Массив вида [""Вар1"",""Вар2"",..]";
    НоваяСтрока.Обработка   = "Массив";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОтправитьОпрос";
    НоваяСтрока.МетодПоиска = "ОТПРАВИТЬОПРОС";
    НоваяСтрока.Параметр    = "--anonymous";
    НоваяСтрока.Описание    = "Анонимность опроса";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПереслатьСообщение";
    НоваяСтрока.МетодПоиска = "ПЕРЕСЛАТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПереслатьСообщение";
    НоваяСтрока.МетодПоиска = "ПЕРЕСЛАТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--message";
    НоваяСтрока.Описание    = "ID оригинального сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПереслатьСообщение";
    НоваяСтрока.МетодПоиска = "ПЕРЕСЛАТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--from";
    НоваяСтрока.Описание    = "ID чата оригинального сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "Бан";
    НоваяСтрока.МетодПоиска = "БАН";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "Бан";
    НоваяСтрока.МетодПоиска = "БАН";
    НоваяСтрока.Параметр    = "--user";
    НоваяСтрока.Описание    = "ID целевого пользователя";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "Разбан";
    НоваяСтрока.МетодПоиска = "РАЗБАН";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "Разбан";
    НоваяСтрока.МетодПоиска = "РАЗБАН";
    НоваяСтрока.Параметр    = "--user";
    НоваяСтрока.Описание    = "ID целевого пользователя";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СоздатьСсылкуПриглашение";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬССЫЛКУПРИГЛАШЕНИЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СоздатьСсылкуПриглашение";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬССЫЛКУПРИГЛАШЕНИЕ";
    НоваяСтрока.Параметр    = "--name";
    НоваяСтрока.Описание    = "Заголовок приглашения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СоздатьСсылкуПриглашение";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬССЫЛКУПРИГЛАШЕНИЕ";
    НоваяСтрока.Параметр    = "--expire";
    НоваяСтрока.Описание    = "Дата окончания жизни ссылки (безсрочно, если не указано)";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СоздатьСсылкуПриглашение";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬССЫЛКУПРИГЛАШЕНИЕ";
    НоваяСтрока.Параметр    = "--limit";
    НоваяСтрока.Описание    = "Лимит пользователей (бесконечно, если не указано)";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ЗакрепитьСообщение";
    НоваяСтрока.МетодПоиска = "ЗАКРЕПИТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ЗакрепитьСообщение";
    НоваяСтрока.МетодПоиска = "ЗАКРЕПИТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID целевого чата";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ЗакрепитьСообщение";
    НоваяСтрока.МетодПоиска = "ЗАКРЕПИТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--message";
    НоваяСтрока.Описание    = "ID целевого сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОткрепитьСообщение";
    НоваяСтрока.МетодПоиска = "ОТКРЕПИТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОткрепитьСообщение";
    НоваяСтрока.МетодПоиска = "ОТКРЕПИТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID целевого чата";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОткрепитьСообщение";
    НоваяСтрока.МетодПоиска = "ОТКРЕПИТЬСООБЩЕНИЕ";
    НоваяСтрока.Параметр    = "--message";
    НоваяСтрока.Описание    = "ID целевого сообщения";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПолучитьЧислоУчастников";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЧИСЛОУЧАСТНИКОВ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен бота";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПолучитьЧислоУчастников";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЧИСЛОУЧАСТНИКОВ";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID целевого чата";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПолучитьСписокИконокАватаров";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКИКОНОКАВАТАРОВ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СоздатьТемуФорума";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СоздатьТемуФорума";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата создания темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СоздатьТемуФорума";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--name";
    НоваяСтрока.Описание    = "Заголовок темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СоздатьТемуФорума";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--icon";
    НоваяСтрока.Описание    = "См. ПолучитьСписокИконокАватаров";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ИзменитьТемуФорума";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ИзменитьТемуФорума";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата создания темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ИзменитьТемуФорума";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--topic";
    НоваяСтрока.Описание    = "ID темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ИзменитьТемуФорума";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--name";
    НоваяСтрока.Описание    = "Новый заголовок";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ИзменитьТемуФорума";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--icon";
    НоваяСтрока.Описание    = "См. ПолучитьСписокИконокАватаров";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ЗакрытьТемуФорума";
    НоваяСтрока.МетодПоиска = "ЗАКРЫТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ЗакрытьТемуФорума";
    НоваяСтрока.МетодПоиска = "ЗАКРЫТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ЗакрытьТемуФорума";
    НоваяСтрока.МетодПоиска = "ЗАКРЫТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--topic";
    НоваяСтрока.Описание    = "ID темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОткрытьТемуФорума";
    НоваяСтрока.МетодПоиска = "ОТКРЫТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОткрытьТемуФорума";
    НоваяСтрока.МетодПоиска = "ОТКРЫТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОткрытьТемуФорума";
    НоваяСтрока.МетодПоиска = "ОТКРЫТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--topic";
    НоваяСтрока.Описание    = "ID темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "УдалитьТемуФорума";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "УдалитьТемуФорума";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "УдалитьТемуФорума";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--topic";
    НоваяСтрока.Описание    = "ID темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СкрытьГлавнуюТемуФорума";
    НоваяСтрока.МетодПоиска = "СКРЫТЬГЛАВНУЮТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СкрытьГлавнуюТемуФорума";
    НоваяСтрока.МетодПоиска = "СКРЫТЬГЛАВНУЮТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПоказатьГлавнуюТемуФорума";
    НоваяСтрока.МетодПоиска = "ПОКАЗАТЬГЛАВНУЮТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ПоказатьГлавнуюТемуФорума";
    НоваяСтрока.МетодПоиска = "ПОКАЗАТЬГЛАВНУЮТЕМУФОРУМА";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ИзменитьИмяГлавнойТемыФорума";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬИМЯГЛАВНОЙТЕМЫФОРУМА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ИзменитьИмяГлавнойТемыФорума";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬИМЯГЛАВНОЙТЕМЫФОРУМА";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ИзменитьИмяГлавнойТемыФорума";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬИМЯГЛАВНОЙТЕМЫФОРУМА";
    НоваяСтрока.Параметр    = "--name";
    НоваяСтрока.Описание    = "Новое имя главной темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОчиститьСписокЗакрепленныхСообщенийТемы";
    НоваяСтрока.МетодПоиска = "ОЧИСТИТЬСПИСОКЗАКРЕПЛЕННЫХСООБЩЕНИЙТЕМЫ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОчиститьСписокЗакрепленныхСообщенийТемы";
    НоваяСтрока.МетодПоиска = "ОЧИСТИТЬСПИСОКЗАКРЕПЛЕННЫХСООБЩЕНИЙТЕМЫ";
    НоваяСтрока.Параметр    = "--chat";
    НоваяСтрока.Описание    = "ID чата темы";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "ОчиститьСписокЗакрепленныхСообщенийТемы";
    НоваяСтрока.МетодПоиска = "ОЧИСТИТЬСПИСОКЗАКРЕПЛЕННЫХСООБЩЕНИЙТЕМЫ";
    НоваяСтрока.Параметр    = "--topic";
    НоваяСтрока.Описание    = "ID темы. Главная, если не заполнено";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬКЛАВИАТУРУПОМАССИВУКНОПОК";
    НоваяСтрока.Параметр    = "--buttons";
    НоваяСтрока.Описание    = "Массив вида [""Кнопка1"",""Кнопка2"",..]";
    НоваяСтрока.Обработка   = "Массив";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬКЛАВИАТУРУПОМАССИВУКНОПОК";
    НоваяСтрока.Параметр    = "--under";
    НоваяСтрока.Описание    = "Клавиатура под сообщением или на нижней панели";
    НоваяСтрока.Обработка   = "Строка";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "telegram";
    НоваяСтрока.Модуль      = "OPI_Telegram";
    НоваяСтрока.Метод       = "СформироватьКлавиатуруПоМассивуКнопок";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬКЛАВИАТУРУПОМАССИВУКНОПОК";
    НоваяСтрока.Параметр    = "--coloumn";
    НоваяСтрока.Описание    = "Истина > кнопки выводятся в столбик, Ложь > в строку";
    НоваяСтрока.Обработка   = "Строка";

    Возврат ТаблицаСостава;
КонецФункции
