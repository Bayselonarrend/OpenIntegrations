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
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьТокен";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬТОКЕН";
    НоваяСтрока.Параметр    = "--account";
    НоваяСтрока.Описание    = "Идентификатор клиента (Account)";
    НоваяСтрока.Область     = "Общие методы";
    НоваяСтрока.ОписаниеМетода   = "Получает токен на основе идентификатора аккаунта и пароля";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьТокен";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬТОКЕН";
    НоваяСтрока.Параметр    = "--pass";
    НоваяСтрока.Описание    = "Секретный ключ (Password)";
    НоваяСтрока.Область     = "Общие методы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьТокен";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬТОКЕН";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Общие методы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьЗаказ";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Создает заказ по описанию полей";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьЗаказ";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--order";
    НоваяСтрока.Описание    = "Набор полей заказа. См. ПолучитьОписаниеЗаказа";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьЗаказ";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--ostore";
    НоваяСтрока.Описание    = "Признак типа заказа Интернет магазин (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьЗаказ";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ИзменитьЗаказ";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Изменяет значения полей выбранного заказа";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ИзменитьЗаказ";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID заказа для изменение";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ИзменитьЗаказ";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--order";
    НоваяСтрока.Описание    = "Набор изменяемых полей заказа";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ИзменитьЗаказ";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "УдалитьЗаказ";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Удаляет заказ по UUID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "УдалитьЗаказ";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID заказа для удаления";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "УдалитьЗаказ";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаказ";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Получает заказ по UUID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаказ";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID заказа";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаказ";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАКАЗ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаказПоНомеру";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАКАЗПОНОМЕРУ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Получает заказ по номеру СДЭК или внутреннему номеру клиента";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаказПоНомеру";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАКАЗПОНОМЕРУ";
    НоваяСтрока.Параметр    = "--number";
    НоваяСтрока.Описание    = "Номер заказа";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаказПоНомеру";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАКАЗПОНОМЕРУ";
    НоваяСтрока.Параметр    = "--internal";
    НоваяСтрока.Описание    = "Вид номера заказа. Истина > номер в базе клиента, Ложь > номер СДЭК (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаказПоНомеру";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАКАЗПОНОМЕРУ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ОформитьКлиентскийВозврат";
    НоваяСтрока.МетодПоиска = "ОФОРМИТЬКЛИЕНТСКИЙВОЗВРАТ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Оформляет клиентский возврат для заказа интернет магазина";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ОформитьКлиентскийВозврат";
    НоваяСтрока.МетодПоиска = "ОФОРМИТЬКЛИЕНТСКИЙВОЗВРАТ";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID заказа";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ОформитьКлиентскийВозврат";
    НоваяСтрока.МетодПоиска = "ОФОРМИТЬКЛИЕНТСКИЙВОЗВРАТ";
    НоваяСтрока.Параметр    = "--tariff";
    НоваяСтрока.Описание    = "Код тарифа (из доступных по договору)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ОформитьКлиентскийВозврат";
    НоваяСтрока.МетодПоиска = "ОФОРМИТЬКЛИЕНТСКИЙВОЗВРАТ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьОтказ";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬОТКАЗ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Создает отказ по заказу для возврата в интернет магазин";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьОтказ";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬОТКАЗ";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID заказа";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьОтказ";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬОТКАЗ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьКвитанцию";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Формирует квитанции в формате pdf к заказам
    |
    |    Пример указания параметра типа массив:
    |    --param ""['Val1','Val2','Val3']""
    |";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьКвитанцию";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--uuids";
    НоваяСтрока.Описание    = "Один или массив UUID заказов";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьКвитанцию";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--type";
    НоваяСтрока.Описание    = "Тип (язык) квитанции (необяз. по ум. - tpl_russia)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьКвитанцию";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--count";
    НоваяСтрока.Описание    = "Число копий одной квитанции на листе (необяз. по ум. - 2)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьКвитанцию";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьКвитанцию";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Получает квитанцию к заказу";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьКвитанцию";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID квитанции, полученный при ее формировании";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьКвитанцию";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--getfile";
    НоваяСтрока.Описание    = "Истина > будут получены сразу данные PDF файла, Ложь > ответ сервера CDEK (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьКвитанцию";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКВИТАНЦИЮ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьШтрихкод";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Формирует штрихкод места в формате PDF для заказов
    |
    |    Пример указания параметра типа массив:
    |    --param ""['Val1','Val2','Val3']""
    |";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьШтрихкод";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--uuids";
    НоваяСтрока.Описание    = "Один или массив UUID заказов";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьШтрихкод";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--count";
    НоваяСтрока.Описание    = "Число копий (необяз. по ум. - 1)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьШтрихкод";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--format";
    НоваяСтрока.Описание    = "Формат печати: A4, A5, A6, A7 (необяз. по ум. - A4)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьШтрихкод";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--lang";
    НоваяСтрока.Описание    = "Язык штрихкода: RUS, ENG (необяз. по ум. - RUS)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СформироватьШтрихкод";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьШтрихкод";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Получает штрихкод места к заказу";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьШтрихкод";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID штрихкода, полученный при его формировании";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьШтрихкод";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--getfile";
    НоваяСтрока.Описание    = "Истина > будут получены сразу данные PDF файла, Ложь > ответ сервера CDEK (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьШтрихкод";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬШТРИХКОД";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьОписаниеЗаказа";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОПИСАНИЕЗАКАЗА";
    НоваяСтрока.Параметр    = "--empty";
    НоваяСтрока.Описание    = "Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";
    НоваяСтрока.ОписаниеМетода   = "Получает макет для создания заказа в функции СоздатьЗаказ";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьОписаниеЗаказа";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОПИСАНИЕЗАКАЗА";
    НоваяСтрока.Параметр    = "--required";
    НоваяСтрока.Описание    = "Истина > в макете будут только обязательные поля (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьОписаниеЗаказа";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОПИСАНИЕЗАКАЗА";
    НоваяСтрока.Параметр    = "--ostore";
    НоваяСтрока.Описание    = "Признак включения в макет полей исключительно для заказо Интернет магазина (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Работа с заказми";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьДоступныеИнтервалыДоставки";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬДОСТУПНЫЕИНТЕРВАЛЫДОСТАВКИ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Управление доставкой";
    НоваяСтрока.ОписаниеМетода   = "Получает доступные интервалы доставки для заказа";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьДоступныеИнтервалыДоставки";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬДОСТУПНЫЕИНТЕРВАЛЫДОСТАВКИ";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID заказа";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьДоступныеИнтервалыДоставки";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬДОСТУПНЫЕИНТЕРВАЛЫДОСТАВКИ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Управление доставкой";
    НоваяСтрока.ОписаниеМетода   = "Создает новую заявку на вызов курьера для забора груза";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--intake";
    НоваяСтрока.Описание    = "Описание заявки. См. ПолучитьОписаниеЗаявкиКурьера";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "СоздатьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Управление доставкой";
    НоваяСтрока.ОписаниеМетода   = "Получает заявку на вызов курьера по UUID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID заявки";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "УдалитьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "УдалитьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID заявки для удаления";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "УдалитьЗаявкуНаВызовКурьера";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАЯВКУНАВЫЗОВКУРЬЕРА";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ЗафиксироватьДоговоренностьОДоставке";
    НоваяСтрока.МетодПоиска = "ЗАФИКСИРОВАТЬДОГОВОРЕННОСТЬОДОСТАВКЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Управление доставкой";
    НоваяСтрока.ОписаниеМетода   = "Фиксирует оговоренные с клиентом дату, время и адрес доставки";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ЗафиксироватьДоговоренностьОДоставке";
    НоваяСтрока.МетодПоиска = "ЗАФИКСИРОВАТЬДОГОВОРЕННОСТЬОДОСТАВКЕ";
    НоваяСтрока.Параметр    = "--appt";
    НоваяСтрока.Описание    = "Описание договоренности. См. ПолучитьОписаниеДоговоренности";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ЗафиксироватьДоговоренностьОДоставке";
    НоваяСтрока.МетодПоиска = "ЗАФИКСИРОВАТЬДОГОВОРЕННОСТЬОДОСТАВКЕ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьДоговоренностьОДоставке";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬДОГОВОРЕННОСТЬОДОСТАВКЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен авторизации";
    НоваяСтрока.Область     = "Управление доставкой";
    НоваяСтрока.ОписаниеМетода   = "Получает информацию об оговоренных с клиентом дате, времени и адресе доставки";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьДоговоренностьОДоставке";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬДОГОВОРЕННОСТЬОДОСТАВКЕ";
    НоваяСтрока.Параметр    = "--uuid";
    НоваяСтрока.Описание    = "UUID договоренности";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьДоговоренностьОДоставке";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬДОГОВОРЕННОСТЬОДОСТАВКЕ";
    НоваяСтрока.Параметр    = "--testapi";
    НоваяСтрока.Описание    = "Флаг использования API для тестовых запросов (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьОписаниеЗаявкиКурьера";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОПИСАНИЕЗАЯВКИКУРЬЕРА";
    НоваяСтрока.Параметр    = "--empty";
    НоваяСтрока.Описание    = "Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";
    НоваяСтрока.ОписаниеМетода   = "Получает макет для создания заявки на вызов курьера в функции СоздатьЗаявкуНаВызовКурьера";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьОписаниеЗаявкиКурьера";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОПИСАНИЕЗАЯВКИКУРЬЕРА";
    НоваяСтрока.Параметр    = "--required";
    НоваяСтрока.Описание    = "Истина > в макете будут только обязательные поля (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьОписаниеДоговоренности";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОПИСАНИЕДОГОВОРЕННОСТИ";
    НоваяСтрока.Параметр    = "--empty";
    НоваяСтрока.Описание    = "Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";
    НоваяСтрока.ОписаниеМетода   = "Получает макет для создания о доставке в функции ЗафиксироватьДоговоренностьОДоставке";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "cdek";
    НоваяСтрока.Модуль      = "OPI_CDEK";
    НоваяСтрока.Метод       = "ПолучитьОписаниеДоговоренности";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОПИСАНИЕДОГОВОРЕННОСТИ";
    НоваяСтрока.Параметр    = "--required";
    НоваяСтрока.Описание    = "Истина > в макете будут только обязательные поля (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Управление доставкой";

    Возврат ТаблицаСостава;
КонецФункции

