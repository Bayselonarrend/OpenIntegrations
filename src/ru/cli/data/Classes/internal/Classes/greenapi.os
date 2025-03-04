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
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "СформироватьПараметрыДоступа";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬПАРАМЕТРЫДОСТУПА";
    НоваяСтрока.Параметр    = "--api";
    НоваяСтрока.Описание    = "Ссылка на хост API";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Формирует структуру основных авторизационных данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "СформироватьПараметрыДоступа";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬПАРАМЕТРЫДОСТУПА";
    НоваяСтрока.Параметр    = "--media";
    НоваяСтрока.Описание    = "Ссылка на хост API для отправки файлов";
    НоваяСтрока.Область     = "Аккаунт";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "СформироватьПараметрыДоступа";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬПАРАМЕТРЫДОСТУПА";
    НоваяСтрока.Параметр    = "--id";
    НоваяСтрока.Описание    = "Уникальный номер инстанса";
    НоваяСтрока.Область     = "Аккаунт";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "СформироватьПараметрыДоступа";
    НоваяСтрока.МетодПоиска = "СФОРМИРОВАТЬПАРАМЕТРЫДОСТУПА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Ключ доступа инстанса";
    НоваяСтрока.Область     = "Аккаунт";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьИнформациюОбАккаунте";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬИНФОРМАЦИЮОБАККАУНТЕ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Получает информацию об аккаунте";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьНастройкиИнстанса";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬНАСТРОЙКИИНСТАНСА";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Получает текущие настройки инстанса";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "УстановитьНастройкиИнстанса";
    НоваяСтрока.МетодПоиска = "УСТАНОВИТЬНАСТРОЙКИИНСТАНСА";
    НоваяСтрока.Параметр    = "--settings";
    НоваяСтрока.Описание    = "Настройки инстанса. См. ПолучитьСтруктуруНастроекИнстанса";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Устанавливает настройки инстанса";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "УстановитьНастройкиИнстанса";
    НоваяСтрока.МетодПоиска = "УСТАНОВИТЬНАСТРОЙКИИНСТАНСА";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьСостояниеИнстанса";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСОСТОЯНИЕИНСТАНСА";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Получает состояние инстанса";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПерезапуститьИнстанс";
    НоваяСтрока.МетодПоиска = "ПЕРЕЗАПУСТИТЬИНСТАНС";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Перезапускает инстанс";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "РазлогинитьИнстанс";
    НоваяСтрока.МетодПоиска = "РАЗЛОГИНИТЬИНСТАНС";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Разлогинивает инстанс";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьQR";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬQR";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Получает QR-код авторизации";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьКодАвторизации";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКОДАВТОРИЗАЦИИ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Получает код авторизации для связи по номеру телефона";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьКодАвторизации";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКОДАВТОРИЗАЦИИ";
    НоваяСтрока.Параметр    = "--phone";
    НоваяСтрока.Описание    = "Номер телефона в международном формате без + и 00";
    НоваяСтрока.Область     = "Аккаунт";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "УстановитьКартинкуПрофиля";
    НоваяСтрока.МетодПоиска = "УСТАНОВИТЬКАРТИНКУПРОФИЛЯ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Устанавливает новую картинку профиля";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "УстановитьКартинкуПрофиля";
    НоваяСтрока.МетодПоиска = "УСТАНОВИТЬКАРТИНКУПРОФИЛЯ";
    НоваяСтрока.Параметр    = "--picture";
    НоваяСтрока.Описание    = "Картинка профиля";
    НоваяСтрока.Область     = "Аккаунт";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьСтруктуруНастроекИнстанса";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСТРУКТУРУНАСТРОЕКИНСТАНСА";
    НоваяСтрока.Параметр    = "--empty";
    НоваяСтрока.Описание    = "Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "Аккаунт";
    НоваяСтрока.ОписаниеМетода   = "Получает шаблон структуры для установки настроек инстанса";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьИнформациюОГруппе";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬИНФОРМАЦИЮОГРУППЕ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Управление группами";
    НоваяСтрока.ОписаниеМетода   = "Получает данные группового чата";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПолучитьИнформациюОГруппе";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬИНФОРМАЦИЮОГРУППЕ";
    НоваяСтрока.Параметр    = "--group";
    НоваяСтрока.Описание    = "Идентификатор группового чата";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "СоздатьГруппу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬГРУППУ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Управление группами";
    НоваяСтрока.ОписаниеМетода   = "Создает новый групповой чат
    |
    |    Пример указания параметра типа массив:
    |    --param ""['Val1','Val2','Val3']""
    |";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "СоздатьГруппу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬГРУППУ";
    НоваяСтрока.Параметр    = "--name";
    НоваяСтрока.Описание    = "Наименование группового чата";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "СоздатьГруппу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬГРУППУ";
    НоваяСтрока.Параметр    = "--members";
    НоваяСтрока.Описание    = "Массив участников чата (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ИзменитьИмяГруппы";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬИМЯГРУППЫ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Управление группами";
    НоваяСтрока.ОписаниеМетода   = "Изменяет имя существующей группы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ИзменитьИмяГруппы";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬИМЯГРУППЫ";
    НоваяСтрока.Параметр    = "--group";
    НоваяСтрока.Описание    = "Идентификатор группового чата";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ИзменитьИмяГруппы";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬИМЯГРУППЫ";
    НоваяСтрока.Параметр    = "--name";
    НоваяСтрока.Описание    = "Новое наименование группового чата";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ДобавитьУчастникаВГруппу";
    НоваяСтрока.МетодПоиска = "ДОБАВИТЬУЧАСТНИКАВГРУППУ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Управление группами";
    НоваяСтрока.ОписаниеМетода   = "Добавляет участника в групповой чат";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ДобавитьУчастникаВГруппу";
    НоваяСтрока.МетодПоиска = "ДОБАВИТЬУЧАСТНИКАВГРУППУ";
    НоваяСтрока.Параметр    = "--group";
    НоваяСтрока.Описание    = "Идентификатор группового чата";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ДобавитьУчастникаВГруппу";
    НоваяСтрока.МетодПоиска = "ДОБАВИТЬУЧАСТНИКАВГРУППУ";
    НоваяСтрока.Параметр    = "--user";
    НоваяСтрока.Описание    = "ID пользователя для добавления";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ИсключитьУчастникаГруппы";
    НоваяСтрока.МетодПоиска = "ИСКЛЮЧИТЬУЧАСТНИКАГРУППЫ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Управление группами";
    НоваяСтрока.ОписаниеМетода   = "Исключает участника из группы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ИсключитьУчастникаГруппы";
    НоваяСтрока.МетодПоиска = "ИСКЛЮЧИТЬУЧАСТНИКАГРУППЫ";
    НоваяСтрока.Параметр    = "--group";
    НоваяСтрока.Описание    = "Идентификатор группового чата";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ИсключитьУчастникаГруппы";
    НоваяСтрока.МетодПоиска = "ИСКЛЮЧИТЬУЧАСТНИКАГРУППЫ";
    НоваяСтрока.Параметр    = "--user";
    НоваяСтрока.Описание    = "ID пользователя для добавления";
    НоваяСтрока.Область     = "Управление группами";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПокинутьГруппу";
    НоваяСтрока.МетодПоиска = "ПОКИНУТЬГРУППУ";
    НоваяСтрока.Параметр    = "--access";
    НоваяСтрока.Описание    = "Параметры доступа. См. СформироватьПараметрыДоступа";
    НоваяСтрока.Область     = "Управление группами";
    НоваяСтрока.ОписаниеМетода   = "Производит выход текущего аккаунта из группового чата";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "greenapi";
    НоваяСтрока.Модуль      = "OPI_GreenAPI";
    НоваяСтрока.Метод       = "ПокинутьГруппу";
    НоваяСтрока.МетодПоиска = "ПОКИНУТЬГРУППУ";
    НоваяСтрока.Параметр    = "--group";
    НоваяСтрока.Описание    = "Идентификатор группового чата";
    НоваяСтрока.Область     = "Управление группами";

    Возврат ТаблицаСостава;
КонецФункции

