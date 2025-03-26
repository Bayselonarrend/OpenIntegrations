﻿Функция ПолучитьСостав() Экспорт

    ТаблицаСостава = Новый ТаблицаЗначений();
    ТаблицаСостава.Колонки.Добавить("Библиотека");
    ТаблицаСостава.Колонки.Добавить("Модуль");
    ТаблицаСостава.Колонки.Добавить("Метод");
    ТаблицаСостава.Колонки.Добавить("МетодПоиска");
    ТаблицаСостава.Колонки.Добавить("Параметр");
    ТаблицаСостава.Колонки.Добавить("Описание");
    ТаблицаСостава.Колонки.Добавить("ОписаниеМетода");
    ТаблицаСостава.Колонки.Добавить("Область");

    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "tcp";
    НоваяСтрока.Модуль      = "OPI_TCP";
    НоваяСтрока.Метод       = "ОбработатьЗапрос";
    НоваяСтрока.МетодПоиска = "ОБРАБОТАТЬЗАПРОС";
    НоваяСтрока.Параметр    = "--address";
    НоваяСтрока.Описание    = "Адрес и порт для подключения";
    НоваяСтрока.Область     = "Методы клиента";
    НоваяСтрока.ОписаниеМетода   = "Отправляет одиночный запрос на указанный адрес и получает ответ, используя стандартные настройки";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "tcp";
    НоваяСтрока.Модуль      = "OPI_TCP";
    НоваяСтрока.Метод       = "ОбработатьЗапрос";
    НоваяСтрока.МетодПоиска = "ОБРАБОТАТЬЗАПРОС";
    НоваяСтрока.Параметр    = "--data";
    НоваяСтрока.Описание    = "Данные или текст для отправки (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Методы клиента";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "tcp";
    НоваяСтрока.Модуль      = "OPI_TCP";
    НоваяСтрока.Метод       = "ОбработатьЗапрос";
    НоваяСтрока.МетодПоиска = "ОБРАБОТАТЬЗАПРОС";
    НоваяСтрока.Параметр    = "--string";
    НоваяСтрока.Описание    = "Признак получения ответа как строки (необяз. по ум. - Да)";
    НоваяСтрока.Область     = "Методы клиента";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "tcp";
    НоваяСтрока.Модуль      = "OPI_TCP";
    НоваяСтрока.Метод       = "ОбработатьЗапрос";
    НоваяСтрока.МетодПоиска = "ОБРАБОТАТЬЗАПРОС";
    НоваяСтрока.Параметр    = "--tls";
    НоваяСтрока.Описание    = "Настройки TLS, если необходимо. См. ПолучитьНастройкиTls (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Методы клиента";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "tcp";
    НоваяСтрока.Модуль      = "OPI_TCP";
    НоваяСтрока.Метод       = "ПолучитьНастройкиTls";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬНАСТРОЙКИTLS";
    НоваяСтрока.Параметр    = "--trust";
    НоваяСтрока.Описание    = "Позволяет работать с некорретными сертификатами, в т.ч. самоподписанными";
    НоваяСтрока.Область     = "Методы клиента";
    НоваяСтрока.ОписаниеМетода   = "Формирует настройки для использования TLS при выполнении запросов";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "tcp";
    НоваяСтрока.Модуль      = "OPI_TCP";
    НоваяСтрока.Метод       = "ПолучитьНастройкиTls";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬНАСТРОЙКИTLS";
    НоваяСтрока.Параметр    = "--cert";
    НоваяСтрока.Описание    = "Путь к корневому PEM файлу сертификата, если его нет в системном хранилище (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Методы клиента";

    Возврат ТаблицаСостава;
КонецФункции

